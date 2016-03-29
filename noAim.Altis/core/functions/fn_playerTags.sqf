#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units","_gogglesNA","_gogglesHALB"];
#define iconID 78000
#define scale 0.8
_gogglesNA = ["G_Bandanna_aviator","G_Bandanna_beast","G_Balaclava_blk","G_Balaclava_tan","G_Balaclava_lowprofile","G_Balaclava_oli"];
_gogglesHALB = ["G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];
_uniformNA = ["U_I_GhillieSuit","U_B_GhillieSuit","U_O_GhillieSuit","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard","U_I_FullGhillie_ard","U_I_FullGhillie_sard","U_I_FullGhillie_lsh"];
_headgearNA = ["H_Shemag_olive","H_ShemagOpen_khk","H_CrewHelmetHeli_B","H_Shemag_tan","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan"];

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V2_F"],50];
_units = _units - [player];

{
	private["_text"];
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
			    case ((goggles _x) in _gogglesNA && playerSide in [civilian]): {format["<t color='#000000'>Maskierte Person</t>"];};
				case ((goggles _x) in _gogglesHALB && playerSide in [civilian]): {format["<t color='#000000'>Bandit</t>"];};
                case ((headgear _x) in _headgearNA && playerSide in [civilian]): {format["<t color='#000000'>Maskierte Person</t>"];};
                case ((uniform _x) in _uniformNA && playerSide in [civilian]): {format["<t color='#000000'>Maskierte Person</t>"];};
				
				
				case (side _x == west && !isNil {(_x getVariable "rank")}): {format["<img image='%1' size='2'></img> <t size='1'>%2<br/>%3</t>",switch ((_x getVariable "rank")) do {
					case 2: {"icons\rang\pol_wachtmeister.paa"};
					case 3: {"icons\rang\pol_obermeister.paa"};
					case 4: {"icons\rang\pol_hauptmeister.paa"};
					case 5: {"icons\rang\pol_kommissar.paa"};
					case 6: {"icons\rang\pol_oberkommissar.paa"};
					case 7: {"icons\rang\pol_hauptkommissar.paa"};
					case 8: {"icons\rang\pol_rat.paa"};
					case 9: {"icons\rang\pol_oberrat.paa"};
					case 10: {"icons\rang\pol_direktor.paa"};
					case 11: {"icons\rang\pol_praesident.paa"};
					default {"icons\rang\pol_anwaerter.paa"};
					},switch ((_x getVariable "rank")) do {
					case 2: {format["<t color='#006ac2'>Polizeiwachtmeister</t>"];};
					case 3: {format["<t color='#006ac2'>Polizeiobermeister</t>"];};
					case 4: {format["<t color='#006ac2'>Polizeihauptmeister</t>"];};
					case 5: {format["<t color='#006ac2'>Polizeikommissar</t>"];};
					case 6: {format["<t color='#006ac2'>Polizeioberkommissar</t>"];};
					case 7: {format["<t color='#006ac2'>Polizeihauptkommissar</t>"];};
					case 8: {format["<t color='#006ac2'>Polizeirat</t>"];};
					case 9: {format["<t color='#006ac2'>Polizeioberrat</t>"];};
					case 10: {format["<t color='#006ac2'>Polizeidirektor</t>"];};
					case 11: {format["<t color='#006ac2'>Polizeipräsident</t>"];};
					default {format["<t color='#006ac2'>Polizeianwärter</t>"];};
				},_x getVariable ["realname",name _x]]};
				case (side _x == independent && !isNil {(_x getVariable "rank")}): {format["<img image='%1' size='2'></img> <t size='1'>%1<br/>%2</t>",switch ((_x getVariable "rank")) do {
					case 2: {"icons\rang\gw_pannendienst.paa"};//*
					case 3: {"icons\rang\gw_staatsanwalt.paa"};//*
					case 4: {"icons\rang\gw_richter.paa"};//*
					case 5: {"icons\rang\gw_zoll.paa"};//*
					case 6: {"icons\rang\gw_security.paa"}; //*
					case 7: {"icons\rang\gw_ordnungsamt.paa"};//*
					case 8: {"icons\rang\gw_muellmann.paa"};//*
					case 9: {"icons\rang\gw_journalist.paa"};
					default {"icons\rang\gw_taxifahrer.paa"}; //*
					},switch ((_x getVariable "rank")) do {
					case 2: {format["<t color='#006ac2'>Pannendienst</t>"];};
					case 3: {format["<t color='#006ac2'>Staatsanwalt</t>"];};
					case 4: {format["<t color='#006ac2'>Richter</t>"];};
					case 5: {format["<t color='#006ac2'>Zoll</t>"];};
					case 6: {format["<t color='#006ac2'>Security</t>"];};
					case 7: {format["<t color='#006ac2'>Ordnungsamt</t>"];};
					case 8: {format["<t color='#006ac2'>Müllmann</t>"];};
					case 9: {format["<t color='#006ac2'>Journalist</t>"];};
					case 10: {format["<t color='#006ac2'>Bürgermeister</t>"];};
					default {format["<t color='#006ac2'>Verifizierter Taxifahrer</t>"];};
				},_x getVariable ["realname",name _x]]};
				case (side _x == east && !isNil {(_x getVariable "rank")}): {format["<img image='%1' size='2'></img> <t size='1'>%1<br/>%2</t>",switch ((_x getVariable "rank")) do {
					case 2: {"icons\rang\fw_brandmeister.paa"};
					case 3: {"icons\rang\fw_oberbrandmeister.paa"};
					case 4: {"icons\rang\fw_hauptbrandmeister.paa"};
					case 5: {"icons\rang\fw_brandinspektor.paa"};
					case 6: {"icons\rang\fw_brandoberinspektor.paa"};
					case 7: {"icons\rang\fw_brandamtmann.paa"};
					case 8: {"icons\rang\fw_brandrat.paa"};
					case 9: {"icons\rang\fw_oberbrandrat.paa"};
					case 10: {"icons\rang\fw_branddirektor.paa"};
					default {"icons\rang\fw_brandmeisteranwaerter.paa"};
					},switch ((_x getVariable "rank")) do {
					case 2: {format["<t color='#ec1c00'>Brandmeister</t>"];};
					case 3: {format["<t color='#ec1c00'>Oberbrandmeister</t>"];};
					case 4: {format["<t color='#ec1c00'>Hauptbrandmeister</t>"];};
					case 5: {format["<t color='#ec1c00'>Brandinspektor</t>"];};
					case 6: {format["<t color='#ec1c00'>Brandoberinspektor</t>"];};
					case 7: {format["<t color='#ec1c00'>Brandamtmann</t>"];};
					case 8: {format["<t color='#ec1c00'>Brandrat</t>"];};
					case 9: {format["<t color='#ec1c00'>Oberbrandrat</t>"];};
					case 10: {format["<t color='#ec1c00'>Branddirektor</t>"];};
					default {format["<t color='#ec1c00'>Brandmeister-Anwärter</t>"];};
				},_x getVariable ["realname",name _x]]};
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
				case ((!isNil {_x getVariable "name"} && playerSide == east)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
				default {
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
					} else {
						_x getVariable ["realname",name _x];
					};
				};
				/*if (_x getVariable["makegsg9",false]) then
				{
					_text = format["<t color='#C0C0C0'>%1</t><br/><t size='0.7' color='#808080'>%2</t>", _name, "GSG9"];							
				};*/
				/*if (_x getVariable["newbie",false]) then // Noobschutz
				{
					_text = format["<t color='#FF0000'>%1</t><br/><t size='0.7' color='#FF0000'>%2</t>", _name, "ANFÄNGERSCHUTZ"];							
				};*/
				
				if (life_GSG9aktiv == true) then // SEK
				{
					_text = format["<t size='0.7' color='#000000'>%2</t>", "SEK"];							
				};
			};
			
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;