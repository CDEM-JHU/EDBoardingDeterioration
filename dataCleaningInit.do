cd ""
import delimited dataCohortClean0.0.1.csv
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