#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = getControl(2400,2407);
lbClear _list2; //Purge the list

_crimes = [	
["Ruhestoerung","5000","108"],
["Fahren ohne Fahrerlaubnis","10000","109"],
["Fahren ohne Licht","2500","110"],
["Falschparken/Verkehrsbehinderung","1000","111"],
["Fahren unter Alkohol-/Drogeneinfluss","20000","112"],
["Verursachen eines Unfalls","7500","113"],
["Verursachen eines Unfalls mit Personenschaden","10000","114"],
["Fahrerflucht","50000","480"],
	
["Fliegen ohne Pilotenschein","30000","116"],
["Fliegen ohne Kollisionslichter","10000","117"],
["Missachtung der Mindestflughoehe","10000","118"],
["Landen in Staedten","5000","119"],
["Fliegen unter Alkohol-/Drogeneinfluss","100000","120"],
	
["Alkohol-/Drogenkonsum","10000","121"],
["Alkohol-/Drogenhandel","50000","483"],
["versuchter Fahrzeugdiebstahl","10000","215"],
["Fahrzeugdiebstahl","20000","487"],
["Handel mit gestohlenen Fahrzeugen","50000","125"],
["Handel mit Sprengstoffen","100000","126"],
["offenes Tragen von Waffen","5000","127"],
["Abfeuern von Waffen","10000","128"],
	
["Besitz von Schildkroeten","250000","129"],
["Alkohol-/Drogenbesitz","30000","481"],
["Besitz von Sprengstoffen","50000","131"],
["Besitz von Goldbarren","100000","132"],
["Besitz legaler Waffen ohne Waffenschein","35000","133"],
["Besitz illegaler Waffen","150000","134"],
["Fuehren eines illegalen Fahrzeugs","500000","135"],
	
["Beamtenbeleidigung","15000","136"],
["Behinderung der Polizeiarbeit","25000","137"],
["Missachtung polizeilicher Anweisungen","25000","138"],
["Fluchthilfe","150000","139"],
["Gefaengnisausbruch","300000","901"],
["Betreten einer Sperrzone","10000","141"],
["Widerstand gegen die Staatsgewalt","80000","142"],
	
["Anstiftung zu einem Verbrechen","25000","143"],
["Beschuss","20000","145"],
["Beschuss mit Personenschaden","75000","146"],
["Fahrlaessige Toetung","100000","187V"],
["Mord","250000","187"],
["versuchte Entfuehrung","125000","207A"],
["Entfuehrung","250000","207"],
["versuchter Tankstellenraub","35000","150"], /* x */
["Tankstellenraub","65000","151"], /* x */
["versuchter Raub","50000","211v"],
["Raub","100000","211"],
["versuchter Bankraub","500000","152"],
["Bankraub","1000000","153"], 
["rebellische Uebernahme","500000","154"],
["Terrorismus","1000000","155"], /* x */
["Einbruch","250000","156"],
["Sklaven Handel","300000","236"],
["Geblitzt +50 km/h","2000","501"],  /* x */
["Geblitzt +75 km/h","2000","502"],  /* x */
["Geblitzt +100 km/h","7500","503"],  /* x */
["Geblitzt +125 km/h","7500","504"],  /* x */
["Geblitzt +150 km/h","10000","505"],  /* x */
["Geblitzt +175 km/h","10000","506"],  /* x */
["Geblitzt +200 km/h","15000","507"]
];

{
	_list2 lbAdd format["%1 - €%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(zak_copstufe) < 3 && __GETC__(zko_adminstufe) == 0) then
{
	ctrlShow[2405,false];
};

[player] remoteExec ["noaim_fnc_wantedFetch",2];
//[[player],"noaim_fnc_wantedFetch",false,false] spawn noaim_fnc_DONE; 