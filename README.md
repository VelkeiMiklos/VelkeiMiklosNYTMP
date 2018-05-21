# New York Most Popular Articles

Sziasztok!
Az Url-nél három időszak van. Napi (1), heti (7) és havi (30). Ezeket az időszakokat egy Segmented Control segítségével lehet kiválasztani. A letöltött adatoknál, lehetőség van a címek között keresni. Miután a felhasználó kiválaszt egy cikket, megjelenik a részletes nézet oldal. Ez tartalmazza a cikk típusát, szekcióját, egy képet és annak leírását, ha van. Továbbá egy elválasztó vonal alatt található egy rövid leírás a cikkről, majd pedig egy gomb, amellyel meg lehet nyitni az eredeti cikket a böngészőben.

A fejlesztés során MVC-t használtam. Az AlamoFire Pod segítségével töltöm le az adatokat. Ez a Services mappában található. A tervezés során mindent modulokra bontottam, és újra felhasználhatóan terveztem: 

Util mappa: Konstans fájl, Üzenet kiíratás, Internet elérhetőség ellenőrzés, Mock osztály 
Helper mappa: Url konvertáló, Dátum konvertáló 
Extension mappa: Szín, és ViewController 
CustomHelper: Saját nézet, Saját kép, Saját gomb

A fejlesztés során folyamatosan teszteltem a funkciókat egy iPhone6 és egy iPad (5 generációs) készüléken. Szimulátoron (iPhoneX, iPhoneSE, iPhone8Plus, iPad Pro 2 generáció) teszteltem. Továbbá készítettem Unit (VelkeiMiklosNYTMPTests) és UI teszteket (VelkeiMiklosNYTMPUITests) is.
Üdv, Miki
