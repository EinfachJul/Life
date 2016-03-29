#include "..\..\macros.hpp"

private ["_cashType","_mathType","_amount"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;
_cashType = [_this,1,0,[0]] call BIS_fnc_param; //0 = onhand | 1 = atm
_mathType = [_this,2,0,[0]] call BIS_fnc_param; //0 = add | 1 = subtract
if(_amount == 0) exitWith {}; //what are you trying to do?
if!(_cashType in [0,1]) exitWith {}; //what are you trying to do?
if!(_mathType in [0,1]) exitWith {}; //what are you trying to do?

if(life_znorak != coins_cache OR life_zgazzy != atmcoins_cache) then
{
	//[[player getVariable["realname",profileName],(atmcoins_cache - life_zgazzy),(coins_cache - life_znorak)],true] spawn noaim_fnc_LAST;
	[player getVariable["realname",profileName]] remoteExec [(atmcoins_cache - life_zgazzy),(coins_cache - life_znorak),-2];
};

switch(_cashType) do
{
	case 0:
	{
		switch(_mathType) do
		{
			case 0:{life_znorak = life_znorak + _amount;};
			case 1:{life_znorak = life_znorak - _amount;};
		};
	};
	case 1:
	{
		switch(_mathType) do
		{
			case 0:{life_zgazzy = life_zgazzy + _amount;};
			case 1:{life_zgazzy = life_zgazzy - _amount;};
		};
	};
};
coins_cache = life_znorak;
atmcoins_cache = life_zgazzy;