/*
	Author: Bryan "Tonic" Boardwine
	Replaces the mass addactions for various med actions towards another player.
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
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget || !isPlayer _curTarget || _curTarget distance player > 5) exitWith {}; //Bad target
if(!(createDialog "pInteraction_Menu")) exitWith {};

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
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText localize "STR_pInAct_Patverfassen";
_Btn1 buttonSetAction "[] call noaim_fnc_getPlayerState";
_Btn1 ctrlShow true;

_Btn2 ctrlSetText localize "STR_pInAct_Patheilen";
_Btn2 buttonSetAction "[_curTarget] spawn noaim_fnc_healPlayer;";
_Btn2 ctrlShow true;

_Btn3 ctrlSetText localize "STR_pInAct_PatAlkDrug";
_Btn3 buttonSetAction "[] spawn noaim_fnc_drugtestAction;";
_Btn3 ctrlShow true;

//Set Ticket Button
_Btn4 ctrlSetText localize "STR_pInAct_RechnungBtn";
_Btn4 buttonSetAction "[life_pInact_curTarget] call noaim_fnc_fw_ticket_action;";
_Btn4 ctrlShow true;

_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;

_curTarget spawn {
	waitUntil {sleep 0.5; _this distance player > 5|| isNull (findDisplay 37400)};
	if(isNull (findDisplay 37400)) exitWith {};
	closeDialog 0;
	closeDialog 0;
};