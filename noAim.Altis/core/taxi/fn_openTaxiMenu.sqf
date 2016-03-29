disableSerialization;
createDialog "life_taxiMenu";
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;

if (!life_isOnDutyTaxi) exitWith {hint "Sie sind nicht im Einsatz oder haben bereits einen Auftrag entgegengenommen!";closeDialog 0;};

//[[player],"TON_fnc_goOnDuty",false,false] spawn noaim_fnc_LAST;
[player] remoteExec ["TON_fnc_goOnDuty",2];
sleep 1;
if (count TaxiCallsClient > 0) then
{
	{
		_taxiListbox lbAdd format ["%1 (%2 meter)",name _x,(_x distance player)];
		_taxiListbox lbSetData [(lbSize _taxiListbox)-1,format ["%1",_x]];
	} forEach TaxiCallsClient;
};

hint "Taxi Auftraege erfolgreich geladen, bitte nimm einen entgegen.";