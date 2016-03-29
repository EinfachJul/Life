/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player that he is being ticketed.
*/
private["_medic","_val","_display","_control"];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
_medic = _this select 0;
if(isNull _medic) exitWith {};
_val = _this select 1;

createDialog "life_ticket_pay_fw";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2600;
_control = _display displayCtrl 2601;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_fw = _medic;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +("%1 hat dir eine Rechnung über $%2 ausgestellt"),_medic getVariable["realname",name _medic],_val];

[] spawn
{
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_ticket_paid) then
	{
		//[[0,format["%1 hat sich geweigert die Rechnung über $%2 zu bezahlen",profileName,life_ticket_val],false],"noaim_fnc_broadcast",east,false] call noaim_fnc_TRY;
		[0,format["%1 hat sich geweigert die Rechnung über $%2 zu bezahlen", profileName,life_ticket_val]] remoteExecCall ["noaim_fnc_broadcast",east];
		//[[1,format["%1 hat sich geweigert die Rechnung über $%2 zu bezahlen",profileName,life_ticket_val],false],"noaim_fnc_broadcast",life_ticket_fw,false] call noaim_fnc_TRY;
		[1,format["%1 hat sich geweigert die Rechnung über $%2 zu bezahlen", profileName,life_ticket_val]] remoteExecCall ["noaim_fnc_broadcast",life_ticket_fw];
	};
};