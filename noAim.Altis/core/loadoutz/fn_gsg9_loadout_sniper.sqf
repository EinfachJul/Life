/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
#include "..\..\macros.hpp"
private ["_loadoutName","_action","_guncost"];
if(playerSide in [civilian,east,independent]) exitWith {hint"Sie gehoeren nicht zu der Bundespolizei";};
if (!license_cop_gsg9): {"Du bist kein GSG9 Beamter!"};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
_guncost = 125000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "GSG9-Sniper Ausruestung";
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

player addUniform "U_B_SpecopsUniform_sgg";
player addVest "V_PlateCarrier2_rgr";
player addHeadgear "H_HelmetB_camo";
player addGoggles "G_Balaclava_combat"; //Gasmaske

player addWeapon "srifle_DMR_02_camo_F"; //Primaer Mar-10
player selectWeapon "srifle_DMR_02_camo_F"; //Primaer Mar-10
player addPrimaryWeaponItem "bipod_03_F_oli"; //Standbein
player addPrimaryWeaponItem "muzzle_snds_338_green"; //Schalldaempfer
	
player addBackPack "B_TacticalPack_ocamo"; //Rucksack
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Medikit", 1];
mybackpack addItemCargoGlobal ["optic_NVS", 1]; //Nachtsichtvisier
mybackpack addItemCargoGlobal ["optic_AMS_khk", 1]; //
mybackpack addItemCargoGlobal ["optic_MRCO", 1]; //Nahkampfvisier
mybackpack addMagazineCargoGlobal ["30Rnd_9x21_Mag",2]; //Sekundärwaffen Munition
mybackpack addMagazineCargoGlobal ["10Rnd_338_Mag",7]; // Primaerwaffen Munition
mybackpack addItemCargoGlobal ["SmokeShellRed", 1];

if(license_cop_gsg9) then {
	player addPrimaryWeaponItem "optic_LRPS";  //Mainvisier
};
	
if(license_cop_gsg9tl) then {
	player addPrimaryWeaponItem "optic_tws";  //Mainvisier
};
	
life_inv_redgull = life_inv_redgull + 2;
life_inv_spaghetti = life_inv_spaghetti + 2;

//player addVest "V_TacVest_blk_POLICE";
//player addGoggles "G_Tactical_Clear";
player addWeapon "hgun_Rook40_snds_F";
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