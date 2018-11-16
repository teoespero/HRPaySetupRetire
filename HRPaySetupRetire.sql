/*
	
	HRPaySetupRetire
	The HRPaySetupRetire table contains STRS and PERS membership information for the employee.
*/

select 
	DistrictID,
	rtrim(DistrictAbbrev) as DistrictAbbrev,
	DistrictTitle
from tblDistrict

select 
	(select DistrictId from tblDistrict) as OrgId,
	te.EmployeeID as EmpId,
	te.Fullname,
	te.SocSecNo,
	null as DateFrom,
	null as DateThru,
	null as RetirePlanCode,
	null as RetirePlanOpt,
	null as PERSForceAfterTax,
	null as RetirePlanPrimary,
	null as RetireStatusCode,
	null as MembershipType,
	null as MembershipDate,
	null as PERSDisallowModification,
	null as PERSCoverageGroup,
	null as PERSSurvivorBenefit,
	null as PERSWorkSched,
	null as PERSApptDateFrom,
	null as PERSApptDateThru,
	null as STRSAssignmentCode,
	null as Comment,
	retCert.RetireClass as CertRetireType,
	retPERS.RetireClass as ClassRetireType,
	te.REtirementAccountId,
	te.RetirementNote,
	te.CertRetireNum,
	te.ClassRetireNum,
	te.ClassRetireNum2,
	CONVERT(VARCHAR(10), te.CertRetirePlanDate, 110) as CertRetirePlanDate,
	CONVERT(VARCHAR(10), te.CertRetirePlanDate2, 110) as CertRetirePlanDate2,
	te.CertQualification,
	CONVERT(VARCHAR(10), te.ClassRetirePlanDate, 110) as ClassRetirePlanDate,
	CONVERT(VARCHAR(10), te.ClassRetirePlanDate2, 110) as ClassRetirePlanDate2,
	te.ClassQualification,
	te.CertRetirementDate,
	te.ClassRetirementDate
from tblEmployee te
left join
	tblRetireClass retCert
	on te.CertRetireId = retCert.RetireClassID
left join
	tblRetireClass retPERS
	on te.ClassRetireId = retPERS.RetireClassID
where
	te.TerminateDate is null
	and te.EmployeeID > 0
