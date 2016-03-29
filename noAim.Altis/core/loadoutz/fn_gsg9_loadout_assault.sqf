/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
#include "..\..\macros.hpp"
private ["_loadoutName","_action","_guncost"];
if(playerSide in [civilian,east,independent]) exitWith {hint"Sie gehoeren nicht zu der Bundespolizei";};
if (!license_cop_gsg9): {"Du bist kein GSG9 Beamter!"};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als toter koennen sie nichts kaufen.";};
_guncost = 85000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "GSG9-Assault Ausruestung";
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
player addUniform "U_B_SpecopsUniform_sgg";
player addVest "V_PlateCarrier2_rgr";
player addHeadgear "H_HelmetB_light_snakeskin";
player addGoggles "G_Balaclava_combat"; //Gasmaske

if(license_cop_gsg9) then {
	player addWeapon "arifle_Katiba_C_F"; //Primaer Katiba Carabine
	player selectWeapon "arifle_Katiba_C_F"; //Primaer Katiba Carabine
};

if(license_cop_gsg9tl) then {
	player addWeapon "arifle_MX_GL_Black_F"; //Primaer Katiba Carabine
	player selectWeapon "arifle_MX_GL_Black_F"; //Primaer Katiba Carabine
};

if ((getPlayerUID player) in ["76561197971317833"]) then {
	player addWeapon "arifle_Katiba_C_F";
	player selectWeapon "arifle_Katiba_C_F";
};

player addPrimaryWeaponItem "optic_MRCO";  //Mainvisier
player addPrimaryWeaponItem "muzzle_snds_H"; //Schalldaempfer

player addBackPack "B_Carryall_mcamo"; //Rucksack
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Toolkit", 1];
mybackpack addItemCargoGlobal ["Medikit", 1];
mybackpack addItemCargoGlobal ["optic_NVS", 1]; //Nachtsichtvisier
mybackpack addItemCargoGlobal ["optic_AMS_khk", 1]; //Nahkampfvisier
mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //Sekundärwaffen Munition
mybackpack addMagazineCargoGlobal ["30Rnd_65x39_caseless_green",7]; // Primaerwaffen Munition
mybackpack addItemCargoGlobal ["HandGrenade_Stone", 1];
mybackpack addItemCargoGlobal ["SmokeShellOrange", 2];
if(license_cop_gsg9tl) then {
	mybackpack addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 4];
	mybackpack addItemCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", 1];
};

life_inv_redgull = life_inv_redgull + 2;
life_inv_spaghetti = life_inv_spaghetti + 2;

player addWeapon "hgun_Rook40_snds_F";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addWeapon "Binocular";
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