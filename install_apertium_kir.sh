#!/usr/bin/env bash

echo "**** Installing the necessary dependencies..."
sudo apt-get -y install autoconf hfst vislcg3 lttoolbox pkg-config libtool
curl -sS https://apertium.projectjj.com/apt/install-nightly.sh | sudo bash
sudo apt-get -y -f install apertium-all-dev

echo "**** Cloning apertium-kir, may take a while..."
git clone git@github.com:apertium/apertium-kir.git

echo "**** Updating the configurations and building..."
cd apertium-kir/ && autoupdate && ./autogen.sh && ./configure && make

echo "**** Testing..."
echo "Бул кыргызча морфологиялык талдоо" | apertium -d . kir-morph

echo "**** Done."

# Now the good question is: how do you parse this or make any sense of the markup?
# You could use apertium-streamparser.

echo "**** Bonus:"
echo "Бул кыргызча морфологиялык талдоо" | apertium -d . kir-morph | python apertium-streamparser

# The expected results:
#
# ^Бул/бул<det><dem>/бул<prn><dem><nom>/бул<prn><dem><nom>+э<cop><aor><p3><pl>/бул<prn><dem><nom>+э<cop><aor><p3><sg>$ ^кыргызча/кыргызча<adv>/кыргызча<n><attr>/кыргызча<n><nom>/кыргызча<n><nom>+э<cop><aor><p3><pl>/кыргызча<n><nom>+э<cop><aor><p3><sg>/кыргыз<n><equ>/кыргыз<n><equ>+э<cop><aor><p3><pl>/кыргыз<n><equ>+э<cop><aor><p3><sg>$ ^морфологиялык/морфологиялык<adj>/морфологиялык<adj>+э<cop><aor><p3><pl>/морфологиялык<adj>+э<cop><aor><p3><sg>$ ^талдоо/талда<v><tv><ger><nom>/талда<v><tv><ger><nom>+э<cop><aor><p3><pl>/талда<v><tv><ger><nom>+э<cop><aor><p3><sg>$^./.<sent>$
#
#[[SReading(baseform='бул', tags=['det', 'dem'])],
# [SReading(baseform='бул', tags=['prn', 'dem', 'nom'])],
# [SReading(baseform='бул', tags=['prn', 'dem', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'pl'])],
# [SReading(baseform='бул', tags=['prn', 'dem', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'sg'])]]
#[[SReading(baseform='кыргызча', tags=['adv'])],
# [SReading(baseform='кыргызча', tags=['n', 'attr'])],
# [SReading(baseform='кыргызча', tags=['n', 'nom'])],
# [SReading(baseform='кыргызча', tags=['n', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'pl'])],
# [SReading(baseform='кыргызча', tags=['n', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'sg'])],
# [SReading(baseform='кыргыз', tags=['n', 'equ'])],
# [SReading(baseform='кыргыз', tags=['n', 'equ']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'pl'])],
# [SReading(baseform='кыргыз', tags=['n', 'equ']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'sg'])]]
#[[SReading(baseform='морфологиялык', tags=['adj'])],
# [SReading(baseform='морфологиялык', tags=['adj']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'pl'])],
# [SReading(baseform='морфологиялык', tags=['adj']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'sg'])]]
#[[SReading(baseform='талда', tags=['v', 'tv', 'ger', 'nom'])],
# [SReading(baseform='талда', tags=['v', 'tv', 'ger', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'pl'])],
# [SReading(baseform='талда', tags=['v', 'tv', 'ger', 'nom']), SReading(baseform='э', tags=['cop', 'aor', 'p3', 'sg'])]]
#[[SReading(baseform='.', tags=['sent'])]]

