// Updated on 13-12-2015
private ["_exit","_tolog","_name","_find"];
_exit = false;
_tolog = [_this,0,"",[""]] call bis_fnc_param;
_name = name player;
_find = ["MONEYLOG","VEHAIRKILL","OPENINVENTORY","CRUSHCAR","VEHSHIPKILL","VEHTRUCKKILL","VEHCARKILL","HOUSEBUY","HOUSESELL","DIRECTTRANSAKTION","WARNING","COPABUSE","CHOPSHOP","KILLER","VEHICLEBUY","ITEMSELL","ITEMBUY","ATMTRANSACTION","GARAGESELL","UNIMPOUND","WEAPONSELL","STOLECAR","HACK","DEATHLOG","ITEMPICK","GESTOHLEN","SUSPICOUS","ALTF4"];
if ((_tolog find _name) == -1) then {_tolog = format ["HACK %1 - %2 ",_name,_tolog];};
{if ((_tolog find _x) != -1) exitwith {_exit = true;};}foreach _find;
if !(_exit) then {_tolog = format ["HACK %1 - %2 ",_name,_tolog];};
ax_log = _tolog;
publicvariableserver "ax_log";
ax_log = nil;