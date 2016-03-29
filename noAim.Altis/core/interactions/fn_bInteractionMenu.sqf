/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
_wasOpen = false;
if (dialog) then {closeDialog 0;_wasOpen = true;};
if(!dialog && !_wasOpen) then
{
	createDialog "pInteraction_Menu";
};
disableSerialization;

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

_display displayAddEventHandler ["KeyDown","if((_this select 1) == 41) then {closeDialog 0;}; false;"];

if (playerSide == civilian) then
{
	_Btn1 ctrlEnable false;

	if((surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship")) then
	{
		_Btn1 ctrlSetText localize "STR_pInAct_NetzAuswerf";
		_Btn1 buttonSetAction "closeDialog 0; [] spawn noaim_fnc_dropFishingNet; ";
		if ((life_carryWeight+2) < life_maxWeight && speed (vehicle player) < 4 && speed (vehicle player) > -4 && !life_net_dropped ) then { _Btn2 ctrlEnable true; };
	}
	else
	{
		_Btn1 ctrlSetText localize "STR_pInAct_SAAbbauen";
		_Btn1 buttonSetAction "closeDialog 0; [] spawn noaim_fnc_gather;";
		if (vehicle player == player && !life_action_inUse && !life_action_gather) then { _Btn2 ctrlEnable true; };
	};
	_Btn1 ctrlShow true;
};
	
	_Btn2 ctrlSetText localize "STR_pInAct_xKniebeugen";
	_Btn2 buttonSetAction "[""move_2""] call noaim_fnc_animations; closeDialog 0;";
	_Btn2 ctrlShow true;

	_Btn3 ctrlSetText localize "STR_pInAct_xLiegestuze";
	_Btn3 buttonSetAction "[""move_3""] call noaim_fnc_animations; closeDialog 0;";
	_Btn3 ctrlShow true;
	
	_Btn4 ctrlSetText localize "STR_pInAct_xWinken";
	_Btn4 buttonSetAction "[""move_1""] call noaim_fnc_animations; closeDialog 0;";
	_Btn4 ctrlShow true;
	
	_Btn5 ctrlSetText "Pinkeln";
	_Btn5 buttonSetAction "[""move_15""] call noaim_fnc_animations; closeDialog 0;";
	_Btn5 ctrlShow true;
	
	_Btn6 ctrlSetText "Repair";
	_Btn6 buttonSetAction "[""move_16""] call noaim_fnc_animations; closeDialog 0;";
	_Btn6 ctrlShow true;
	
	_Btn7 ctrlSetText "Takwondo";
	_Btn7 buttonSetAction "[""move_14""] call noaim_fnc_animations; closeDialog 0;";
	_Btn7 ctrlShow true;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;

if (vehicle player != player) then
{
	_Btn2 ctrlEnable false;
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
};