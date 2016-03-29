#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];

if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
_marketprice = [_type] call noaim_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 2)) exitWith {hint "CLICK ABUSE";};
life_nottoofast = time;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_znorak && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = [([_type,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr;

if(([true,_type,_amount] call noaim_fnc_handleInv)) then
{
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
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call noaim_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[1,grpPlayer] remoteExec ["TON_fnc_updateGang",2];
			//[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn noaim_fnc_DONE;
		} else {
			if((_price * _amount) > life_znorak) exitWith {[false,_type,_amount] call noaim_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call noaim_fnc_numberText];
			__SUB__(life_znorak,_price * _amount);
			//AX_LOG *DEFEKT FIX
			[format ["ITEMBUY: %1 hat %2x %3 fuer %4€ gekauft.", name player, _amount, _name, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
		};
	} else {
		if((_price * _amount) > life_znorak) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call noaim_fnc_handleInv;};
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call noaim_fnc_numberText];
		__SUB__(life_znorak,(_price * _amount));
		//AX_LOG *DEFEKT FIX
		[format ["ITEMBUY: %1 hat %2x %3 fuer %4€ gekauft.", name player, _amount, _name, [_price] call noaim_fnc_numberText],"ax_log",false,false] call noaim_fnc_Loggy;
	};
	
	if(_marketprice != -1) then
	{
        [_type, _amount] spawn
        {
			sleep 120;
			[_this select 0,_this select 1] call noaim_fnc_marketBuy;
		}
    };
	[] call noaim_fnc_virt_update;
	//[] call noaim_fnc_status_bar;
};
//[] call noaim_fnc_virt_update;
disableUserInput false;
//[8] call SAX_fnc_updatePartial;

//ANTISPAM
[0] call SAX_fnc_updatePartial;
//[3] call SAX_fnc_updatePartial;