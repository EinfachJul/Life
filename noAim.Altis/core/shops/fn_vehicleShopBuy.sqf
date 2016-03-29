/*
	Author: Bryan "Tonic" Boardwine
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call noaim_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_znorak < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_znorak] call noaim_fnc_numberText];closeDialog 0;};
if(!([_className] call noaim_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense";closeDialog 0;};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "fwehr_air") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","ReammoBox_F","StaticWeapon","Cargo_base_F"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","ReammoBox_F","StaticWeapon","Cargo_base_F"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block"; closeDialog 0;};
life_znorak = life_znorak - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call noaim_fnc_numberText];
[0] call SAX_fnc_updatePartial;	//ANTI GELDGLITCH SCRIPT !!!!!

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "fwehr_air") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle setVariable["spawned",false,true];
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteExec ["noaim_fnc_colorVehicle"];
	//[[_vehicle,_colorIndex],"noaim_fnc_colorVehicle",true,false] spawn noaim_fnc_DONE;
	[_vehicle] call noaim_fnc_clearVehicleAmmo;
	[_vehicle] call noaim_fnc_licensePlate;
	//[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn noaim_fnc_TRY;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TON_fnc_setObjVar",2];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TON_fnc_setObjVar",2];
	//[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn noaim_fnc_DONE;
	_vehicle disableTIEquipment false; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle setVariable["spawned",false,true];
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	//[[_vehicle,_colorIndex],"noaim_fnc_colorVehicle",true,false] spawn noaim_fnc_TRY;
	[_vehicle,_colorIndex] remoteExec ["noaim_fnc_colorVehicle",-2];
	[_vehicle] call noaim_fnc_clearVehicleAmmo;
	//[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn noaim_fnc_TRY;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TON_fnc_setObjVar",2];
	//[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn noaim_fnc_DONE;
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TON_fnc_setObjVar",2];
	_vehicle disableTIEquipment false; //No Thermals.. They're cheap but addictive.
};
//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn noaim_fnc_vehicleAnimate;
	};
	
	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn noaim_fnc_vehicleAnimate;
		};
	};
	
	case east: {
		[_vehicle,"fwehr_offroad",true] spawn noaim_fnc_vehicleAnimate;
	};	
	
	case independent: {
		[_vehicle,"alac_offroad",true] spawn noaim_fnc_vehicleAnimate;
	};
};

if( (typeOf (_vehicle) ) in (["I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_fuel_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_fuel_F","B_Truck_01_ammo_F","B_Truck_01_box_F","B_Truck_01_fuel_F","B_Truck_01_covered_F","B_Truck_01_transport_F","O_Truck_03_device_F"]) ) then  
{ 
	(_vehicle) enableRopeAttach false;
};

_vehicle setVariable["spawned",true,true];
_vehicle allowDamage true;
_vehicle setDamage 0;

//zaki_vehicles set[count zaki_vehicles,_vehicle]; //Add err to the chain.
zaki_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExec ["TON_fnc_keyManagement",2];
//[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn noaim_fnc_DONE;
if(_mode) then {
	if(!(_className in ["B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExec ["TON_fnc_vehicleCreate",2];
		//[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn noaim_fnc_DONE;
	};
};

if(!(_className in ["B_UAV_01_F","B_Quadbike_01_F"])) then {
	_vehicle addItemCargoGlobal ["ToolKit",1];
};

if((life_veh_shop select 2) == "cop" || (life_veh_shop select 2) == "med" || (life_veh_shop select 2) == "alac") then {
	_lightleft = "#lightpoint" createVehicle getPosATL _vehicle;
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "C_Offroad_01_repair_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "C_Hatchback_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.6, 2, -0.95]];
		};
		case "C_Hatchback_01_sport_F":
		{
			_lightleft attachTo [_vehicle, [-0.6, 2, -0.95]];
		};
		case "C_SUV_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.4, 2.3, -0.55]];
		};
		case "C_Van_01_box_F":
		{
			_lightleft attachTo [_vehicle, [0.0, 2.05, -0.5]];
		};
		case "B_MRAP_01_F":
		{
			_lightleft attachTo [_vehicle, [-1, -2.8, 0.55]];
		};
		case "B_MRAP_01_hmg_F":
		{
			_lightleft attachTo [_vehicle, [-1, -2.8, 0.55]];
		};
		case "I_MRAP_03_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "B_Heli_Transport_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.96]];
		};
		case "B_Heli_Light_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "C_Heli_Light_01_civil_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "I_Heli_light_03_unarmed_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "B_Heli_Transport_03_F":
		{
			_lightleft attachTo [_vehicle, [0.0, -3.5, -2.0]];
		};
		case "B_Heli_Transport_03_unarmed_F":
		{
			_lightleft attachTo [_vehicle, [0.0, -3.5, -2.0]];
		};
		case "O_Heli_Transport_04_medevac_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 2.0, 1.0]];
		};
		case "O_Heli_Light_02_unarmed_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.96]];
		};
		case "I_Heli_Transport_02_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.96]];
		};
		case "O_Heli_Transport_04_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 2.0, 1.0]];
		};
		case "B_Boat_Transport_01_F":
		{
			_lightleft attachTo [_vehicle, [-0.8, -1.8, -0.6]];
		};
		case "C_Boat_Civil_01_police_F":
		{
			_lightleft attachTo [_vehicle, [-0.3, -1.05, 0.55]];
		};
		case "C_Boat_Civil_01_rescue_F":
		{
			_lightleft attachTo [_vehicle, [-0.3, 1.5, 0.1]];
		};
		case "I_Truck_02_box_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.96]];
		};
		case "B_Truck_01_mover_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 3.0, 0.8]];
		};
		case "B_Truck_01_Repair_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 3.7, 0.4]];
		};
		case "O_Truck_03_ammo_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 2.0, 0.96]];
		};
		case "I_G_Offroad_01_armed_F":
		{
			_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
		};
		case "I_Truck_02_medical_F":
		{
			_lightleft attachTo [_vehicle, [-0.5, 3.0, 0.5]];
		};
		default {
			_lightleft attachTo [_vehicle, [-0.5, 0.0, 0.0]];
		};
	};

	_lightright = "#lightpoint" createVehicle getPosATL _vehicle;
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "C_Offroad_01_repair_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "C_Hatchback_01_F":
		{
			_lightright attachTo [_vehicle, [0.6, 2, -0.95]];
		};
		case "C_Hatchback_01_sport_F":
		{
			_lightright attachTo [_vehicle, [0.6, 2, -0.95]];
		};
		case "C_SUV_01_F":
		{
			_lightright attachTo [_vehicle, [0.4, 2.3, -0.52]];
		};
		case "C_Van_01_box_F":
		{
			_lightright attachTo [_vehicle, [0.0, 2.05, -0.5]];
		};
		case "B_MRAP_01_F":
		{
			_lightright attachTo [_vehicle, [1, -2.8, 0.55]];
		};
		case "B_MRAP_01_hmg_F":
		{
			_lightright attachTo [_vehicle, [1, -2.8, 0.55]];
		};
		case "I_MRAP_03_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "B_Heli_Transport_01_F":
		{
			_lightright attachTo [_vehicle, [0.5, 0.0, 0.96]];
		};
		case "B_Heli_Light_01_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "C_Heli_Light_01_civil_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "I_Heli_light_03_unarmed_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "B_Heli_Transport_03_F":
		{
			_lightright attachTo [_vehicle, [0.0, 7.5, -2.0]];
		};
		case "B_Heli_Transport_03_unarmed_F":
		{
			_lightright attachTo [_vehicle, [0.0, 7.5, -2.0]];
		};
		case "O_Heli_Transport_04_medevac_F":
		{
			_lightright attachTo [_vehicle, [0.5, 2.0, 1.0]];
		};
		case "O_Heli_Light_02_unarmed_F":
		{
			_lightright attachTo [_vehicle, [0.5, 0.0, 0.96]];
		};
		case "I_Heli_Transport_02_F":
		{
			_lightright attachTo [_vehicle, [0.5, 0.0, 0.96]];
		};
		case "O_Heli_Transport_04_F":
		{
			_lightright attachTo [_vehicle, [0.5, 2.0, 1.0]];
		};
		case "B_Boat_Transport_01_F":
		{
			_lightright attachTo [_vehicle, [0.8, -1.8, -0.6]];
		};
		case "C_Boat_Civil_01_police_F":
		{
			_lightright attachTo [_vehicle, [0.3, -1.05, 0.55]];
		};
		case "C_Boat_Civil_01_rescue_F":
		{
			_lightright attachTo [_vehicle, [0.3, 1.5, 0.1]];
		};
		case "I_Truck_02_box_F":
		{
			_lightright attachTo [_vehicle, [0.5, 0.0, 0.96]];
		};
		case "B_Truck_01_mover_F":
		{
			_lightright attachTo [_vehicle, [0.5, 3.0, 0.8]];
		};
		case "B_Truck_01_Repair_F":
		{
			_lightright attachTo [_vehicle, [0.5, 3.7, 0.4]];
		};
		case "O_Truck_03_ammo_F":
		{
			_lightright attachTo [_vehicle, [0.5, 2.0, 0.96]];
		};
		case "I_G_Offroad_01_armed_F":
		{
			_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
		};
		case "I_Truck_02_medical_F":
		{
			_lightright attachTo [_vehicle, [0.5, 3.0, 0.5]];
		};
		default {
			_lightright attachTo [_vehicle, [0.5, 0.0, 0.0]];
		};
	};
};

[format ["VEHICLEBUY: %1 hat sich %2 für %3 gekauft.", name player, typeOf _vehicle, [_basePrice] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;

[0] call SAX_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;