/*
	Author: Bryan "Tonic" Boardwine
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du hast vor kurzem eine Bank ausgeraubt und musst deshalb warten bis du Geld weitergeben kannst.";ctrlShow[2001,true];};
if(!life_use_atm_2) exitWith {hint "Du hast vor kurzem einen Laden ausgeraubt und musst deshalb warten bis du Geld weitergeben kannst.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Bitte nur Zahlen.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst eine Summe eingeben.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_znorak) exitWith {hint "Du hast nicht so viel Geld!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Der Spieler ist nicht in Reichweite";};

if((parseNumber(_amount)) >= 10000) then {
	[format ["DIRECTTRANSAKTION: %1 (%4) gave %2 to %3", name player, [(parseNumber(_amount))] call noaim_fnc_numberText, name _unit, playerSide],"ax_log",false,false] call noaim_fnc_Loggy;
};
/*
//AX_LOG NEED TEST
_toLog = format["DIRECT TRANSAKTION: [Handgeld]%1 Geld gegeben an %3: %2.",player getVariable["realname",name player],[(parseNumber(_amount))] call noaim_fnc_numberText,_unit getVariable["realname",name player]];
*/
hint format["You gave €%1 to %2",[(parseNumber(_amount))] call noaim_fnc_numberText,_unit getVariable["realname",name _unit]];
life_znorak = life_znorak - (parseNumber(_amount));
[0] call SAX_fnc_updatePartial;
[_unit,_amount,player] remoteExec ["noaim_fnc_receiveMoney",_unit];
//[[_unit,_amount,player],"noaim_fnc_receiveMoney",_unit,false] spawn noaim_fnc_DONE;
[] call noaim_fnc_p_updateMenu;

ctrlShow[2001,true];