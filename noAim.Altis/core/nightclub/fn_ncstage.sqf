/* 
	File: fn_ncstage.sqf
	Author: TinyBigJacko
	Date: Unknown
	Desc: Stage lighting.
*/
private["_unit"];
_unit = _this select 0;

if (isNil "_unit" || isNull _unit || !(_unit getVariable "stage")) exitWith {};

if(ncstagelights) exitWith
{
	hint "Stage Lights sind nun Aus!";
	deleteVehicle  stagelight;
	sleep 1;
	hint "";
	ncstagelights = false;
	sleep 0.02;
};
_pos = ligh;

ncstagelights = true;
sleep 1;
if (!(_vehicle getVariable "stage")) exitWith {};
if(ncstagelights) then
{
	_unit setVariable["stagelight",FALSE,TRUE]; //spawn noaim_fnc_LAST;
	stagelight = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	this setPos [getPos this select 0, getPos this select 1, 0.40];
	stagelight setLightBrightness 0.05;
	stagelight setLightColor[255,255,255];
	hint "Stage Lights sind nun An!";
	sleep 3;
	hint "";	
};
