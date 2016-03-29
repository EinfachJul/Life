/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
#include "..\..\macros.hpp"
private ["_loadoutName","_action","_guncost"];
if(playerSide in [civilian,east]) exitWith {hint "Sie gehoeren nicht zur Polizei";};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
_guncost = 85000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "Polizei-Assault Ausruestung";
_action = [
			format["Sind sie sich sicher das sie ihre vorhandene Ausruestung ersetzen moechten fuer die :%1: ? Es wird sie %2 € Kosten.",_loadoutName,[_guncost] call noaim_fnc_numberText],
			"Ausruestung kaufen",
			"Kaufen",
			"Nein"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Sie haben die %1 fuer <t color='#8cff9b'>%2 €</t> gekauft.",_loadoutName,[_guncost] call noaim_fnc_numberText];
life_zgazzy = life_zgazzy - _guncost;
			
titleText ["Das Kostet sie 85,000 €, direkt von ihrem Bankkonto.","PLAIN"];

uiSleep 1;
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
titleText[format["Nun ziehen Sie sich ihre %1 an.",_loadoutName],"PLAIN"];
uiSleep 3;

//**************************
if(__GETC__(zak_copstufe) > 1) then {
	player addUniform "U_B_CombatUniform_mcam";
};

if(__GETC__(zak_copstufe) == 2) then { //Wachtmeister
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MX_Black_F";
	player selectWeapon "arifle_MX_Black_F";
};

if(__GETC__(zak_copstufe) == 3) then { //Obermeister
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MX_Black_F";
	player selectWeapon "arifle_MX_Black_F";
};

if(__GETC__(zak_copstufe) == 4) then { //Hauptmeister
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MX_Black_F";
	player selectWeapon "arifle_MX_Black_F";
};

if(__GETC__(zak_copstufe) == 5) then { //Kommissar
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MX_Black_F";
	player selectWeapon "arifle_MX_Black_F";
};

if(__GETC__(zak_copstufe) == 6) then { //Oberkommissar
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F";
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if(__GETC__(zak_copstufe) == 7) then { //Hauptkommissar
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F"; //wg 120
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if(__GETC__(zak_copstufe) == 8) then { //Rat
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F"; //wg 120
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if(__GETC__(zak_copstufe) == 9) then { //Oberrat
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F"; //wg 120
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if(__GETC__(zak_copstufe) == 10) then { //Direktor
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F";
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if(__GETC__(zak_copstufe) == 11) then { //Präsident
	player addHeadgear "H_Beret_blk_POLICE"; 
	player addWeapon "arifle_MXM_Black_F";
	player selectWeapon "arifle_MXM_Black_F";
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
};

if ((getPlayerUID player) in ["76561197971317833"]) then {
	player addHeadgear "H_Cap_police"; 
	player addWeapon "arifle_Katiba_C_F";
	player selectWeapon "arifle_Katiba_C_F";
};
//	wg 6 ammor 0
player addPrimaryWeaponItem "optic_MRCO"; // wg 4
player addPrimaryWeaponItem "muzzle_snds_H"; // wg 10
player addPrimaryWeaponItem "acc_pointer_IR";	// wg 6
player addVest "V_TacVest_blk_POLICE"; // 
player addGoggles "G_Aviator";
player addWeapon "hgun_P07_snds_F"; // cc 100 wg 40 am 20 
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
//player addWeapon "Binocular";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";

player addBackPack "B_Carryall_oucamo";
mybackpack = unitBackpack player;
if ((getPlayerUID player) in ["76561197971317833"]) then {
	mybackpack addMagazineCargoGlobal ["30Rnd_65x39_caseless_green",10]; //this will add items
	mybackpack addItemCargoGlobal ["optic_NVS", 1]; //Nachtsichtvisier
	mybackpack addItemCargoGlobal ["optic_AMS", 1]; //Fernvisier
} else {
	mybackpack addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",10]; //this will add items
};
//mybackpack addItemCargoGlobal ["Toolkit", 1];
mybackpack addItemCargoGlobal ["FirstAidKit", 1];
mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",5]; //this will add items

reload player;
titleText [format["Enjoy your %1",_loadoutName],"PLAIN"];
[1] call SAX_fnc_updatePartial;
} else {
			hint"Nun gut, danke fuer nichts..";
};