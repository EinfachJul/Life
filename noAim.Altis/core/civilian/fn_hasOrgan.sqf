/*
file: fn_hasOrgan.sqf
author: [midgetgrimm] - A Grimm Life |• Index page

*/
private["_organThief"];
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {}; //if not the thief get bent

//[[1,format["%1 has cut out a kidney from %2.",name _organThief,name player]],"noaim_fnc_broadcast",nil,false] spawn noaim_fnc_TRY;//lets people know you are stealing kidneys
[1,format["%1 has cut out a kidney from %2.",name _organThief,name player]] remoteExecCall ["noaim_fnc_broadcast",nil];

[_organThief,"kidney",1] call noaim_fnc_handleInv; //put stolen kidney into inventory of thief
//[[getPlayerUID _organThief,name _organThief,"919"],"noaim_fnc_wantedAdd",false,false] spawn noaim_fnc_TRY;//add to wanted list
[getPlayerUID _organThief,name _organThief,"919"] remoteExec ["noaim_fnc_wantedAdd",2];
sleep 300; //no more organ theft for at least 5 minutes, so they cant just do it over and over, can do whatever time you want
_organThief setVariable["hasOrgan",false,true];//allow them to be able to take organs again- setting a variable 