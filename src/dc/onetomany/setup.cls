Class dc.onetomany.setup Extends %RegisteredObject
{

/// Data Init
ClassMethod Init(path As %String) As %Status
{
        Set sc = $$$OK
        set path = $get(path,"/home/irisowner/dev/data/")
        // do something
        do ##class(shvarov.csvgenpy.csv).Generate(path_"companies.csv","companies","dc_onetomany",,,1,"id")
        do ##class(shvarov.csvgenpy.csv).Generate(path_"products.csv","products","dc_onetomany",,,1,"id")
        do ##class(shvarov.csvgenpy.csv).Generate(path_"sales.csv","sales","dc_onetomany")
        
        
        Return sc
}

// 

}
