#pragma once

#include <string>

// Decoded tokens shared by the decoder and source emitters.
enum TokenType {
    UNDEF,
    DATA,
    VARIABLE,
    IF,
    IFEND,
    ELSE,
    ENDIF,
    OP,
    GOSUB,
    GOTO,
    RETURN,
    FUNC,
    TABLE,
    SELECT,
    CASE,
    READTABLE8,
    READTABLE16,
    EQ,
    FUNC2
};

struct Token {
    int addr;
    bool isjump;
    TokenType type;
    int data;
    bool isConstant;
    std::string str;
};

