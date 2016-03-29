player setDamage (0.05 + (damage player));
[] call noaim_fnc_status_bar;

hint "Let´s dance !";
sleep 3;

player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
player setDamage (0.05 + (damage player));
[] call noaim_fnc_status_bar;				
// ARYX DROGEN SCRIPT
for "_i" from 0 to 200 do
		{
		player setVariable ["drug_haschisch", true, true];
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.01,0.01,true];
		"chromAberration" ppEffectCommit 1;
		sleep 3;
		};
		
"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
player setVariable ["drug_haschisch", false, true];