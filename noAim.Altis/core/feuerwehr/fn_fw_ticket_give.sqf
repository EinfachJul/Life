/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit} || isNull life_ticket_unit) exitWith {};

_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 100000) exitWith {hint localize "STR_fw_TicketOver100"};
//[[player,(parseNumber _val)],"noaim_fnc_fw_ticket_prompt",life_ticket_unit,false] call noaim_fnc_TRY;
[player,(parseNumber _val)] remoteExec ["noaim_fnc_fw_ticket_prompt",life_ticket_unit];
closeDialog 0;