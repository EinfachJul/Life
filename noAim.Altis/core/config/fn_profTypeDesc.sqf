/*
Author: Jacob "PapaBear" Tyler
Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;
 
if(_type == "" ) exitWith {[]};
 
_profDesc = "";
switch ( _type ) do
{	
	//license to text
	//DRUGS
	case "Heroin_Prof": {_profDesc = "Sammeln/Verarbeiten von Schlafmond/Heroin"; };
	case "Cocain_Prof": { _profDesc = "Sammeln/Verarbeiten von Kokain"; };
	case "Canabis_Prof": { _profDesc = "SammelnVerarbeiten von Kannabis, Marijuana, Haschisch"; };
	case "Tabak_Prof": { _profDesc = "Sammeln/Verarbeiten von Tabak zu Zigarren"; };
	case "Alkohol_Prof": { _profDesc = "Sammeln/Verarbeiten von Trauben zu Wein"; };
	//MATERIALS
	case "Copper_Prof": { _profDesc = "Sammeln/Schmelzen von Kupfer zu Kupferbarren"; };
	case "Iron_Prof": { _profDesc = "Sammeln/Schmelzen von Eisen zu Eisenbarren";  };
	case "Sand_Prof": { _profDesc = "Sammeln/Verarbeiten von Sand zu Glass"; };
	case "Diamond_Prof": { _profDesc = "Sammeln/Schleifen von Rohdiamant zu Diamant"; };
	case "Oil_Prof": { _profDesc = "Sammeln/Verarbeiten von Rohoel zu Oel"; };
	case "Gas_Prof": { _profDesc = "Sammeln/Verarbeiten von Gas zu Gasflaschen"; };
	case "Aluminum_Prof": { _profDesc = "Sammeln/Verarbeiten von Bauxit zu Aluminium"; };
	case "Schwefel_Prof": { _profDesc = "Sammeln/Verarbeiten von Schwefel"; };
	case "Kunststoff_Prof": { _profDesc = "Verarbeiten zu Kunststoff"; };
	case "Stoff_Prof": { _profDesc = "Sammeln/Verarbeiten von Baumwolle zu Stoffen"; };
	//EXTRAS
	case "Fruit_Prof": { _profDesc = "Sammeln von Obst"; };
	case "Food_Prof": { _profDesc = "Sammeln/Verarbeiten von Lebensmitteln"; };
	case "Laptop_Prof": { _profDesc = "Herstellung von Laptops"; };
	case "Wood_Prof": { _profDesc = "Sammeln/Verarbeiten von Holz"; };
	case "Turtle_Prof": { _profDesc = "Jagen von Schildkroeten"; };
	case "Corals_Prof": { _profName = "Sammeln von Korallen"; };
	case "TurtleSoup_Prof": { _profName = "Verarbeiten von Schildkroeten"; };
	case "Fish_Prof": { _profDesc = "Fangen von Fischen"; };
	case "Jagd_Prof": { _profDesc = "Jagen von Ziegen, Huehner und Schafen"; };
	case "Schmuck_Prof": { _profDesc = "Verarbeiten von Korallen"; };
	//===========
	case "Ticket_Prof": {_profDesc = "Ticketsausstellen der Polizei"; };
	case "TicketFW_Prof": {_profDesc = "Ticketsausstellen der Feuerwehr"; };
	case "Arrest_Prof": {_profDesc = "Verhaften von Personen fuer das Gefaengnis"; };
	case "Impound_Prof": {_profDesc = "Abschleppen von Fahrzeugen"; };
	case "ImpoundPerm_Prof": {_profDesc = "Beschlagnahmen von Fahrzeugen"; };
	case "ImpoundCrash_Prof": {_profDesc = "Zerstoeren von Fahrzeugen"; };
	case "ImpoundFW_Prof": {_profDesc = "Abschleppen von Fahrzeugen"; };
	case "Revive_Prof": {_profDesc = "Wiederbeleben von fast Toten Personen"; };
	case "Hero_Prof": {_profDesc = "Auszahlung von Kopfgeld"; };
	case "Dieb_Prof": {_profDesc = "Ausrauben von Tankstellen"; };
	case "Gang_Prof": {_profDesc = "Gang Taetigkeiten"; };
	case "Repair_Prof": {_profDesc = "Fahrzeug Reparieren"; };
	case "RepairCop_Prof": {_profDesc = "Fahrzeug Reparieren"; };
	default{""};
};

_profDesc;