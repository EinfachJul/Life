/*
Creators: Pak & GamerDF

Merged all Placeable Items

Description:
Holt das Item aus dem Inventar und setzt es auf der Map.
*/

private["_type"];

_type = [_this,0,-1] call BIS_fnc_param;

switch(_type) do
{
	//BarrierLight
	case 0:
	{
		private["_barrierLight"];
		_barrierLight = "RoadBarrier_light" createVehicle [0,0,0.2];
		_barrierLight attachTo[player,[0,5.5,0.2]];
		_barrierLight setDir 90;
		_barrierLight setVariable["item","barrierLightDeployed",true];
		
		life_action_barrierLightDeploy = player addAction["<t color='#00FF00'>Barriere aufstellen</t>",{if(!isNull life_barrierLight) then {detach life_barrierLight; life_barrierLight = ObjNull;}; player removeAction life_action_barrierLightDeploy; life_action_barrierLightDeploy = nil;},"",999,false,false,"",'!isNull life_barrierLight'];
		life_barrierLight = _barrierLight;
		waitUntil {isNull life_barrierLight};
		if(!isNil "life_action_barrierLightDeploy") then {player removeAction life_action_barrierLightDeploy;};
		if(isNull _barrierLight) exitWith {life_barrierLight = ObjNull;};
		_barrierLight setPos [(getPos _barrierLight select 0),(getPos _barrierLight select 1),0];
		_barrierLight allowDamage false;
	};
	
	//Bunker
	case 1:
	{
		private["_bunker"];
		_bunker = "Land_BagBunker_Small_F" createVehicle [0,0,0.2];
		_bunker attachTo[player,[0,5.5,0.2]];
		_bunker setDir 90;
		_bunker setVariable["item","bunkerDeployed",true];

		life_action_bunkerDeploy = player addAction["<t color='#00FF00'>Bunker aufstellen</t>",{if(!isNull life_bunker) then {detach life_bunker; life_bunker = ObjNull;}; player removeAction life_action_bunkerDeploy; life_action_bunkerDeploy = nil;},"",999,false,false,"",'!isNull life_bunker'];
		life_bunker = _bunker;
		waitUntil {isNull life_bunker};
		if(!isNil "life_action_bunkerDeploy") then {player removeAction life_action_bunkerDeploy;};
		if(isNull _bunker) exitWith {life_bunker = ObjNull;};
		_bunker setPos [(getPos _bunker select 0),(getPos _bunker select 1),0];
		_bunker allowDamage false;
	};
	
	//RoadCone
	case 2:
	{
		private["_roadcone"];
		_roadcone = "RoadCone_L_F" createVehicle [0,0,0.2];
		_roadcone attachTo[player,[0,5.5,0.2]];
		_roadcone setDir 90;
		_roadcone setVariable["item","coneDeployed",true];

		life_action_roadconeDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull life_roadcone) then {detach life_roadcone; life_roadcone = ObjNull;}; player removeAction life_action_roadconeDeploy; life_action_roadconeDeploy = nil;},"",999,false,false,"",'!isNull life_roadcone'];
		life_roadcone = _roadcone;
		waitUntil {isNull life_roadcone};
		if(!isNil "life_action_roadconeDeploy") then {player removeAction life_action_roadconeDeploy;};
		if(isNull _roadcone) exitWith {life_roadcone = ObjNull;};
		_roadcone setPos [(getPos _roadcone select 0),(getPos _roadcone select 1),0];
		_roadcone allowDamage false;
	};
	
	//Mauer
	case 3:
	{
		private["_mauer"];
		_mauer = "Land_BagFence_Round_F" createVehicle [0,0,0.2];
		_mauer attachTo[player,[0,5.5,0.2]];
		_mauer setDir 90;
		_mauer setVariable["item","mauerDeployed",true];

		life_action_mauerDeploy = player addAction["<t color='#00FF00'>Mauer aufstellen</t>",{if(!isNull life_mauer) then {detach life_mauer; life_mauer = ObjNull;}; player removeAction life_action_mauerDeploy; life_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull life_mauer'];
		life_mauer = _mauer;
		waitUntil {isNull life_mauer};
		if(!isNil "life_action_mauerDeploy") then {player removeAction life_action_mauerDeploy;};
		if(isNull _mauer) exitWith {life_mauer = ObjNull;};
		_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
		_mauer allowDamage false;
	};
	
	//Schranke
	case 4:
	{
		private["_schranke"];
		_schranke = "Land_BarGate_F" createVehicle [0,0,0.2];
		_schranke attachTo[player,[0,5.5,0.2]];
		_schranke setDir 90;
		_schranke setVariable["item","schrankeDeployed",true];

		life_action_schrankeDeploy = player addAction["<t color='#00FF00'>Schranke aufstellen</t>",{if(!isNull life_schranke) then {detach life_schranke; life_schranke = ObjNull;}; player removeAction life_action_schrankeDeploy; life_action_schrankeDeploy = nil;},"",999,false,false,"",'!isNull life_schranke'];
		life_schranke = _schranke;
		waitUntil {isNull life_schranke};
		if(!isNil "life_action_schrankeDeploy") then {player removeAction life_action_schrankeDeploy;};
		if(isNull _schranke) exitWith {life_schranke = ObjNull;};
		_schranke setPos [(getPos _schranke select 0),(getPos _schranke select 1),0];
		_schranke allowDamage false;
	};
	
	//Strahler
	case 5:
	{
		private["_strahler"];
		_strahler = "Land_PortableLight_double_F" createVehicle [0,0,0.2];
		_strahler attachTo[player,[0,5.5,0.2]];
		_strahler setDir 90;
		_strahler setVariable["item","strahlerDeployed",true];

		life_action_strahlerDeploy = player addAction["<t color='#00FF00'>Strahler aufstellen</t>",{if(!isNull life_strahler) then {detach life_strahler; life_strahler = ObjNull;}; player removeAction life_action_strahlerDeploy; life_action_strahlerDeploy = nil;},"",999,false,false,"",'!isNull life_strahler'];
		life_strahler = _strahler;
		waitUntil {isNull life_strahler};
		if(!isNil "life_action_strahlerDeploy") then {player removeAction life_action_strahlerDeploy;};
		if(isNull _strahler) exitWith {life_strahler = ObjNull;};
		_strahler setPos [(getPos _strahler select 0),(getPos _strahler select 1),0];
		_strahler allowDamage false;
	};
	
	//Spikes
	case 6:
	{
		private["_spikeStrip"];
		_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0.2];
		_spikeStrip attachTo[player,[0,5.5,0]];
		_spikeStrip setDir 90;
		_spikeStrip setVariable["item","spikeDeployed",true];

		life_action_spikeStripDeploy = player addAction["Platziere Nagelband",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];
		life_spikestrip = _spikeStrip;
		waitUntil {isNull life_spikeStrip};
		if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
		if(isNull _spikeStrip) exitWith {life_spikestrip = ObjNull;};
		_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
		_spikeStrip setDamage 1;
		life_action_spikeStripPickup = player addAction["Entferne Nagelband",noaim_fnc_packupSpikes,"",0,false,false,"",
		' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
		//[[_spikeStrip],"TON_fnc_spikeStrip",false,false] spawn noaim_fnc_TRY; //Send it to the server for monitoring.
		[_spikeStrip] remoteExec ["TON_fnc_spikeStrip",2];
	};
};