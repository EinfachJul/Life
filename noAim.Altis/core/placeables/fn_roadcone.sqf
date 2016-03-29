/*
	Author: Bryan "Tonic" Boardwine
	Creates a spike strip and preps it.
*/
private["_roadcone"];
_roadcone = "RoadCone_L_F" createVehicle [0,0,0.2];
_roadcone attachTo[player,[0,5.5,0.2]];
_roadcone setDir 90;
_roadcone setVariable["item","roadconeDeployed",true];

life_action_roadconeDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull life_roadcone) then {detach life_roadcone; life_roadcone = ObjNull;}; player removeAction life_action_roadconeDeploy; life_action_roadconeDeploy = nil;},"",999,false,false,"",'!isNull life_roadcone'];
life_roadcone = _roadcone;
waitUntil {isNull life_roadcone};
if(!isNil "life_action_roadconeDeploy") then {player removeAction life_action_roadconeDeploy;};
if(isNull _roadcone) exitWith {life_roadcone = ObjNull;};
_roadcone setPos [(getPos _roadcone select 0),(getPos _roadcone select 1),0];
_roadcone allowDamage false;