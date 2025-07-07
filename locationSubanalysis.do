dtable  if boardingtime >= 4 & boardingtime <= 48, cont(boardingtime  pulse resp sbp temp age charlsonweightedscore glu na k co2 lactate hgb wbc plt, statistics(q2 iqi) test(kwallis)) factor(hispanic_y_n catpatientracenum catgendernum chiefcomplaintNum previousadmit overnightadmit year catadi twentyeightdaymortality) define(iqi = q1 q3) sformat("[%s]" iqi) by(locationnamenum, tests nototal) export(table4.docx, replace)

/**/
logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum i1.co2Num sbp pulse resp temp i.catpatientracenum i2.catgendernum i1.gluNum i1.hgbNum i1.kNum i1.naNum i1.pltNum i1.wbcNum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48 & locationnamenum == 3

etable

/**/
logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum i1.co2Num sbp pulse resp temp i.catpatientracenum i2.catgendernum i1.gluNum i1.hgbNum i1.kNum i1.naNum i1.pltNum i1.wbcNum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48 & locationnamenum == 1

etable, append

/**/
logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum i1.co2Num sbp pulse resp temp i.catpatientracenum i2.catgendernum i1.gluNum i1.hgbNum i1.kNum i1.naNum i1.pltNum i1.wbcNum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48 & locationnamenum == 5

etable, append

/**/
logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum i1.co2Num sbp pulse resp temp i.catpatientracenum i2.catgendernum i1.gluNum i1.hgbNum i1.kNum i1.naNum i1.pltNum i1.wbcNum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48 & locationnamenum == 4

etable, append

/**/
logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum i1.co2Num sbp pulse resp temp i.catpatientracenum i2.catgendernum i1.gluNum i1.hgbNum i1.kNum i1.naNum i1.pltNum i1.wbcNum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48 & locationnamenum == 2

etable, append
etable, append column(index) title(Location Specific Model) export(multiModel.xlsx, replace) cstat(_r_b, nformat(%6.2f)) cstat(_r_ci, nformat(%6.2f) cidelimiter(","))

