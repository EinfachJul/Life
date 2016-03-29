/*
	Author: Bryan "Tonic" Boardwine
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 1000000) exitWith {hint localize "STR_Cop_TicketOver100"};
//if((__GETC__(zak_copstufe) < 2) > 100000) exitWith {hint localize "STR_Cop_TicketAntBlock"};
//[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call noaim_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"noaim_fnc_broadcast",true,false] spawn noaim_fnc_TRY;
[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call noaim_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]] remoteExecCall ["noaim_fnc_broadcast",-2];

//[[player,(parseNumber _val)],"noaim_fnc_ticketPrompt",life_ticket_unit,false] spawn noaim_fnc_TRY;
[player,(parseNumber _val)] remoteExec ["noaim_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;