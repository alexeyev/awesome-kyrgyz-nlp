# Awesome Kyrgyz NLP [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

A curated list of awesome Kyrgyz language processing software, models and datasets. Inspired by [awesome-ML](https://github.com/josephmisiti/awesome-machine-learning). 

The main focus is on **open source** tools, **downloadable** data and research **papers with code**.

If you want to contribute to this list (please do), send me a pull request.
Also, a listed repository should be tagged as deprecated if:

* Repository's owners explicitly say that "this library is not maintained".
* Not committed to for a long time (2~3 years).

## Table of Contents
<!-- MarkdownTOC depth=3 -->
- [Awesome Kyrgyz NLP](#awesome-kyrgyz-nlp)
  - [Table of Contents](#table-of-contents)
  - [Datasets](#data)
  - [Pretrained models](#pretrained-models)
  - [Methods/Software](#software)
      - [Morphology](#morphology-s)
  - [Online Demos](#demos)
  - [Miscellaneous](#misc)
<!-- /MarkdownTOC -->

<a name="data"></a>
## Datasets

#### Corpora

* [Manas-UdS](http://fedora.clarin-d.uni-saarland.de/kyrgyz/index.html): 1.2M words, 84 literary texts, 5 genres: novel, novelette, epic, minor epic, and fairy tale; lemmata, PoS tags, rich per-text metadata.
* [kkWaC](https://www.sketchengine.eu/kywac-kyrgyz-corpus/): Kyrgyz corpus from the web, 19M words, Jan 2012
* [Kyrgyz in Leipzig Corpora Collecion](https://wortschatz.uni-leipzig.de/en/download/Kirghiz): Community data / Newscrawl (1M sentences) / Wikipedia (300K sentences)
* [TilCorpusu](https://tilcorpusu.org/): Kyrgyz corpus, 100M words, news+fiction, made public in July 2023

#### Character recognition
* [Kyrgyz language hand-written letters (Kyrgyz MNIST)](https://github.com/Akyl-AI/kyrgyz_MNIST): hand-written Kyrgyz alphabet letters collection for machine learning applications; original images (a total of 80213) have been transformed to 50x50 images, then to CSV format

#### Raw text
* [kloop corpus](https://github.com/kyrgyz-nlp/kloop-corpus): 16'826 articles (sqlite3 DB file) + crawler code

#### Morphology &amp; Syntax
* [UD project comments](https://universaldependencies.org/tr/) on difficulties in Turkish language processing, might bring light to the question why parsing Kyrgyz is hard as well
* [KTMU's UD Treebank, 781 sentences](https://github.com/UniversalDependencies/UD_Kyrgyz-KTMU)
* [Verbal paradigms for Kyrgyz (100 Kyrgyz verbs fully conjugated in all tenses)](https://github.com/unimorph/kir) by Aytnatova Alima, annotation for Unimorph by E. Chodroff

#### Named Entity Recognition
* [WikiANN](https://huggingface.co/datasets/wikiann) has a Kyrgyz language part
* [KyrgyzNER](https://github.com/Akyl-AI/KyrgyzNER): [not published yet]

#### Text Classification
* [Kyrgyz Multi-Label News Classification](https://github.com/alexeyev/kyrgyz-multi-label-topic-classification): [not published yet]

#### Word Similarity Data
* [Kyrgyz Word Embedding Evaluation](https://github.com/alexeyev/kyrgyz-embedding-evaluation): [not published yet]

#### Machine-readable dictionaries
* [Country names table](https://github.com/kyrgyz-nlp/country_names/blob/main/country_names_in_kyrgyz.tsv): Kyrgyz-Russian-English
* Thesaurus [KyrSpell](http://kyrgyzorfo.narod.ru/) (however, unpacking it seems to break the license)


<a name="pretrained-models"></a>
## Pretrained models
* [Polyglot morfessor](https://github.com/aboSamoor/polyglot/blob/master/docs/MorphologicalAnalysis.rst) —  pretrained [morfessor](http://www.cis.hut.fi/cis/projects/morpho/) model, number 6
* [fastText](https://fasttext.cc/docs/en/crawl-vectors.html) — 300-dimensional fastText vectors provided by the authors: [bin](https://dl.fbaipublicfiles.com/fasttext/vectors-crawl/cc.ky.300.bin.gz), [txt](https://dl.fbaipublicfiles.com/fasttext/vectors-crawl/cc.ky.300.vec.gz).
* [compressed fastText](https://github.com/avidale/compress-fasttext) —  [fasttext-ky-mini](https://zenodo.org/record/4905385/files/fasttext-ky-mini?download=1) prepared by Liebl Bernhard in 2021.
* [BERT-based NER](https://huggingface.co/murat/kyrgyz_language_NER) —  `bert-base-multilingual-cased` fine-tuned on Wikiann for NER on Kyrgyz. The author warns that this model is not usable and is built just as a proof of concept. Will be updated later.

<a name="software"></a>
## Methods/Software

* [spaCy](https://github.com/explosion/spaCy/tree/master/spacy/lang/ky) basic support: tokenization, stopwords, `like_num`

#### Morphology <a name="morphology-s"></a>
* [Kyrgyz for Apertium](https://github.com/apertium/apertium-kir/): morphological analysis and generation, PoS-tagging; installation script: [install_apertium_kir.sh](/install_apertium_kir.sh). A [much, much easier way](https://github.com/apertium/apertium-python/): `import apertium; apertium.installer.install_module("kir")`.
* [DEPRECATED] [kymopl](https://github.com/dens-den/kymopl): Kyrguz morphology in Prolog

**Mentioned in papers:**
* TODO

## Hate Speech detection
* [Jupyter Notebook for hate speech detection](https://github.com/kyrgyz-nlp/hate-speech-examples)

#### Other
* [Tilchi](https://github.com/IncorexLLC/Tilchi) electronic Russian-Kyrgyz dictionary, open source desktop application
* [ӨҮҢизатор](https://github.com/kyrgyz-nlp/letter_replacer): a proof-of-concept letter replacement Telegram bot demo code, fixes incorrect usages of 'О','У', 'Н' => 'Ө', 'Ү','Ң'
* [Number-to-words conversion](https://github.com/AzamatSoodaev/number-to-words-kg) (JavaScript) by [@AzamatSooldaev](https://github.com/AzamatSoodaev)
* [Number-to-words conversion](https://github.com/timursaurus/sandar) (TypeScript) by [@timursaurus](https://github.com/timursaurus)
* [Telegram bot for Kyrgyz morphological analysis](https://github.com/sasha-kir/kyrgyz_parser) by [@sasha-kir](https://github.com/sasha-kir) based on [Apertium data for Kyrgyz](https://github.com/apertium/apertium-kir/)

<a name="demos"></a>
## Online Demos
* [Cyrillic-to-Latin online converter](http://www.transliteration.kpr.eu/ky/) based on [this resource](https://www.qyrgyz.com/post/kakoy-budet-kyrgyzskaya-latinitsa).

<a name="misc"></a>
## Miscellaneous
* [Turkic Interlingua](https://github.com/turkic-interlingua) community and [SIGTURK](https://github.com/sigturk/) (ACL Turkic languages special interest group)
* A useful [Apertium](https://wiki.apertium.org/wiki/Kyrgyz)'s list of tools and other resources
* Online dictionaries and other useful resources on [el-sozduk.kg](https://el-sozduk.kg/)
* [Turkic languages-related resources](http://ddi.itu.edu.tr/en/toolsandresources) compiled by Dr. Gülşen Eryiğit and her team at Istanbul Technical University 


## Contributions to this list

[@golden-ratio](https://github.com/golden-ratio)
