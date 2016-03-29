#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice","_cops"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
if((life_nottoofast != 0) && ((time - life_nottoofast) < 2)) exitWith {hint "CLICK ABUSE";};
life_nottoofast = time;
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call noaim_fnc_varHandle;


////Marktsystem Anfang////
_marketprice = [_type] call noaim_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call noaim_fnc_vartostr;
if(([false,_type,_amount] call noaim_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call noaim_fnc_numberText];
	life_znorak = life_znorak + _price;
	
	if(_marketprice != -1) then 
	{ 
        [_type, _amount] spawn
        {
            sleep 60;
            [_this select 0,_this select 1] call noaim_fnc_marketSell;
           // [[_this select 0,_this select 1],"DB_fnc_marketInsertTimes",false,false] call noaim_fnc_LAST; // Sends the shortname and amount of the sold item to the server
			[_this select 0,_this select 1] remoteExec ["DB_fnc_marketInsertTimes",2];
        };
	};
	[] call noaim_fnc_virt_update;
	[format ["ITEMSELL: %1 hat %2 %3 fuer %4 Euro verkauft.", player getVariable["realname",name player], _amount, _name, _price],"ax_log",false,false] call noaim_fnc_Loggy;
};

if((life_spam != 0) && ((time - life_spam) < 0.3)) then {
	titleText ["AUTOCLICKER", "BLACK OUT", 3];
	//[[0,"STR_ANOTF_autoclicker",true,[profileName]],"noaim_fnc_broadcast",true,false] call noaim_fnc_TRY;
	[0,"STR_ANOTF_autoclicker",true,[profileName]] remoteExecCall ["noaim_fnc_broadcast",-2];
	sleep 2;
	//[99] call SAX_fnc_updatePartial;
	["KICK",false,true] call BIS_fnc_endMission;
};
/*hint "Ich kann momentan keine Drogen annehmen, vielleicht wenn mehr Polizei gefahr ist!*/
//if((life_shop_type == "heroin") && {side _x == west} count playableUnits < 1) exitWith { hint "Ich biete den halben Preis, da es momentan nicht wirklich Schwer ist zu Farmen, ohne Polizei!"; _marketprice = _marketprice * 0.50; };

//NDJ 28May14 - Make other heroin dealers pay less or more!
//if(life_shop_type == "heroin2") then {_price = _price * 0.25;}; //quarter of normal price!
//if(life_shop_type == "heroin3") then {_price = _price * 1.50;}; //1.5 times normal price!

//if((life_shop_type == "heroin") && {side _x == west} count playableUnits < 2) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
//EDIT NOCH
//if((life_shop_type == "heroin") && {side _x == west} count playableUnits < 0) exitWith {_price = _price * 0.50;};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
	else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
		/*
		_cops = [];
		{
			if (side _x == west) then { _cops pushBack _x};
		} forEach playableUnits;
		
		if(count _cops < 1) exitWith { hint "Ich kann momentan keine Drogen annehmen, vielleicht wenn mehr Polizei gefahr ist!" };*/
};

//Call short view here
[_shop_data select 1] spawn noaim_fnc_marketShortView;
disableUserInput false;
life_spam = time;
//[] call noaim_fnc_status_bar;
[0] call SAX_fnc_updatePartial;
//[3] call SAX_fnc_updatePartial;