private["_respondmode","_message","_clothings"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;
//_displaystats = param [3,0,[0]];

if (_respondmode==1) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
};

if (_respondmode==2) then {
    player addEventHandler ["handleDamage", {false}];
    playMusic "LeadTrack02_F_Bootcamp";
    hint "Willkommen in der Paintballarena! Das kommende Spiel wird 5 Minuten gehen, viel Spa�!";
    meinePos = getPos player;
    [] call noaim_fnc_saveGear;
    player enableFatigue false;
    meingear = life_gear;
    life_gear set [16,[]];
    RemoveAllWeapons player;
    {player removeMagazine _x;} foreach (magazines player);
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeGoggles player;
    removeHeadGear player;
    //player forceAddUniform "U_I_Protagonist_VR"; // U_B_Protagonist_VR U_B_Protagonist_VR
	_clothings = ["U_I_Protagonist_VR","U_O_Protagonist_VR","U_B_Protagonist_VR"];
	player forceAddUniform (_clothings select (floor(random (count _clothings))));
	player addGoggles "G_Goggles_VR";
    player addWeaponGlobal "hgun_Pistol_heavy_02_Yorris_F";
    player addMagazines ["6Rnd_45ACP_Cylinder" , 25];
    {
        player unassignItem _x;
        player removeItem _x;
    } foreach (assignedItems player);
    player allowDamage false;
    _wohin = round(random (count pb_positionen));
    if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
    _position = pb_positionen select _wohin;
    player setPos _position;
    tode = 0;
    player addEventHandler ["Hit", {
        _wohin = round(random (count pb_positionen));
        if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
        _position = pb_positionen select _wohin;
        player setPos _position;
        tode = tode+1;
        _maxGeld = 15000;
        _grenzeAusz = 30;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistik</t><br/><br/><t align='left'>Tode</t><t align='right'>%1</t><br/><t align='left'>Punkte</t><t align='right'>%2</t>",tode,_punkte];
    }];
};

if (_respondmode==3) then {
    life_gear = meingear;
    [] spawn noaim_fnc_loadGear;
    player setPos meinePos;
    player allowDamage true;
    player removeAllEventHandlers "Hit";
    player addEventHandler["handleDamage",{_this call noaim_fnc_handleDamage;}];
    player enableFatigue true;
    _grenzeAusz = 30;
    if (tode>=_grenzeAusz) then {
        hint "Das Spiel wurde beendet. Leider hast du nicht gen�gend Punkte erspielt, um einen Geldpreis zu erhalten!";
    } else {
        _maxGeld = 15000;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        _geldMin= _geldTod*tode;
        _gesamt = _maxGeld-_geldMin;
        life_znorak = life_znorak + _gesamt;
        hint format ["Das Spiel wurde beendet. Du hast insgesamt %1 Punkte erspielt und einen Geldpreis ($%2) erhalten. Gl�ckwunsch!",_punkte,_gesamt];
    };
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};

if (_respondmode==5) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
    life_znorak = life_znorak - 5000;
};