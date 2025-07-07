histogram boardingtime if  boardingtime >= 4 & boardingtime <= 48, bin(48)

dtable if boardingtime >= 4 & boardingtime <= 48, cont(boardingtime pulse resp sbp temp age charlsonweightedscore na k glu co2 lactate hgb wbc plt, statistics(q2 iqi)) factor(locationnamenum  hispanic_y_n catpatientracenum catgendernum previousadmit overnightadmit year twentyeightdaymortality) define(iqi = q1 q3) sformat("[%s]" iqi) export(table1.docx, replace)

dtable  if boardingtime >= 4 & boardingtime <= 48, cont(boardingtime pulse resp sbp temp age charlsonweightedscore, statistics(q2 iqi) test(kwallis)) factor(co2Num gluNum hgbNum kNum lactateNum naNum pltNum wbcNum locationnamenum  hispanic_y_n catpatientracenum catgendernum previousadmit overnightadmit year twentyeightdaymortality) define(iqi = q1 q3) sformat("[%s]" iqi) by(upgrade, tests nototal) export(table2.docx, replace)

dtable  if boardingtime >= 4 & boardingtime <= 48, cont(age boardingtime pulse resp sbp temp  charlsonweightedscore standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital, statistics(q2 iqi) test(kwallis)) factor(co2Num gluNum hgbNum kNum lactateNum naNum pltNum wbcNum locationnamenum  hispanic_y_n catpatientracenum catgendernum previousadmit overnightadmit year catadi chiefcomplaintNum) define(iqi = q1 q3) sformat("[%s]" iqi) by(edupgrade, tests nototal) export(table3.docx, replace)

sum boardingtime if floorupgrade == 1 & boardingtime >= 4 & boardingtime <= 48, detail

quietly logistic upgrade standboardingtime if boardingtime >= 4 & boardingtime <=48 
quietly etable
quietly logistic upgrade b3.co2Num if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.gluNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append
quietly logistic upgrade b3.kNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly quietly logistic upgrade b3.lactateNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.naNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.pltNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.wbcNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic upgrade b3.hgbNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.pltNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade pulse if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic upgrade resp if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade sbp if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic upgrade spo2 if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade temp if boardingtime >= 4 & boardingtime <=48  
quietly etable, append
quietly logistic upgrade age if boardingtime >= 4 & boardingtime <=48  
quietly etable, append
quietly logistic upgrade b3.catpatientracenum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b1.catgendernum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.locationnamenum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade standnumedpatientsindepartment if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade hispanic_y_n  if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade i.catadi if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade charlsonweightedscore if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic upgrade standnumedpatientsboarding if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade standnumpatientsinhospital if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade overnightadmit if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic upgrade previousadmit if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
quietly logistic upgrade b3.chiefcomplaintNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append
etable, append column(index) title(Univariate Analysis for Upgrade) export(univariateUpgrade.xlsx, replace) cstat(_r_b, nformat(%6.2f)) cstat(_r_ci, nformat(%6.2f) cidelimiter(","))


quietly logistic edupgrade standboardingtime if boardingtime >= 4 & boardingtime <=48 
quietly etable
quietly logistic edupgrade b3.co2Num if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic edupgrade b3.gluNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b3.kNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b3.lactateNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append  
quietly logistic edupgrade b3.naNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append  
quietly logistic edupgrade b3.pltNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append 
quietly logistic edupgrade b3.wbcNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b3.hgbNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append  
quietly logistic edupgrade b3.pltNum if boardingtime >= 4 & boardingtime <=48
quietly etable, append  
quietly logistic edupgrade pulse if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade resp if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade sbp if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade spo2 if boardingtime >= 4 & boardingtime <=48
quietly etable, append  
quietly logistic edupgrade temp if boardingtime >= 4 & boardingtime <=48  
quietly etable, append 
quietly logistic edupgrade age if boardingtime >= 4 & boardingtime <=48  
quietly etable, append 
quietly logistic edupgrade b3.catpatientracenum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b1.catgendernum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b3.locationnamenum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade standnumedpatientsindepartment if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade hispanic_y_n  if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade i.catadi if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade charlsonweightedscore if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade standnumedpatientsboarding if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade standnumpatientsinhospital if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade overnightadmit if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade previousadmit if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
quietly logistic edupgrade b3.chiefcomplaintNum if boardingtime >= 4 & boardingtime <=48 
quietly etable, append 
etable, append column(index) title(Univariate Analysis for ED Upgrade) export(univariateEdUpgrade.xlsx, replace) cstat(_r_b, nformat(%6.2f)) cstat(_r_ci, nformat(%6.2f) cidelimiter(","))


logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48
etable, title(Multivariate for Upgrade) export(multivariateUpgrade.xlsx, replace) cstat(_r_b, nformat(%6.2f)) cstat(_r_ci, nformat(%6.2f) cidelimiter(","))

logistic edupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num sbp pulse resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48
etable, title(Multivariate for Upgrade) export(multivariateEdUpgrade.xlsx, replace) cstat(_r_b, nformat(%6.2f)) cstat(_r_ci, nformat(%6.2f) cidelimiter(","))


logistic twentyeightdaymortality upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num sbp pulse resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48


logistic twentyeightdaymortality edupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num sbp pulse resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48


gen hour = floor(boardingtime)

tabulate hour upgrade if boardingtime <= 48, row
tabulate hour edupgrade if boardingtime <= 48, row