if (life_calledTaxi) exitWith { hint "Sie haben bereits ein Taxi Anruf getaetigt!"; };
if (life_isOnDutyTaxi) exitWith { hint "Sie koennen kein Taxi rufen da Sie sich selbst im Einsatz als Taxifahrer befinden!"; };
life_calledTaxi = true;
[player] remoteExec ["TON_fnc_callTaxiDrivers",2];
hint "Sie haben ein Taxi gerufen. Bitte warten Sie bis ein Taxifahrer ihren Auftrag entgegen nimmt. Ihr Auftrag wird nach 60 sekunden geloescht sollte es zu keinem ergebniss kommen.";