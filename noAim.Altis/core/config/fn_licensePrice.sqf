/*
	Author: Bryan "Tonic" Boardwine
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "cair": {25000};
	case "gsg9": {1};
	case "fwr": {1};
	case "gsg9tl": {1};
	case "fwair": {2500000};
	case "driver": {1500}; //
	case "truck": {45000}; //*
	case "pilot": {65000}; //*
	case "boat": {25000}; //*
	case "dive": {50000}; //*
	case "gun": {50000};	 //
	case "rebel": {1500000}; //
	case "mafia": {1500000}; //
	case "donator": {1};
	case "home": {500000}; //
	case "heroin": {750000}; //
	case "marijuana": {250000}; //
	case "cocaine": {750000}; //
	case "oil": {100000}; //
	case "diamond": {250000}; //
	case "copper": {20000}; //
	case "iron": {35000}; //
	case "sand": {55000}; //
	case "brauer": {65000}; //
	case "nudeln": {11500}; //
	case "wein": {65000}; //
	case "zigaretten": {100000}; //
	case "zucker": {35000}; //
	case "whiskey": {65000}; //
	case "zigarren": {400000}; //
	case "rum": {65000}; //
	case "holz": {20000}; //
	case "schwefel": {50000}; //
	case "silber": {25000}; //X
	case "zinn": {25000}; //X
	case "zink": {50000}; //
	case "gusseisen": {50000};
	case "bronze": {65000}; //X
	case "schmuck": {150000}; //
	case "kidney": {1000000};
	case "car": {500}; //
	case "air": {5000}; //
	case "taxi": {50000}; //
	case "security": {50000}; //X
	case "haschisch": {1000000}; //
	case "lsd": {30000}; //X bald
	case "vodka": {25000}; //X bald
	case "alkohol": {65000}; //
	case "elektronik": {200000}; //
	case "plastic": {75000}; //
	case "leder": {50000}; //X bald
	case "papier": {25000}; //
	case "woll": {50000}; //
	case "fabric": {50000}; //
	case "aluminium": {100000}; //
	case "lead": {100000}; //
	case "fleischer": {12000}; //
	case "jadgschein": {25000}; //
	case "lagerhouse": {1200000}; //X bald bank mit Kisten?
	case "fishing": {12000}; //
	case "anwalt": {120000}; //
	case "richter": {820000}; //X bald
	case "gokart": {50000}; //
	case "logistika": {900000}; //
	case "gas": {60000}; //
	case "pccpu": {1500000}; // 
	case "schwacid": {50000}; //
	case "wooden": {20000}; //
	case "pcmainboard": {1500000}; //
	case "orangejuice": {12000}; //
	case "weizenbrot": {12000}; //
	case "abulb": {200000}; //
	case "laptop": {1500000}; //
	case "batterie": {200000}; //
	case "applejuice": {12000}; //
	case "clubdj": {9999990000};
	case "clanbase": {9999990000};
	case "clan1": {9999990000};
};