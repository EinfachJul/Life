/*
Author: Bryan "Tonic" Boardwine
THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call noaim_fnc_fetchDeadGear;
[_oldGear] spawn noaim_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
//[[life_corpse],"noaim_fnc_corpse",nil,FALSE] spawn noaim_fnc_DONE;
[life_corpse] remoteExec ["noaim_fnc_corpse",-2];
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call noaim_fnc_numberText];
closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

profileNamespace setVariable["Busted",false];

//Take fee for services.
if(life_zgazzy > (call life_revive_fee)) then {
	life_zgazzy = life_zgazzy - (call life_revive_fee);
} else {
	life_zgazzy = 0;
};
//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,true];
life_corpse setVariable["name",nil,true];
life_corpse setvariable["fwcall",nil,true];
life_corpse setvariable["fwoffline",nil,true];
[life_corpse] remoteExec ["noaim_fnc_corpse",-2];
//[[life_corpse],"noaim_fnc_corpse",true,false] spawn noaim_fnc_DONE;
hideBody life_corpse;
deleteVehicle life_corpse;
{
	deleteVehicle _x;
} forEach nearestObjects [life_corpse, ["GroundWeaponHolder"], 5];
player setVariable["Revive",nil,true];
player setVariable["name",nil,true];
player setVariable["Reviving",nil,true];
[] call noaim_fnc_status_bar; //Request update of hud.
player setvariable["fwcall",nil,true];
player setvariable["fwoffline",nil,true];
Life_request_timer = false;
[] call noaim_fnc_updateClothing;

[3] call SAX_fnc_updatePartial;
[6] call SAX_fnc_updatePartial;