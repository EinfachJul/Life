private["_corpse","_animals","_success"];

_meats = 0;
_meats = _meats + life_inv_henraw + life_inv_goatraw + life_inv_roosterraw + life_inv_sheepraw + life_inv_rabbitraw;

if (_meats == 0) exitWith 
{ 
	hint "Sie besitzen kein Fleisch zum Grillen."; 
};

[2, format["Der Grill vorgang startet von %1.", _meats]] call noaim_fnc_broadcast;

for "_i" from 1 to _meats do
{
	//[[player,"AinvPknlMstpSnonWnonDnon_medic_2"],"noaim_fnc_animSync",true,false] spawn noaim_fnc_TRY;
	[player,"AinvPknlMstpSnonWnonDnon_medic_2",true] remoteExec ["noaim_fnc_animSync",-2];
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_2";
	sleep 2.3;
};

if (!alive player) exitWith {};

_meatTypes = ["henraw","goatraw","roosterraw","sheepraw","rabbitraw"];
{
	_num = missionNamespace getVariable ([_x,0] call noaim_fnc_varHandle);
	if (_num > 0) then
	{
		[false,_x,_num] call noaim_fnc_handleInv;
		[true,format["%1steak",_x],_num] call noaim_fnc_handleInv;
	};
} forEach _meatTypes;

[2, format["Der Grill vorgang startet von %1.", _meats]] call noaim_fnc_broadcast;