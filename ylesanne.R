# Kodune ülesanne R-i lühikoolitus, 1. osale: Andmete eeltöötlus R-is ja Tidyverse-is
# Toimumise kuupäevad: 27.04.2020 - 08.05.2020

# Kodune ülesanne esitab mõned tehnilised ülesanded R-is lahendamiseks, mis põhineb 1. osa materjalidel. Mõned küsimused on esitatud näidetele väga lähedal, teised nõuavad eri peatüki osade mõningast kombineerimist. Kõik ülesanded peaks läbitud materjalidega tehtavad olema, ehkki on mõistetav, et uus aines võib olla esialgu üpris harjumatu. Kõik küsimused on teretulnud arutelufoorumis või otse läbiviijatele. R-i kasutamist võib pidada üpris praktiliseks valdkonnaks, kus vilumus võib tulla ainult harjutamise ja kasutamise läbi. Jõudu lahendamisel

# Kodutöö esitamisel palun saatkegi täidetud .R kood, kus on küsimuste järgi kirjutatud vastused R-i koodis, mis töötab.
# Testimiseks võite igaks juhuks sulgeda RStudio korraks ning proovida vastuseid järjest käivitada tühjendatud R-i keskkonnas.



# 0. Lugege sisse tidyverse paketid







# 1. Lugege sisse gapminder andmestik ja valige välja saksamaaga seotud andmed ja salvesta see uue muutujana. Vihje: filter()







# 2. Filtreerige välja Saksamaa andmetest kaks juhuslikku aastat ja jätke alles ainult see aasta, kus on kahest aastast kõrgema gdp-ga inimese kohta. Vihje: sample_n()







# 3. Valige välja gapminder andmestikust Euroopa andmed ja aasta 2007. Vihje: &







# 4. Arvutage oodatud eluea keskmine, rahvaarvu mediaan ja vähim gdpPercap. Vihje: mean(), median(), min()







# 5. Võtke ette saksamaa andmed ning lisage uus tunnus, mis näitab, mitu korda suurem on gdpPercap 1952 aasta väärtusest. Vihje: mutate()







# 6. Tehke seda sama kõigile riikidele korraga ja järjestage riigid 1952-2007 kasvuprotsendi järgi suurimast väiksemani.







# 7. Lugege sisse ess9_ee andmestik. Vihje: haven::read_sav()







# 8. Valige välja inimestesse suhtumisega seotud tulbad ess9_ee andmetest ja kuvage ülevaade neist. Vihje: select() ja summarytools või skimr pakett.







# 9. Arvutage välja ühe tunnuse keskmine väärtus ja eraldi kummagi admge tunnuses antud soo jaoks.
# Oluline vihje. mean() funktsioon ei luba NA väärtusi. Selleks et kasutada mean() funktsiooni arvudega, mille hulgas on NA, tuleb lisada na.rm=T
# Vt näide:
seq = c(1,2,NA,4)
mean(seq)
mean(seq,na.rm=T)







# 10. Tehke ühest neist tunnustest kategooriline muutuja, millel on kolm tasandit. Vihje: cut()







# 11. Loendage, mitu väärtust on igal tasandil. Vihje: count() või summarise() ja n()







# 12. Lisage uus tulp, kus on tasanditele pandud nimed. Vihje: factor(,labels)







# 13. Lugege sisse kolm andmestikku sdg_08_10.tsv, tps00001.tsv, tipslm60.tsv ja salvestage need muutujatena. Vihje: vaata, et kataloog oleks data.
# Nende andmestike sisuülevaade on järgmistel linkidel

# Real GDP per capita (sdg_08_10.tsv) https://ec.europa.eu/eurostat/web/products-datasets/-/sdg_08_10
# Population by year (tps00001.tsv) https://ec.europa.eu/eurostat/web/products-datasets/-/tps00001
# Activity rate - % of total population aged 15-64 (tipslm60.tsv) https://ec.europa.eu/eurostat/web/products-datasets/-/tipslm60
# Andmestikest on eemaldatud netist alla laadides kaasnevad tähemärkidega eristused.







# 14. Lahutage esimene tulp komakohtade pealt nagu sai lahutatud ka eu_lifeExp andmestik ja salvesta muutused muutujas. Uute tulpade nimed tuleb ise määrata. Vihje: separate()







# 15. Vii kõik kolm andmestikku 'pikka' formaati ja salvesta need. Vihje: pivot_longer()







# 16. Arvuta välja 2000ndate aastate keskmine realgdpPercap riikide kohta. Vihje filter() group_by(), mutate(), summarise()
# Vihje: numberväärtus on loetud praegu NA väärtuste kuju tõttu tekstina. Numbrid saab kätte funktsiooniga as.numeric() või kodeerides : märgi NA-ks faili lugedes.







# 17. Liida kõik kolm andmestikku kokku riiginime ja aasta põhjal, jättes alles ainult andmepunktid, millele on vaste igas andmestikus. 
# Vihje: inner_join(), andmestikud tuleb liita järjestikku, kaks andmestikku korraga.







# 18. Salvestage loodud 'pikk' ühendatud andmestik eraldi .tsv faili 'output' kataloogi. # Vihje: write_tsv






