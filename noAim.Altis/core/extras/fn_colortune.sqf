/*
//--- Color corrections ppEffect
na_ppColor = ppEffectCreate [ "colorCorrections", 2015 ];
na_ppColor ppEffectEnable true;
//"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
na_ppColor ppEffectAdjust [ 1, 1, -0.03, [ 0, 0, 0, 0 ], [ 0.4, 0.3, 0.2, 1.3 ], [ 1, 1, 1, 0 ] ];
na_ppColor ppEffectCommit 0;*/

na_ColorCorrections1500 = ppEffectCreate ["colorCorrections", 1500];
na_ColorCorrections1500 ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.79, 0.72, 0.62, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
na_ColorCorrections1500 ppEffectCommit 0;
na_ColorCorrections1500 ppEffectEnable true;