
_ani = [_this,0,""] call BIS_fnc_param;
if(player getVariable ["restrained", false]) exitWith { hint "Du bist gefesselt."; };

switch (_ani) do
{
//winken
	case "move_1": { player playActionNow "gestureHi"; };
// kniebeugen
	case "move_2":
	{
		if(animationState player != "AmovPercMstpSnonWnonDnon_exerciseKneeBendA" ) then
		{
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKneeBendA";
		};
	};
//liegenstütze
	case "move_3":
	{
		if(animationState player != "AmovPercMstpSnonWnonDnon_exercisePushup" ) then
		{
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	case "move_4": { player playActionNow "gestureYes"; };
	case "move_5": { player playActionNow "gestureNo"; };
	case "move_6": { player playActionNow "gestureUp"; };
	case "move_7": { player playActionNow "gestureGo"; };
	case "move_8": { player playActionNow "gestureFreeze"; };
	case "move_9": { player playActionNow "gestureFollow"; };
	case "move_10": { player playActionNow "SitDown"; };
	case "move_11": { player playActionNow "ThrowPrepare"; };
	case "move_12": { player playActionNow "GestureNod"; };
	// Kneebend Fast
	case "move_13":
	{
		if(animationState player != "AmovPercMstpSnonWnonDnon_exercisekneeBendB" ) then
		{
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};
	// Takwondo
	case "move_14":
	{
		if(animationState player != "AmovPercMstpSnonWnonDnon_exerciseKata" ) then
		{
			player action ["SwitchWeapon", player, player, 100];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};
	
	case "move_15":
	{
		if(animationState player != "Acts_AidlPercMstpSlowWrflDnon_pissing" ) then
		{
			player action ["Acts_AidlPercMstpSlowWrflDnon_pissing", player, player, 100];
			player playMoveNow "Acts_AidlPercMstpSlowWrflDnon_pissing";
		};
	};
	
	case "move_16":
	{
		if(animationState player != "Acts_carFixingWheel" ) then
		{
			player action ["Acts_carFixingWheel", player, player, 100];
			player playMoveNow "Acts_carFixingWheel";
		};
	};
	
	case "move_17":
	{
		if(animationState player != "AinvPercMstpSnonWnonDnon_G01" ) then
		{
			player action ["AinvPercMstpSnonWnonDnon_G01", player, player, 100];
			player playMoveNow "AinvPercMstpSnonWnonDnon_G01";
		};
	};
	
	case "move_18":
	{
		if(animationState player != "Acts_ShieldFromSun_loop" ) then
		{
			player action ["Acts_ShieldFromSun_loop", player, player, 100];
			player playMoveNow "Acts_ShieldFromSun_loop";
		};
	};
	
	case "move_19":
	{
		if(animationState player != "Acts_CrouchGetLowGesture" ) then
		{
			player action ["Acts_CrouchGetLowGesture", player, player, 100];
			player playMoveNow "Acts_CrouchGetLowGesture";
		};
	};
};