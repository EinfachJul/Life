/*
	Allows Cops to enter locked Vehicles
*/
private ["_position","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_position = [_this,1,"",[""]] call BIS_fnc_param;
if(playerSide == civilian || isNull _vehicle || _position == "") exitWith {};

switch (_position) do
{
	case "driver":
	{
		_vehicle lock false;
		if(isNull (driver _vehicle)) then {
			player action ["getInDriver", _vehicle];
		} else {
			player action ["getInCargo", _vehicle];
		};
		_vehicle lock true;
	};
	case "passenger":
	{
		_vehicle lock false;
		player action ["getInCargo", _vehicle];
		_vehicle lock true;
	};
	case "copilot":
	{
		_vehicle lock false;
		player action ["getInTurret", _vehicle,[0]];
		_vehicle lock true;
	};
	case "exit":
	{
		_vehicle lock false;
		player action ["getOut", _vehicle];
		_vehicle lock true;
 	};
};