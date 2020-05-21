#' ---
#' title: "R-i lühikoolitus, osa 1"
#' subtitle: "Andmete eeltöötlus R-is ja Tidyverse-is"
#' author: "Peeter Tinits"
#' date: "25/04/2020"
#' ---
#' 
#' # Sissejuhatus
#' 
#' R on programmeerimiskeel ja vabavaraline arenduskeskkond, mis on mõeldud eelkõige andmete töötluseks, analüüsiks ja visualiseerimiseks. Suhtlus R-iga käib koodirea kaudu, mis võib olenevalt taustast olla juba tuttav või veel võõras viis andmetöötluseks. See õppetükk annab alused lihtsamaks andmetöötluseks R-is: kuidas lugeda salvestatud andmeid, kuidas leida andmestikust meile vajalik osa, kuidas luua uusi muutujaid ja kuidas ühendada informatsiooni mitmest tabelist.
#' 
#' See õppetükk annab sissejuhatuse lihtsamale andmetöötlusele R-is *tidyverse* stiilis. *Tidyverse* on pakettide kogu R-is, mis on püüdnud hõlbustada levinud andmetöötlusviiside mõistmist ja õppimist. *Tidyverse* on ka R-i maailmas võrdlemisi uus - esimesed õpikud ilmusid 2017 aastal - mistõttu ei pruugi ka kogenud R-i kasutajad seda tunda. Praeguseks on *tidyverse* paketid saanud üsna populaarseks ning kogunud enda ümber tugeva kogukonna, mis ka aitab kaasa pakettide pidevale täiendamisele. R-i õppimist võib alustada kohe *tidyverse*-ist (ja mõnde õpetajad seda soovitavadki), aga *tidyverse* stiil ei pruugi olla sissejuhatavas kursuses kaetudki. R-i igapäevasel kasutamisel on kasulik tunda just erinevaid stiile.
#' 
#' See õppetükk võiks sobida nii uustulnukale, kes proovib R-i esimest korda, kui kogenud R-i kasutajale, kes soovib näha, kuidas käib andmetöötlus teises R-i "murdes". Õppetükk on kujundatud lähtudes sotsiaalteadlaste huvidest ning eeldab mõningast arusaamist sellest, mis on andmed ja mida nendega teha saab. Õppetükk on sündinud seminarimaterjalide kohandusena ning igasugune tagasiside materjalide sisu ja toimeviisi kohta nii e-õppe vormis kui üldiselt on tagasiside väga oodatud. Jõudu algajatele ja edasijõudnutele!
#' 
#' 
#' ## Miks R?
#' 
#' R-i eeliseks ja omapäraks Exceli ja SPSSiga võrreldes on see, et suhtlus arvutiga käib eelkõige koodirea kaudu. Terve analüüsi saab siis salvestada faili või failide komplektina, mille uuestikäivitamisel teeb analüüs kõik vajalikud protsessid läbi. Selle tulemusena dokumenteerib analüüsiprotsess ennast ise ning tagab, et mõni teine uurija tulevikus või autor ise saab kergesti analüüsikäigu taastada. Seeläbi võimaldab R analüüsi, mis on
#' 
#' - läbipaistev
#' - paindlik
#' - reprodutseeritav
#' 
#' Räägitakse, et ühe uurija kõige olulisem kaastööline on tema ise kuue kuu eest (kes esimese analüüsi teostas). Tema aga ei vasta enam kirjadele. Kui analüüs tervikuna on salvestatud skriptifailis, mis on kenasti kommenteeritud ja suudab analüüsi iga hetk taastada, ei pruugi olla enam vajalik püüda meenutada kogu protsessi. Kui nüüd selgub, et mõnes punktis oli viga või mõne sammu jaoks on ilmnenud parem viis analüüsi teostada või on tekkinud ligipääs uutele andmetele, on kerge kohendada paari vajaliku kohta koodis ning jooksutada analüüs uuesti. Ilma lisavaevata tekib sel juhul ka võimalus, et teised uurijad saavad analüüsi kontrollida ning sellele edaspidi toetuda, millest võidab ka teadus üldiselt.
#' 
#' Oluline R-i juures on ka see, et R ise ja kõik tema paketid on läbinisti avatud ning täiendatavad, mistõttu on enamike levinud funktsioonide jaoks loodud hulk abipakette, mis lihtsustavad analüüsi tegemist ning võimaldavad teha täpselt seda, mida vaja. Enamik probleeme on tulnud ette tihti ka teistel ning ka paljude nišiteemadega on mõned uurijad paketid ette valmist teinud. Siin õppetükis vaatame just levinud kasutusjuhtumeid, mis sotsiaalteadlaselt ette võivad tulla.
#' 
#' ## Tidyverse
#' 
#' [Tidyverse](https://www.tidyverse.org/) on pakettide komplekt R-is, mis püüab järgida ühist filosoofiat ja grammatikat algoritmide loomisel, eelkõige *literate programming* loogikat. Seeläbi on tidyverse-ile kõige tähtsam
#' 
#' - lihtne ja loetav kood
#' - operatsioonide ja andmestruktuuride ühilduvus
#' - kerge ja kiire õpiteekond
#' 
#' *Tidyverse* jätab meelega kõrvale olulise osa R-i põhisüntaksist, eesmärgiga hõlbustada just peamisi andmetöötluse samme. *Tidyverse* paketid ei pruugi olla kõige efektiivsemad masinale ning samuti ei saa nendega teha kõike - üldjuhul aga saab nendega hakkama. Tidyverse-il on aktiivne toetav kogukond ja pakette arendatakse aktiivselt edasi ja juurde. Peamised paketid tidyverse-is on *ggplot2*, *dplyr*, *tidyr*, *readr*, *purrr*, *tibble*, *stringr* ja *forcats*.
#' 
#' *Tidyverse* on ka R-i maailmas võrdlemisi uus - esimesed õpikud ilmusid ehk 2017 aastal - mistõttu ei pruugi ka kogenud R-i kasutajad seda tunda. Mitmed kogenumad kasutajad "kolivad" aga ka ümber *tidyverse* pakettidesse, aga arvamusi on muidugi erinevaid. All on väike näidis ühest andmetöötlusest R-is, kus ülemised kaks varianti kasutavad käske nii nagu neid varem R-is kasutati ja alumine kasutab käske nii nagu tidyverse uuendused seda lubavad.
#' 
#' <center>
#' ![](figures/tidyverse_vs_base.png)
#' </center>
#' 
#' Idee järgi võiks olla viimane neist veidi kergem silmale lugeda ja valmis kirjutada, aga eks siin on igaühe oma silm kuningas. See lühikoolitus annab maitse *tidyverse* andmetöötlusest R-is, mis võiks anda piisava sissevaate nii kogenud kui algajale R-i kasutajale, mille põhjal saab hakata ise materjale edasi otsima.
#' 
#' # Mis on R? Mis on RStudio?
#' 
#' R on programmeerimiskeel ja vabavaraline arenduskeskkond, mis on mõeldud eelkõige andmete töötluseks, analüüsiks ja visuaalseks kuvamiseks. RStudio on abivahend, mis hõlbustab ja toetab R-i kasutamist sedavõrd, et võiks arvata, et tegemist on juba uue keskkonnaga. RStudio töötab hästi tavalises isiklikus arvutis (Windows, Mac, Linux jne), aga seda on võimalik kasutada ka läbi interneti.
#' 
#' ## Installimine
#' 
#' Isiklikule arvutile installige kõigepealt R (viimane versioon on ok) ja seejärel RStudio (viimane versioon on ok). Installimiseks antakse täpsed ja uusimad juhised järgnevatel lehtedel.
#' 
#' 1. Installige R: https://cran.rstudio.com/
#'   - Windows: https://cran.rstudio.com/bin/windows/base/
#'   - Mac: https://cran.rstudio.com/bin/macosx/
#'   - Linux: https://cran.rstudio.com/bin/linux/ (vt readme-d)
#' 2. Installige RStudio:
#'   https://www.rstudio.com/products/rstudio/download/
#' 
#' ## Rstudio Cloud
#' 
#' Ilma installimata on võimalik kasutada ka RStudio Cloudi: https://rstudio.cloud/. Tehke endale kasutaja 'sign up' kaudu ning logige sisse. Iga oma RStudio töö jaoks võib siis teha eraldi projekti.
#' 
#' <center>
#' ![](figures/rstudio_cloud_signup.png)
#' </center>
#' 
#' 
#' ## Materjalide avamine
#' 
#' Materjalid on jagatud eraldi .zip failis, mis tuleb alla laadida. Selle avamiseks RStudios on mitmeid võimalusi.
#' 
#' ### Isiklikus arvutis
#' 
#' Isiklikus arvutis pakkige kõigepealt failid lahti (extract). Kui klikkida selle peale Windowsis, siis mõnikord avab ta faile üksikuna .zipi sees, mis siin ei toimi.
#' 
#' Kui failid on avatud ja RStudio installitud, võib lihtsalt klikkida .Rproj failile. See avab RStudio õigest kohast nii, et kõik on juba seadistatud. Projektifaili võib avada ka RStudios vajutades kõigepealt paremal ülal nurgas olevale "Project: (None)" tekstile. Ja sealt Open project ja suunata see Rproj failile. Projektifaili kasutamine seab paika ka töökataloogi.
#' 
#' <center>
#' ![](figures/project_none.png)
#' </center>
#' 
#' Kui projektifaili mitte kasutada, on oluline seadistada töökataloog. Selle jaoks vajutage alumise parempoolse kasti juures, kus on failid (veenduge, et Files sälk oleks valitud) ülal paremal kolme punktiga tähistatud kohale. Seejärel avaneb aken, kus liikuda õigesse kohta.
#' 
#' <center>
#' ![](figures/gotodir.png)
#' </center>
#' 
#' Kui olete lahtipakitud kataloogis, siis valige ülalt sinise hammasratta kõrvalt More ja Set As Working Directory. See käivitab konsoolis ka esimese käsu setwd(), mis seab kataloogi paika. Edaspidi saab kopeerida selle käsu näiteks faili algusesse, et saada kohe õigesse kohta. Töökataloogi on võimalik kontrollida käsuga getwd().
#' 
#' <center>
#' ![](figures/setasworkingdir.png)
#' </center>
#' 
#' ### Pilves
#' 
#' Materjalide avamiseks RStudio Cloud-is tuleks kõigepealt luua projekt oma kasutajanime all. Ning projektis on näha sarnane koht failidega. Seal valida koht Upload - kus saab valida terve .zip faili, mis siis seal lahti pakitakse.
#' Võib kasutada ka RStudiot pilves
#' 
#' <center>
#' ![](figures/upload_to_cloud.png)
#' </center>
#' 
#' ## RStudio tutvustus
#' 
#' <center>
#' ![](figures/RStudio_vaade.png)
#' </center>
#' 
#' RStudio vaade on tüüpiliselt selline nagu ülal näha. Akende asukohti saab muuta ja nende suhtelisi suurusi saab muuta, aga alguses on neid hea hoida paiga.
#' 
#' - Vasakul-ülal on skriptiaken; 
#' - paremal-ülal on muutujad ja käskude ajalugu;
#' - vasakul-all on konsool, kus jookseb kood; 
#' - paremal-all on failid, graafikud ja abi.
#' 
#' 
#' ## Stiilisoovitus
#' 
#' Veel üks stiilisoovitus. Lülitada sisse word-wrap ehk soft-wrap
#' Selleks leia menüüst järgmine koht:
#' Tools -> Global options -> Code -> Editing -> Soft-wrap R source files (lülita see sisse)
#' 
#' 
#' 
#' # R-i alused
#' 
#' ## R ja käsud
#' 
#' Suhtlus R-iga käib käskude kaudu. Sisestades R-is käsu ja vajutades ENTERit püüab R selle tulemust välja arvutada ja salvestada kui selleks on juhised antud. Skriptid koondavad kokku hulga käske, mida võib järgemööda käivitada. Skriptidesse on hea käske koondada, kuna siis võib kunagi hiljem töötluskäigu täpselt taastada, seda võib kergesti parandada ja see töötab ka kellegi teise arvutis.
#' 
#' Skriptifaile koostatakse üldiselt niimoodi, et kui otsast käske käivitada, siis jookseb skript kenasti lõpuni. Sellest tuleb ka pöidlareegel, et kui mõnes salvestatud skriptifailis mõni varemsalvestatud käsk ei tööta, võib proovida faili algusest peale kõik uuesti läbi teha ja vaadata, kas viga on ikka olemas. Kui on, siis võib olla probleem salvestatud skriptis.
#' 
#' R-is saab salvestada skripte lihtsas skriptifailis, millel on .R lõpp või siis Rmarkdown failis, millel on .Rmd lõpp. Rmarkdown on lisamoodul R-is mis aitab teksti ja koodi hoida samas failis.
#' 
#' Nii .R kui .Rmd failis või RStudio kaudu käske käivitada ühekaupa. Üldiselt on käsk ühe rea peal, ning selle käivitamiseks tuleb viia oma tekstikursor sellele reale ja vajutada Windowsis ja Linuxis CTRL+ENTER, Mac-is CMD+ENTER. Sama käsk on ka RStudios ülal Run all Run -> Run selected line(s). Tekstikursoriga saab valida ka mitu rida või osa ühest või mitmest reast ja kui osa teksti on valitud, siis käivitab R ainult selle. Käsu jooksutamiseks konsooliaknas (RStudios all vasakul) kasutage lihtsalt ENTER.
#' 
#' Peaaegu kõikide käskude puhul on võimalik lisada käsu ette küsimärk, mille käivitamisel ilmub paremalle alla nurka selle käsu kasutusjuhend.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

?read.csv


#' 
#' 
#' ## R lihtsa kalkulaatorina
#' 
#' Näiteks võib lasta tal arvutada lihtsamat matemaatikat. Näiteks võime käsuks anda lihtsalt 5+7 ja R käivitab selle ning trükib välja tulemuse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

5 + 7


#' 
#' Tulemus on näha ülal. Kui käivitad käsu RStudios, jõuab tulemus konsooli. 5 ja 7 olid sisendnumbrid ja + oli operatsioon, mille R tegi, mis antud juhul tähendas liitmist. R-is saab ka teha teisi tehteid.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1+1
4-2
4*2
27*17
459/17
sqrt(25)


#' 
#' Tärn tähistab kordusmärki ja kaldkriips jagamist. sqrt() võtab ruutjuure sellest numbrist. Viimane ongi tüüpiline viis R-ile käske anda
#' 
#'     funktsioon(sisend)
#' 
#' Tidyverse-s on selle kõrval teine tava.
#' 
#'     andmed %>% 
#'         funktsioon()
#' 
#' Nad mõlemad teevad täpselt sama asja, lihtsal Tidyverse-i võtab vaikimisi sissesöödetud andmed funktsiooni sisendiks. Sellest rohkem peagi.
#' 
#' 
#' ## Tulemuste salvestamine
#' 
#' Kui R-i võib kasutada lihtsa kalkulaatorina, siis selle jõud tuleb välja siis kui tuleb mingit andmehulka või tehteid korduvalt kasutada. Selle jaoks on võimalik nii andmeid kui funktsioone R-is kergesti salvestada.
#' 
#' Tavaliselt kasutatakse salvestamiseks noolt <-, mis on koostatud väiksem-kui märgist ja sidekriipsust. Üksikut võrdusmärki = saab aga kasutada enamasti samas tähenduses. Seda märki saab teha ka vajutades korraga alla ALT + - ehk ALT + miinusmärk. Tähele tuleb panna, et üksik võrdusmärk = ja topelt võrdusmärk == on R-is erinevas tähenduses.
#' 
#' Me võime alustuseks teha muutuja x, mille sisuks on  5 + 7. Selleks kirjuta x <- 5 + 7."
#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x <- 5 + 7


#' 
#' Kui R salvestab tulemuse muutujasse, ei trüki ta seda enam välja. Seda seepärast, et ta salvestamise juures eeldab, et me soovime sellega midagi veel teha. Et vaadata muutuja sisu, trükime selle lihtsalt sisse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x


#' 
#' Me võime muutujat omakorda kasutada uue muutuja loomiseks. Näiteks loome muutuja y, mis koosneb x-st ja 3-st. R otsib üles x-i väärtuse ja kasutab seda y-i arvutamiseks. Kui x poleks määratud, siis R sellist y-it vastu ei võtaks.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

y <- x - 3


#' 
#' Me võime vaadata y-i väärtust nüüd samamoodi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

y


#' 
#' Seejuures kui me nüüd muudame x-i tagantjärele, siis y enam ei muutu. Muudame x-i neljaks ja vaatame, et y-i väärtus säilib ikka.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x <- 4
y


#' 
#' X-i saab määrata nii noole <- kui ka võrdusmärgi = abil. Järgmised operatsioonid on võrdsed.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x <- 4
x =  4


#' 
#' ## Tehete järjekord
#' 
#' Muutujate tegemisel on oluline operatsioonide järjekord. Samamoodi nagu matemaatikas tehete järjekorra määramiseks, saame järjekorda R-is määrata sulgude kaudu. Näiteks tavamatemaatikaga sarnaselt on järgmised kaks tehet erinevad.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

z <- x+y*2
z
z <- (x+y)*2
z


#' 
#' ## Võrdused ja võrratused
#' 
#' Väga sagedasti on meil andmetöötlusel vaja kahte väärtust võrrelda. Näiteks leida kõik inimesed, kes on vanemad kui 60 või siis kõik andmed, mis pärinevad 2010 jaanuarikuust. Selleks on R-is kasutusel hulk viise kontrollida samasust ja erinevust.
#' 
#' Kaks võrdusmärki == kontrollib, kas kaks objekti on täpselt võrdsed ja vastab sellele, kas TRUE või FALSE ehk kas tõene või väär. Koodi kirjutades võib TRUE ja FALSE lühendada vastavalt T ja F.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1==1
1==2
x==4
x==y
x==y*2


#' 
#' Eitust märgitakse nendes kontrollides hüüumärgiga !. Võrdsusetuse kontrollimiseks võime kasutada märki hüüumärki koos võrdusmägiga != või asetada hüüumärgi ! kontrolllause ette. Kõik järgnevad laused kontrollivad hüüumärgi kaudu ühenduse eitust.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1!=1
1!=2
!1==1
!1==2


#' 
#' Lisaks võrdsusele saame numbrite puhul kontrollida ka kas esimene number on väiksem kui <, suurem kui >, väiksem/võrdne <= või suurem/võrdne >= teisest numbrist.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1 < 1
2 > 1
1 <= 1
2 >= 2


#' 
#' 
#' ## Muutujate nimed ja tekst
#' 
#' R-is töödeldakse lisaks numbritele ka teksti. Et mitte segamini ajada muutujate nimesid ja teksti, peab tekst olema alati jutumärkides. Kui me kirjutame x või y ilma jutumärkideta, otsib R üles need muutujad ja väljastab nende väärtuse. Kui me tahame, et R mõistaks x-i ja y-it tekstina, peame need ümbritsema jutumärkidega, kas ühekordsete ('näidis') või kahekordsetega ("näidis")."
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x
y
'x'
"y"


#' 
#' Seni kuni ta on tekstijupi sees on ta ükskõik kui pikk, võib sisaldada tühikuid ja muid märke.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

"Siin on kirjutatud lause ühe tekstielemendina."


#' 
#' Ja sellegi saame me salvestada samamoodi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

a <- "Siin on kirjutatud lause ühe tekstielemendina."


#' 
#' Seejuures võib muutujate nimeks olla peaaegu ükskõik mis. Muutuja ei või ainult alata numbriga, sisaldada tühikuid sidekriipse, kooloneid, trelle ja muud, millel on R-i algsüntaksis juba tähendus. Muutuja võib kasutada suuri ja väikseid tähti. Näiteks võime teha muutuja kuuliLennuTeeTunneliLuuk.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

kuuliLennuTeeTunneliLuuk <- "Siin on kirjutatud lause ühe tekstielemendina."


#' 
#' Üldiselt on ka soovitus, et muutujate nimed võiksid olla pigem informatiivsed kui a, b ja c, kuna kuue kuu pärast ei mäleta enam keegi, mis see a täpselt oli, ilma hoolikalt koodi lugemata.
#' 
#' Kui me aga unustame tekstielemendi ümber jutumärgid, siis annab R meile veateate. Ta ei leia sellist objekti üles.
#' 
## ---- eval=F--------------------------------------------------------------------------------------------------------------------------------------------------
## 
## tundmatumuutujanimi
## 

#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# Error: object 'tundmatumuutujanimi' not found.


#' 
#' Selliseid veateateid annab R üldse kui kuskil on koodis viga ning R ei suuda seda käivitada. Tihti tuleb ette, et kuskil on sulud vales kohas või sulgemata ja R arvab, et miski peaks olema objekt kuigi see on mõeldud funktsioonina. Kui oma silm kohe viga ei leia, tasub panna veateade google-isse. Kuna sarnased probleemid tulevad teistelgi sagedasti ette, siis on tihti seal esimese vastusena lahendus olemas. 
#' 
#' ## Jadad
#' 
#' Tavaliselt töötab R rohkem kui ühe väärtusega korraga kasutades jadasid ehk vektoreid. Jadasid võib teha näiteks numbritest või tekstijuppidest, aga näiteks ka tabelitest (nendest siin õppetükis ei räägi).
#' 
#' Selleks on kaks lihtsamat võimalust. Kooloniga : saab teha numbrijärjendi ja c() funktsiooniga saab teha järjendi numbritest või tekstielementidest. Sarnaseid funktsioone on veel, nt seq() või rep(), mida saate ise edasi uurida. Näiteks all on jadad 1 kuni 10 ja a, b, c.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1:10
c("a","b","c")


#' 
#' Ka c()-ga võib teha jadasid, samuti võib sinna panna muutujate nimesid. Kui jada sisaldab vähemalt ühte tekstielementi, teeb ta ka kõik numbrid tekstiks. Jad elemendiks võib olla ka teine jada, c() käsk seab nad kõik samale tasapinnale
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

x <- 4

c("a", 1, x)

c(1, 4, 8)

c(1:8, 2, 4)

c(4, 6, c(1, 2, 3))


#' 
#' Et kontrollida, kas miski element on olemas jadas, kasutatakse käsku %in%. %in% kontrollib, kas esimest elementi leidub teises
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

1 %in% 1:10


#' 
#' Samaaegselt võib kontrollida ka mitut elementi ühes jadas. Järgmine kontrollib, millised elemendid jadast 2 kuni 10 on ühtlasi jadas 1 kuni 5
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

2:10 %in% 1:5


#' 
#' Sama võib teha ka tekstijadaga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

c("a","b","c","f") %in% c("a","b","c","d","e")


#' 
#' Ka %in% märki saab kombineerida hüüumärgiga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

!2:10 %in% 1:2


#' 
#' Vektoreid saab samamoodi salvestada nagu muid R-i objekte
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

numbrivektor <- 1:10
numbrivektor

tekstivektor <- c("a", "b", "c", "d","e","f","g","h","i","j")
tekstivektor


#' 
#' 
#' Lisaks numbritele ja tekstidele on R-is veel üks oluline vektoritüüp, faktor. Faktorid on kategoorilised muutujad, kus väike hulk tüüpe, mis korduvad.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

faktor <- factor(c("a","a","a","a","a","b","b","b","b","b"))
faktor


#' 
#' Näiteks ülal on siis 10 elemendi pikkune faktor, kus on kaks tüüpi a ja b. Faktoril on niisiis lisaks jadale oluliseks selle tasandid levels(). 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

levels(faktor)


#' 
#' Tasandeid saab ümber nimetada, muutes neid kogu jada ulatuses. 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

levels(faktor) <-c("naine","mees")
faktor


#' 
#' Ning tasandite järjestust saab muuta. Tasandite järjestuse muutmine ei muuda jada ennast. Tüüp a jääb a-ks ja tüüp b jääb b-ks.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

faktor <-factor(faktor,levels=c("mees","naine"))
faktor


#' 
#' Tasandite järjestus mängib olulist rolli mudelite ja graafikute loomisel.
#' 
#' Tähelepanelikult tuleb jälgida, et numbermuutujad ei oleks mõistetud R-i poolt kui faktorid, kuna kasutades numbritele mõeldud operatsioone, kohaldab R kõikidele andmepunktidele selle faktori väärtust. Faktorite järjestus on tihti tähestiku või ilmumise järjekorras. Näiteks kui me teeme kasutatud faktori numbriteks, on need järjest 1 ja 2.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

as.numeric(faktor)


#' 
#' Kui me aga teeme uue faktori, kus on nii numbrid kui tähed selle tasanditeks, siis selle tegemine numbriteks ajab ka numbrijärje sassi. Tähelepanu tuleb osutada eriti kui mõnikord on mõne numbri asemel tabelis tekst või on puuduv väärtus märgitud mõne tähemärgiga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

faktor2 <-factor(c(5,7,4,"a","u","b"))
faktor2
as.numeric(faktor2)


#' 
#' Õiged numbrid saab kätte muundades faktori enne tähtedeks ja siis numbriteks. 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

as.numeric(as.character(faktor2))


#' 
#' R-i vanemad paketid on enamasti seatud nii, et tekstitulp loetakse vaikimisi sisse faktorina. Faktorite vale ümbertõlgendamine on viinud ka mitmete vigadeni avaldatud teaudstöödes. Tidyverse paketid andmete sisselugemisel enam faktoreid vaikimisi ei lisa. Põhipaketis failide sissemuutmisel tasub silmas pidada parameetrit *stringsAsFactors*.
#' 
#' ## R paketid
#' 
#' Lisaks põhikäskudele on R-is hulk lisapakette, mis avavad uusi kasutusvõimalusi ning teevad olemasolevaid võimalusi mugavamaks. Praeguse õppetüki fookuses olev *tidyverse* on pakettide komplekt, mis püüab teha mõlemat.
#' 
#' Iga paketi puhul tuleb see R-is esiteks 1) arvutisse installida ja teiseks 2) iga kord R-i või RStudiot käivitades sisse lülitada.
#' 
#' Paketi installimiseks on olemas käsk install.packages(). Sama käsu leiab ka ülalt menüüst Tools -> Install Packages... alt, kus saab kirjutada endale soovitavad paketid komadega eraldatult sisse. RStudio pakub ka kirjutamise ajal välja, mis paketid need võiksid olla. Uuemates RStudio versioonides on ka mõnikord skriptiakna kohal teade, et teatud paketid on installimata, kas soovite neid installida. Kui vajutada seal install, siis käivitab R sama install.packages() protsessi.
#' 
#' Installime kõigepealt oma arvutisse tidyverse paketid. See võtab natuke aega, las arvuti töötab. Konsoolis näidatakse installikäiku, seal võib olla punast teksti ja hoiatusi, aga kui lõpuks on teade "* DONE (tidyverse)", on kõik hästi. RStudios hakkab installimise ajal vilkuma punane stopnupp konsooli ülal-paremal otsas. Ärge sinna vajutage. Kui vajutate võib installimine katki minna. Kui see millegipärast on juhtunud, siis enamasti aitab remove.packages() samadele pakettidele ja siis uuesti proovida.
#' 
## ----eval=F---------------------------------------------------------------------------------------------------------------------------------------------------
## 
## install.packages("tidyverse")
## 

#' 
#' Paketi sisselugemiseks kasutame funktsiooni library(). Peaaegu samaväärne funktsioon on require() kui mõnikord skriptides on just seda kasutatud. Loeme kõigepealt sisse library(tidyverse).
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

library(tidyverse)


#' 
#' Tidyverse käivitamisel võiks teie isiklikus arvutis näha midagi sellist. Ta näitab seal ka paari konflikti, aga nende pärast ei pea praegu muretsema. Neid tuleb teinekord ette kui uues paketis on mõni käsk sama nimega kui mõnes teises sisselaetud paketis. Sellisel juhul arvab R, et viimasena laetud funktsioon on õigeim.
#' 
#' Väljatrükitust on näha, et R-i on sisselaetud paketid ggplot2, purr, tibble, dplyr, tidyr, stringr, readr ja forcats. Enamik pakette loevad sisse iseenda + enda töötamiseks vajalikud abipaketid (mida võib olla terve hulk). Tidyverse on üks väheseid pakette, mis loeb terve komplekti, mistõttu teised paketid võivad näidata teistlaadi teateid või, tavapäraselt, ei näitagi mingeid teateid. Senikaua kuni R veateadet ei näita library() käsu puhul, peaks olema kõik hästi.
#' 
#' Lisamärkusena. Pakette on võimalik kasutada kahel viisil. Arvutisse varem installitud paketi võib sisse lugeda library() käsuga, aga ükskõik mis paketiga installitud käsku võib käivitada käsuga pakett::käsk(). Näiteks kasutame paketi skimr käsku skim(), et saada loetud paketist ülevaadet.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# read_csv() on juba aktiveeritud tidyverse paketiga
gapminder <- read_csv("data/gapminder.csv")

# skim() käsk on skimr paketis, mis ei veel tervenisti aktiveeritud
gapminder %>% 
  skimr::skim()


#' 
#' 
#' Sellisel juhul ei ole vajalik, et pakett oleks aktiveeritud, küll aga peab see pakett arvutis installitud olema. Algajal kasutajl on soovitav vajalikud paketid igal juhul aktiveerida. Selles õppetükis on kasutatud pakett::käsk() käsustruktuuri iga kord kui käsk ei ole tidyverse põhipakettides.
#' 
#' 
#' # Töö andmetega
#' 
#' ## Tidy andmeloogika
#' 
#' Tidy andmeloogika on välja kasvanud tähelepanekust, et äärmiselt suur osa tööst uurimisprojektis võib kuluda andmete puhastamisele ja analüüsiks ettevalmistamisele. Selle ettepanek on üpris lihtne, et iga rida peaks olema vaatlus, iga tulp tunnus ning iga väli vastav väärtus. See võib tunduda endast mõistetav, aga tabeleid, mis on inimsilmale loetavad on väga erinevaid (nt võib ühes tulbas olla korraga mitu vaatlusaspekti või eri väärtused salvestatud eri tulpadena). Vaata näiteid [Hadley, 2014 artiklist](https://vita.had.co.nz/papers/tidy-data.pdf), mis idee esitab. Kui andmed on kasutatavad ühtsel kujul on võimalik ka analüüsivahendites selle kujuga arvestada ning lihtsustada seeläbi analüüsikäiku. See, mis täpselt on vaatlus ja mis on tunnus muidugi sõltub täpsemalt meie analüüsiküsimustest.
#' 
#' <center>
#' ![](figures/tidy_data.png)
#' </center>
#' 
#' ## Andmefailide lugemine
#' 
#' Andmefailide lugemine käib enamasti üherealiste käskudega, millele saab lisada parameetreid. Samamoodi nagu muu info, tasub need salvestada muutujasse.
#' 
#' Tavaline on näiteks .csv ehk komaga eristatud väärtuste fail. Loeme ühe sellise sisse. Tidyverse paketis on read_csv() käsk. R-i baaspaketis on read.csv() üsna sarnane toimeviisilt. Tidyverse versioon teeb mõned asjad mugavamaks. Muuhulgas näitab read_csv() kohe ülevaadet sisseloetud andmestikust ja sealsetest andmetüüpidest. Peamised tüübid on *double* igasugu numberväärtuste jaoks ja *character* igasugu teksti jaoks. Parameetritega saab täpsustada, kuidas täpselt faili lugeda.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# Allikas https://cran.r-project.org/web/packages/gapminder
gapminder <- read_csv("data/gapminder.csv")


#' 
#' Lihtne viis R-is vaadata andmestikku on klikkides selle nimele paremal ülal *environment* menüüs või kasutades View() käsku.
#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

View(gapminder)


#' 
#' Vastavalt failile tuleb valida ka käsk või parameetrid. Näiteks eesti keeleruumis on komaga eristatud väärtuste failis kasutatud eristamiseks semikoolonit ja numbrites komakohana koma (0,05). Inglise keeleruumis on numbrite komakohaks teadagi punkt (nt 0.05). Et tegemist on sageda juhtumiga, on selleks *tidyverse* paketis olemas eraldi käsk read_csv2(), mis võtab nö "Euroopa .csv vormi".
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder <- read_csv2("data/gapminder_euro.csv")


#' 
#' Levinud on ka näiteks .tsv ehk tabulatsiooniga eraldataud väärtuste failid. Selle jaoks on kasutusel read_tsv() käsk. 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder <- read_tsv("data/gapminder.tsv")


#' 
#' Lisaks on paketis ka read_delim() käsk, kus saab parameetrid ise sättida. *delim* märgib vaheväärtust, mis võib olla näiteks koma, semikoolon või midagi hoopis muud. Komakohaväärtus märgitakse asukohaspetsiifiliste väärtuste locale sees. Parameetrid märgitakse R-is sulgude vahele, märkides kõigepealt parameetri nime ja siis väärtuse. Tihti on parameetrite vaikejärjekord paigas ja kui parameetri nime ei ole määratud võetakse see järjekorra järgi. Näiteks varem sulgude vahele kirjutatud faili asukoht antakse edasi parameetrile *path*, kuna see on read_tsv() esimene parameeter.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder <- read_delim("data/gapminder.csv",delim=",")
gapminder <- read_delim("data/gapminder.tsv",delim="\t")
gapminder <- read_delim("data/gapminder_euro.csv",delim=";", locale=locale(decimal_mark = ","))


#' 
#' Võimalikke parameetreid ja väärtusi saab vaadata kõikide käskudega kaasas olevast abitekstist asetades koodireal käsu ette küsimärgi. Nt vaata ?read_delim all. Abitekst ilmub RStudios all paremal paiknevasse aknasse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

?read_delim


#' 
#' ### Erinevad failitüübid
#' 
#' Andmeid esitatakse, jagatakse ja hoitakse üsna erinevatel viisidel - mitte alati ei ole võimalik saada lihtsat .csv või .tsv faili, mis sobib hästi R-ile. Igasuguste failitüüpide jaoks, mis on olnud sobivad teistes kontekstides või teistes programmides on loodud hulk eraldiseisvaid pakette, mis aitavad neid failiformaate lugeda. Võimalik, et vajalik failitüüp ei ole kõige levinuim neist, aga kui otsida google-ist või stackoverflow-st R ja oma failitüüp ja read, siis tõenäoliselt on vastus olemas.
#' 
#' Siin toome paar näidet levinumatest tüüpidest, mida võib vaja minna: .xlsx, .sav, .xml ja .json. R-is on tihti loodud ka pakette andmete hankimisek.
#' 
#' #### Exceli failid
#' 
#' Exceli failide jaoks on omaette pakett [readxl](https://readxl.tidyverse.org/). See on installitud koos tidyverse pakettidega, aga tuleb eraldi sisse lugeda või viidata käsus.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# Allikas https://www.stat.ee/stat-rahvaarv-aasta-alguses
excel_fail <- readxl::read_xls(path="data/Rahvaarv aasta alguses, aastad.xls",skip=1)



#' 
#' 
#' #### SPSS failid
#' 
#' SPSS, Stata ja SAS failide lugemiseks on samuti eraldi pakett [haven](https://haven.tidyverse.org/), mis installitakse koos tidyverse-iga, aga tuleb aktiveerida eraldi või viidata käsus.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

#library(haven)

# Allikas https://www.europeansocialsurvey.org/data/download.html?r=9
spss_fail <- haven::read_sav("data/ESS9EE.sav")



#' 
#' 
#' #### XML failid
#' 
#' XML failide jaoks on mitmeid pakette. Tidyverse komplektis on installitud [xml2](https://github.com/r-lib/xml2). XML andmestike puhul võib olla ka standardformaate. Näiteks Statistikaamet on hakanud kasutama sdmx andmestiku standardit. Selleks on R-is olemas oma pakett rsdmx. Et see pole tidyverse paketiga kaasas tuleb see kõigepealt installida. Seejärel võib sellega lugeda näiteks allalaetud xml faili või andmete saamiseks loodud linki
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

#install.packages("rdsmx")
library(rsdmx)

# Allikas http://andmebaas.stat.ee/ -> RV021
sdmx_xml_fail <- rsdmx::readSDMX(file = "data/stat_ee_RV21_compact.xml",isURL=F) %>%  as.data.frame()

# Allikas https://cran.r-project.org/web/packages/rsdmx/vignettes/quickstart.html
sdmx_xml_url <- rsdmx::readSDMX("http://stats.oecd.org/restsdmx/sdmx.ashx/GetData/MIG/TOT../OECD?startTime=2000&endTime=2011",isURL=T) %>% as.data.frame()



#' 
#' #### JSON failid
#' 
#' Tihti esinevad andmed ka json formaadis. Selle jaoks on tidyverse-iga kaasas pakett jsonlite, mis tuleb samuti eraldi aktiveerida või viidata käsu sees. Sellega võib lugeda ka kohalikke faile või laadida otse faile alla netist.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

library(jsonlite)

# Allikas https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-10-01
json_fail <- jsonlite::fromJSON(readLines("https://jaredlander.com/data/PizzaPollData.php"), flatten = TRUE)


#' 
#' #### Andmete hankimine pakettide abil
#' 
#' R-i pakette on hakatud ka kasutama viisina andmete levitamiseks. Need võivad olla kaasas mõnes paketis funktsioonide näiteandmetena, näiteks gapminderi paketis või andmekogude haldajad või kasutajad on loonud pakette andmete kättesaamise lihtsustamiseks. Sellised paketid on olemas näiteks [eurostati avaandmetel](https://cran.r-project.org/web/packages/eurostat/index.html) või [gutenbergi tekstikogul](https://cran.r-project.org/web/packages/gutenbergr/vignettes/intro.html). Näiteks aktiveerides gapminderi paketi, saame me kaasa gapminderi andmestiku või lugedes sisse eurostati paketi saame me kaasa get_eurostat() käsu, kuhu kirjutatud andmestiku nime järgi laeb pakett alla ajakohased andmed. Viimasel ajal on kasutatud R-i pakette ka üksikartiklitega kaasas olevate andmestike ja analüüside jagamiseks.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

andmed_paketist1 <- gapminder::gapminder

andmed_paketi_abil1 <- eurostat::get_eurostat('demo_mlexpec')

andmed_paketi_abil2 <- eurostat::get_eurostat('hlth_silc_08')


#' 
#' 
#' ## Andmete eemaldamine
#' 
#' Kui meil andmestikke vaja ei ole, saame nad eemaldada käsuga rm(), kuhu võib lisada kõik muutujad, mis me soovime eemaldada. Eraldatud komadega.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

rm(gapminder, excel_fail, json_fail)


#' 
#' Kui me soovime eemaldada kõik sisse loetud andmestikud, saame kasutada käsku rm(list=ls()). ls() näitab kõiki sisseloetud muutujaid. Sama teeb luua märk andmete kohal paremal ülal ääres.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ls()

rm(list = ls())


#' 
#' # Valimi loomine ja tunnuste valik
#' 
#' ## Andmed
#' 
#' Loeme sisse kolm eri tüüpi andmestikku. Pikas formaadis anded, kus on iga mõõtmishetk ühel real, laias formaadis andmed, kus on mõõtmised tehtud tüüpide järgi rea tunnusteks ning suured küsitlusandmed, kus on igal mõõtmisel mõõdetud korraga väga palju erinevaid tunnuseid.
#' 
#' - Pikad andmed: *GAPMINDER* 1952-2007 oodatav eluiga, rahvaarv ja GDP inimese kohta valitud maailma riikides
#' - Laiad andmed: *EUROSTAT* 1960-2018 oodatav eluiga igal aastal Euroopa Liidu riikides.
#' - Suur küsitlus: Euroopa Sotsiaaluuringute 9. vooru küsitlustulemused Eesti kohta (2018)
#' 
#' Alustuseks avame paketid, mis sisaldavad meile vajalikke käske. Vajalikud paketid tuleb avada iga kord kui me käivitame R-i.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# tidyverse pakett hulk erinevate käskude jaoks
library(tidyverse)

# haven pakett spss andmete lugemiseks
library(haven)


#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# GAPMINDER andmed pärinevad näidisandmestikust *gapminder* paketis ja on tehtud varem R-ile sobivaks.
gapminder <- read_csv("data/gapminder.csv")

# EUROSTAT andmed on laetud alla oma kodulehelt .tsv kujul.
eu_lifeExp <- read_tsv("data/demo_mlexpec.tsv")

# Euroopa Sotsiaaluuringute küsitlus on laetud alla oma kodulehelt SPSS faili .sav kujul.
ess9_ee <- haven::read_sav("data/ESS9EE.sav")


# EUROSTAT andmestikus on küll andmeväljad eraldatud tabulatsioonimärgiga, aga ridade identifikaatorid on eraldatud komaga.
# Selleks et eraldada komaga eraldatud andmeväljad, kasutame funktsiooni separate, mis lahutab ühe tulba mitmeks määratud eraldusmärgi alusel.
# Siin lahutame esimese tulba (col = 1), neljaks tulbaks, mille nimed on lisatud vektorina ja määrame eraldusmärgiks koma.
# Kuna me tahame tabelit sellisel kujul kasutada läbivalt, salvestame üle tabeli enda muutuja.
# Käsu süntaksit selgitame lähemat allpool.

eu_lifeExp <-
  eu_lifeExp %>% 
  separate(col=1,into=c("unit","sex","age","geo"), sep=",")


#' 
#' ## Andmete töötlus *tidyverse* stiilis R-is
#' 
#' Andmete töötlemiseks on R-is mitmeid eri stiilivariante või "murdeid". Levinuimad neist on ehk base-R ehk liht-R, tidyverse ja data.table. Igaüks toob kaasa oma variatsiooni R-i süntaksist ja lubab mõnd asja lihtsamini teha kui teine.
#' 
#' *Tidyverse* pakettide töötluses on peamiseks operaatoriks %>% toru. See toru liigutab endale eelnenud töötluse tulemuse edasi ning annab selle aluseks järgmisele protseduurile. Tavaliselt on R-is igal real üks käsk. R on aga piisavalt tark, et näha kui käsk ei lõppe rea lõpuga - näiteks kui sulud on sulgemata või rea lõpus on %>% toru ja jätkab lugemist järgmiselt realt. Seetõttu tasub ka kindlasti vaadata, et rea lõpus on sulud kenasti suletud ja käsk ka lõppeb seal, kus soov on.
#' 
#' Tidyverse töömudel on järgmine. Võttes aluseks andmed, suuname nad läbi %>% toru protsessi 1 ja seejärel selle protsessi tulemuse ka protsessi 2. Kuna viimasel real ei ole toru, teab R ka töötluse siis lõpetada. Kuna meil pole andmeid nimega andmed ja selliseid protsesse, siis see kood ei tööta.
#' 
## ---- eval = F------------------------------------------------------------------------------------------------------------------------------------------------
## 
## andmed %>%
##  protsess1() %>%
##  protsess2()
## 

#' 
#' Vaatame alustuseks lihtsaid käske, mis on mõeldud andmestikust esimese ülevaate saamiseks ja sellest endale vajaliku osa eraldamiseks. Selleks on olemas järgmised vahendid.
#' 
#' - %>% - vii andmed järgmisesse protsessi
#' - select() - vali soovitud tunnused
#' - filter() - vii andmestik läbi filtri/sõela
#' - unique() - jäta alles ainult unikaalsed read
#' 
#' Trükkides sisse andmestiku nime, näeme selle sisu. Gapminder andmestik sisaldab tunnuseid riik, manner, mõõtmise aasta, oodatav eluiga, rahvaarv ja GDP rahvaarvu kohta. Samas on iga riigi kohta 12 mõõtmisaastat perioodi sees, mis on asetatud igaüks ise reale.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder


#' 
#' ## Tunnuste valimine
#' 
#' Kui me nüüd tahaksime võtta sellest ainult valitud tulbad, siis kasutame käsku select(). Kirjutame selleks soovitud tunnuste nimed sulgude vahele
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  select(country,continent,year,lifeExp)


#' 
#' Me saame sama teha ka numbritega. Mäletate, et koolon tähendas numbrite vahemikku, ehk 1:4 tähendab tulpi 1-4.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  select(1:4)


#' 
#' Me võime ka võtta ainult riigi ja mandri. Sellisel juhul on näha, et tabel ei muutunud sellest veel lühemaks. Riiginimed esinevad mitu korda ka siis kui mõõtmisaasta on eemaldatud.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  select(1:2)


#' 
#' Et jääks alles ainult unikaalsed read, kasutame käsku unique().
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  select(1:2) %>% 
  unique()


#' 
#' Näiteks, et näha kõiki mandreid selles andmestikus, valime ainult selle tulba ja lisame rea unique().
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  select(continent) %>% 
  unique()


#' 
#' Kuna gapminder on üpris kompaktne andmestik ja tulpade eraldamine oluliselt ülevaadet ei paranda. select() funktsiooni kasu tuleb esile alles suuremate andmestikega. Näiteks kui me vaatame eu_lifeExp andmestikku, näeme, et seal on hulk rohkem tunnuseid iga rea kohta.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp


#' 
#' Me võime vaadata, et tahame näiteks ainult 2017 aasta andmeid. Siin tuleb 2017 jutumärkidesse panna nagu on selle kuju ka ülevaates, kuna ta ei ole antud juhul numbri, vaid teksti rollis. Tunnuste nimed, mis ei meenuta numbreid võivad olla nii jutumärkides kui ilma.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp %>% 
  select(unit,sex,age,"geo","2017")


#' 
#' Võib juhtuda, et me ei taha ainult ühte aastat, vaid mõnd vahemikku. Selleks on võimalik kirjutada kõik nimed järjest select() alla. Või selle hõlbustamiseks sisaldab ka select() hulka lisafunktsioone, millega tunnuste valimist lihtsustada. Näiteks starts_with(), ends_with() võimaldavad valida tunnuseid, mille nimed algavad või lõppevad kindla mustriga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp %>% 
  select(unit,sex,age,"geo","2018","2017")

eu_lifeExp %>% 
  select(unit,sex,age,geo,starts_with("200"))

eu_lifeExp %>% 
  select(unit,sex,age,geo,ends_with("5"))


#' 
#' Viimaks on meil võimalik ka kasutada keerulisemaid mustreid. matches() võimaldab kasutada ka regulaaravaldisi tunnusenimede leidmiseks. Näiteks võime leida tunnused iga viie aasta tagant. "0$|5$" tähendab, et tekst peab lõppema 0-i või 5-ga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp %>% 
  select(unit,sex,age,geo,matches("0$|5$"))


#' 
#' See funktsioon tunnuste valimiseks võib osutuda eriti kasulikuks kui on tabelis väga palju tunnuseid, mille tunnuste nimed on omavahel sarnased teatud reeglite alusel. Näiteks meie sisseloetud küsitluses võime tahta korraga näha kõiki küsimusi, mis on seotud usaldusega. Need sisaldavad tunnusenimes trst ja me võime seda otsida. Näiteks siis kasutades starts_with() funktsiooni või matches() funktsiooni. matches() leiab ühe tunnuse enam, kuna ppltrst tunnuses pole otsitu enam tunnuse nime alguses.
#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  select(idno,cntry,starts_with("trst"))

ess9_ee %>% 
  select(idno,cntry,matches("trst"))


#' 
#' 
#' ## Valimi loomine
#' 
#' Kui select() funktsiooniga saab tunnuseid valida, siis meile vajalike ridade valimiseks on käsk filter(). filter() leiab meie seatud kriteeriumitele vastavad read ning jätab tabelist alles ainult need. Näiteksvõime võtta *gapminder* andmestikust kõik andmed, mis puudutavad Soomet või kõik andmed, mis on aastast 1952. Nagu R-i aluste peatükis sai öeldud, kasutame samasuse kontrolliks kahte võrdusmärki == .
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(country=="Finland")

gapminder %>% 
  filter(year==1952)


#' 
#' Me võime lisada ka mitu kriteeriumit lisades nende vahele ja-märgi & või koma , .
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(country=="Finland"&year==1952)

gapminder %>% 
  filter(country=="Finland",year==1952)


#' 
#' Me võime kasutada ka teisi võrdsuse kontrollimise viise. Näiteks võtame riigid, 1) mille rahvaarv oli aastal 1952 vähem kui 1 000 000 või 2) mille oodatav eluiga oli suurem kui 70 aastat või 3) kõik mõõtmistulemused mitte aastast 1952 (hüüumärk ! tähistab eitust), mille GDP elaniku kohta oli 500 ja 1000 usd vahel.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1952,pop<1000000)

gapminder %>% 
  filter(year==1952,lifeExp>70)


gapminder %>% 
  filter(!year==1952,gdpPercap>500,gdpPercap<1000)


#' 
#' Täpselt samamoodi võime soovida võtta ainult osa ridu eu_lifeExp andmestikust. Võtame alustuseks ainult eesti kohta käivad andmed. Näeme, et seal on oodatav edasine eluiga määratud vanuste järgi. Valime sealt Y1, mis arvutab oodatava eluea sünnihetkel. Seejärel näeme, et seal on eraldi ridadel sugu F, M ja T. Valime sealt T ehk kõik. Kuna T on tekst on vaja jutumärke selle ümber.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp %>% 
  filter(geo=="EE")

eu_lifeExp %>% 
  filter(geo=="EE"&age=="Y1")

eu_lifeExp %>% 
  filter(geo=="EE"&age=="Y1"&sex=="T")


#' 
#' Või ESS9 puhul võime võtta kõik, kelle sooks on märgitud 1 või kelle usaldus poliitikutesse on kõrgem kui 7.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  filter(admge==1) %>% 
  select(idno,admge)

ess9_ee %>% 
  filter(trstplt>6) %>% 
  select(idno,starts_with("trst"))


#' 
#' ## Juhuvalimi tegemine
#' 
#' Võib juhtuda, et soovime valida juhuslikud andmeread andmestikust. Selle jaoks on olemas käsk sample_n(), mis võtab andmestikust *n* suvalist rida. Vaikimisi ei korrata ühtki rida, aga selle muutmiseks on võimalik lisada parameeter replace = TRUE. Lisaks, on võimalik lisada ridadele ka kaalud, mida valimi tegemisel arvestatakse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==2007) %>% 
  sample_n(10)

eu_lifeExp %>% 
  filter(age=="Y1",sex=="T") %>% 
  sample_n(10)

ess9_ee %>% 
  sample_n(100)

ess9_ee %>% 
  sample_n(100, weight=dweight)


#' 
#' # Ülevaated ja andmete grupeerimine
#' 
#' Et tüüpiliselt on esimese asjana soov andmestikust lihtsalt ülevaadet saada, on selleks loodud eraldi paketid ja käsud. Vaateme siin kahte: *summarytools* ja *skimr*. Ühe hea ülevaate sel teemal leiab [siit](https://dabblingwithdata.wordpress.com/2018/01/02/my-favourite-r-package-for-summarising-data/).
#' 
#' ## Koondülevaated
#' 
#' ### summarytools
#' 
#' *summarytools* paketis on olulisim käsk dfSummary, mis annab ülevaate tervest sellele antud tabelist. dfSummary trükib utlemused konsooli, lisades view() väikse tähega tehakse tulemustest kena html tabel. Suure tabeli Näiteks võtame 1957 aasta ülevaate *gapminderis*, 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

library(summarytools)

gapminder %>% 
  filter(year==1957) %>% 
  dfSummary()

eu_lifeExp %>% 
  select(unit,sex,age,geo,matches("0$|5$")) %>% 
  filter(age=="Y1"&sex=="T") %>% 
  dfSummary() %>% 
  view()

ess9_ee %>% 
  select(starts_with("trst")) %>% 
  dfSummary() %>% 
  view()



#' 
#' Me võime trükkida ka kogu tabeli. Suure tabeli ülevaate loomine võib võtta natuke aega.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  dfSummary() %>% 
  view()


#' 
#' #### Puuduvad väärtused
#' 
#' Märkasime ka ühes tabelis probleemi. Nimelt on küsimuste vastustel üks võimalik vastus koolon :, mis tähistab andmestikus puuduvat andmemärki. Samuti võiks
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp <- read_tsv("data/demo_mlexpec.tsv", na = ":")

eu_lifeExp <-
  eu_lifeExp %>% 
  separate(col=1,into=c("unit","sex","age","geo"), sep=",")

eu_lifeExp %>% 
  select("2016") %>% 
  unique() %>% 
  arrange(get("2016"))

eu_lifeExp %>% 
  select(unit,sex,age,geo,matches("0$|5$")) %>% 
  filter(age=="Y1"&sex=="T") %>% 
  dfSummary() %>% 
  view()


#' 
#' #### Sildid andmeväärtustel
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

trst_cols <- ess9_ee %>% 
  select(idno,cntry,matches("trst"))

view(dfSummary(trst_cols))

trst_chars <- trst_cols %>% 
  rio::factorize()
view(dfSummary(trst_chars,max.distinct.values = 15))


#' 
#' ### skimr
#' 
#' Teine funktsioon ülevaadete saamiseks, mis trükib tulemused veidi kompaktsemalt konsooli on skim() *skimr* paketist. Näiteks võime võtta ülevaate 1952 aasta *gapminder* andmetest, sünnist oodatava eluea euroopa riikides (pane tähele ajaga kahanev puuduvate väärtuste arv) ja usaldusega seotud mõõdikute kohta. ess9_ee puhul tuleb kasutada vahepeal *haven* paketi lisafunktsiooni zap_labels(), mis eemaldab andmestikult SPSS failiga kaasa tulnud sildid. R-is tavaliselt silte andmete küljes ei hoita, pigem dokumentatsioonis, mistõttu mitmed funktsioonid, nagu ka skim(), ei pruugi töötada ilma eelnevalt silte eemaldamata.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

library(skimr)

gapminder %>% 
  filter(year==1952) %>% 
  skim()

eu_lifeExp %>% 
  filter(age=="Y1",sex=="T") %>% 
  skim()

ess9_ee %>% 
  select(idno,starts_with("trst")) %>% 
  zap_labels() %>%
  skim()


#' 
#' skim() tulemuse saab samamoodi nagu iga R-i funktsiooni tulemuse salvestada muutujasse ning tekkinud tabelit võib omakorda edasi töödelda. Näiteks võime võtta top_n() funktsiooniga kaks tunnust, millel on kõige vähem puuduvaid väärtusi. Esimene neist on identifikaator, teine usaldus politseisse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

skim_ess9_ee <- ess9_ee %>% 
  select(idno,starts_with("trst")) %>% 
  zap_labels() %>%
  skim()

ess9_ee %>% 
  select(idno,starts_with("trst")) %>% 
  zap_labels() %>%
  skim() %>% 
  top_n(2,complete_rate)

ess9_ee %>% 
  select(idno,starts_with("trst")) %>% 
  #rio::characterize() %>% 
  zap_labels() %>% 
  skim()


#' 
#' ## Andmete grupeerimine
#' 
#' Andmestikku on ka võimalik mingil alusel grupeerida funktsiooniga group_by(). Sellisel juhul saab paljusid funktsioone rakendada grupi kaupa. Ja tekitada koondtabeleid funktsiooniga nest(). nest() koondab tabeli gruppide kaupa kokku, nii et tekib nö tabel tabelis. group_by() esialgu lihtsalt lisab tabelile tunnuse. nest() koondab gruppide kaupa ülejäänud tunnused eraldi tabeliteks. Grupeerida ja koondada saab korraga mitme tunnuse alusel. Koondatud tabelis on võimalik kasutada funktsioone iga koondvälja kohta. Sellest siin me ei räägi, aga edasi võib lugeda sel teemal [Grolemund & Wickham, 2017 raamatust siit](https://r4ds.had.co.nz/many-models.html).
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  group_by(country)

gapminder %>% 
  group_by(country) %>% 
  nest()

gapminder %>% 
  group_by(country,continent) %>% 
  nest()


#' 
#' ### Grupi parameetrite abil filtreerimine
#' 
#' Grupeerimine muudab ka veidi teiste funktsioonide toimeviisi. Nimelt, kus vähegi midagi arvutatakse, tehakse seda grupi kaupa. Selle jaoks on R-is hulk funktsioone - lihtsamad neist on mean(), median(), sd(), min(), max(), row_number(), first(), last(), n(). Nende sisu peaks olema üldiselt ennastseletav. Täpsema info jaoks lisage mõiste ette küsimärk ?, nt ?row_number ja uurige lähemalt.
#' 
#' Kui me filtreerime andmestikku ilma gruppideta, siis iga funktsioon töötab terve andmestiku peal. Näiteks row_number()<10 võtab esimesed 10 rida andmestikust. Püüdes võtta keskmist filtri aluseks, kasutades funktsiooni mean() tunnuse pop peal, võtab tabel keskmise kõigi vaatlusandmete peale. (Antud juhul 29.6 miljonit.) Kui me nüüd proovime filtreerida selle osa tabelist, kus on keskmine rahvaarv üle 30 miljoni, saame vastuseks tühja tabeli, kuna keskmine on väiksem. Otsides ridu, millel keskmine on väiksem, saame kõik read tagasi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(row_number()<10)

gapminder %>% 
  filter(mean(pop)>30000000)

gapminder %>% 
  filter(mean(pop)<30000000)


#' 
#' Me saame sama teha aga olles grupeerinud andmestiku riigi kaupa ja sel juhul row_number()<5 annab meile igas grupis esimesed 5 rida, max(pop)>30000000 annab meile ainult riigid, kus oli rahvaarv ka keskmiselt suurem kui 30 miljonit läbi ajaperioodi. sample_n() funktsioon annab samas kindla arvu juhuslikke väärtusi igas grupis.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# 4 esimest aastat iga riigi kohta
gapminder %>% 
  group_by(country) %>% 
  filter(row_number()<5)

# Riigid, kus oli keskmine rahvaarv üle 30 000 000
gapminder %>% 
  group_by(country) %>% 
  filter(mean(pop)>30000000)

# Riigid, kus oli maksimaalne rahvaarv üle 100 000 000
gapminder %>% 
  group_by(country) %>% 
  filter(mean(pop)>100000000)

# 4 esimest aastat iga riigi kohta
gapminder %>% 
  group_by(continent) %>% 
  sample_n(5)


#' 
#' ### Koondülevaated gruppide kaupa
#' 
#' Samuti võime kasutada group_by() funktsiooni, koos skim() funktsioonis, mis koondab siis ülevaate iga grupi kohta eraldi. Grupeerime tabeli aastate kaupa ja kasutame skim() funktsiooni seal.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# Tervikandmestiku ülevaade
gapminder %>% 
  select(year,lifeExp) %>% 
  skim()

# Aastate kaupa ülevaade
gapminder %>% 
  select(year,lifeExp) %>% 
  group_by(year) %>% 
  skim()


#' 
#' ### Juhusliku grupi valimine
#' 
#' sample_n() funktsioon valib üldiselt juhusliku rea. Kasutades group_by() ja nest() funktsiooni ning neid õigel hetkel lahti harutades ungroup() ja unnest() funktsioonidega võime ka leida ühe juhusliku riigi ning võtta kõik andmed selle kohta. Juhusliku grupi saamiseks andmestikust on üpris palju viise, levinuim ja selgem variant on ehk kasutada selleks mõnd välist muutujat ja filtrit, mis valitud juhusliku riigi hetkeks salvestab.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>%
  group_by(country) %>% 
  sample_n(1)


gapminder %>%
  group_by(country) %>% 
  nest() %>% 
  ungroup() %>% 
  sample_n(1)


gapminder %>% 
  group_by(country) %>%
  nest() %>% 
  ungroup() %>% 
  sample_n(1) %>% 
  unnest() %>% 
  skim()

selected <- gapminder %>% 
  sample_n(1) %>% 
  pull(country)

gapminder %>% 
  filter(country==selected) %>% 
  skim()


#' 
#' 
#' # Tunnuste loomine
#' 
#' Seni oleme vaadanud kuidas tabelist soovitud tunnuseid ja ridu kätte saada ning valimit koostada. Enamasti tuleb andmete analüüsis aga olemasolevaid andmeid ka muundada ja uusi väärtusi välja arvutada. Selleks on peamised funktsioonid mutate(), mis lisab tabelile tulba, ja summarise(), mis teeb grupeerivate tunnuste kohta käiva tulba koondtabelis. Need käivad koos funktsioonidega group_by() ja ungroup() grupeerimiseks. Lisaks võib kasutada funktsiooni arrange() tulemuste järjestamiseks. Tunnuste loomisel on hulk lihtsamaid funktsioone, nt mean(), max(), min(), sd(), log(), n(), row_number(), first(), last(), rank(), mille tähendus võiks olla nimest mõistetav. Täpsemaks uurimiseks kasutage küsimärki funktsiooni ees, nt ?rank. arrange() käsku saab kasutada tabeli mingi tulba järgi järjestamiseks, desc() funktsioon selle sees teeb järjestuse kahanevaks.
#' 
#' - summarise() võtad andmed kokku mõne funktsiooniga
#' - mutate() loo uus muutuja
#' - mean(), max(), min(), sd(), log(), n(), row_number(), first(), last(), rank()
#' 
#' 
#' - group_by() grupeeri andmestik
#' - ungroup() 
#' - arrange() järjesta väärtuse järgi
#' 
#' 
#' Käsk mutate() teeb uue muutuja. Parameetrina antakse seal uue tunnuse nimi ja selle sisu. Kui uue tunnuse nimi kattub vanaga, siis kirjutatakse see ümber. Lihtsa näidisena võime arvutada uue tunnuse nimega GDP korrutades GDP inimese kohta rahvaarvuga. Tulemuseks on uus tunnus tabelis, GDP. Tähele tasub panna, et samamoodi nagu muude käskudega, tulemused ei salvestu muutujasse enne kui me seda ise teeme.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  mutate(gdp = pop * gdpPercap)


#' 
#' ## Koondtunnuse loomine
#' 
#' summarise() käsk arvutab koondväärtusi grupeerimistunnuste alusel. Kui meil pole tabel grupeeritud kuidagi, annab summarise() ühe vastuse. Näiteks saame sellega arvutada suurima gdp terve tabeli peale funktsiooniga max(). Selle funktsioni sisse saame asetada ükskõik mis tehte, mille tulemuseks on arvväärtus. Niisiis võime arvutada gdp väärtuse otse selle sees. Alternatiivina võime alguses teha uue tulba ja siis võtta sellest maksimumi. Tulemus on sama.
#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
 summarise(maxgdp = max(pop * gdpPercap))

gapminder %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  summarise(maxgdp = max(gdp))


#' 
#' Et luua mitu uut tulpa või koondtulpa, võime kirjutada funktsiooni sees mitme uue tulba sisendi ja eraldada need komadega.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
 summarise(maxpop=max(pop), maxgdppercap=max(gdpPercap), maxgdp = max(pop * gdpPercap))


#' 
#' ## Koondtabelid
#' 
#' Kombineerides summarise() group_by() funktsiooniga, saame tekitada mitmesuguseid koondtabeleid. Näiteks 1) suurim gdp maailmjao kohta, suurim gdp riigi kohta
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# group_by() + summarise()
# Suurim gdp maailmajao kohta
gapminder %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  group_by(continent) %>% 
  summarise(max_gdp = max(gdp))

# Suurim gdp riigi kohta 
gapminder %>% 
  group_by(country) %>% 
  summarise(max_gdpPercap = max(gdpPercap)) %>% 
  arrange(desc(max_gdpPercap))


#' 
#' ## Lisatunnuse loomine
#' 
#' Kui summarise() teeb sellest koondtulba, siis mutate() teeb sellesisulise uue tulba. Kui käsk nagu max() annab grupi kohta ainult ühe väärtuse, siis mutate() paneb igale positsioonile selle tulemuse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  group_by(country) %>% 
  mutate(max_gdpPercap=max(gdpPercap))


#' 
#' Seda omakorda saab kasutada edasises töötluses. Näiteks, kui meid huvitab mis aastal oli riigil kõrgeim gdp inimese kohta, saame filtreerida loodud tulba järgi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  group_by(country) %>% 
  mutate(max_gdpPercap=max(gdpPercap)) %>% 
  filter(gdpPercap == max_gdpPercap) %>% 
  select(country,continent,year,gdpPercap) %>% 
  arrange(desc(gdpPercap))


#' 
#' Võime omakorda eraldada sellest riigid, mil "rikkaim" aasta inimese kohta ei olnud viimane aasta.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  group_by(country) %>% 
  mutate(max_gdpPercap=max(gdpPercap),max_year=max(year)) %>% 
  filter(gdpPercap == max_gdpPercap) %>% 
  filter(!year==max_year) %>% 
  select(country,continent,year,gdpPercap) %>% 
  arrange(year)


#' 
#' Neid arvutusi saab teha ka filter() käsu sees, mis nähtamatult tekitab uue tulba ja siis filtreerib selle põhjal. Järgmiste ridadega saame sama tulemuse.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  group_by(country) %>% 
  filter(gdpPercap == max(gdpPercap), !year == max(year)) %>% 
  select(country,continent,year,gdpPercap) %>% 
  arrange(year)


#' 
#' Võime summarise() funktsiooni abil arvutada ka mõne tunnuse keskmise, kasutades mean() funktsiooni.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

# Maailmajagude keskmine gdp inimese kohta
gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap)) 

# Kontinentide võrdlus ajas, gdp
gapminder %>% 
  group_by(continent,year) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap))


#' 
#' Võime summarise() funktsiooni abil arvutada ka mõne tunnuse keskmise, kasutades mean() funktsiooni. Lisades komadega tunnuseid, saame arvutada ka muid väärtusi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------
# Maailmajagude keskmine gdp inimese kohta
gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap),sd_gdpPercap = sd(gdpPercap), median_gdpPercap=median(gdpPercap),min_gdpPercap = min(gdpPercap),max_gdpPercap = max(gdpPercap)) 


#' 
#' Kui me tahame arvutada midagi koondtunnuste põhjal, peame arvutama selle pärast koondtunnuseid.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------
# Maailmajagude keskmine gdp inimese kohta ja selle paremusjärjestus.
gapminder %>% 
  group_by(continent) %>% 
  summarise(mean_gdpPercap = mean(gdpPercap),sd_gdpPercap = sd(gdpPercap), median_gdpPercap=median(gdpPercap),min_gdpPercap = min(gdpPercap),max_gdpPercap = max(gdpPercap)) %>% 
  mutate(rank=rank(-mean_gdpPercap))


#' 
#' ## Arvutused üle mitme tulba
#' 
#' On võimalik ka rea kaupa grupeerida, siis võib võtta näiteks keskmiste väärtusi üle tulpade.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  select(idno,starts_with("trst")) %>% 
  group_by(row_number()) %>% 
  mutate(extracol=mean(c(trstprl,trstlgl,trstplc)))


#' 
#' ## Kategooriliste faktortunnuste loomine
#' 
#' Tihti on meil tarvis teha arvu jada kategooriliseks väärtuseks. Selleks on mitmeid võimalusi. Peamise teeb ära käsk cut(), mis lõikab numbertunnuse ettenähtud arvu gruppideks või ettenähtud kohtadest. Näiteks teeme *gapminder* andmestikus oodatava eluea tunnuse gruppideks etteantud kohtadest või neljaks grupiks, mille ulatus tunnuse skaalal oleks enamvähem sama suur.
#' 
#' cut() tüüpi käsud teevad numbrijadast järjestatud faktori, lisades tüüpideabil väärtuse. Oluline on, et kui seda võtta numberväärtusena siis on nii...
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1957) %>% 
  mutate(lifeExp_cut=cut(lifeExp,breaks=c(0,30,60,70,80,90))) %>% 
  sample_n(10)

gapminder %>% 
  filter(year==1957) %>% 
  mutate(lifeExp_cut=cut(lifeExp,breaks=4)) %>% 
  sample_n(10)


#' 
#' Me võime asendada väärtusi piiritlevad grupid ka muude siltidega.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1957) %>% 
  mutate(lifeExp_cut=cut(lifeExp,breaks=3,labels=c("madal","keskmine","kõrge"))) %>% 
  sample_n(10)


#' 
#' *Tidyverse* pakettides on selleks ka paar abifunktsiooni, cut_interval(), cut_number(), cut_width(), mis kasutavad eri meetodeid grupisuuruste arvutamiseks. cut_interval() teeb rühmad, millel n rühma on sama intervall, cut_number() teeb n rühma, millel on enamvähem sama palju liikmeid, cut_width() teeb rühmad ettemääratud intervalli järgi. Loeme kokku palju igas grupis on count() funktsiooni kaudu. count() funktsioon teeb sama kui group_by() ja summarise(n=n()) koos.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1957) %>%
  mutate(group= cut_interval(lifeExp,4)) %>%
  count(group)

gapminder %>% 
  filter(year==1957) %>%
  mutate(group= cut_number(lifeExp,4)) %>%
  count(group)

gapminder %>% 
  filter(year==1957) %>%
  mutate(group= cut_width(lifeExp,4)) %>% 
  count(group)

# Sama group_by() ja summarise() kaudu
# gapminder %>% 
#   filter(year==1957) %>%
#   mutate(group= cut_width(lifeExp,4)) %>% 
#   group_by(group) %>% 
#   summarise(n=n())



#' 
#' Kui me tahame muuta olemasoleva faktortunnuse silte, siis on selleks olemas funktsioon fct_recode(). fct_recode ootab sisendiks faktortunnuse tasandite nimetusi. Nii võime anda uued nimed näiteks ühekaupa käsitsi muutes "madal" = "[30.3,43.4]","keskmine"="(43.4,59.2]","kõrge"="(59.2,73.5]".
#' 
#' Kui me ei pruugi teada täpselt, kuhu gruppide vahepunktid täpselt lähevad, on lihtsam jätta kõrvale vahemikku märkivad sildid. Selleks võime me jätta cut() funktsioonis sildid määramata, lisades parameetri label=F. Sama tulemuse saavutame võttes faktortunnust numbritena as.numeric() funktsiooni abil, nagu sai näidatud sissejuhatuses. cut() funktsioonid hoiavad tasemete järjestust väiksemast suurimani. Faktorite tasemeid võib ümber nimetada ka R-i baasfunktsiooni levels() kaudu, veidi teistsuguse loogikaga. Vaadake ?levels lähemalt.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1957) %>%
  mutate(group_label1= cut_number(lifeExp,3)) %>% 
  mutate(group_label2= fct_recode(factor(group_label1), "madal" = "[30.3,43.4]","keskmine"="(43.4,59.2]","kõrge"="(59.2,73.5]"))

gapminder %>% 
  filter(year==1957) %>%
  mutate(group_label1= cut_number(lifeExp,3)) %>% 
  mutate(group_rank= cut_number(lifeExp,3,label=F)) %>%
  mutate(group_numeric= as.numeric(group_label1)) %>%
  mutate(group_label2= fct_recode(factor(group_rank), "madal" = "1","keskmine"="2","kõrge"="3"))


#' 
#' Kui me teame täpselt, mis tingimustele me tahame et muutuja vastaks, võime me kasutada ka käske if_else() ja case_when(). if_else() määrab alguses tõetingimused, näiteks rahvaarv peab olema suurem kui miljon. Järgmisena määratakse, mis on väärtuseks siis kui tingimused vastavad tõele ja mis on väärtuseks siis kui need ei vasta tõele. case_when() puhul määratakse ära mitu tingimust ja tilde ~ järel väärtus, mida kasutatakse kui tingimused vastavad tõele. case_when() esialgu jätab ühe juhu katmata - kui elanikke on vähem kui miljon. Selle saame lahendada, kasutades if_else() tingimusega, et väärtus on puuduv is.na(). case_when() määrab kõik tingimustesse mitte mahtuvad tunnused puuduvaks.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder %>% 
  filter(year==1957) %>% 
  mutate(popsize=if_else(pop>1000000,true="miljon+",false="vähem"))

gapminder %>% 
  filter(year==1957) %>% 
  mutate(popsize=case_when(pop>1000000&pop<=5000000~"miljon+",
                           pop>5000000&pop<=10000000~"5miljon+",
                           pop>10000000~"10miljon+"))

gapminder %>% 
  filter(year==1957) %>% 
  mutate(popsize=case_when(pop>1000000&pop<=5000000~"miljon+",
                           pop>5000000&pop<=10000000~"5miljon+",
                           pop>10000000~"10miljon+")) %>% 
  mutate(popsize=if_else(is.na(popsize),"vähem",popsize))


#' 
#' Nende funktsioonidega võime näiteks ümber kodeerida küsimuste tulemusi, juhul kui me arvame et 10-punktiline lineaare skaala ei ole meie küsimusele vastuse leidmiseks parim. Me võime selleks kasutada näiteks cut() funktsiooni või case_when().
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  select(idno,trstplt) %>% 
  mutate(trstplc_fct=cut(trstplt,breaks=c(0,2,4,6,8,10),labels=c("ei","pigem ei","erapooletu","pigem jah","jah")))

ess9_ee %>% 
  select(idno,trstplt) %>% 
  mutate(trstplc_fct=case_when(trstplt<4~"pigem ei",
                               trstplt>=4&trstplt<=6~"erapooletu",
                               trstplt>=6~"pigem jah"))


#' 
#' Samamoodi kuluvad need ära kui meil on numberväärtus, mis tuleb kindlasti kategooriliseks lugeda. Numbertunnust või tähttunnust saab teha faktortunnuseks käsuga factor(). Kategoorilist faktortunnust, kui väärtused sisaldavad numbreid saab teha numbriteks funktsiooniga as.numeric(as.character()). Tehes kategoorilise faktortunnuse lihtsalt numbriteks as.numeric() käsuga, võetakse numberväärtused faktortunnuse tasemete järjekorra mitte sildi järgi.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

ess9_ee %>% 
  select(idno,admge) %>%
  mutate(admge= factor(admge))

ess9_ee %>% 
  select(idno,admge) %>%
  mutate(admge= case_when(admge==1~"mees",
                          admge==2~"naine"))
  
ess9_ee %>% 
  select(idno,admge) %>%
  mutate(admge= factor(admge)) %>% 
  mutate(admge= fct_recode(admge,"mees"="1","naine"="2"))


#' 
#' # Tabelite pööramine ja liitmine
#' 
#' ## Tabeli pööramine
#' 
#' Nagu failide sisselugemisel mainitud, oli meil tabeleid "pikal" ja "laial" kujul ning vastavalt sellele kujule, kuidas tabel oli, tuli sellega ringi käia veidi erineval. Näiteks laial kujul on eri mõõtmiste liigid tihti tunnustena ja nendega töötamiseks on käsk select(), kui pikal kujul on eri liiki mõõtmised eri ridadel ning õigete leidmisel aitab filter. Olenevalt ülesandest võib olla tarvilik just üks neist tabeli kujudest. Enamasti nõuab R-is mudelite ja jooniste tegemine tabelit pigem "pikal" kujul, kus iga uus vaatlus oleks eraldi real, mitte grupeeritud tunnusteks. Nende vahel on aga kerge vahetada. Selleks on meil kaks käsku pivot_longer(), mis teeb tabeli pikemaks ja pivot_wider() mis teeb tabeli laiemaks. Teistes pakettides kasutatakse samal otstarbel veel käske melt() ja dcast().
#' 
#' Proovime seda meie andmestike peal. *gapminder* andmestik on tüüpiline "pikas" formaadis andmestik. Selleks, et seda laiemaks harutada, valime välja ühe tunnuse (*pop*) ja kasutame käsku pivot_wider(), lisades identifikaator tulpade nimetused, siis tulba, kust võtta tunnuste nimetused ja teise tulba, kust võtta tunnuste väärtused. Selle järgi on ka illustratsioon protsessist [Grolemund & Wickham, 2017 raamatust](https://r4ds.had.co.nz/tidy-data.html#pivoting).
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gapminder

gapminder %>% 
  select(country,continent,year,pop) %>% 
  pivot_wider(id_cols=c("country","continent"),names_from="year",values_from="pop")


#' 
#' <center>
#' ![](figures/pivot_wider_tidybook.png)
#' </center>
#' 
#' Seevastu *eu_lifeExp* andmestik on meil algselt "laias" formaadi, kus numbrid on toodud eraldi tunnustena. Sele "pikaks" tegemiseks võime kasutada pivot_longer() funktsiooni, kus meil on vaja öelda, millised tulbad teha eraldi liiki mõõtmisteks ridadel, mis tulpa koondada nende nimed ja mis tulpa nende väärtused. Selle järgi on samuti illustratsioon protsessist [Grolemund & Wickham, 2017 raamatust](https://r4ds.had.co.nz/tidy-data.html#pivoting).
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

eu_lifeExp

eu_lifeExp %>% 
  pivot_longer(cols=matches("[0-9]"), names_to="year", values_to="lifeExp")


#' 
#' <center>
#' ![](figures/pivot_longer_tidybook.png)
#' </center>
#' 
#' ## Tabelite järjestikku liitmine
#' 
#' Tabelitega töötamisel tuleb tihti mõte, et võiks sellele lisada paar rida või paar tulpa. Juhul, kui andmepunktid on tabelites täpselt samas järjekorras on võimalik liita uus tulp käsuga bind_cols(). Ridade liitmisel saab kasutada käsku bind_rows(). Väga sarnased käsud on cbind() ja rbind(). Neid käske kasutatakse eelkõige andmestike loomisel.
#' 
#' Me võime näiteks teha gdp tulba gapminderi andmestiku põhjal. Salvestada selle eraldi ja siis lisada selle gapminderisse. bind_cols() funktsiooni läheb vaja suhteliselt harva. Mõnikord läheb seda vaja kui muutujad on salvestatud eri failides. Kui me liidame nii andmestiku, millel on samanimelisi tulpasid, siis muudab käsk viimase tabeli tulpade nimesid, et need eristuks. Näiteks kõrvutades gapminderi iseendaga, saame kaks korda laiema tabeli, kus on lisatud 1 igale muutuja nimele.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

gdp_gapminder <- gapminder %>% 
  mutate(gdp = pop * gdpPercap) %>% 
  select(gdp)

bind_cols(gapminder, gdp_gapminder)

bind_cols(gapminder, gapminder)


#' 
#' Veidi sagemini läheb vaja bind_rows() käsku, mis liidab tabelile uusi ridu. bind_rows() ühitab kokku samanimelised tulbad. Näiteks võib juhtuda, et meil on eri riikide andmestikud eri failides. Sellisel juhul saab need liita bind_rows käsuga.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

finland <- gapminder %>% 
  filter(country=="Finland")

norway <- gapminder %>% 
  filter(country=="Norway")

bind_rows(finland, norway) %>% 
  filter(year>2000)


#' 
#' Samuti võime bind_rows() käsuga lisada ise mõne rea andmestikku. Lisame näidisrea Eesti kohta.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

bind_rows(finland, norway) %>% 
  filter(year>2000) %>% 
  bind_rows(tibble(country="Estonia",continent="Europe",year=2018,lifeExp=78,pop=1318700,gdpPercap=19948))


#' 
#' 
#' ## Tabelite liitmine ühise tunnuse põhjal
#' 
#' Hulka sagedamini tuleb meil liita tabeleid mõne tunnuse alusel. Selleks on R-i pakettides ka hulk funktsioone. *Tidyverse* pakettides on selleks join() tüüpi käsud. join() käsud võtavad tabelis ühe või mitu tunnust ning proovib seda klapitada valitud tunnuse või tunnustega teises tabelis. Kõik read, kus on tunnuste kaupa täpselt sama väärtus on võimalik ühendada. Teistes pakettides kasutatakse siin merge() käsku, mis töötab sama loogikaga. Selle kohta on ka lisatud joonis.
#' 
#' <center>
#' ![](figures/joins.png)
#' </center>
#' 
#' Pildi peal on kujutatud see ridadehulk, mis alles jääb. Täpsemalt öeldes, left_join() hoiab esimese tabeli terviklikuna. right_join() hoiab teise tabeli terviklikuna. inner_join() hoiab alles ainult kattuvad read. full_join() hoiab mõlemad tabelid terviklikuna. Ning anti_join() eemaldab teise tabeliga kattuvad read esimesest tabelist.
#' 
#' - left_join() - liidab vasakpoolse andmestiku külge need read, mis sobivad paremast. 
#' - right_join() - liidab parempoolse andmestiku külge need read, mis sobivad vasakust. 
#' - inner_join() - jätab alles ainult sobivad read kummastki 
#' - full_join() - jätab alles kõik read mõlemast tabelist, isegi kui ükski ei kattu. 
#' - anti_join() - töötab vastupidiselt ja eemaldab vasakust kõik read, mis ühtivad parempoolse tabeliga.
#' 
#' Võtame selle jaoks appi teise tabeli. Siin näites kasutame Euroopa GDP inimese kohta andmeid. Veel võib katsetada ka teiste andmestikule lisatud andmetega. Need tulevad lõpuks mängu selle osa kodutöös.
#' 
#' - Real GDP per capita (sdg_08_10.tsv) [link](https://ec.europa.eu/eurostat/web/products-datasets/-/sdg_08_10)
#' - Population by year (tps00001.tsv) [link](https://ec.europa.eu/eurostat/web/products-datasets/-/tps00001)
#' - Activity rate - % of total population aged 15-64 (tipslm60.tsv) [link](https://ec.europa.eu/eurostat/web/products-datasets/-/tipslm60)
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------


# EUROSTAT andmed on laetud alla oma kodulehelt .tsv kujul.
eu_gdpPercap <- read_tsv("data/sdg_08_10.tsv", na = ":") 
eu_gdpPercap <- eu_gdpPercap %>% # Nagu varemgi peame faili iseärasuste tõttu jaotama tunnusteks
  separate(col=1,into=c("unit","na_item","geo"), sep=",")

# Seejärel võime teha kummastki tabelist "pika" variandi
eu_lifeExp_long <- eu_lifeExp %>% 
  filter(sex=="T",age=="Y1") %>% 
  select(-unit,-sex,-age) %>% 
  pivot_longer(cols=matches("[0-9]"), names_to="year", values_to="lifeExp")

eu_gdpPercap_long <- eu_gdpPercap %>% 
  filter(unit=="CLV10_EUR_HAB") %>% 
  select(-unit,-na_item) %>% 
  pivot_longer(cols=matches("[0-9]"), names_to="year", values_to="gdpPercap")


# Ja lõpuks need kokku siduda riikide ja aastate kaupa. Nüüd on meil kõrvuti eluiga ja antud väärtus sellest.
eu_lifeExp_gdpPercap <- eu_lifeExp_long %>% 
  left_join(eu_gdpPercap_long,by=c("geo","year"))


#' 
#' 
#' 
#' # Andmete salvestamine faili
#' 
#' Viimaks salvestame siis selle faili. Selleks on taas hulk käske. *tidyverse* paketis leiab need käsud üldiselt asendades *read* *write*-iga. Niisiis write_csv(), write_csv2(), write_tsv(), write_delim(), write_sav() jne töötavad. Kui salvestamisfunktsioonid on eraldi pakettides on sellest juttu üldiselt ka lugemisfunktsioonide juures. Abiotsing ?read_csv või ?read_sav aitab siin välja.
#' 
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------

write_tsv(eu_lifeExp_gdpPercap,"output/eu_life_gdp.tsv")

write_csv2(eu_lifeExp_gdpPercap,"output/eu_life_gdp_euro.csv")

write_delim(eu_lifeExp_gdpPercap,"output/eu_life_gdp_customdelim.csv",delim="@")

write_excel_csv2(eu_lifeExp_gdpPercap,"output/eu_life_gdp.xlsx")

write_sav(eu_lifeExp_gdpPercap,"output/eu_life_gdp.sav")


#' 
#' ## Kuhu ja kuidas faile salvestada
#' 
#' Selle projekti kataloogistruktuur on järgmine. Nagu märgata on eraldi kataloogid tehtud andmetele, illustratsioonidele ja ka väljundandmetele. Kood on juurkataloogis koos juhendi, projektifaili ja "loe mind" failiga. Readme.md on hea fail, mida kasutada kuna failihalduskeskkonnad juba tihti teavad ette, et seal on oluline info.
#' 
## ---- eval=F--------------------------------------------------------------------------------------------------------------------------------------------------
## 
## # .
## # └── intro_tidy_SV
## #     ├── data
## #     ├── figures
## #     ├── license
## #     ├── output
## #     ├── intro_tidy.html
## #     ├── intro_tidy.R
## #     ├── intro_tidy.RProj
## #     └── readme.md
## 

#' 
#' Faile võib paigutada väga erineval viisil. Hea struktuur sõltub projekti suurusest ja mis seal sees teha. Tihti algab projekt ühest skriptifailist ja ühest andmefailist ning kasvab uute allikate ja versioonidega. Et töö käik oleks mõistetav ka kauakestnud projektil tasub otsida endale sobivat kataloogistruktuuri ja kasutada seda pidevalt. See, milline andmekogu struktuur sobib Sinu projektidele tasub omaette läbimõtlemist.
#' 
#' Näiteks on suuremates projektides soovitav hoida toorandmed ja töödeldud andmed eraldi, et kogemata ei hakkaks toorandmeid muutma ning väljundite jaoks võib olla eraldi kataloog. Avalikel andmeprojektidel tuleks alati lisada ka litsents - kas ja mis tingimustel võivad teised neid materjale kasutada. Ainult siis kui litsents on määratletud, saab olla kindel, et materjalide taaskasutamiseks on õigused ka antud. Litsentside toimeviisidega tasub ennast kurssi viia. 
#' 
#' Näiteks selles õppetükis toodud kood on antud MIT litsentsiga, mis annab igaühele õiguse kasutada seda, kuidas tahes, õppematerjalid aga on antud CC-BY-4.0 litsentsiga, mis eeldab, et nende taaskasutamisel tuleks algallikale viidata.
#' 
## -------------------------------------------------------------------------------------------------------------------------------------------------------------
# .
# └── projekt
#     ├── code
#     ├── data
#     │   ├── raw
#     │   └── processed
#     ├── output
#     │   ├── figures
#     │   └── report
#     ├── meta.R
#     ├── projekt.Rproj 
#     ├── LICENSE
#     └── README.md


#' 
#' Soovitan vaadata ülevaateid [siin](https://www.r-bloggers.com/structuring-r-projects/) ja [siin](https://kbroman.org/steps2rr/pages/organize.html). Väga soovitan vaadata Software Carpentry artiklit [Good Enough Practices for Scientific Computing](https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/), kus on omaette osa ka uurimisprojekti failide organiseerimise kohta.
#' 
#' Kataloogistruktuuri sättimise juures soovitan vaadata veel paketti [here](https://github.com/jennybc/here_here), mis aitab failide asukohti korraldada. Kui R-i rohkem kasutada, siis failide otsimine võib erineda veidi .R ja .Rmd failide vahel ja sõltudes olukorrast. Pakett *here* lahendab paljuski need probleemid.
#' 
#' 
#' 
#' # Viited {-}
#' 
#' - Grolemund, Garret & Wickham, Hadley. 2017. *R for Data Science*. O'Reilly Media https://r4ds.had.co.nz/
#' - Wickham, Hadley. 2014. Tidy Data. *Journal of Statistical Software*. Vol. 59 (10). http://dx.doi.org/10.18637/jss.v059.i10
