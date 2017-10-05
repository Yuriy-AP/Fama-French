/*
-----------------------------------
Paper:	Fama and French (1993) 
by:		Yuriy Podvysotskiy
Date:	14 December 2016
-----------------------------------
*/


/*Table 2 Replication*/

/// For time: Jul-1963 till Dec-1991 
/// -----------------------------------
sum rmrf smb hml if date>=196307 & date<=199112
foreach x in rmrf smb hml {
ttest `x'=0 if date>196307 & date<=199112
}
tsset time
foreach x in rmrf smb hml {
reg `x' l.`x' l2.`x' l12.`x' if date>=196307 & date<=199112
}
corr rmrf smb hml if date>=196307 & date<=199112

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
gen er`x' = `x' - rf
}


sum erme1bm1 - erme5bm5 if date>=196307 & date<=199112
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
ttest er`x'=0 if date>=196307 & date<=199112
}

/// For time: Jan-1992 till Oct-2016
/// -----------------------------------
sum rmrf smb hml if date>199112 & date<=201610
foreach x in rmrf smb hml {
ttest `x'=0 if date>199112 & date<=201610
}
tsset time
foreach x in rmrf smb hml {
reg `x' l.`x' l2.`x' l12.`x' if date>199112 & date<=201610
}
corr rmrf smb hml if date>199112 & date<=201610

sum erme1bm1 - erme5bm5 if date>199112 & date<=201610
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
ttest er`x'=0 if date>199112 & date<=201610
}

/*Table 4 Replication*/
/// For time: Jul-1963 till Dec-1991 
/// -----------------------------------
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf if date>=196307 & date<=199112
}

/// For time: Jan-1992 till Oct-2016
/// -----------------------------------
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf if date>199112 & date<=201610
}

/*Table 6 Replication*/
/// For time: Jul-1963 till Dec-1991 
/// -----------------------------------
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf smb hml if date>=196307 & date<=199112
}

/// For time: Jan-1992 till Oct-2016
/// -----------------------------------
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf smb hml if date>=199112 & date<=201610
}

/*Table 7 (extension)*/

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{

reg er`x' rmrf smb hml if date>=199112 & date<=201610
estat sbknown, break(948) /*time=984 corresponds to Jun-2008*/
}
 
 /// Discontinuity (donought):
 /// -------------------------
gen morethan2008 = 0
replace morethan2008 =1 if date >200812
gen mon24 = 0 
replace mon24 = date-200713 if date >=200701 & date <=200712
replace mon24 = date-200900 if date >200901 & date <=200912
gen morethan2008_age = 0
replace morethan2008_age = mon24 if date >200812

drop if date >=200801 & date <= 200812 /// Create 'donought'

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf smb hml morethan2008 mon24 morethan2008_age if date>=200701 & date<=200912
}
