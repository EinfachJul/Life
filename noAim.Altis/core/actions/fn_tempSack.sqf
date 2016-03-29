/*
	Author: Dirk Pitt edited by arYx
*/
private ["_mode"];
_mode = [_this,0,0,[-1]] call BIS_fnc_param;

if(_mode == 0) then {
	player setVariable["tempSack",true,true];
	player removeItem "ItemMap";
	player unassignItem "ItemMap";
	player removeItem "ItemGPS";
	player unassignItem "ItemGPS";
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0.2,0.2,0.2,0], [0.2,0.2,0.2,0], [0.08,0.08,0.08,0]];
	"colorCorrections" ppEffectCommit 1;

	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [0.10,0.10,true];
	"chromAberration" ppEffectCommit 1;

	"DynamicBlur" ppEffectEnable true;
	"DynamicBlur" ppEffectAdjust[5];
	"DynamicBlur" ppEffectCommit 1;
}else{
	player setVariable["tempSack",false,true];
	"colorCorrections" ppEffectEnable false;
	"chromAberration" ppEffectEnable false;
	"DynamicBlur" ppEffectEnable false;
	player addItem "ItemMap";
	player assignItem "ItemMap";
};