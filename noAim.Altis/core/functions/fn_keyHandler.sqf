/*
	Author: Bryan "Tonic" Boardwine
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_curTarget"];
_player = player;
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_curTarget = cursorTarget;
_turtle = ((nearestObjects[getPos player,["Turtle_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F"],3]) select 0);

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_BlinkerLinksKey = if(count (actionKeys "User11") == 0) then {18} else {(actionKeys "User11") select 0};
_BlinkerRechtsKey = if(count (actionKeys "User12") == 0) then {16 } else {(actionKeys "User12") select 0};
_mapKey = actionKeys "ShowMap" select 0;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

// prevent gear abuse
if((_code in (actionKeys "Gear"))&&(!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR alive cursorTarget))) then
{
	closeDialog 0;
	closeDialog 0;
	_handled = true;
};

// Ist vor dir ein totes Tier?
/*
if(_curTarget isKindOf "Animal" && {!alive _curTarget}) exitWith {
   // [_turtle] spawn noaim_fnc_gutAnimal;
};*/

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};
//No circonflex
if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn noaim_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time;
			[player,true] spawn noaim_fnc_jumpFnc;
			[player,false] remoteExec ["noaim_fnc_jumpFnc",-2];
			
			_handled = true;
		};
	};
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn noaim_fnc_copMarkers;}};
			case civilian : {if(!visibleMap) then {[] spawn noaim_fnc_gangMarkers;}};
			case east: {if(!visibleMap) then {[] spawn noaim_fnc_medicMarkers;}};
			//case independent: {if(!visibleMap) then {[] spawn noaim_fnc_alacMarkers;}};
		};
	};
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn noaim_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	//disabled ^
	if((_code in (actionKeys "SelectAll") || _code in (actionKeys "ForceCommandingMode"))) then {_handled = true;};


	if((_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide") || _code in (actionKeys "PushToTalkAll") || _code in (actionKeys "PushToTalkDirect") || _code in (actionKeys "VoiceOverNet"))) exitWith {
		if (currentChannel in [life_radio_default,7]) then
		{
			setCurrentChannel 5;
		};
	};

	//Restraining (Shift + R)
	case 19:
	{

		if(_shift) then {_handled = true;};
		
		if(playerSide == civilian) then {
			/* if(_shift && (playerSide == civilian) && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && cursorTarget distance player < 4 && speed cursorTarget < 1 && !(cursorTarget getVariable["newbie",false])) then */
			if(_shift && (playerSide == civilian) && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && cursorTarget distance player < 4 && speed cursorTarget < 1) then
			{

				if(!(animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
				{
					[cursorTarget] spawn noaim_fnc_knockoutAction;
					/*if("ItemRadio" in assignedItems cursorTarget) then {
							cursorTarget removeweapon "ItemRadio";
							hint "Ihr Smartphone ist auf den Boden gefallen!";
							_defenceplace1 = "Item_ItemRadio" createVehicle (player modelToWorld[0,0,0]);}
					else { hint "Die Person die sie Ausgenockt haben, hat kein Smartphone!"};*/
				};
			};
		} else {
			if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
			{
				[] call noaim_fnc_restrainAction;
			};
		};
	};
	
	case 23:
	{
		if (!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR alive cursorTarget)) then {
			closeDialog 0;
			closeDialog 0;
		};
	};
	// Farming Key (E)
	case 18:
    {
	    if((playerSide == civilian) && (!life_action_gather) ) then
        {
			[] spawn noaim_fnc_gather;
        };
		
		if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","I_G_Van_01_transport_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F"])) then {
			if(driver (vehicle player) == player) then {
				[vehicle player] call noaim_fnc_startBlinkertwo;
				_handled = true;
				sleep 5;
			};
		};
	};
	
	//surrender... shift + g
	case 34:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn noaim_fnc_surrender;
				};
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in zaki_vehicles) then
				{
					[vehicle player] call noaim_fnc_openInventory;
				};
			}
			else
			{
				if((cursorTarget isKindOf "Land_Wreck_Traw_F" OR cursorTarget isKindOf "Land_Wreck_Traw2_F" OR cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F" OR cursorTarget isKindOf "Cargo_base_F" OR cursorTarget isKindOf "ReammoBox_F" OR cursorTarget isKindOf "StaticWeapon") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in zaki_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call noaim_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,east]) then 
		{
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","I_G_Van_01_transport_F","B_MRAP_01_F","I_MRAP_03_F","C_Van_01_box_F","C_Offroad_01_repair_F","C_Kart_01_F","B_Quadbike_01_F","I_G_Offroad_01_armed_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","B_Heli_Transport_01_F","I_Truck_02_covered_F","O_Heli_Light_02_unarmed_F","B_Truck_01_mover_F","I_Truck_02_box_F","C_Heli_Light_01_civil_F","O_Heli_Transport_04_F"]) then 
			{
				if(!isNil {vehicle player getVariable "lights"}) then 
				{
					if(playerSide == west) then
					{
						[vehicle player] call noaim_fnc_sirenLights;
					};
					if(playerSide == east) then
					{
						[vehicle player] call noaim_fnc_medicSirenLights;
					};
					if(playerSide == independent) then
					{
						[vehicle player] call noaim_fnc_serviceLights;
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call noaim_fnc_radar; };
	};
	
	// ^
	case 41:
	{
		if(!_alt && !_ctrlKey) then
		{
			[] spawn noaim_fnc_bInteractionMenu;
		};
	};
	
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call noaim_fnc_p_openMenu;
		};
	};
	
	//Q Key
    case 16:
    {
        if(!life_action_inUse && vehicle player == player && !life_action_gather) then
        {
			if(vehicle player != player) exitWith {};
			if(life_inv_pickaxe >= 1) then
			{
				[] spawn {
					private "_handle";
					_handle = [] spawn noaim_fnc_pickAxeUse;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};
		};
		if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
			if(driver (vehicle player) == player) then {
				[vehicle player] call noaim_fnc_startBlinker;
				_handled = true;
				sleep 5;
			};
		};
    };
	
	/*case _BlinkerRechtsKey:
	{
		if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
			if(driver (vehicle player) == player) then {
				[vehicle player] call noaim_fnc_startBlinker;
				_handled = true;
			};
		};
	};*/
	//F Key
	case 33:
    {   
        if (!_shift && !_alt) then
        {
            if(playerSide in [west,east] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
			{
				if(!life_sirenToggleAllowed) exitWith {};
				life_sirenToggleAllowed = false;
				[] spawn {
					sleep 2;
					life_sirenToggleAllowed = true;
				};
					
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText [localize "STR_MISC_SirensOFF","PLAIN"];
					_veh setVariable["siren",false,true];
				}
				else
				{
					titleText [localize "STR_MISC_SirensON","PLAIN"];
					_veh setVariable["siren",true,true];
					if(playerSide == west) then {
						[_veh] remoteExec ["noaim_fnc_medicSiren",-2];
					};
					if(playerSide == east) then  {
						[_veh] remoteExec ["noaim_fnc_medicSiren",-2];
					};
				};
			};
		};
		
		if(_shift) then
		{
			if(playerSide in [west,east] && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
			{
				if(!life_siren2ToggleAllowed) exitWith {};
				life_siren2ToggleAllowed = false;
				[] spawn {
					sleep 2;
					life_siren2ToggleAllowed = true;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
				if((_veh getVariable "siren2")) then
				{
					titleText [localize "STR_MISC_Sirens2OFF","PLAIN"];
					_veh setVariable["siren2",false,true];
				}
				else
				{
					titleText [localize "STR_MISC_Sirens2ON","PLAIN"];
					_veh setVariable["siren2",true,true];
					if(playerSide == west) then {
						[_veh] remoteExec ["noaim_fnc_copSiren2",-2];
					} else {
						[_veh] remoteExec ["noaim_fnc_medicSiren2",-2];
					};
				};
			};
		};
		
		if(_alt) then
        {
            if(playerSide in [west,east] && vehicle player != player && !life_siren3_active && ((driver vehicle player) == player)) then
            {
				if(!life_siren3ToggleAllowed) exitWith {};
				life_siren3ToggleAllowed = false;
				[] spawn {
					sleep 2;
					life_siren3ToggleAllowed = true;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren3"}) then {_veh setVariable["siren3",false,true];};
				if((_veh getVariable "siren3")) then
				{
					titleText [localize "STR_MISC_Sirens3OFF","PLAIN"];
					_veh setVariable["siren3",false,true];
				}
				else
				{
					titleText [localize "STR_MISC_Sirens3ON","PLAIN"];
					_veh setVariable["siren3",true,true];
					if(playerSide == west) then {
						//[[_veh],"noaim_fnc_copSiren3",nil,true] spawn noaim_fnc_DONE;
						[_veh] remoteExec ["noaim_fnc_copSiren3",-2];
					}
					 else {
						//[[_veh],"noaim_fnc_medicSiren3",nil,true] spawn noaim_fnc_DONE;
						[_veh] remoteExec ["noaim_fnc_medicSiren3",-2];
					};
				};
            };
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey && !_shift) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(!life_lockToggleAllowed) exitWith {};
			life_lockToggleAllowed = false;
			[] spawn {
				sleep 1;
				life_lockToggleAllowed = true;
			};
				
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in zaki_vehicles && player distance _veh < 8) then {
					_door = [_veh] call noaim_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in zaki_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
								if(driver (vehicle player) == player) then {
									[vehicle player] call noaim_fnc_warnBlinker;
									_handled = true;
									sleep 5;
								};
							};
							_veh lock 0;
                            _veh animateDoor ["door_back_R",1];
                            _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
						} else {
							/*if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
								if(driver (vehicle player) == player) then {
									[vehicle player] call noaim_fnc_warnBlinker;
									_handled = true;
								};
							};*/
							[_veh,0] remoteExec ["noaim_fnc_lockVehicle",_veh];
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
						};
							systemChat localize "STR_MISC_VehUnlock";
							_veh say3D "car_unlock";
					}
					else
					{
						if(local _veh) then
						{
							_veh lock 2;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
						}
						else
						{
							if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
								if(driver (vehicle player) == player) then {
									[vehicle player] call noaim_fnc_warnBlinker;
									_handled = true;
								};
							};
							//[[_veh,2],"noaim_fnc_lockVehicle",_veh,false] spawn noaim_fnc_DONE;
							[_veh,2] remoteExec ["noaim_fnc_lockVehicle",_veh];
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
						};
						//hint composeText [ image "images\icons\lock.paa", " Véhicule Fermé" ];
						systemChat localize "STR_MISC_VehLock";
						_veh say3D "car_lock";
					};
				};
			};
		}else{
			if(_shift && allowEarplug) then {
				allowEarplug = false;
				if(airnoise) then {
					1 fadesound 1;
					airnoise = false;
					hintSilent localize "STR_NOTF_Earplug_off";
				}else{
					1 fadesound 0.05;
					airnoise = true;
					hintSilent localize "STR_NOTF_Earplug_on";
				};
				playSound "earplug";
				[] spawn {
					sleep 1;
					allowEarplug = true;
				};
			};
		};
	};
	
	//Ö Key?
	case 39: 
	{
		if(vehicle player != player && (typeOf vehicle player in ["C_Offroad_01_F","B_MRAP_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Hatchback_01_F","I_MRAP_03_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","B_Truck_01_box_F","C_SUV_01_F","C_Offroad_01_repair_F","I_Truck_02_box_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","C_Van_01_fuel_F","B_Quadbike_01_F","O_MRAP_02_F"])) then {
			if(driver (vehicle player) == player) then {
				[vehicle player] call noaim_fnc_warnBlinker;
				_handled = true;
				sleep 5;
			};
		};
		if(_shift) then {
			[] call noaim_fnc_earplug;
			_handled = true;
		};
	};
	
	//Ü Key
	case 26: 
	{
		//[] call noaim_fnc_earplug;
		//_handled = true;
        //Licht für Kart
		if(vehicle player != player && (typeOf vehicle player in ["SUV_01_base_black_F"])) then {
			_veh = vehicle player;
			_vel = velocity _veh;
			_speed = speed _veh;
			_velXM = velocityModelSpace _veh select 0;
			_velYM = velocityModelSpace _veh select 1;
			if(_speed <= 1 || _speed >= 200 || _velXM > _velYM) exitWith {};
			_dir = direction _veh;
			_velX = velocity _veh select 0;
			_velY = velocity _veh select 1;
			_velZ = velocity _veh select 2;
			_speedBoost = 0.4;
			_veh setvelocity [
				(_vel select 0) + _speedBoost * (sin _dir),
				(_vel select 1) + _speedBoost * (cos _dir),
				(_vel select 2) - _speedBoost
			];
        };
	};

	// O, police gate opener
    case 24:
	{
		if(_shift) then {_handled = true;};
		if(_shift && (playerSide == civilian || playerSide == independent) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,east,west]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && !life_is_arrested) then
		{
			if([false,"zipties",1] call noaim_fnc_handleInv) then
			{
				[] call noaim_fnc_restrainAction;
			}
			else
			{
				hint localize "STR_NOTF_ZiptiesLack";
			};
		};
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call noaim_fnc_copOpener;
		};
		if (!_shift && !_alt && !_ctrlKey && (playerSide == east) && (vehicle player != player)) then {
			[] call noaim_fnc_medicOpener;
		};
	};
	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F"])) then
        {
            [] call noaim_fnc_openEmpMenu; [_this] call noaim_fnc_isEmpOperator;
        };
    };
	
	case 6:
	{
		if(!_alt && !_ctrlKey) then {
			[] spawn noaim_fnc_activateNitro;
		};
	};
	
	//Pushup(Shift + Num 4)
	case 75:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_is_arrested} && (vehicle player == player)) then
			{
				cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
			};
	}; 	

	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && {!life_is_arrested} && (vehicle player == player)) then
		{
			cutText [format["Takwondo!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
			if(_shift) then {_handled = true;};
			if ((_shift) && {!life_is_arrested} && (vehicle player == player)) then
			{
				cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};

	//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && {!life_is_arrested} && (vehicle player == player)) then
			{
				cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			};
	};
	
	//Numpad (,) Entfernt
    case 83:
    {
        if(playerSide == civilian) then 
        {
            _handled = true;
        };
		if(playerSide == west) then 
        {
            _handled = true;
        };
    };
};

_handled;