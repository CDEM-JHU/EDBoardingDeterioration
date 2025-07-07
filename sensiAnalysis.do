/*Data Importation for Sesntivity Analysis Dataset */
cd ""
import delimited senstivtyDataset.csv
encode catpatientrace, generate(catpatientracenum)
encode catgender, generate(catgendernum)
replace timetohighloc = 0 if timetohighloc  == .
encode co2binsens, gen(co2NumSens)
encode glubinsens, gen(gluNumSens)
encode hgbbinsens, gen(hgbNumSens)
encode kbinsens, gen(kNumSens)
encode lactatebinsens, gen(lactateNumSens)
encode nabinsens, gen(naNumSens)
encode pltbin, gen(pltNumSens)
encode wbcbinsens, gen(wbcNumSens)
encode co2binstrict, gen(co2NumStrict)
encode glubinstrict, gen(gluNumStrict)
encode hgbbinstrict, gen(hgbNumStrict)
encode kbinstrict, gen(kNumStrict)
encode lactatebinstrict, gen(lactateNumStrict)
encode nabinstrict, gen(naNumStrict)
encode pltbinstrict, gen(pltNumStrict)
encode wbcbinstrict, gen(wbcNumStrict)
encode chiefcomplaint, gen(chiefcomplaintNum)
encode locationname, gen(locationnamenum)
egen standboardingtime = std(boardingtime)

/*Logistic Regression for Senstive Crtieria */

logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNumSens b3.co2NumSens pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNumSens b3.hgbNumSens b3.kNumSens b3.naNumSens b3.pltNumSens b3.wbcNumSens b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48, or 
estimates store modelSensAll

logistic edupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore  b3.lactateNumSens b3.co2NumSens pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNumSens b3.hgbNumSens b3.kNumSens b3.naNumSens b3.pltNumSens b3.wbcNumSens b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48, or 
estimates store modelSensEd

/*Logistic Regression for Strict Crtieria */

logistic upgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore b3.lactateNumStrict b3.co2NumStrict pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNumStrict b3.hgbNumStrict b3.kNumStrict b3.naNumStrict b3.pltNumStrict b3.wbcNumStrict b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48, or 
estimates store modelStrictAll


logistic edupgrade standboardingtime age i1.hispanic_y_n charlsonweightedscore  b3.lactateNumStrict b3.co2NumStrict pulse sbp resp temp  i.catpatientracenum i2.catgendernum b3.gluNumStrict b3.hgbNumStrict b3.kNumStrict b3.naNumStrict b3.pltNumStrict b3.wbcNumStrict b2.locationnamenum standnumedpatientsindepartment standnumedpatientsboarding standnumpatientsinhospital overnightadmit previousadmit b3.chiefcomplaintNum  i.catadi b2018.year if boardingtime >= 4 & boardingtime <=48, or 
estimates store modelStrictEd

esttab modelSensAll modelSensEd modelStrictAll modelStrictEd using "sensi_analysis.rtf",eform ci(2) b(2) nostar wide title("modelSensAll" "modelSensEd" "modelStrictAll" "modelStrictEd") replace substitute("[" "(" "]" ")" "," " - ")