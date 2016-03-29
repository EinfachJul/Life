/*
	Author: Bryan "Tonic" Boardwine
	Creates a spike strip and preps it.
*/
private["__barrierlight"];
_barrierlight = "RoadBarrier_F" createVehicle [0,0,0.2];
_barrierlight attachTo[player,[0,5.5,0.2]];
_barrierlight setDir 90;
_barrierlight setVariable["item","barrierlightDeployed",true];

life_action_barrierlightDeploy = player addAction["<t color='#00FF00'>Lichtschranke aufstellen</t>",{if(!isNull life_barrierlight) then {detach life_barrierlight; life_barrierlight = ObjNull;}; player removeAction life_action_barrierlightDeploy; life_action_barrierlightDeploy = nil;},"",999,false,false,"",'!isNull life_barrierlight'];
life_barrierlight = _barrierlight;
waitUntil {isNull life_barrierlight};
if(!isNil "life_action_barrierlightDeploy") then {player removeAction life_action_barrierlightDeploy;};
if(isNull _barrierlight) exitWith {life_barrierlight = ObjNull;};
_barrierlight setPos [(getPos _barrierlight select 0),(getPos _barrierlight select 1),0];
_barrierlight allowDamage false;