#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "Diese Person ist bereits in einer Gang"}; //Added

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	//[[profileName,grpPlayer],"noaim_fnc_gangInvite",_unit,false] spawn noaim_fnc_DONE;
	[profileName,grpPlayer] remoteExec ["noaim_fnc_gangInvite",_unit];
	_members = grpPlayer getVariable "gang_members";
	_members pushBack getPlayerUID _unit;
	grpPlayer setVariable["gang_members",_members,true];
	hint format[localize "STR_GNOTF_InviteSent",_unit getVariable["realname",name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};