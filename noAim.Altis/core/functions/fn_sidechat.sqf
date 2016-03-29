#include "..\..\macros.hpp"
/*
File: fn_sidechat.sqf
Author: Checksor
*/
private["_count","_warn"];
_count=0;
_warn=0;

	titleText["Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.","PLAIN"];
	hint "Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.";
	systemChat "Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.";
	while {_count < 25} do {
		If ((getPlayerChannel player)==6) then {
			_warn=_warn+1;
			titleText["Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.","PLAIN"];
			hint "Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.";
			systemChat "Das Reden im Sidechannel ist Verboten, und wird mit einem Kick bestraft.";
		};
		If (_warn>4) exitWith {};
		_count=_count+1;
		sleep 1;
	}; 

If (_warn>4) exitWith {
	//[[0,format["%1 wurde fuer Sidechat Spam gekickt.", name player]],"noaim_fnc_broadcast",west,false] spawn noaim_fnc_TRY;
	[0,format["%1 wurde fuer Sidechat Spam gekickt.", name player]] remoteExecCall ["noaim_fnc_broadcast",west];
	//[[0,format["%1 wurde fuer Sidechat Spam gekickt.", name player]],"noaim_fnc_broadcast",civilian,false] spawn noaim_fnc_TRY;
	[0,format["%1 wurde fuer Sidechat Spam gekickt.", name player]] remoteExecCall ["noaim_fnc_broadcast",civilian];
	endMission "Loser";
};