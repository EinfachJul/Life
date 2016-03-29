/*
Author: Jacob "PapaBear" Tyler modified by ArYx for noAimLife
Opens gui and fills info
*/
private["_dialog","_Names","_Lvls","_Exp","_profText","_data","_profLevel","_profBesch","_profExp","_spacesTill"];
createDialog "life_prof_dialog";
disableSerialization;
_dialog = findDisplay 7730;
_Names = _dialog displayCtrl 7731;
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"alac"}; case east: {"med"};};
_spacesTill = 20;
{
	_numSpaces = 0;
	_profText = [_x select 0] call noaim_fnc_profType;
	_charCount = count _profText;
	_numSpaces = _spacesTill - _charCount;
	_data = missionNamespace getVariable (_x select 0);
	_profLevel = _data select 0;
	_profExp = _data select 1;
	_nextLevel = 0;
	_nextLevel = _profLevel * ( _profLevel - 1) * 500 ;
	_profBesch = [_x select 0] call noaim_fnc_profTypeDesc;
	/*_nextLevel2 =  6 * ( _profLevel^2 ) ;
	_nextLevel = _nextLevel - _nextLevel2;
	_nextLevel3 = 20 * _profLevel ;
	_nextLevel = _nextLevel + _nextLevel3 + 500 ;*/
	if(_nextLevel < 1) then {_nextLevel = 500;};
        if(_x select 1 == _flag) then {
			_Names lbAdd format["%1",_profText];
			_Names lbAdd format["%1/%2 XP",_profExp, _nextLevel];
			_Names lbAdd format["%1 Lvl",_profLevel];
			_Names lbAdd format["%1",_profBesch];
			_Names lbSetData [(lbSize _Names)-1,str(_profText)];
        };
} foreach life_prof;