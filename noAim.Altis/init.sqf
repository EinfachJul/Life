X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo ="Altis Life RPG (noAimLife)";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\fastrope.sqf"; //Toss ropes\

if(isDedicated && isNil("life_market_prices")) then
{
	sleep 60;
	[] call TON_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

RscSpectator_allowFreeCam = false;
StartProgress = true;
introSpawn = nil;

[] execVM "scripts\fn_teargas.sqf";
[] execVM "scripts\fn_weather.sqf";

[
	15*60, // seconds to delete dead bodies (0 means don't delete) 
	10*60, // seconds to delete dead vehicles (0 means don't delete)
	0, // seconds to delete immobile vehicles (0 means don't delete)
	15*60, // seconds to delete dropped weapons (0 means don't delete)
	1*60, // seconds to deleted planted explosives (0 means don't delete)
	3*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "scripts\fn_cleanup.sqf";
[] execVM "scripts\radartrap50.sqf";
[] execVM "scripts\statusBar.sqf";

player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;
0 fadeRadio 0;

//onPlayerDisconnected { [_id, _name, _uid] call compile preProcessFileLineNumbers "core\functions\fn_onPlayerDisconnect.sqf" };
_veh4 = "Land_Atm_01_F" createVehicle position player;
_veh4 setVariable ["BIS_enableRandomization", false];

_deletor = ["deletor_1"];
{
	_pos = getMarkerPos _x;
	_nearObjects = nearestObjects [_pos,["Land_Offices_01_V1_F"],30]; //XAVA lower?
	{
		_x hideObject true;
	}forEach _nearObjects;
} forEach _deletor;

setTerrainGrid 30; //30.01.2016
setViewDistance 2000; //30.01.2016
setObjectViewDistance [1100,600]; //30.01.2016

//fuck you fog
[] spawn {
	while{true} do {
		sleep 10;
		200 setFog 0;
		200 setRain 0;
		sleep 590;
	};
};
[] spawn {
    while {true} do
	{
	/*
		{
			if ((agent _x isKindOf "Snake_random_F") || (agent _x isKindOf "Rabbit_F")) then { deleteVehicle agent _x; };
		}forEach agents;
		*/
		for "_i" from 1 to 3 do
		{
			if((fed_bank getVariable "Dome") getVariable (format["bis_disabled_Door_%1",_i]) == 1) then
			{
				(fed_bank getVariable "Dome") animate [format["Door_%1_rot",_i],0];
			};
		};
		
        sleep 5;
    };
};

[] execVM "scripts\safezone2.sqf";
[] execVM "scripts\nofirezone.sqf";

[] spawn {
	_fuelPos = [
		[3757.14,13477.9,-0.0540276],[3757.54,13485.9,-0.010498],[4001.12,12592.1,-0.0965538],
		[5023.26,14429.6,-0.0978947],[5019.68,14436.7,-0.0114822],[2849.07,9955.15,-0.0126724],
		[6198.83,15081.4,-0.0911655],[6798.15,15561.6,-0.0439568],[9205.75,12112.2,-0.0487232],
		[9021.82,15728.7,-0.0294342],[9023.75,15729,-0.0272522],[9025.78,15729.4,-0.0205612],
		[8481.69,18260.7,-0.0266876],[5768.99,20085.7,-0.0590668],[11831.6,14155.9,-0.0342894],
		[12024.7,15830,-0.0298138],[12026.6,15830.1,-0.0342979],[12028.4,15830,-0.0388737],
		[14173.2,16541.8,-0.0946102],[13692,18586,-0.130533],[13697.3,18585,-0.0881214],
		[13704.1,18583.7,-0.0889683],[14221.4,18302.5,-0.0697155],[15297.1,17565.9,-0.283808],
		[15781,17453.2,-0.285192],[16750.9,12513.1,-0.0525198],[16871.7,15476.6,0.0106945],
		[16875.2,15469.4,0.0377445],[17417.2,13936.7,-0.106361],[19961.3,11454.6,-0.0349236],
		[19965.1,11447.6,-0.0483704],[20784.8,16665.9,-0.0521202],[20789.6,16672.3,-0.0213318],
		[21230.4,7116.56,-0.060379],[23379.4,19799,-0.0544052],[25701.2,21372.6,-0.0774155]
	];

	{
		_fuelPump = nearestObject[_x,"Land_fs_feed_F"];
		_fuelPump setFuelCargo 0;
		if(!isDedicated) then {
			_fuelPump addAction["Fahrzeug Tanken (5000€)",noaim_fnc_refuelVehicle,"",0,false,false,"",'(count nearestObjects[_target,["Car","Truck","Air","Ship"],10]) > 0 && (_target distance player < 5)'];
		};
	} forEach _fuelPos;
};

if (hasinterface) then {
waitUntil {!isnull player};
//player enableStamina false;
//player addEventHandler ["Respawn", {player enableStamina false}];
};