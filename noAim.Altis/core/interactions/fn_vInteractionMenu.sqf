#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_avehicles"];

_avehicles = [
	"C_Kart_01_Blu_F",
	"C_Kart_01_Red_F",
	"C_Kart_01_Fuel_F",
	"C_Kart_01_Vrana_F",
	"B_Heli_Transport_03_unarmed_F",
	"O_Heli_Transport_04_F",
	"B_Heli_Transport_03_F",
	"O_Heli_Transport_04_ammo_F",
	"O_Heli_Transport_04_bench_F",
	"O_Heli_Transport_04_box_F",
	"O_Heli_Transport_04_covered_F",
	"O_Heli_Transport_04_fuel_F",
	"O_Heli_Transport_04_medevac_F",
	"O_Heli_Transport_04_repair_F",
	"C_Heli_Light_01_civil_F"
];

if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "Cargo_base_F") OR (_curTarget isKindOf "ReammoBox_F") OR (_curTarget isKindOf "StaticWeapon") OR (_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_repairTruck;";
if("ToolKit" in (items player)  && (getDammage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
 
if(playerSide == west) then {
 
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_searchVehAction;";
	_Btn2 ctrlShow true;
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_vehInvSearch;";
	_Btn3 ctrlShow true;
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
	_Btn4 ctrlShow true;
	
	if(_curTarget isKindOf "Ship") then
	{
		_Btn5 ctrlSetText localize "STR_pAct_Anschieben";
		//_Btn5_Icon ctrlSetText "icons\interaction\boot.paa";
		_Btn5 buttonSetAction "[] spawn noaim_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget}) then { _Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false};
	}
	else
	{
		_Btn5 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn5 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.6]; closeDialog 0;";
		if((crew _curTarget) isEqualTo [] && {!canMove _curTarget}) then { _Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false;};
	};
	_Btn5 ctrlShow true;
	
	_Btn6 ctrlSetText localize "STR_vInAct_Impound";
	_Btn6 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_impoundAction;";
	_Btn6 ctrlShow true;
	
	//_Btn7_Icon ctrlSetText "icons\interaction\fahrer.paa";
	//_Btn7 ctrlSetText localize "STR_vInAct_GetInKart";
	//_Btn7 buttonSetAction "[life_vInact_curTarget,""driver""] call noaim_fnc_cocheIntro; closeDialog 0;";
	//_Btn7 ctrlShow true;
	//_Btn7_Icon ctrlShow true;
	_Btn7 ctrlSetText localize "STR_vInAct_GetInKart";
	_Btn7 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;life_action_inUse = false;";
	if((typeOf (_curTarget) in _avehicles) && (isNull (driver _curTarget)) && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn7 ctrlEnable true;} else {_Btn7 ctrlEnable false};


	_Btn8 ctrlSetText localize "STR_pAct_EnterAsPasseng";
	_Btn8 buttonSetAction "[life_vInact_curTarget,""passenger""] call noaim_fnc_cocheIntro; closeDialog 0;";
	_Btn8 ctrlShow true;
	
	_Btn9 ctrlSetText localize "STR_vInAct_Impound_Perm";
	_Btn9 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_impoundPermAction;";
	_Btn9 ctrlShow true;
	
	if(__GETC__(zak_copstufe) > 2) then
	{
		_Btn10 ctrlSetText localize "STR_vInAct_Crush";
		_Btn10 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_copCrush;";
		_Btn10 ctrlShow true;
	} else {
		_Btn10 ctrlShow false;
	};
	
	if(typeOf _curTarget == "O_Truck_03_device_F") then
	{
		_Btn11 ctrlSetText localize "STR_pAct_StartGeraet";
		_Btn11 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_deviceMine; closeDialog 0;";
		_Btn11 ctrlShow true;
		if(isNil {(_curTarget getVariable "mining")} OR local _curTarget && {_curTarget in zaki_vehicles}) then
		{
			_Btn11 ctrlEnable true;
		}
		else
		{
			_Btn11 ctrlEnable false;
		};
	};
};
 
if(playerSide == civilian) then {

	if(_curTarget isKindOf "Ship") then
	{
		_Btn2 ctrlSetText localize "STR_pAct_Anschieben";
		//_Btn5_Icon ctrlSetText "icons\interaction\boot.paa";
		_Btn2 buttonSetAction "[] spawn noaim_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	}
	else
	{
		_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if((crew _curTarget) isEqualTo [] && {!canMove _curTarget}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};
	};
	_Btn2 ctrlShow true;

	_Btn3 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn3 buttonSetAction "if(!isNil 'allowedToRefresh' && servertime - allowedToRefresh < 5) exitWith {hint localize 'STR_NOTF_PullOut_Update';}; if(isNil 'allowedToRefresh') then {allowedToRefresh = servertime;}; allowedToRefresh = servertime; [life_vInact_curTarget] spawn noaim_fnc_pulloutAction;";
	if((crew _curTarget) isEqualTo []) then {_Btn3 ctrlEnable false;};
	_Btn3 ctrlShow true;

	_Btn4 ctrlSetText localize "STR_vInAct_DeviceMine";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_deviceMine";
	if(typeOf _curTarget == "O_Truck_03_device_F" && isNil {(_curTarget getVariable "mining")} && local _curTarget && {_curTarget in zaki_vehicles}) then {	_Btn4 ctrlEnable true;	} else {_Btn4 ctrlEnable false;	};
	_Btn4 ctrlShow true;
	
	/*_Btn5 ctrlSetText localize "STR_vInAct_GetInKart";
	_Btn5 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;life_action_inUse = false;";
	if((typeOf (_curTarget) in _avehicles) && (isNull (driver _curTarget)) && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false};
	*/
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
	_Btn11 ctrlShow false;
};
 
if(playerSide == independent) then {
 	
	_Btn2 ctrlSetText localize "STR_vInAct_AlacImpound";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_impoundAction; closeDialog 0;";
	_Btn2 ctrlShow true;
	
	if(_curTarget isKindOf "Ship") then
	{
		_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn3 buttonSetAction "[] spawn noaim_fnc_pushObject; closeDialog 0;";
		if(local _curTarget && {(crew _curTarget) isEqualTo []} ) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
	}
	else
	{
		_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if((crew _curTarget) isEqualTo [] && {!canMove _curTarget}) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false;};
	};
	_Btn3 ctrlShow true;
	
	_Btn4 ctrlSetText localize "STR_vInAct_Registration";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_searchVehAction;";
	_Btn4 ctrlShow true;
	
	_Btn5 ctrlSetText localize "STR_pAct_EnterAsDriver";
	_Btn5 buttonSetAction "[life_vInact_curTarget,""driver""] call noaim_fnc_cocheIntro; closeDialog 0;";
	_Btn5 ctrlShow true;

	_Btn6 ctrlSetText localize "STR_pAct_EnterAsPasseng";
	_Btn6 buttonSetAction "[life_vInact_curTarget,""passenger""] call noaim_fnc_cocheIntro; closeDialog 0;";
	_Btn6 ctrlShow true;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	
	_Btn9 ctrlSetText localize "STR_vInAct_GetInKart";
	_Btn9 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;life_action_inUse = false;";
	if((typeOf (_curTarget) in _avehicles) && (isNull (driver _curTarget)) && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn9 ctrlEnable true;} else {_Btn9 ctrlEnable false};
	
	_Btn10 ctrlShow false;
};
 
if(playerSide == east) then {

	_Btn2 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn2 buttonSetAction "if(!isNil 'allowedToRefresh' && servertime - allowedToRefresh < 5) exitWith {hint localize 'STR_NOTF_PullOut_Update';}; if(isNil 'allowedToRefresh') then {allowedToRefresh = servertime;}; allowedToRefresh = servertime; [life_vInact_curTarget] spawn noaim_fnc_pulloutAction;";
	if((crew _curTarget) isEqualTo []) then {_Btn2 ctrlEnable false;};
	_Btn2 ctrlShow true;
	
	if(_curTarget isKindOf "Ship") then
	{
		_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn3 buttonSetAction "[] spawn noaim_fnc_pushObject; closeDialog 0;";
		if(local _curTarget && {(crew _curTarget) isEqualTo []} ) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
	}
	else
	{
		_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn3 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		if((crew _curTarget) isEqualTo [] && {!canMove _curTarget}) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false;};
	};
	_Btn3 ctrlShow true;
	
	_Btn4 ctrlSetText localize "STR_pAct_EnterAsDriver";
	_Btn4 buttonSetAction "[life_vInact_curTarget,""driver""] call noaim_fnc_cocheIntro; closeDialog 0;";
	_Btn4 ctrlShow true;

	_Btn5 ctrlSetText localize "STR_pAct_EnterAsPasseng";	
	_Btn5 buttonSetAction "[life_vInact_curTarget,""passenger""] call noaim_fnc_cocheIntro; closeDialog 0;";	
	_Btn5 ctrlShow true;

	_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
	_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
	if((typeOf (_curTarget) in _avehicles ) && (isNull (driver _curTarget)) && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	_Btn6 ctrlShow true;
	
	_Btn7 ctrlSetText localize "STR_vInAct_Impound";
	_Btn7 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_impoundAction;";
	_Btn7 ctrlShow true;
	
	_Btn8 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn8 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_pulloutAction;";
	if(count crew _curTarget == 0) then {_Btn8 ctrlEnable false;};
	_Btn8 ctrlShow true;
	
	_Btn9 ctrlSetText "Kofferraum Reparieren";
	//_Btn8 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_fixcar; closeDialog 0;";
	_Btn9 buttonSetAction "life_vInact_curTarget setVariable [""trunk_in_use"",false,true];";
	//cursorTarget setVariable["trunk_in_use",false,true];
	_Btn9 ctrlShow true;
	
	_Btn10 ctrlSetText localize "STR_vInAct_Registration";
	_Btn10 buttonSetAction "[life_vInact_curTarget] spawn noaim_fnc_searchVehAction;";
	_Btn10 ctrlShow true;
};