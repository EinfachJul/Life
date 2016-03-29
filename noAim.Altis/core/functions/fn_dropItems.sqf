/*
	Author: Bryan "Tonic" Boardwine
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "life_inv_water":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_redgull":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelE":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelF":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_coffee":
		{
			if (_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_znorak":
		{
			if(life_znorak > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call noaim_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Suitcase_F" createVehicle _pos;
				//[[_obj],"noaim_fnc_simDisable",nil,true] spawn noaim_fnc_LAST;
				[_obj] remoteExec ["noaim_fnc_simDisable",nil,true];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (zoki_inv_items + ["life_znorak"]);