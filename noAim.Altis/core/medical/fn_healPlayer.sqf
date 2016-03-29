/*
	File: fn_healPlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Heals the targeted player.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
life_interrupted = false;
if(isNull life_pInact_curTarget) exitwith {};
if(damage life_pInact_curTarget == 1) exitWith {hint localize "STR_NOTF_AlreadyHealed"};
if(player distance life_pInact_curTarget > 5) exitWith {hint localize "STR_NOTF_HealToFar"};

life_action_inUse = true;

_upp = format[localize "STR_NOTF_Healing",name life_pInact_curTarget];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_interrupted) exitWith {};
	if(player distance life_pInact_curTarget > 5) exitWith {};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted || !alive player) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player distance life_pInact_curTarget > 5) exitWith {hint localize "STR_NOTF_HealToFar"};

life_pInact_curTarget setDamage 0;
titleText[localize "STR_NOTF_HealedPlayer","PLAIN"];