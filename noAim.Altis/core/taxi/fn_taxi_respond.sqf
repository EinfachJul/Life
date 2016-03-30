_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;
pricePerM = 4;
NoAimPaid = -1;

switch (_mode) do
{
	case 1:
	{
		TaxiCallsClient = _info;
		systemChat "Deine Taxi Auftraege wurden Aktualisiert!";
	};
	case 2:
	{
		hint format ["Taxifahrer %1 hat ihren Anruf entgegengenommen, dieser befindet sich %2 meter entfernt von ihrer position.",name _info,floor (player distance _info)];
		life_taxiDriver = _info;
		life_calledTaxi = true;
		taxi_eventHandlerID1 = player addEventHandler ["GetIn", {
			sleep 0.1;
			if (life_taxiDriver == (driver vehicle player)) then {life_inTaxi = true;};
		}];
		taxi_ActionToLeave = player addAction ["Taxiservice Beenden", {
			hint format ["Sie haben den Taxiservice abgebrochen oder beendet, Sie haben %1 € fuer die Fahrt bezahlt.",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_zgazzy<life_taxiTotalPrice) then
 +				{
 +					NoAim_Paid = life_zgazzy; life_zgazzy = 0;
 +				}
 +			else
 +				{
 +					life_zgazzy = life_zgazzy - life_taxiTotalPrice;
 +				};
 +			[[life_taxiTotalPrice,pricePerM,NoAimPaid],"noaim_fnc_finishRide",life_taxiDriver,false] spawn noaim_fnc_MP;
		}];
		_oldTaxiPos = getPos player;
		life_taxiTotalPrice = 0;
		_updateCount = 0;
		sleep 5;
		while {life_calledTaxi && !(player getVariable "restrained")} do {
			uiSleep 0.1;
			_updateCount = _updateCount + 1;
			hintSilent parseText format ["TAXI-METER<br/><br/><t align='left'>Strecke Gefahren:</t><t align='right'>%1</t><br/><t align='left'>Preis:</t><t align='right'>%2</t>",floor (life_taxiTotalPrice/pricePerM),life_taxiTotalPrice];
			if ((_oldTaxiPos distance player >= 1)&&(life_taxiDriver == (driver vehicle player))) then { life_taxiTotalPrice = life_taxiTotalPrice + pricePerM; _oldTaxiPos = getPos player; };
			if (_updateCount>=200) then {
				//[[5,life_taxiTotalPrice],"noaim_fnc_respond",life_taxiDriver,false] spawn noaim_fnc_LAST;
				[5,life_taxiTotalPrice] remoteExec ["noaim_fnc_respond",life_taxiDriver];
			};
		};
		if (life_inTaxi) then {
			hint format ["Sie haben den Taxiservice abgebrochen oder beendet, Sie haben %1 € fuer die Fahrt bezahlt.",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_zgazzy<life_taxiTotalPrice) then {life_zgazzy = 0;} else { life_zgazzy = life_zgazzy - life_taxiTotalPrice;};
			//[[life_taxiTotalPrice,pricePerM],"noaim_fnc_finishRide",life_taxiDriver,false] spawn noaim_fnc_LAST;
			[life_taxiTotalPrice,pricePerM] remoteExec ["noaim_fnc_finishRide",life_taxiDriver];
			player removeAction taxi_ActionToLeave;
		};
	};
	case 3:
	{
		hint "Kein Taxifahrer hat ihren Anfrage akzeptiert in den letzten 30 sekunden, Ihrer Anruf wurde daher von der aktiven Taxi Auftrags liste geloescht. Sie koennen es nun noch einmal versuchen.";
		life_calledTaxi = false;
    };
    case 4:
    {
    	hint "Es befinden sich derzeit keine Taxifahrer im Einsatz.";
    	life_calledTaxi = false;
	};
	case 5:
	{
		life_taxiTotalPriceBACKUP = _info;
	};
	case 6:
	{
		life_calledTaxi = false;
		sleep 0.2;
		hint format ["Der Taxifahrer hat den Auftrag beendet, Sie haben %1 € fuer die Fahrt bezahlt.",life_taxiTotalPrice];
		life_inTaxi = false;
		if (life_zgazzy<life_taxiTotalPrice) then {life_zgazzy = 0;} else { life_zgazzy = life_zgazzy - life_taxiTotalPrice;};
		//[[life_taxiTotalPrice,pricePerM],"noaim_fnc_finishRide",life_taxiDriver,false] spawn noaim_fnc_LAST;
		[life_taxiTotalPrice,pricePerM] remoteExec ["noaim_fnc_finishRide",life_taxiDriver];
		player removeAction taxi_ActionToLeave;
	};
};
