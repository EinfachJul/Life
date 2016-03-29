/*
	File: fn_usetobacco.sqf
	Author: jakesmithey
	Description:
	An effect for smoking a cigarette.
*/
cutText ["Sie haben sich eine Zigarette angezuendet..","PLAIN",2];
sleep 3;
cutText ["Mmmm... Ich bin einfach suechtig! Ich kann einfach nicht anders...","PLAIN",2];

private["_OBJ","_PS","_tStart","_count","_smoke_action"];

life_drugged_weed = 1;
player setVariable ["smoke_weed", true, true];
_tStart = time;

_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

//[[_PS,_OBJ],"noaim_fnc_weedSmoke",true] spawn noaim_fnc_TRY;
[_PS,_OBJ] remoteExec ["noaim_fnc_weedSmoke",true];
_smoke_action = player addAction["<t color='#FF0000'>Zig ausmachen</t>",noaim_fnc_extinguishJoint,"",6, false, true, "", ' (player getVariable ["smoke_weed",false]) '];

_count = 0;
while{life_drugged_weed == 1 && Alive player && player getVariable ["smoke_weed",false] && (time - _tStart) < life_drugged_weed_duration * 30} do 
{
	if(_count % 20 == 0) then { life_thirst = life_thirst - 1; [] spawn noaim_fnc_status_bar;};
	sleep 1;
	_count = _count + 1;
}; 

player setVariable ["smoke_weed", false, true];
life_drugged_weed = 0;
player removeAction _smoke_action;
deleteVehicle _PS;

_tStart = time;
waitUntil{sleep 5; (!Alive player || (time - _tStart) > 300 || player getVariable ["smoke_weed",false])};