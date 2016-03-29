#include "..\..\macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_fw}) exitWith {};
if(life_znorak < life_ticket_val) exitWith
{
	if(life_zgazzy < life_ticket_val) exitWith
	{
		hint localize "Du hast nicht genug Geld auf deinem Bankkonto um die Rechnung zu bezahlen.";
		//[[1,format["%1 hat nicht genug Geld auf deinem Bankkonto um die Rechnung zu bezahlen.",profileName],false],"noaim_fnc_broadcast",life_ticket_fw,false] call noaim_fnc_TRY;
		[1,format["%1 hat nicht genug Geld auf deinem Bankkonto um die Rechnung zu bezahlen.", profileName]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_fw];
		closeDialog 0;
	};
	hint format[localize "Du hast die Rechnung über $%1 bezahlt.",[life_ticket_val] call noaim_fnc_numberText];
	life_zgazzy = life_zgazzy - life_ticket_val;
	life_ticket_paid = true;
	//[[0,format["%1 hat die Rechnung über $%2 bezahlt",profileName,[life_ticket_val] call noaim_fnc_numberText],false],"noaim_fnc_broadcast",east,false] call noaim_fnc_TRY;
	[0,format["%1 hat die Rechnung über $%2 bezahlt", profileName,[life_ticket_val] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",east];
	//[[1,format["%1 hat die Rechnung über $%2 bezahlt",profileName,[life_ticket_val] call noaim_fnc_numberText],false],"noaim_fnc_broadcast",life_ticket_fw,false] call noaim_fnc_TRY;
	[1,format["%1 hat die Rechnung über $%2 bezahlt",profileName,[life_ticket_val] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_fw];
	//[[life_ticket_val,player,life_ticket_fw],"noaim_fnc_fw_ticket_paid",life_ticket_fw,false] call noaim_fnc_TRY;
	[life_ticket_val,player,life_ticket_fw] remoteExec ["noaim_fnc_fw_ticket_paid",life_ticket_fw];
	closeDialog 0;
};

life_znorak = life_znorak - life_ticket_val;
life_ticket_paid = true;

//[[0,format["%1 hat die Rechnung über $%2 bezahlt",profileName,[life_ticket_val] call noaim_fnc_numberText],false],"noaim_fnc_broadcast",east,false] call noaim_fnc_TRY;
[0,format["%1 hat die Rechnung über $%2 bezahlt",profileName,[life_ticket_val] call noaim_fnc_numberText]] remoteExecCall ["noaim_fnc_broadcast",east];
closeDialog 0;
//[[1,format["%1 hat die Rechnung über $%2 bezahlt",profileName],false],"noaim_fnc_broadcast",life_ticket_fw,false] call noaim_fnc_TRY;
[1,format["%1 hat die Rechnung über $%2 bezahlt",profileName]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_fw];
//[[life_ticket_val,player,life_ticket_fw],"noaim_fnc_fw_ticket_paid",life_ticket_fw,false] call noaim_fnc_TRY;
[life_ticket_val,player,life_ticket_fw] remoteExec ["noaim_fnc_fw_ticket_paid",life_ticket_fw];