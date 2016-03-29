/*
	Author: Bryan "Tonic" Boardwine
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};
if(side _cop in [independent, civilian] && life_is_arrested) exitWith {hintSilent localize "STR_Jail_Zipties_Error";};
player setVariable["restrained",true,true];

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		/*_time = time;
		waitUntil {(time - _time) > (20 * 60)};*/
		waitUntil {sleep 5*60; !({_x != player && alive _x && (getPos player) distance _x < 60} count playableUnits > 0)};
		
		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if((player getVariable["restrained",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrained",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			detach player;
			profileNamespace setVariable["Busted",false];
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
			
			"colorCorrections" ppEffectEnable false;
			"chromAberration" ppEffectEnable false;
			
			[1] call noaim_fnc_tempSack;
		};
	};
};

if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };
titleText[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]],"PLAIN"];
player say3D "handcuffs";
profileNamespace setVariable["Busted",true];				
player unassignItem "ItemGPS";
player unassignItem "Binocular";
player unassignItem "Rangefinder";
while {player getVariable "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
		profileNamespace setVariable["Busted",false];
		[player] joinSilent (group player); //try out
		//detach _player;
	};
	
	if(!alive _cop) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
		[player] joinSilent (group player); //try out
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if((driver vehicle player) == player) then {moveOut player}; //try out
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
		if ((vehicle player isKindOf "Air") && (((assignedVehicleRole player) select 0) == "Turret")) then {moveOut player}; //try out
	};
};
//disableUserInput false;
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["restrained",false,true];
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	profileNamespace setVariable["Busted",false];
	detach player;
	titleText["Du wurdest freigelassen.","PLAIN"];
	player say3D "handcuffs";
};