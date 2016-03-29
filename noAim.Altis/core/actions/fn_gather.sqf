/*
	Author: Bryan "Tonic" Boardwine
	Main functionality for gathering. - rewritten to work with a more user friendly configuration, as well as allowing easily to configure necessary items like pickaxe
*/
private["_gather","_itemWeight","_diff","_itemName","_batchSize","_resourceZones","_resourceCfg", "_zone", "_x", "_valRequiredItem", "_requiredItem", "_zoneSize", "_varItem", "_valItem", "_resourcetypeof"];
//Action is in use, exit before we do anything to prevent spamming. 
if (life_action_gather) exitWith {}; 
//we have a heavy loop ahead so we want to prevent people from spamming
life_action_gather = true;
//check if we are in the resource zone for any of the resources
_zone = "";
{
	_gather = _x;
	_resourceCfg = [_gather] call noaim_fnc_resourceCfg;
	_resourceZones = _resourceCfg select 0;
	// if there are no zones defined we are done here
	if (count _resourceZones == 0) exitWith {};
	_zoneSize = _resourceCfg select 1;
	_batchSize = _resourceCfg select 2;
	_requiredItem = _resourceCfg select 3;
	_resourcetypeof = _resourceCfg select 4;
	{
		if((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
	} forEach _resourceZones;
	//if we found a zone we are done here as well
	if(_zone != "") exitWith {};
} forEach resource_list;

if(_zone == "") exitWith {
	//hint localize "STR_NOTF_notNearResource";
	life_action_gather = false;
};

if(_requiredItem == "") then {
	_valItem = 1;
}
else {
	_varItem = [_requiredItem,0] call noaim_fnc_varHandle;
	_valItem = missionNamespace getVariable _varItem;
};
if (_valItem < 1) exitWith {
	/*titleText["Eine Spitzhacke wird benötigt.","PLAIN"];*/
	switch (_resourcetypeof) do
	{
		case 2: {titleText["Eine Spitzhacke wird benoetigt.","PLAIN"];};
		case 3: {titleText["Eine MotorSaege wird benoetigt.","PLAIN"];};
		case 4: {titleText["Eine Schaufel wird benoetigt.","PLAIN"];};
		case 5: {titleText["Ein Sieb wird benoetigt.","PLAIN"];};
		case 6: {titleText["Ein paar Handschuhe wird benoetigt.","PLAIN"];};
		default {};
	};
	life_action_gather = false;
};

//gather check??
if(vehicle player != player) exitWith {
	hint localize "STR_NOTF_VehCheck";
	life_action_gather = false;
};

_diff = [_gather,_batchSize,life_carryWeight,life_maxWeight] call noaim_fnc_calWeightDiff;
if(_diff == 0) exitWith {
	hint localize "STR_NOTF_InvFull";
	life_action_gather = false;
};

switch (_resourcetypeof) do
{
	case 1: {player say3D "harvest";};
	case 2: {player say3D "mining";};
	case 3: {player say3D "saw";};
	case 4: {player say3D "mining";};
	case 5: {player say3D "shakepowder";};
	case 6: {player say3D "harvest";};
	default {};
};

_time = 0;
_profName = [_gather] call noaim_fnc_profType;
 
if( _profName != "" ) then 
{
	_data = missionNamespace getVariable (_profName);
	_time = ( 3 - (0.25 * (_data select 0)));
};

//run gather animation 3 times (0,1,2)
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call noaim_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call noaim_fnc_varHandle)] call noaim_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];

	if( _profName != "" ) then 
	{
		[_profName,25] call noaim_fnc_addExp;
	};
};

life_action_gather = false;