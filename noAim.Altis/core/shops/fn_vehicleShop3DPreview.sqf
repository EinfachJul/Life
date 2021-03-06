/*
	File: fn_vehicleShop3DPreview.sqf
	Author: NiiRoZz

	Description:
	Called when a new selection is made in the list box and
	displays the new vehicle selected.
*/
private ["_classView","_object"];

if (isNil "life_preview_3D_vehicle_cam") then
{
	[] call noaim_fnc_vehicleShopInit3DPreview;
};

_classView = _this select 0;

// Ignore non instantiable objects.
if (_classView != "" && {isClass (configFile >> "CfgVehicles" >> _classView) && {getNumber (configFile >> "CfgVehicles" >> _classView >> "scope") > 0}}) then
{
	// Skip if object view is the same as previous.
	if (isNull life_preview_3D_vehicle_object || {_classView != typeOf life_preview_3D_vehicle_object}) then
	{
		if (!isNull life_preview_3D_vehicle_object) then {detach life_preview_3D_vehicle_object; deleteVehicle life_preview_3D_vehicle_object;};
		// Create and place the object in the sky
		if (!life_pos_exist) then {
			life_pos_attach = [[5000, 5000, 0]] call noaim_fnc_searchPosEmpty;
			life_pos_exist = true;
			life_preview_light = "#lightpoint" createVehicleLocal life_pos_attach;
			life_preview_light setlightbrightness 0.5;
			life_preview_light setlightcolor [1,1,1];
			life_preview_light setlightambient [1,1,1];
		};
		_object = _classView createVehicleLocal life_pos_attach;
		_object attachTo [life_attachment_point, life_pos_attach];

		life_preview_3D_vehicle_object = _object;
	};
};