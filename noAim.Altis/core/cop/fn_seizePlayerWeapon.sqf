/*
	Author: Skalicon
	Preforms the seizePlayerWeaponAction script on the cursorTarget
*/
//[[],"noaim_fnc_seizePlayerWeaponAction",cursorTarget,false] spawn noaim_fnc_LAST;
[] remoteExec ["noaim_fnc_seizePlayerWeaponAction",cursorTarget];
//[[52, player, format["Sie haben die Waffen und Magazine von %1 beschlagnahmt und auf die Fahndungsliste gesetzt", name cursorTarget]],"TON_fnc_logIt",false,false] spawn noaim_fnc_LAST;
[52, player, format["Sie haben die Waffen und Magazine von %1 beschlagnahmt und auf die Fahndungsliste gesetzt", name cursorTarget]] remoteExec ["TON_fnc_logit",2];