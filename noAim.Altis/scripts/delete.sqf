//Delete Objects Kavala
_initCodes = [];

[] spawn  
{
ids = [[1121217,1121217,[3662.09,13093.1,10.2166]], [1121216,1121216,[3660.04,13093,10.2166]], [1120806,1120806,[3637.07,13099.3,10.2166]], [1117336,1117336,[3655.13,13199.1,10.2166]], [1117117,1117117,[3656.13,13199.2,10.2166]], [1117176,1117181,[3656.13,13199.2,10.2166]], [1117184,1117186,[3656.13,13199.2,10.2166]], [1117197,1117197,[3656.13,13199.2,10.2166]], [1117224,1117225,[3656.13,13199.2,10.2166]], [1117235,1117235,[3656.13,13199.2,10.2166]], [1117321,1117323,[3656.13,13199.2,10.2166]], [1117325,1117329,[3656.13,13199.2,10.2166]], [1117334,1117334,[3656.13,13199.2,10.2166]], [1117386,1117390,[3656.13,13199.2,10.2166]], [1117400,1117401,[3656.13,13199.2,10.2166]], [1120587,1120589,[3656.13,13199.2,10.2166]], [1120613,1120613,[3656.13,13199.2,10.2166]], [1120649,1120659,[3656.13,13199.2,10.2166]], [1120807,1120807,[3656.13,13199.2,10.2166]], [1120895,1120897,[3656.13,13199.2,10.2166]], [1120906,1120906,[3656.13,13199.2,10.2166]], [1120915,1120915,[3656.13,13199.2,10.2166]], [1120941,1120949,[3656.13,13199.2,10.2166]], [1120951,1120951,[3656.13,13199.2,10.2166]], [1120953,1120955,[3656.13,13199.2,10.2166]], [1120958,1120960,[3656.13,13199.2,10.2166]]];

    {
        for "_i" from (_x select 0) to (_x select 1) do 
        {
        aa2 = (_x select 2) nearestObject _i;
        aa2 hideObject true;
        };
    }forEach ids;
};