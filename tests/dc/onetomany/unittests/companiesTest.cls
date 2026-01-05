Class dc.onetomany.unittests.companiesTest Extends %UnitTest.TestCase
{

Method TestCompanySalesTotal103() As %Status
{
    Set sc = $$$OK
    Set tRS = ##class(%ResultSet).%New("dc.onetomany.companies:CompanySalesTotal")
    Do tRS.Execute(103)
    Do $$$AssertTrue(tRS.Next(), "Expected a row for companyid 103.")
    Set total = +tRS.Get("totalsales")
    Do $$$AssertEquals(17000, total)
    Do tRS.Close()
    Quit sc
}

Method TestCompanySalesTotal104() As %Status
{
    Set sc = $$$OK
    Set tRS = ##class(%ResultSet).%New("dc.onetomany.companies:CompanySalesTotal")
    Do tRS.Execute(104)
    Do $$$AssertTrue(tRS.Next(), "Expected a row for companyid 104.")
    Set total = +tRS.Get("totalsales")
    Do $$$AssertEquals(7000, total)
    Do tRS.Close()
    Quit sc
}

}
