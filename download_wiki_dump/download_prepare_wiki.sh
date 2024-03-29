#!/bin/bash
# Based on: https://towardsdatascience.com/pre-processing-a-wikipedia-dump-for-nlp-model-training-a-write-up-3b9176fdf67

LG="ky"

rm -rf ${LG}wiki-latest-pages-articles.* wikiextractor

WIKI_DUMP_NAME=${LG}wiki-latest-pages-articles.xml.bz2
WIKI_DUMP_DOWNLOAD_URL=https://dumps.wikimedia.org/${LG}wiki/latest/$WIKI_DUMP_NAME

# download latest Wikipedia dump in chosen language
echo "Downloading the latest $LG-language Wikipedia dump from $WIKI_DUMP_DOWNLOAD_URL..."
wget -c $WIKI_DUMP_DOWNLOAD_URL
echo "Succesfully downloaded the latest $LG-language Wikipedia dump to $WIKI_DUMP_NAME"

###########################################################################################
###########################################################################################

WIKI_DUMP_FILE_IN=$WIKI_DUMP_NAME
WIKI_DUMP_FILE_OUT=${WIKI_DUMP_FILE_IN%%.*}.txt

# installing required libs
python -m pip install wikiextractor==3.0.4 blingfire==0.1.8


# extract and clean the chosen Wikipedia dump
echo "Extracting and cleaning $WIKI_DUMP_FILE_IN to $WIKI_DUMP_FILE_OUT..."

python -m wikiextractor.WikiExtractor $WIKI_DUMP_FILE_IN --processes 8 -q -o - \
| sed "/^\s*\$/d" \
| sed -e 's/\&quot;/"/g' \
| sed -e 's/\&amp;/\&/g' \
| sed -e 's/\&lt;[^\&]*\&gt;//g' \
| grep -v "^<doc id=" \
| grep -v "</doc>\$" \
> $WIKI_DUMP_FILE_OUT
echo "Succesfully extracted and cleaned $WIKI_DUMP_FILE_IN to $WIKI_DUMP_FILE_OUT"

###########################################################################################
###########################################################################################

python3 bling_split.py $WIKI_DUMP_FILE_OUT

rm ${LG}wiki-latest-pages-articles.*
