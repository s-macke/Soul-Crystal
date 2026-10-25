// Host-only replay input, shared by the runner and text coverage collector.
// Includes expand in place; they never start or reset the game.
#ifndef SOUL_REPLAY_FILE_H
#define SOUL_REPLAY_FILE_H
#include <algorithm>
#include <filesystem>
#include <fstream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace replay_file {
struct Line {
    std::string text, file;
    unsigned number = 0;
    std::string includedFrom;
    std::string location() const { return file+":"+std::to_string(number); }
};
inline std::string trim(const std::string& s) {
    const auto a=s.find_first_not_of(" \t\r\n");
    return a==std::string::npos ? "" : s.substr(a,s.find_last_not_of(" \t\r\n")-a+1);
}
inline void expand(const std::filesystem::path& path, std::vector<Line>& lines,
                   std::vector<std::filesystem::path>& active, const std::string& trace) {
    std::error_code error;
    const auto file=std::filesystem::canonical(path,error);
    if(error) throw std::runtime_error("Cannot open "+path.string()+": "+error.message()+trace);
    if(std::find(active.begin(),active.end(),file)!=active.end())
        throw std::runtime_error("Include cycle: "+file.string()+trace);
    if(active.size()>=32) throw std::runtime_error("Include depth exceeds 32: "+file.string()+trace);
    std::ifstream input(file);
    if(!input) throw std::runtime_error("Cannot open "+file.string()+trace);
    active.push_back(file);
    std::string text;
    unsigned number=0;
    while(std::getline(input,text)) {
        ++number;
        Line line{trim(text),file.string(),number,trace};
        if(line.text.empty() || line.text[0]=='#') continue;
        const auto split=line.text.find_first_of(" \t");
        if(line.text.substr(0,split)=="@include") {
            const auto target=split==std::string::npos ? "" : trim(line.text.substr(split));
            if(target.empty()) throw std::runtime_error(line.location()+": Empty @include path"+trace);
            expand(file.parent_path()/target,lines,active,"\nIncluded from "+line.location()+trace);
        } else lines.push_back(std::move(line));
    }
    if(input.bad()) throw std::runtime_error("Read error: "+file.string()+trace);
    active.pop_back();
}
inline std::vector<Line> read(const std::filesystem::path& path) {
    std::vector<Line> lines;
    std::vector<std::filesystem::path> active;
    expand(path,lines,active,"");
    return lines;
}
}
#endif
