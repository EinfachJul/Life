/*
      Created by Mokomoko
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption","_velocityUp"];

if (isNil "_fuelConsumption")then {
_fuelConsumption = 0;
};

while{true} do 
{
	_vehicleToFuel = (vehicle player);
	_speed = speed _vehicleToFuel;
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
		//_velocityUp = (velocity _vehicleToFuel select 2)*3;
		//_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6 + _velocityUp;
		
		if(_vehicleToFuel isKindOf "Car") then {
		
			switch(true) do
			{
				case (_speed >= 0 and _speed < 30): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0001};
				case (_speed >= 30 and _speed < 55): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0002};
				//case (_speed >= 15 and _speed < 30): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0003};
				case (_speed >= 55 and _speed < 85): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0004};
				//case (_speed >= 55 and _speed < 70): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0005};
				case (_speed >= 85 and _speed < 100): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0006};
				//case (_speed >= 85 and _speed < 100): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0007};
				case (_speed >= 100 and _speed < 130): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0007};
				//case (_speed >= 115 and _speed < 130): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0009};
				case (_speed >= 130 and _speed < 145): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0008};
				//case (_speed >= 145 and _speed < 160): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0011};
				case (_speed >= 145 and _speed < 200): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0010};
				//case (_speed >= 180 and _speed < 200): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0013};
				case (_speed >= 200 and _speed < 280): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0011};
				//case (_speed >= 240 and _speed < 280): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0015};
				case (_speed >= 280 and _speed < 340): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0012};
				case (_speed >= 340 and _speed < 400): 	{_fuelConsumption = _velocityOfVehicle/150000 + 0.0013};
				//default {_fuelConsumption = _velocityOfVehicle/150000 + 0.0002;}
			};
		};
		
		if((_vehicleToFuel isKindOf "Air") && (_vehicleToFuel isKindOf "Ship")) then {
		
				case (_speed >= 0 and _speed < 100): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0003};
				case (_speed >= 100 and _speed < 200): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0008};
				case (_speed >= 200 and _speed < 300): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0012};
				case (_speed >= 300 and _speed < 400): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0014};
				case (_speed >= 400 and _speed < 500): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0016};	
		};
		
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		_displayFuel = _fuelConsumption*10000/2;

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Du bist auf Reserve unterwegs. Du solltest eine Tankstelle aufsuchen!";
		}
		else
		{
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "Dein Tank ist leer. Wir hoffen du bist gut zu Fuss!";
			};
		};
	};
	sleep 2;
};