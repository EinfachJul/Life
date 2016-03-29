#include "..\macros.hpp"
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];

0 cutText["Erstelle neuen Altisbewohner ...bitte warten...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
//diag_log "--------------------------------- Starting noAim Life Client Init ----------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
[] call noaim_fnc_setupEVH;
[] call noaim_fnc_setupActions;

//--- Custom GUI menu colours
profileNamespace setVariable [ "GUI_BCG_RGB_R", 0.0 ]; //85
profileNamespace setVariable [ "GUI_BCG_RGB_G", 0.14 ]; //05
profileNamespace setVariable [ "GUI_BCG_RGB_B", 0.33 ]; //05
profileNamespace setVariable [ "GUI_BCG_RGB_A", 1.0 ];
saveProfileNamespace;

if (playerSide == east) then {
	switch(true) do {
	case ([str(player),"med"] call KRON_StrInStr): {player setVariable["side","med", true]};
	default {player setVariable["side","",true]};
	};
};

if (playerSide == independent) then {
	switch(true) do {
	case ([str(player),"alac"] call KRON_StrInStr): {player setVariable["side","alac", true]};
	default {player setVariable["side","",true]};
	};
};

waitUntil {(!isNil {TON_fnc_clientGangLeader})};

0 cutText ["...Du wirst gerade mit dem Server Synchronisiert, dies kann einen Moment dauern...","BLACK FADED"];
0 cutFadeOut 99999999;

waitUntil{!isNil "life_server_isReady"};

0 cutText ["...Du wirst gerade mit dem Server Synchronisiert, Housing wird geladen... 25%","BLACK FADED"];
0 cutFadeOut 99999999;
life_init_objects_skript = [] spawn noaim_fnc_initObjects;
waitUntil {scriptDone life_init_objects_skript};

0 cutText ["...Du wirst gerade mit dem Server synchronisiert, Marktplatz wird geladen ....50%","BLACK FADED"];
0 cutFadeOut 99999999;
_handle1 = [] execVM "scripts\delete.sqf";
waitUntil {scriptDone _handle1};

waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith {
	999999 cutText ["Die Datenbankinformationen wurden von ihrem Client nicht geladen, bitte informieren sie einen Administrator.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SAX_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Herzlich Willkommen auf dem noAimLife.de Altis Life Server! Viel Spaß!","BLACK FADED"];
0 cutFadeOut 9999999;

[] spawn noaim_fnc_escInterupt;

switch (playerSide) do
{	
	case west:
	{
		_handle = [] spawn noaim_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		_handle = [] spawn noaim_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case east:
	{
		_handle = [] spawn noaim_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
		
	case independent:
	{
		_handle = [] spawn noaim_fnc_initAlac;
		waitUntil {scriptDone _handle};
	};
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];//sets variables to false on start
player setVariable["hasOrgan",false,true];
diag_log "Einstellungen Initiert";
[] execFSM "core\fsm\naclient.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call noaim_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format[" End of noAim Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn noaim_fnc_TRY;
[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",2];
0 cutText ["","BLACK IN"];
[] call noaim_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","noaim_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","noaim_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call noaim_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

if(license_civ_logistika OR playerSide in [west,east]) then
{
   _igiload = execVM "IgiLoad\IgiLoadInit.sqf";
};

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));
//[[getPlayerUID player,player getVariable["realname",name player]],"noaim_fnc_wantedProfUpdate",false,false] spawn noaim_fnc_TRY;
[getPlayerUID player,player getVariable["realname",name player]] remoteExecCall ["noaim_fnc_wantedProfUpdate",2];
noaim_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_zgazzy = life_zgazzy + _price;
";

[] execVM "core\init_survival.sqf";
[] execVM "core\fn_addKey.sqf";
[] execVM "scripts\if.sqf";
[] execVM "core\extras\fn_welcomeMessage.sqf";
[] spawn NA_fnc_vehicleManagerInit;

__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

if(__GETC__(life_donatorlevel) > 0) then
{
	life_paycheck = life_paycheck + 2200;
};
__CONST__(life_paycheck,life_paycheck);

[] spawn noaim_fnc_fatigueReset;

[] spawn { // AUTOSave
    while {true} do {
        sleep 160;
		[] call noaim_fnc_updateClothing;
    };
};

[] spawn { // AUTOSave
    while {true} do {
       // sleep 600;
		sleep (1280 + random 60); //10 MIN + UPTO 10 MIN EXTRA
        [] call SAX_fnc_updateRequest;
		hint localize "STR_NOTF_AutoSave";
    };
};

enableRadio false;
0 fadeRadio 0;

player setVariable [ "BIS_noCoreConversations", true ];
setTerrainGrid 45; // Reduce Grass for higher FPS