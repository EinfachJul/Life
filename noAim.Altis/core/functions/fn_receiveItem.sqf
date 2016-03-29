/*
	Author: Bryan "Tonic" Boardwine
	Receive an item from a player.
*/
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if(_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then
{
	if(([true,_item,_diff] call noaim_fnc_handleInv)) then
	{
		hint format[localize "STR_MISC_TooMuch_3",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)];
		//[[_from,_item,str((parseNumber _val) - _diff),_unit],"noaim_fnc_giveDiff",_from,false] spawn noaim_fnc_DONE;
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExec ["noaim_fnc_giveDiff",_from];
	}
	else
	{
		[_from,_item,_val,_unit,false] remoteExec ["noaim_fnc_giveDiff",_from];
		//[[_from,_item,_val,_unit,false],"noaim_fnc_giveDiff",_from,false] spawn noaim_fnc_DONE;
	};
}
else
{
	if(([true,_item,(parseNumber _val)] call noaim_fnc_handleInv)) then
	{
		private["_type"];
		_type = [_item,0] call noaim_fnc_varHandle;
		_type = [_type] call noaim_fnc_varToStr;
		hint format[localize "STR_NOTF_GivenItem",_from getVariable["realname",name _from],_val,_type];
	}
	else
	{
		//[[_from,_item,_val,_unit,false],"noaim_fnc_giveDiff",_from,false] spawn noaim_fnc_TRY;
		[_from,_item,_val,_unit,false] remoteExec ["noaim_fnc_giveDiff",_from];
	};
};