/*
	Author: Bryan "Tonic" Boardwine
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		//[[_position],"noaim_fnc_flashbang",true,false] spawn noaim_fnc_TRY;
		[_position] remoteExec ["noaim_fnc_flashbang",-2];
	};
};