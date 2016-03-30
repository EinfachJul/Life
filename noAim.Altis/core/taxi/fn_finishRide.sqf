private["_cash","_pricePerM","_paidmoney","_totalDistance","_fehlbetrag"];
_cash = _this select 0;
_pricePerM = _this select 1;
_paidmoney = _this select 2;
_totalDistance = (_cash/_pricePerM);
_totalDistance = floor _totalDistance;
_fehlbetrag = _cash - _paidmoney;

if !(_paidmoney == 0.5) then
	{
		life_znorak = life_znorak + _paidmoney;
		_message = parseText format ["Ihr Kunde hat den Service gestoppt, Sie erhalten %1 € fuer die %2 meter, jedoch konnte der Kunde nur %3 € bezahlen. Sie wurden wieder als Freier Taxifahrer in der Auftragsliste eingetragen.",_cash,_totalDistance,_fehlbetrag];
		titleText[format["%1",_message],"PLAIN"];
	};
	else
	{
		life_znorak = life_znorak + _cash;
		_message = parseText format ["Ihr Kunde hat den Service gestoppt, Sie erhalten %1 € fuer die %2 meter. Sie wurden wieder als Freier Taxifahrer in der Auftragsliste eingetragen.",_cash,_totalDistance];
		titleText[format["%1",_message],"PLAIN"];
	};

player removeAction taxi_ActionToLeave;
life_isOnDutyTaxi = true;
[[player],"TON_fnc_goOnDuty",false,false] spawn noaim_fnc_MP;
