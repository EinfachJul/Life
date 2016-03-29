/*
	Author: Bryan "Tonic" Boardwine
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call noaim_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_znorak) exitWith {hint localize "STR_ATM_NotEnoughCash"};

life_znorak = life_znorak - _value;
life_zgazzy = life_zgazzy + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call noaim_fnc_numberText];
diag_log format ["%1 hat %2 auf sein Konto eingezahlt",player getVariable["realname",name player],[_value] call noaim_fnc_numberText];
[] call noaim_fnc_atmMenu;

if (isNil "life_bank_transfer") then {life_bank_transfer = false;};
if !(life_bank_transfer) then 
{
	life_bank_transfer = true;
	[] spawn
	{
		sleep 5;
		[6] call SAX_fnc_updatePartial;
		life_bank_transfer = false;
	};
};