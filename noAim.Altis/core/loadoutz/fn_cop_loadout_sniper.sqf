/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
#include "..\..\macros.hpp"
private ["_loadoutName","_action","_guncost"];
if(playerSide in [civilian,east]) exitWith {hint"Sie gehoeren nicht zu der Polizei";};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
_guncost = 125000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "Polizei-Sniper Ausruestung";
_action = [
			format["Sind sie sich sicher das sie ihre vorhandene Ausruestung ersetzen moechten fuer die :%1: ? Es wird sie %2 € Kosten.",_loadoutName,[_guncost] call noaim_fnc_numberText],
			"Ausruestung kaufen",
			"Kaufen",
			"Nein"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Sie haben die %1 fuer <t color='#8cff9b'>%2 €</t> gekauft.",_loadoutName,[_guncost] call noaim_fnc_numberText];
life_zgazzy = life_zgazzy - _guncost;
			
titleText ["Das Kostet sie 125,000 €, direkt von ihrem Bankkonto.","PLAIN"];

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

if(__GETC__(zak_copstufe) == 2) then { //Wachmeister
	player addWeapon "srifle_DMR_03_F";
	player selectWeapon "srifle_DMR_03_F";
	player addPrimaryWeaponItem "optic_SOS";
	player addPrimaryWeaponItem "muzzle_snds_B";

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["20Rnd_762x51_Mag",5]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4]; //this will add items
};

if(__GETC__(zak_copstufe) == 3) then { //Obermeister
	player addWeapon "srifle_EBR_F"; //Primaer Mk18
	player selectWeapon "srifle_EBR_F"; //Primaer Mk18
	player addPrimaryWeaponItem "optic_SOS";
	player addPrimaryWeaponItem "muzzle_snds_B";
	
	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["20Rnd_762x51_Mag",5]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4]; //this will add items
};

if(__GETC__(zak_copstufe) == 4) then { //Hauptmeister
	player addWeapon "srifle_EBR_F"; //Primaer Mk18
	player selectWeapon "srifle_EBR_F"; //Primaer Mk18
	player addPrimaryWeaponItem "optic_SOS";
	player addPrimaryWeaponItem "muzzle_snds_B";
	
	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["20Rnd_762x51_Mag",5]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4]; //this will add items
};

if(__GETC__(zak_copstufe) == 5) then { //Kommissar
	player addWeapon "srifle_EBR_F"; //Primaer Mk18
	player selectWeapon "srifle_EBR_F"; //Primaer Mk18
	player addPrimaryWeaponItem "optic_SOS";
	player addPrimaryWeaponItem "muzzle_snds_B";
	
	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["20Rnd_762x51_Mag",5]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",4]; //this will add items
};

if(__GETC__(zak_copstufe) == 6) then { //Oberkommissar
	player addWeapon "srifle_DMR_05_blk_F"; //Primaer Cyrus
	player selectWeapon "srifle_DMR_05_blk_F"; //Primaer Cyrus
	player addPrimaryWeaponItem "optic_SOS";  //Mainvisier
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
	player addPrimaryWeaponItem "muzzle_snds_93mmg"; //Schalldaempfer

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["10Rnd_93x64_DMR_05_Mag",7]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //this will add items
};

if(__GETC__(zak_copstufe) == 7) then { //Hauptkommissar
	player addWeapon "srifle_DMR_05_blk_F"; //Primaer Cyrus
	player selectWeapon "srifle_DMR_05_blk_F"; //Primaer Cyrus
	player addPrimaryWeaponItem "optic_LRPS";  //Mainvisier
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
	player addPrimaryWeaponItem "muzzle_snds_93mmg"; //Schalldaempfer

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["10Rnd_93x64_DMR_05_Mag",7]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //this will add items
};

if(__GETC__(zak_copstufe) == 8) then { //Rat
	player addWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player selectWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player addPrimaryWeaponItem "optic_LRPS";  //Mainvisier
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
	player addPrimaryWeaponItem "muzzle_snds_338_black"; //Schalldaempfer

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["10Rnd_338_Mag",7]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 1];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //this will add items
};

if(__GETC__(zak_copstufe) == 9) then { //Oberrat
	player addWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player selectWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player addPrimaryWeaponItem "optic_LRPS";  //Mainvisier
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
	player addPrimaryWeaponItem "muzzle_snds_338_black"; //Schalldaempfer

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["10Rnd_338_Mag",7]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 2];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //this will add items
};

if(__GETC__(zak_copstufe) == 10) then { //Direktor
	player addWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player selectWeapon "srifle_DMR_02_F"; //Primaer MAR-10
	player addPrimaryWeaponItem "optic_LRPS";  //Mainvisier
	player addPrimaryWeaponItem "bipod_01_F_blk"; //Standbein
	player addPrimaryWeaponItem "muzzle_snds_338_black"; //Schalldaempfer

	player addBackPack "B_Carryall_oucamo";
	mybackpack = unitBackpack player;
	mybackpack addMagazineCargoGlobal ["10Rnd_338_Mag",7]; //this will add items
	mybackpack addItemCargoGlobal ["FirstAidKit", 3];
	mybackpack addItemCargoGlobal ["optic_NVS", 1];
	mybackpack addItemCargoGlobal ["optic_AMS", 1];
	mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //this will add items
};

if ((getPlayerUID player) in ["76561197971317833","76561198013004603"]) then {
	player addHeadgear "H_PilotHelmetHeli_B";
} else {
	player addHeadgear "H_Watchcap_blk";
};

player addVest "V_TacVest_blk_POLICE"; // Polizei Weste

if ((getPlayerUID player) in ["76561198013004603"]) then {
	player addGoggles "G_Balaclava_combat";
} else {
	player addGoggles "G_Tactical_Clear";
};
player addWeapon "hgun_P07_snds_F";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addWeapon "Rangefinder";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";

reload player;
titleText [format["Enjoy your %1",_loadoutName],"PLAIN"];
[1] call SAX_fnc_updatePartial;
} else {
			hint"Nun gut, danke fuer nichts..";
};