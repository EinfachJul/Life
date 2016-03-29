disableSerialization;
_display        = findDisplay 6600;
_taxiListbox    = _display displayCtrl 6601;
if !(lbCurSel _taxiListbox >=0) exitWith {hint "Error";};
_player         = _taxiListbox lbData (lbCurSel _taxiListbox);
_player = call compile _player;

hint format ["Sie haben den Anruf Auftrag von %1 akzeptiert. Dieser befindet sich %2 meter entfernt von ihrer Position. Es wurde eine Position auf der Karte platziert.",name _player,player distance _player];
life_taxiCustomer = _player;

//[[player,_player],"TON_fnc_acceptedTaxiCall",false,false] spawn noaim_fnc_LAST;
[player,_player] remoteExec ["TON_fnc_acceptedTaxiCall",2];
//[[2,player],"noaim_fnc_taxi_respond",_player,false] spawn noaim_fnc_LAST;
[2,player] remoteExec ["noaim_fnc_taxi_respond",_player];

_markerText = createMarkerLocal ["Taxilocation", getPos _player];
"Taxilocation" setMarkerColorLocal "ColorRed";
"Taxilocation" setMarkerTextLocal format ["LETZTE POSITION VON %1",name _player];
"Taxilocation" setMarkerTypeLocal "mil_warning";
life_isOnDutyTaxi = false;
closeDialog 0;

taxi_ActionToLeave = player addAction ["Taxiservice Beenden", {
	if (alive life_taxiCustomer) then {
		//[[6],"noaim_fnc_taxi_respond",life_taxiCustomer,false] spawn noaim_fnc_LAST;
		[6] remoteExec ["noaim_fnc_taxi_respond",life_taxiCustomer];
		player removeAction taxi_ActionToLeave;
	} else {
		player removeAction taxi_ActionToLeave;
		_message = parseText format ["Sie haben die Fahrt gestoppt, aber der Kunde scheint entweder Tot oder verschwunden (Disconnect) zu sein. Sie erhalten die letzte gesicherte Summe von %1 €.",life_taxiTotalPriceBACKUP];
		titleText[format["%1",_message],"PLAIN"];
		life_znorak = life_znorak + life_taxiTotalPriceBACKUP;
		life_isOnDutyTaxi = true;
		//[[player],"TON_fnc_goOnDuty",false,false] spawn noaim_fnc_LAST;
		[player] remoteExec ["TON_fnc_goOnDuty",2];
	};
}];

life_taxiTotalPriceBACKUP = 0;
while {player distance _player > 10} do { "Taxilocation" setMarkerPosLocal getPos _player; };
deleteMarkerLocal "Taxilocation";