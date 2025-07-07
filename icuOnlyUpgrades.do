/*Data Importation for Sesntivity Analysis Dataset */
cd ""
import delimited icuOnlySesit.csv

/*Generate variables*/
encode catpatientrace, generate(catpatientracenum)
encode catgender, generate(catgendernum)
replace timetohighloc = 0 if timetohighloc  == .
encode co2bin, gen(co2Num)
encode glubin, gen(gluNum)
encode hgbbin, gen(hgbNum)
encode kbin, gen(kNum)
encode lactatebin, gen(lactateNum)
encode nabin, gen(naNum)
encode pltbin, gen(pltNum)
encode wbcbin, gen(wbcNum)
encode chiefcomplaint, gen(chiefcomplaintNum)
encode locationname, gen(locationnamenum)
egen standboardingtime = std(boardingtime)
/*generate loc change variables*/
gen edicuupgrade = (icuupgrade == 1 & edupgrade == 1)
gen imcupgrade = (upgrade == 1 & icuupgrade != 1)
gen imcedupgrade = (edupgrade == 1 & icuupgrade != 1)

histogram boardingtime if  boardingtime >= 4 & boardingtime <= 48, bin(48)

dtable if boardingtime >= 4 & boardingtime <= 48, cont(boardingtime pulse resp sbp temp age charlsonweightedscore na k glu co2 lactate hgb wbc plt, statistics(q2 iqi)) factor(locationnamenum  hispanic_y_n catpatientracenum catgendernum previousadmit overnightadmit year twentyeightdaymortality) define(iqi = q1 q3) sformat("[%s]" iqi)

dtable  if boardingtime >= 4 & boardingtime <= 48, cont(boardingtime pulse resp sbp temp age charlsonweightedscore, statistics(q2 iqi) test(kwallis)) factor(co2Num gluNum hgbNum kNum lactateNum naNum pltNum wbcNum locationnamenum  hispanic_y_n catpatientracenum catgendernum previousadmit overnightadmit year twentyeightdaymortality) define(iqi = q1 q3) sformat("[%s]" iqi) by(icuupgrade, tests nototal)




logistic icuupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48

estimates store icuupgradeModel

logistic edicuupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48

estimates store edicuupgradeModel

logistic imcupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48

estimates store imcupgradeModel

logistic imcedupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48

estimates store edimcupgradeModel

esttab icuupgradeModel edicuupgradeModel imcupgradeModel edimcupgradeModel using "sensi_loc_analysis.rtf",eform ci(2) b(2) nostar wide title("icuupgradeModel" "edicuupgradeModel" "imcupgradeModel" "edimcupgradeModel") replace substitute("[" "(" "]" ")" "," " - ")


logistic twentyeightdaymortality icuupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num sbp pulse resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48

logistic twentyeightdaymortality imcupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNum b3.co2Num sbp pulse resp temp  i.catpatientracenum i2.catgendernum b3.gluNum b3.hgbNum b3.kNum b3.naNum b3.pltNum b3.wbcNum b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48