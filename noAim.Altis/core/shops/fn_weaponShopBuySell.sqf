#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call noaim_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	life_znorak = life_znorak + _price;
	[_item,false] call noaim_fnc_handleItem;
	hint parseText format[localize "STR_Shop_Weapon_Sold",_itemInfo select 1,[_price] call noaim_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call noaim_fnc_weaponShopFilter; //Update the menu.
	//AX_LOG NEED TEST
	[format ["WEAPONSELL: %1 hat -> %2 fuer %3 verkauft.", player getVariable["realname",name player], _iteminfo select 1, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>€%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>€%2</t>",
				[(grpPlayer getVariable "gang_bank")] call noaim_fnc_numberText,
				[life_znorak] call noaim_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format[localize "STR_Shop_Weapon_BoughtGang",_itemInfo select 1,[_price] call noaim_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn noaim_fnc_handleItem;
			//AX_LOG *DEFEKT FIX
			[format ["WEAPONSELL: %1 hat -> %2 fuer %3 im Gangversteck gekauft.", player getVariable["realname",name player], _iteminfo select 1, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
			//_toLog = format["WEAPONSELL: %1 hat -> %2 fuer %3 im Gangversteck gekauft.",player getVariable["realname",name player],_iteminfo select 1,[_price] call noaim_fnc_numberText];
			//[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn noaim_fnc_DONE;
			[1,grpPlayer] remoteExec ["TON_fnc_updateGang",2];
		} else {
			if(_price > life_znorak) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
			hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call noaim_fnc_numberText];
			__SUB__(life_znorak,_price);
			[_item,true] spawn noaim_fnc_handleItem;
			//AX_LOG *DEFEKT FIX
			[format ["WEAPONSELL: %1 hat -> %2 fuer %3 gekauft.", player getVariable["realname",name player], _iteminfo select 1, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
			//[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn noaim_fnc_TRY;
			[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",2];
		};
	} else {
		if(_price > life_znorak) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
		hint parseText format[localize "STR_Shop_Weapon_BoughtItem",_itemInfo select 1,[_price] call noaim_fnc_numberText];
		life_znorak = life_znorak - _price;
		[_item,true] spawn noaim_fnc_handleItem;
		//AX_LOG *DEFEKT FIX
		[format ["WEAPONSELL: %1 hat -> %2 fuer %3 gekauft.", player getVariable["realname",name player], _iteminfo select 1, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
	};
};

[] call noaim_fnc_saveGear;
[0] call SAX_fnc_updatePartial;