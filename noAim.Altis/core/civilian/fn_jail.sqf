/*
	Author: Bryan "Tonic" Boardwine
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"]; //-------------Changed---------------
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;//-------------Changed--------------

[1] call noaim_fnc_tempSack;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_TRY;
[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "damdi_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "damdi_marker") > 40) then
{
	player setPos (getMarkerPos "damdi_marker");
};

[1] call noaim_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call noaim_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call noaim_fnc_handleInv;};
if(life_inv_cocaine > 0) then {[false,"cocaine",life_inv_cocaine] call noaim_fnc_handleInv;};
if(life_inv_cocainep > 0) then {[false,"cocainep",life_inv_cocainep] call noaim_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call noaim_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call noaim_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call noaim_fnc_handleInv;};
if(life_inv_boltcutter > 0) then {[false,"boltcutter",life_inv_boltcutter] call noaim_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call noaim_fnc_handleInv;};
if(life_inv_blastingcharge > 0) then {[false,"blastingcharge",life_inv_blastingcharge] call noaim_fnc_handleInv;};
if(life_inv_zipties > 0) then {[false,"zipties",life_inv_zipties] call noaim_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

//[player,_bad,_time] remoteExec ["noaim_fnc_jailSys",2]; //REMOTE
[player,_bad,_time] remoteExec ["noaim_fnc_jailSys",2];
//[[player,_bad,_time],"noaim_fnc_jailSys",false,false] spawn noaim_fnc_DONE;
[2] call SAX_fnc_updatePartial;
[5] call SAX_fnc_updatePartial;