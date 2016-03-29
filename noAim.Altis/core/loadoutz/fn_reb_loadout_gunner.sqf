/*File:fn_armyassault.sqf Author:[midgetgrimm] */
private ["_loadoutName","_action","_guncost"];
if(playerSide in [west,east]) exitWith {hint"Sie besitzen nicht die Erlaubnis diese Uniform zu Kaufen.";};
if (vehicle player != player) exitWith { hint "Steigen Sie bitte aus ihrem Fahrzeug aus!" };
if(!alive player) exitWith {hint"Als totet koennen sie nichts kaufen.";};
_guncost = 850000;
if(life_zgazzy < _guncost) exitWith {hint format[localize "STR_NOTF_LO_NoCash",_guncost];};
_loadoutName = "Mx SW Ausruestung";
_action = [
			format["Sind sie sich sicher das sie ihre vorhandene Ausruestung ersetzen moechten fuer die :%1: ? Es wird sie %2 € Kosten.",_loadoutName,[_guncost] call noaim_fnc_numberText],
			"Ausruestung kaufen",
			"Kaufen",
			"Nein"
		] call BIS_fnc_guiMessage;
if(_action) then {
			
	if(license_civ_rebel) then {
		hint parseText format["Sie haben die %1 fuer <t color='#8cff9b'>%2 €</t>",_loadoutName,[_guncost] call noaim_fnc_numberText];
		life_zgazzy = life_zgazzy - _guncost;
					
		titleText ["Das Kostet sie 850,000 €, direkt von ihrem Bankkonto.","PLAIN"];

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

		_clothings = ["U_OG_leader","U_OG_Guerilla3_2","U_OG_Guerilla2_3","U_OG_Guerilla2_1","U_OG_Guerilla1_1","U_B_survival_uniform","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F"];
		player addUniform (_clothings select (floor(random (count _clothings))));

		_headgear = ["H_Cap_tan","H_MilCap_mcamo","H_MilCap_dgtl","H_Bandanna_khk","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_ShemagOpen_khk","H_Watchcap_camo","H_Hat_camo"];
		player addHeadgear (_headgear select (floor(random (count _headgear))));

		_vest = ["V_BandollierB_oli","V_BandollierB_cbr","V_Chestrig_khk","V_Chestrig_rgr","V_TacVest_khk","V_TacVest_oli","V_TacVest_camo","V_HarnessO_brn","V_PlateCarrierIA1_dgtl","V_I_G_resistanceLeader_F"];
		player addVest (_vest select (floor(random (count _vest))));

		_backpacks = ["B_Kitbag_mcamo","B_Carryall_oli"];
		player addBackpack (_backpacks select (floor(random (count _backpacks))));

		_nvgoggles = ["NVGoggles_INDEP","NVGoggles"];
		_nv = (_nvgoggles select (floor(random (count _nvgoggles))));
		player addItem _nv;
		player assignItem _nv;

		_weapon = ["arifle_MX_SW_Hamr_pointer_F","arifle_MX_SW_Black_Hamr_pointer_F"];
		_wep = (_weapon select (floor(random (count _weapon))));
		player addWeapon _wep;
		player selectWeapon _wep;

		//Add standard equipment and items
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemRadio";
		player assignItem "ItemRadio";
		//Attachments
		//ammo
		player addItemToUniform "100Rnd_65x39_caseless_mag";
		player addItemToUniform "100Rnd_65x39_caseless_mag";
		player addItemToVest "100Rnd_65x39_caseless_mag";
		player addItemToVest "100Rnd_65x39_caseless_mag";
		player addItemToVest "100Rnd_65x39_caseless_mag";
		player addItemToBackpack "100Rnd_65x39_caseless_mag";
		player addItemToBackpack "100Rnd_65x39_caseless_mag";
		player addItemToBackpack "100Rnd_65x39_caseless_mag";
		player addItemToBackpack "FirstAidKit";

		reload player;

		titleText [format["Nun ziehen Sie sich ihre %1 an.",_loadoutName],"PLAIN"];

	} else {
		hint"Sie besitzen keine Rebellen Lizenz";
	};
} else {
			hint"Nun gut, danke fuer nichts..";
};