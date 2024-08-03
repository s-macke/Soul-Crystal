APIKEY="FILL_IN"

#curl -v -X POST 'https://api.deepl.com/v2/document' \
#	-H 'Authorization: DeepL-Auth-Key <<FILL_IN>>' \
#	-F 'source_lang=DE' \
#	-F 'target_lang=EN' \
 # -F 'file=@story.txt'

curl -v -X POST 'https://api.deepl.com/v2/translate' \
	-H "Authorization: DeepL-Auth-Key ${APIKEY}" \
	-F 'source_lang=DE' \
	-F 'target_lang=EN' \
	-F 'text=@story.txt'


#	-F 'glossary_id=def3a26b-3e84-45b3-84ae-0c0aaf3525f7'