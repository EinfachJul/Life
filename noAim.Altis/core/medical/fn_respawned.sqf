/*
	Author: Bryan "Tonic" Boardwine
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = true;
life_use_atm_2 = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_znorak = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

profileNamespace setVariable["Busted",false];

life_corpse setVariable["Revive",nil,true];
life_corpse setVariable["name",nil,true];
life_corpse setVariable["Reviving",nil,true];
life_corpse setvariable["fwcall",nil,true];
life_corpse setvariable["fwoffline",nil,true];
player setVariable["Revive",nil,true];
player setVariable["name",nil,true];
player setVariable["Reviving",nil,true];
player setvariable["fwcall",nil,true];
player setvariable["fwoffline",nil,true];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn noaim_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn noaim_fnc_civLoadout;
	};
	case east: {
		_handle = [] spawn noaim_fnc_medicLoadout;
	};
	case independent: {
		_handle = [] spawn noaim_fnc_alacLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn noaim_fnc_jail;
	[] call SAX_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	//[[getPlayerUID player,player,life_copRecieve,true],"noaim_fnc_wantedBounty",false,false] spawn noaim_fnc_TRY;
	[getPlayerUID player,player,life_copRecieve,true] remoteExecCall ["noaim_fnc_wantedBounty",2];
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that  Most Wanted
if(life_removeWanted) then {
	//[[getPlayerUID player],"noaim_fnc_wantedRemove",false,false] spawn noaim_fnc_DONE;
	[getPlayerUID player] remoteExec ["noaim_fnc_wantedRemove",2];
};

[] call noaim_fnc_updateClothing;
[] call SAX_fnc_updateRequest;
[] call noaim_fnc_status_bar; //Request update of hud.