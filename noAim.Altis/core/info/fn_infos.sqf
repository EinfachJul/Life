#include "..\..\macros.hpp"
private["_mode","_dialog","_ititlez","_itextz","_ilistz","_inputz","_displayName","_isetz","_select"];

disableSerialization;
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_dialog = findDisplay 4501;
_ititlez = _dialog displayCtrl 4502;
_itextz = _dialog displayCtrl 4503;
_ilistz = _dialog displayCtrl 4504;

_inputz = [
	["Tastenkombination 1","Tastatur/Infos",
	"<t size='0.8'>Tastenkombination:
	<br/>Windows Taste aendern: Controls -> Custom -> User Action 10
	<br/><a color='#ff1000'>'Windows'</a> oder <a color='#ff1000'>'E'</a> = Rohstoff-Sammeln / Gathern
	<br/><a color='#ff1000'>'Q'</a> = Rohstoff-Sammeln mit Werkzeug
	<br/><a color='#ff1000'>'Y'</a> oder <a color='#ff1000'>'Z'</a> = Spielermenu / Z-Inventar
	<br/><a color='#ff1000'>'T'</a> = Kofferraum/Stauraum Oeffnen (Fahrzeug/Haus)
	<br/><a color='#ff1000'>'U'</a> = Oeffnen/Abschliessen (Fahrzeug/Haus)
	<br/><a color='#ff1000'>'Links Shift + G'</a> = Ergeben
	<br/><a color='#ff1000'>'Links Shift + R'</a> = Niederschlagen
	<br/><a color='#ff1000'>'Links Shift + O'</a> = Fesseln
	<br/><a color='#ff1000'>'Links Shift + L'</a> = Kart Licht
	<br/><a color='#ff1000'>'Links Shift + U'</a> = Kopfhoerer / Earplugs
	<br/><a color='#ff1000'>'Q'</a> und <a color='#ff1000'>'E'</a> = Fahrzeug Blinker
	<br/><a color='#ff1000'>'Ö(OE)'</a> = Fahrzeug Warn Blinker
	<br/><a color='#ff1000'>'Shift/Strg + H'</a> = Waffe Wegstecken/Rausholen
	<br/><a color='#ff1000'>'Ue(UE)'</a> = Interactions Menu
	<br/><a color='#ff1000'>'Space'</a> = Springen/Jump
	<br/><a color='#ff1000'>'Shift + Num 1'</a> = Takwondo/Dance
	<br/><a color='#ff1000'>'Shift + Num 2'</a> = Kniebeugen
	<br/><a color='#ff1000'>'Shift + Num 3'</a> = Kniebeugen (fast)
	<br/><a color='#ff1000'>'Shift + Num 4'</a> = Liegestuetzen
	</t>
	"],
	
	["Dienst Tasten","Dienst Tastenkominnation",
	"<t size='0.8'><a color='#ff1000'>'Links Shift + R'</a> = Festnehmen (Cop)
	<br/><a color='#ff1000'>'Links Shift + L'</a> = Blaulicht (Cop, Feuerwehr)
	<br/><a color='#ff1000'>'F'</a> = Sirene(Cop, Feuerwehr)
	<br/><a color='#ff1000'>'Links Shift + F'</a> = Jaulen/Yelp (Cop, Feuerwehr)
	<br/><a color='#ff1000'>'Links Alt + F'</a> = Extra Sirene/Ansage (Cop, Feuerwehr)
	<br/><a color='#ff1000'>'Links Shift + O'</a> = Schranke Oeffnen (Cop)
	<br/><a color='#ff1000'>'K'</a> = EMP Heli Konsole (Cop)
	</t>
	"],
	
	["Legale Berufe","Legale Berufe",
	"<t size='0.8'><a color='#ff0000'>- </a>Feld/Mine(Item / Gewicht)<a color='#ff1000'> -> </a>Verarbeitung(Item / Gewicht)<a color='#ff1000'> -> </a>Haendler
	<br/><br/><a color='#ff1000'>- </a>Kupfermine (Kupfererz / G:4)<a color='#ff1000'> -> </a>Kupferverarbeiter (Kupferbarren / G:3)<a color='#ff1000'> -> </a>Eisen/Kupferhaendler
	<br/><br/><a color='#ff1000'>- </a>Eisenmine (Eisenerz / G:4)<a color='#ff1000'> -> </a>Eisenverarbeiter (Eisenbarren / G:3)<a color='#ff1000'> -> </a>Eisen/Kupferhaendler
	<br/><br/><a color='#ff1000'>- </a>Oelfeld (ErdOel / G:7)<a color='#ff1000'> -> </a>Oelraffinerie (Oel / G:7) <a color='#ff1000'> -> </a>Oelhaendler
	<br/><br/><a color='#ff1000'>- </a>Diamantenmine (Rohdiamant / G:4)<a color='#ff1000'> -> </a>Diamantenschleifer (Diamanten / G:2)<a color='#ff1000'> -> </a>Diamantenhaendler
	<br/><br/><a color='#ff1000'>- </a>Sandmine (Sand / G:3)<a color='#ff1000'> -> </a>Glasgiesserei (Glass / G:2)<a color='#ff1000'> -> </a>Glashaendler
	<br/><br/><a color='#ff1000'>- </a>Getreidefeld (Getreide / G:3)<a color='#ff1000'> -> </a>Muehle (Mehl / G:2)<a color='#ff1000'> -> </a>Markt:Wasser<a color='#ff1000'> -> </a>Baeckerei<a color='#ff1000'> -> </a>Gebaeckhandel
	<br/><br/><a color='#ff1000'>- </a>Wald (Holzstamm / G:4)<a color='#ff1000'> -> </a>Kokerei (Kohle / G:3)<a color='#ff1000'> -> </a>Kohlehaendler
	<br/><br/><a color='#ff1000'>- </a>Wald (Holzstamm / G:4)<a color='#ff1000'> -> </a>Saegewerk (Holzbrett / G:3)<a color='#ff1000'> -> </a>Moebelhaendler
	<br/><br/><a color='#ff1000'>- </a>Traubenplantage (Trauben / G:3)<a color='#ff1000'> -> </a>Kelterei (Wein / G:3)<a color='#ff1000'> -> </a>Item:Glass<a color='#ff1000'> -> </a>Getraenkehandel
	<br/><br/><a color='#ff1000'>- </a>Schwefelablagerung (unv. Schwefel / G:4)<a color='#ff1000'> -> </a>Schwefelverarbeitung (Schwefel / G:3)<a color='#ff1000'> -> </a>Schwefelhaendler
	<br/><br/><a color='#ff1000'>- </a>Bauxit Mine (Bauxit / G:4)<a color='#ff1000'> -> </a>Aluminiumverarbeitung (Aluminium / G:3)<a color='#ff1000'> -> </a>Blei-/Aluminiumhaendler
	<br/><br/><a color='#ff1000'>- </a>Baumwollefeld (Baumwolle / G:3)<a color='#ff1000'> -> </a>Stoff-/Wollverarbeitung (Stoff/Wolle / G:2)<a color='#ff1000'> -> </a>Schneiderei
	<br/><br/><a color='#ff1000'>- </a>Oelfeld (ErdOel / G:7)<a color='#ff1000'> -> </a>Kunststoffverarbeitung (Plastik / G:4)<a color='#ff1000'> -> </a>Kunststoffhaendler
	<br/><br/><a color='#ff1000'>- </a>Jagdgebiet/Bauernhof (Rohes Fleisch / G:2)<a color='#ff1000'> -> </a>Fleischerei (Steaks / G:2)<a color='#ff1000'> -> </a>Fleischhaendler
	<br/><br/><a color='#ff1000'>- </a>Gas Platform (Erdgas / G:6)<a color='#ff1000'> -> </a>Item:Eisenbarren (Z:2 / G:5)<a color='#ff1000'> -> </a>Gas Fabrik<a color='#ff1000'> -> </a>Gashaendler
	<br/></t>
	"],
	
	["Team-Legale Berufe","Team-Legale Berufe",
	"<t size='0.8'>
	<br/><a color='#00aeff'>- </a>Item:PC-CPU, PC-Mainboard<a color='#00aeff'> -> </a>PC-CPU Werk<a color='#00aeff'> -> </a>Laptop Herstellen
	</t>
	"],
	
	["Berufe Hilfe","Berufe Hilfe",
	"<t size='0.8'><a color='#ff0000'>- </a>Gegenstand(Item Gewicht)<a color='#ff1000'> -> </a>Benoetigte Items(Zahl/Gewicht)<a color='#ff1000'> -> </a>Haendler
	<br/><a color='#00aeff'>- </a>Laptop(40): <a color='#ff1000'> - </a>PC-Mainboard(Z:1 / G:5)<a color='#ff1000'> - </a>PC-CPU(Z:1 / G:5)<a color='#ff1000'> - </a>Schrauben(10)
	<br/><a color='#00aeff'>- </a>Weizenbrot(2): <a color='#ff1000'> - </a>Wasserflasche(Z:1 / G:1)<a color='#ff1000'> - </a>Mehl(Z:1 / G:2)<a color='#ff1000'> - </a>Baeckerei
	<br/><a color='#00aeff'>- </a>Gasflasche(5): <a color='#ff1000'> - </a>Gas(2)<a color='#ff1000'> - </a>Eisenbarren(Z:2 / G:3)<a color='#ff1000'> - </a>Gashaendler
	<br/><a color='#00aeff'>- </a>Wein(3): <a color='#ff1000'> - </a>Trauben(Z:4/G:4)<a color='#ff1000'> - </a>Getraenkehandel
	</t>
	"],
	
	["Illegale Berufe","Illegale Berufe",
	"<t size='0.8'><t size='0.8'><a color='#ff0000'>- </a>Plantage/Feld(Item Gewicht)<a color='#ff1000'> -> </a>Verarbeitung(Item Gewicht)<a color='#ff1000'> -> </a>Haendler
	<br/><a color='#ff1000'>- </a>Cannabisplantage (G: 6)<a color='#ff1000'> -> </a>Marihuanaverarbeitung (G: 4)<a color='#ff1000'> -> </a>Drogendealer
	<br/><a color='#ff1000'>- </a>Schlafmohnfeld (G: 6)<a color='#ff1000'> -> </a>Heroinverarbeitung (G: 5)<a color='#ff1000'> -> </a>Drogendealer
	<br/><a color='#ff1000'>- </a>Kokainplantage (G: 6)<a color='#ff1000'> -> </a>Kokainverarbeitung (G: 4)<a color='#ff1000'> -> </a>Drogendealer
	<br/><a color='#ff1000'>- </a>Tabakplantage (G: 4)<a color='#ff1000'> -> </a>Zigarrenverarbeitung (G: 3)<a color='#ff1000'> -> </a>Tabakhandel
	<br/><br/><a color='#ff1000'>- </a>Cannabisplantage (G: 5)<a color='#ff1000'> -> </a>Marihuanaverarbeitung (G: 4)<a color='#ff1000'> -> </a>Haschischextraktion (G: 3)<a color='#ff1000'> -> </a>Drogendealer
	</t>
	"],
	
	["Fahrzeug Info","Fahrzeug Info",
	"<t size='0.8'>Fahrzeug - Lagerplatz - Mietpreis - Kaufpreis
	<br/>
	<br/>Zivilfahrzeuge: - AutoHaus/PKW-Handel
	<br/>Quad/ATV<a color='#808080'> - </a>30<a color='#808080'> - </a>3300<a color='#808080'> - </a>5000
	<br/>
	<br/>Befinden sich noch im Aufbau.
	</t>
	"],
	
	["Lizenzen Info","Lizenzen Info",
	"<t size='0.8'>Fuehrerschein<a color='#ff1000'> - </a>1.100 €
	<br/>Bootsschein<a color='#ff1000'> - </a>25.000 €
	<br/>Pilotenschein<a color='#ff1000'> - </a>125.000 €
	<br/>Go-Kartschein(DLC)<a color='#ff1000'> - </a>50.000 €
	<br/>LKW-Fuehrerschein<a color='#ff1000'> - </a>125.000 €
	<br/>
	<br/>Taucherschein<a color='#ff1000'> - </a>50.000 €
	<br/>Waffenschein<a color='#ff1000'> - </a>50.000 €
	<br/>Hausbesitzer-Lizenz<a color='#ff1000'> - </a>500.000 €
	<br/>Logistik-Lizenz<a color='#ff1000'> - </a>900.000 €
	<br/>Anwalts-Lizenz<a color='#ff1000'> - </a>120.000 €
	<br/>Taxifahrer-Lizenz<a color='#ff1000'> - </a>50.000 €
	<br/>Jagdschein<a color='#ff1000'> - </a>25.000 €
	<br/>
	<br/>Fisch-/Fleischverarbeitung<a color='#ff1000'> - </a>12.000 €
	<br/>Brotverarbeitung<a color='#ff1000'> - </a>12.000 €
	<br/>Kupferverarbeitung<a color='#ff1000'> - </a>20.000 €
	<br/>Erz/Eisenverarbeitung<a color='#ff1000'> - </a>35.000 €
	<br/>Aluminiumverarbeitung<a color='#ff1000'> - </a>100.000 €
	<br/>Holzverarbeitung<a color='#ff1000'> - </a>20.000 €
	<br/>Schwefelverarbeitung<a color='#ff1000'> - </a>50.000 €
	<br/>Stoff-/Wollverarbeitung<a color='#ff1000'> - </a>50.000 €
	<br/>Sandverarbeitung(Glas herstellen)<a color='#ff1000'> - </a>55.000 €
	<br/>Gasverarbeitung<a color='#ff1000'> - </a>60.000 €
	<br/>Weinverarbeitung<a color='#ff1000'> - </a>65.000 €
	<br/>Kunststoffverarbeitung<a color='#ff1000'> - </a>75.000 €
	<br/>Oelverarbeitung<a color='#ff1000'> - </a>100.000 €
	<br/>Diamantenverarbeitung<a color='#ff1000'> - </a>250.000 €
	<br/>
	<br/>Laptop Herstellung<a color='#ff1000'> - </a>1.500.000 €
	<br/>
	<br/>Marihuanaverarbeitung<a color='#ff1000'> - </a>250.000 €
	<br/>Zigarrenverarbeitung<a color='#ff1000'> - </a>400.000 €
	<br/>Heroinverarbeitung<a color='#ff1000'> - </a>750.000 €
	<br/>Kokainverarbeitung<a color='#ff1000'> - </a>750.000 €
	<br/>Haschischverarbeitung<a color='#ff1000'> - </a>1.000.000 €
	<br/>
	<br/>Mafia Ausbildung/Lizenz<a color='#ff1000'> - </a>1.500.000 €
	<br/>Rebellen Ausbildung/Lizenz<a color='#ff1000'> - </a>1.500.000 €
	</t>
	"],
	
	["noAim Info","Alles zum Thema noAim",
	"<t size='0.8'>Wir Suchen Member ab 16 Jahren bewirb dich auf <a color='#ff1000' href='http://www.noaim.eu'>www.noAim.eu</a> (noAim Member = VIP/Whitelisted Slot)
	<br/><br/>
	<br/>Admins/Supporter Bewerbung auf <a color='#ff1000' href='http://www.noaimlife.de/supporter'>www.noaimlife.de/supporter</a>
	<br/><br/>
	<br/>TS3: ts.noaimlife.de
	<br/>URL: <a color='#ff1000' href='http://www.noaimlife.de'>www.noaimlife.de</a>
	<br/>
	<br/>Dieser Server ist teil des noAim Clan's - 2007
	<br/>- Hoster von mehreren vollen und bekannten CS:Source Servern
	<br/>- Ehemalige Hoster von DayZMod Servern DE101 - DE107
	</t>
	"]
];

switch(_mode) do
{
	case 0:
	{
		{
			_displayName = (_x select 0);
			_ilistz lbAdd format["%1",_displayName];
		} forEach _inputz;
	};
	
	case 1:
	{
		if(isNull _dialog) exitWith {};
		_isetz = lbCurSel _ilistz;
		_select = _inputz select _isetz;
		_ititlez ctrlSetText (_select select 1);
		_itextz ctrlSetStructuredText parseText (_select select 2);
	};
};