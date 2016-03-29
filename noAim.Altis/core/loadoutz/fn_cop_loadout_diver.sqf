/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
#include "..\..\macros.hpp"
private ["_loadoutName","_action","_guncost"];
if(playerSide in [civilian,east]) exitWith {hint "Sie gehoeren nicht zur Polizei";};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
_guncost = 85000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "Polizei-Taucher Ausruestung";
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
		player addUniform "U_B_Wetsuit";
		player addGoggles "G_Diving";
		player addVest "V_RebreatherB";
		player addMagazine "20Rnd_556x45_UW_mag";
		player addMagazine "20Rnd_556x45_UW_mag";
		player addMagazine "20Rnd_556x45_UW_mag";
		player addMagazine "20Rnd_556x45_UW_mag";
		player addMagazine "20Rnd_556x45_UW_mag";
		player addWeapon "arifle_SDAR_F";
		player selectWeapon "arifle_SDAR_F";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemRadio";
		player assignItem "ItemRadio"; 
		player addItem "NVGoggles_OPFOR";
		player assignItem "NVGoggles_OPFOR";
		player addBackPack "B_FieldPack_blk";
	};
	mybackpack = unitBackpack player;
	mybackpack addItemCargoGlobal ["Toolkit", 1];

reload player;
titleText [format["Enjoy your %1",_loadoutName],"PLAIN"];
[1] call SAX_fnc_updatePartial;
} else {
			hint"Nun gut, danke fuer nichts..";
};