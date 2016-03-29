/*
	Author: Bryan "Tonic" Boardwine
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {hint "Niemand wurde ausgewaehlt!";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {hint "Sie habe kein Gegenstand ausgewaehlt welchen Sie weitergeben moechten.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Sie haben ein unbekanntes Nummern format angegeben.";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Sie muessen eine genaue anzahl angeben welche Sie weitergeben moechten.";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
if(!([false,_item,(parseNumber _val)] call noaim_fnc_handleInv)) exitWith {hint "Sie koennen nicht soviele dieser Gegenstaende hergeben, da Sie nicht soviele besitzen?";ctrlShow[2002,true];};
//[[_unit,_val,_item,player],"noaim_fnc_receiveItem",_unit,false] spawn noaim_fnc_DONE;
[_unit,_val,_item,player] remoteExec ["noaim_fnc_receiveItem",_unit];
_type = [_item,0] call noaim_fnc_varHandle;
_type = [_type] call noaim_fnc_varToStr;
hint format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type];
[] call noaim_fnc_p_updateMenu;

ctrlShow[2002,true];