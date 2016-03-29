/*
	Author: Bryan "Tonic" Boardwine
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance tawvd_foot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance tawvd_car};
	case ((vehicle player) isKindOf "Air"): {setViewDistance tawvd_air};
};