/*
    Author: Bryan "Tonic" Boardwine
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == east || playerSide == civilian && {(call life_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
	["life_inv_apple", life_inv_apple],
	["life_inv_orange", life_inv_orange],
	["life_inv_hotdog", life_inv_hotdog],
	["life_inv_fries", life_inv_fries],
	["life_inv_burger1", life_inv_burger1],
	["life_inv_burger2", life_inv_burger2],
	["life_inv_burger3", life_inv_burger3],
	["life_inv_burger4", life_inv_burger4],
	["life_inv_burger5", life_inv_burger5],
	["life_inv_burger6", life_inv_burger6],
	["life_inv_pizza1", life_inv_pizza1],
	["life_inv_pizza2", life_inv_pizza2],
	["life_inv_pizza3", life_inv_pizza3],
	["life_inv_pizza4", life_inv_pizza4],
	["life_inv_sandwich", life_inv_sandwich],
	["life_inv_snack1", life_inv_snack1],
	["life_inv_snack2", life_inv_snack2],
	["life_inv_lasagne", life_inv_lasagne],
	["life_inv_spaghetti", life_inv_spaghetti],
	["life_inv_doener", life_inv_doener],
	["life_inv_gyros", life_inv_gyros],
	["life_inv_apfeltasche", life_inv_apfeltasche],
	["life_inv_icecream1", life_inv_icecream1],
	["life_inv_currywurst", life_inv_currywurst],
	["life_inv_salema", life_inv_salema],
	["life_inv_ornate", life_inv_ornate],
	["life_inv_mackerel", life_inv_mackerel],
	["life_inv_tuna", life_inv_tuna],
	["life_inv_mullet", life_inv_mullet],
	["life_inv_catshark", life_inv_catshark],
	["life_inv_fishingpoles", life_inv_fishingpoles],
	["life_inv_water", life_inv_water],
	["life_inv_donuts", life_inv_donuts],
	["life_inv_turtlesoup", life_inv_turtlesoup],
	["life_inv_coffee", life_inv_coffee],
	["life_inv_fuelF", life_inv_fuelF],
	["life_inv_fuelE", life_inv_fuelE],
	["life_inv_pickaxe", life_inv_pickaxe],
	["life_inv_handcoves", life_inv_handcoves],
	["life_inv_sieb", life_inv_sieb],
	["life_inv_saege", life_inv_saege],
	["life_inv_lockpick", life_inv_lockpick],
	["life_inv_shovel", life_inv_shovel],
	["life_inv_knife", life_inv_knife],
	["life_inv_painkillers", life_inv_painkillers],
	["life_inv_morphium", life_inv_morphium],
	["life_inv_redgull", life_inv_redgull],
	["life_inv_spikeStrip", life_inv_spikeStrip],
	["life_inv_defusekit", life_inv_defusekit],
	["life_inv_storagesmall", life_inv_storagesmall],
	["life_inv_storagebig", life_inv_storagebig],
	["life_inv_boxzlarge", life_inv_boxzlarge],
	["life_inv_boxzmedium", life_inv_boxzmedium],
	["life_inv_boxzsmall", life_inv_boxzsmall],
	["life_inv_tracker", life_inv_tracker],
	["life_inv_handcuffkey", life_inv_handcuffkey],
	["life_inv_zipties", life_inv_zipties],
	["life_inv_schranke", life_inv_schranke],
	["life_inv_barrierlight", life_inv_barrierlight],
	["life_inv_strahler", life_inv_strahler],
	["life_inv_bunker", life_inv_bunker],
	["life_inv_mauer", life_inv_mauer],
	["life_inv_roadcone", life_inv_roadcone],
	["life_inv_diske", life_inv_diske]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call life_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

life_gear = _return;