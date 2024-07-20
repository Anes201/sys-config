# add the "#!/bin/bash" at begining when using the script

#Script to translate Selected Word.
word=$(xclip -o);

firefox "https://translate.google.com/?sl=en&tl=ar&text=$word&op=translate"
echo "DONE!"

# using xclip

translated_word = xclip -o;
echo $translated_word


# add translated word using terminal
ts() {
	echo "$1,$2" >> Scripts/AddEnglishWord.txt
}
