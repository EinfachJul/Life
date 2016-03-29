/*
	Author: Bryan "Tonic" Boardwine
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_G_Van_01_transport_F","C_Kart_01_F","B_Quadbike_01_F","I_Truck_02_box_F","B_MRAP_01_F","B_Truck_01_mover_F","I_Truck_02_covered_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F"])) exitWith {};

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	//[[_vehicle,0.22],"noaim_fnc_medicLights",true,false] call noaim_fnc_DONE;
	[_vehicle,0.22] remoteExec ["noaim_fnc_medicLights",-2];
};