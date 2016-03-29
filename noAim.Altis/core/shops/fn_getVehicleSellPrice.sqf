/*
    Author: H4SHK3KS (ofpectag:ZO1)
    Returns the right sell price for the vehicle

    Parameters:
    #0 Side: Side of Player
    #1 String: Type of vehicle
    #2 String: Vehicle classname

    Returns:
    Int: Sell price
*/
private["_side","_type","_class","_return","_exit","_searchArr"];

_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_class = [_this,2,"",[""]] call BIS_fnc_param;

if(_type == "" || _class == "") exitWith {}; // No, what a shit!

_exitNode = {
    _searchArr = []; _exit = true;
};

_return = 10000;
_exit = false;

switch (_side) do {
    case west: {
    	switch (_type) do {
    	    case "Air": {
    	    	_searchArr = ["cop_air","gsg9_air"];
    	    };

    	    case "Car": {
    	    	_searchArr = ["cop_car","gsg9_car"];
    	    };

    	    case "Ship": {
    	    	_searchArr = ["cop_ship"];
    	    };

            default {call _exitNode;};
    	};
    };

    case civilian: {
		switch (_type) do {
    	    case "Air": {
    	    	_searchArr = ["civ_air","civ_airXL","civ_airXD","donator_hq","reb_air","maf_air","clan_veh"];
    	    };

    	    case "Car": {
    	    	_searchArr = ["civ_car","taxi_car","donator_hq","kart_shop","civ_truck","reb_car","maf_car","clan_veh"];
    	    };

    	    case "Ship": {
    	    	_searchArr = ["civ_ship"];
    	    };

			case "ReammoBox_F": {
    	    	_searchArr = ["civ_logistika"];
    	    };
			
			case "StaticWeapon": {
    	    	_searchArr = ["civ_logistika"];
    	    };

            default {call _exitNode;};
    	};
	};

    case independent: {
		switch (_type) do {
			case "Air": {
				//_searchArr = [""];
			};

			case "Car": {
				//_searchArr = [""];
			};

            default {call _exitNode;};
        };
    };

	case east: {
        if((player getVariable["side","med"]) == "med") then {
            switch (_type) do {
                case "Air": {
                    _searchArr = ["fwehr_airs"];
                };

                case "Car": {
                    _searchArr = ["fwehr_car"];
                };

                case "Ship": {
                    _searchArr = ["fwehr_ship"];
                };

                default {call _exitNode;};
            };
        };
	};

    default {
        call _exitNode;
    };
};

if(_exit) exitWith {_return};

_finishExit = false;

{
	_tmpVehicleConfArr = [_x] call noaim_fnc_vehicleListCfg;
	{
		if ((_x select 0) == _class) exitWith {_return = round((_x select 1) * 0.4); _finishExit = true;};
	} forEach _tmpVehicleConfArr;
	if(_finishExit) exitWith {};
} forEach _searchArr;

_return;