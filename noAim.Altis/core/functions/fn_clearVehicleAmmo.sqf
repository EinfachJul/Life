/*
	Author: Bryan "Tonic" Boardwine
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(_veh == "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};
if(_veh == "B_APC_Wheeled_01_cannon_F") then
{
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
};

if(_veh == "I_APC_Wheeled_03_cannon_F") then
{
	_vehicle removeMagazinesTurret ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
	_vehicle removeMagazinesTurret ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];
	_vehicle removeMagazinesTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
	_vehicle removeMagazinesTurret ["2Rnd_GAT_missiles",[0]];
};
if(_veh == "O_Heli_Attack_02_F") then
{
	_vehicle removeMagazinesTurret ["192Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};
if(_veh == "O_Heli_Attack_02_black_F") then
{
	_vehicle removeMagazinesTurret ["192Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};
if(_veh == "B_Heli_Light_01_armed_F") then
{
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
};
if(_veh == "B_Heli_Transport_01_camo_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};
if(_veh == "I_Plane_Fighter_03_AA_F") then
{
	_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "B_Plane_CAS_01_F") then
{
	_vehicle removeMagazinesTurret ["1000Rnd_Gatling_30mm_Plane_CAS_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_04_F",[-1]];
	_vehicle removeMagazinesTurret ["6Rnd_Missile_AGM_02_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Bomb_04_F",[-1]];
	_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_AP_F",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Plane_CAS_02_F") then
{
	_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "B_Heli_Attack_01_F") then
{
	_vehicle removeMagazinesTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
	_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
};
if(_veh == "B_Heli_Transport_01_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};
if(_veh == "B_Heli_Transport_03_unarmed_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_ammo_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_box_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_covered_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_medevac_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Transport_04_repair_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "I_Heli_light_03_unarmed_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "I_Heli_Transport_02_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "B_Heli_Transport_03_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};
if(_veh == "I_Heli_light_03_F") then
{
	_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "O_Heli_Light_02_unarmed_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh == "I_MRAP_03_hmg_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Yellow",[0]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Yellow",[0]];
};
if(_veh == "O_MRAP_02_hmg_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
};
if (_veh == "B_APC_Tracked_01_CRV_F") Then {
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
};

if (_veh == "B_APC_Tracked_01_CRV_F") Then {
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
};

if (_veh == "O_Boat_Armed_01_hmg_F") Then { 
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[0]];
};

if (_veh == "I_Boat_Armed_01_minigun_F") Then { 
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt_Tracer_Red",[0]];
};

if (_veh == "B_Boat_Armed_01_minigun_F") Then { 
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt_Tracer_Red",[0]];
};

if(_vehicle isKindOf "Air") then {
	//_vehicle removeBackpack ["B_Parachute",[0]];
	//clearBackpackCargoGlobal _vehicles;
	//clearBackpackCargoGlobal B_Parachute; // REMOVE TEST32
	clearBackpackCargoGlobal B_Parachute;
};
/*

if((_vehicle isKindOf "Air") || !(_vehicle isKindOf "Car") || !(_vehicle isKindOf "ReammoBox_F") || !(_vehicle isKindOf "StaticWeapon") || !(_vehicle isKindOf "Ship")) then {
	//_vehicle removeBackpack ["B_Parachute",[0]];
	clearBackpackCargoGlobal _vehicle;
	
};*/

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;