#include "..\..\macros.hpp"
private["_mode","_dialog","_btitlez","_btextz","_blistz","_bnputz","_displayName","_bsetz","_select"];

disableSerialization;
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_dialog = findDisplay 4512;
_btitlez = _dialog displayCtrl 4513;
_btextz = _dialog displayCtrl 4514;
_blistz = _dialog displayCtrl 4515;

_bnputz = [
	["1. Allgemeine Gesetzregelungen","1. Allgemeine Gesetzregelungen",
	"<t size='0.8'><a color='#ff1000'>§108</a> Ruhestoerung 5000€
	<br/><a color='#ff1000'>§136</a> Beleidigungen 15.000€
	</t>
	"],
	
	["2. Strafprozessordnung","2. Strafprozessordnung",
	"<t size='0.8'><a color='#ff1000'>§137</a> Stoerung einer Amtshandlung 25.000€
	<br/><a color='#ff1000'>§138</a> Missachtung polizeilicher Anweisungen 25.000€
	<br/><a color='#ff1000'>§142</a> Widerstand gegen die Staatsgewalt 80.000€
	</t>
	"],
	
	["3. Strassenverkehrsordnung","3. Strassenverkehrsordnung",
	"<t size='0.8'><a color='#ff1000'>§111</a> Falschparken/Verkehrsbehinderung 1000€
	<br/><a color='#ff1000'>§110</a> Fahren ohne Licht 2500€
	<br/><a color='#ff1000'>§113</a> Verursachen eines Unfalls 7500€
	<br/><a color='#ff1000'>§109</a> Fahren ohne Fahrerlaubnis 10.000€
	<br/><a color='#ff1000'>§114</a> Verursachen eines Unfalls mit Personenschaden 10.000€
	<br/><a color='#ff1000'>§112</a> Fahren unter Alkohol-/Drogeneinfluss 20.000€
	<br/><a color='#ff1000'>§480</a> Fahrerflucht 50000€
	<br/><a color='#ff1000'>§135</a> Fuehren eines illegalen Fahrzeuges 500.000€
	</t>
	"],
	
	
	["3.1 Geschwindigkeitsueberschreitung","3.1 Geschwindigkeitsueberschreitung",
	"<t size='0.8'>+35km/h 200€ 
	<br/>+50km/h 2000€
	<br/>+75km/h 2000€
	<br/>+100kmh/h 7500€
	<br/>+125km/h 7500€
	<br/>+150km/h 10.000€
	<br/>+175km/h 10.000€
	<br/>+200kmh/h 15.000€
	</t>
	"],
	
	["4. Luftverkehrs-Ordnung","4. Luftverkehrs-Ordnung",
	"<t size='0.8'><a color='#ff1000'>§119</a> Landen in der Stadt 5000€
	<br/><a color='#ff1000'>§117</a> Fliegen ohne Kollisionslichter 10.000€
	<br/><a color='#ff1000'>§118</a> Missachtung der Mindestflughoehe 10.000€
	<br/><a color='#ff1000'>§116</a> Fliegen ohne Pilotenschein 30000€
	<br/><a color='#ff1000'>§120</a> Fliegen unter Alkohol-/Drogeneinfluss 100.000€
	</t>
	"],
	
	["5. Betaeubungsmittelgesetz","5. Verstoss gegen das Betaeubungsmittelgesetz",
	"<t size='0.8'><a color='#ff1000'>§121</a> Drogenkonsum 10.000€
	<br/><a color='#ff1000'>§483</a> Drogenhandel 50.000€
	</t>
	"],
	
	["6. Strafgesetzbuch","6. Strafgesetzbuch",
	"<t size='0.8'><a color='#ff1000'>§141</a> Betreten einer Sperrzone 10.000€
	<br/><a color='#ff1000'>§215</a> Versuchter Fahrzeugdiebstahl 10.000€
	<br/><a color='#ff1000'>§139</a> Fluchthilfe 150.000€
	<br/><a color='#ff1000'>§487</a> Fahrzeugdiebstahl 20.000€
	<br/><a color='#ff1000'>§145</a> Ueberfall auf Personen/Fahrzeuge 20.000€
	<br/><a color='#ff1000'>§143</a> Anstiftung zu einem Verbrechen 25.000€
	<br/><a color='#ff1000'>§150</a> Versuchter Tankstellenraub 35.000€
	<br/><a color='#ff1000'>§211V</a> Versuchter Raub 50.000€
	<br/><a color='#ff1000'>§151</a> Tankstellenraub 65.000€
	<br/><a color='#ff1000'>§146</a> Beschuss mit Personen-/Fahrzeugschaden 75.000€
	<br/><a color='#ff1000'>§211</a> Raub 100.000€
	<br/><a color='#ff1000'>§187V</a> Fahrlaessige Toetung 100.000€
	<br/><a color='#ff1000'>§207A</a> Versuche Entfuehrung 125.000€
	<br/><a color='#ff1000'>§187</a> Mord 250.000€
	<br/><a color='#ff1000'>§207</a> Entfuehrung 250.000€
	<br/><a color='#ff1000'>§156</a> Einbruch 250.000€
	<br/><a color='#ff1000'>§901</a> Gefaengnisausbruch 300.000€
	<br/><a color='#ff1000'>§236</a> Sklavenhandel 300.000€
	<br/><a color='#ff1000'>§154</a> Rebellische Uebernahme 500.000€
	<br/><a color='#ff1000'>§152</a> Versuchter Bankraub 500.000€
	<br/><a color='#ff1000'>§153</a> Bankraub 1.000.000€
	<br/><a color='#ff1000'>§155</a> Terrorismus 1.000.000€
	</t>
	"],
	
	["7. Hehlerei","7. Hehlerei",
	"<t size='0.8'><a color='#ff1000'>§125</a> Handel mit gestohlenen Fahrzeugen 50.000€
	</t>
	"],
	
	["8. Waffen Ordnung","8. Waffen Ordnung",
	"<t size='0.8'><a color='#ff1000'>§127</a> Offenes Tragen von Waffen 5000€
	<br/><a color='#ff1000'>§133</a> Besitz legaler Waffen ohne Waffenschein 35.000€
	<br/><a color='#ff1000'>§131</a> Besitz von Sprengstoffen 50.000€
	<br/><a color='#ff1000'>§126</a> Handel mit Sprengstoffen 100.000€
	<br/><a color='#ff1000'>§128</a> Abfeuern von Waffen innerhalb einer Stadt 10.000€
	<br/><a color='#ff1000'>§134</a> Besitz illegaler Waffen 150.000€
	</t>
	"],
	
	["9. Besitz von Illegalenwaren","9. Besitz von Illegalenwaren",
	"<t size='0.8'><a color='#ff1000'>§481</a> Besitz von Drogen 30.000€
	<br/><a color='#ff1000'>§132</a> Besitz von Goldbarren 100.000€
	<br/><a color='#ff1000'>§129</a> Besitz von Schildkroeten 250.000€
	</t>
	"]
];

switch(_mode) do
{
	case 0:
	{
		{
			_displayName = (_x select 0);
			_blistz lbAdd format["%1",_displayName];
		} forEach _bnputz;
	};
	
	case 1:
	{
		if(isNull _dialog) exitWith {};
		_bsetz = lbCurSel _blistz;
		_select = _bnputz select _bsetz;
		_btitlez ctrlSetText (_select select 1);
		_btextz ctrlSetStructuredText parseText (_select select 2);
	};
};