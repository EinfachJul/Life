/*File:fn_underWaterLoadout.sqf Author:[midgetgrimm] */
private ["_loadoutName","_action","_guncost"];
if(playerSide in [west,east]) exitWith {hint"Sie besitzen nicht die Erlaubnis diese Uniform zu Kaufen.";};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
if(license_civ_dive)then {
_guncost = 125000;
if(life_zgazzy < _guncost) exitWith {hint localize "STR_NOTF_Upgrade_NoCash"};
_loadoutName = "Underwater Ausruestung 125 000";
_action = [
			format["Sind sie sich sicher das sie ihre vorhandene Ausruestung ersetzen moechten fuer die :%1: ? Es wird sie %2 € Kosten.",_loadoutName,[_guncost] call noaim_fnc_numberText],
			"Ausruestung kaufen",
			"Kaufen",
			"Nein"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
hint parseText format["Sie haben die %1 fuer <t color='#8cff9b'>%2 €</t>",_loadoutName,[_guncost] call noaim_fnc_numberText];
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

player addUniform "U_O_Wetsuit";
player addGoggles "G_Diving";
player addVest "V_RebreatherIR";
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
mybackpack = unitBackpack player;
mybackpack addItemCargoGlobal ["Toolkit", 1];
//you can also y-inv items too like this
reload player;
titleText [format["Nun ziehen Sie sich ihre %1 an.",_loadoutName],"PLAIN"];
[1] call SAX_fnc_updatePartial;
} else {
	hint"Nun gut, danke fuer nichts..";
};
} else {
	hint"Sie müssen eine Taucher lizenz Kaufen.";
};