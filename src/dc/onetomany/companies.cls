/// 
Class dc.onetomany.companies Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {irisowner}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = companies ]
{

Property id As %Library.BigInt [ SqlColumnNumber = 2 ];

Property name As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 3 ];

Property industry As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 4 ];

Property description As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 5 ];

Property website As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 6 ];

Parameter ALLOWIDENTITYINSERT = 1;

Parameter USEEXTENTSET = 1;

Query CompaniesBySales() As %SQLQuery(CONTAINID = 1, ROWSPEC = "id:%Integer,name:%String,industry:%String,description:%String,website:%String,totalsales:%Numeric") [ SqlName = CompaniesBySales, SqlProc ]
{
SELECT c.id,
       c.name,
       c.industry,
       c.description,
       c.website,
       SUM(s.saleamountusd) AS totalsales
FROM dc_onetomany.sales s
JOIN dc_onetomany.companies c ON c.id = s.companyid
GROUP BY c.id, c.name, c.industry, c.description, c.website
ORDER BY totalsales DESC
}

Query CompanySalesTotal(companyid As %Integer) As %SQLQuery(CONTAINID = 1, ROWSPEC = "companyid:%Integer,totalsales:%Numeric") [ SqlName = CompanySalesTotal, SqlProc ]
{
SELECT :companyid AS companyid,
       COALESCE(SUM(s.saleamountusd), 0) AS totalsales
FROM dc_onetomany.sales s
WHERE s.companyid = :companyid
}

Index COMPANIESPKEY1 On id [ IdKey, PrimaryKey, SqlName = COMPANIES_PKEY1, Unique ];

Storage Default
{
<Data name="companiesDefaultData">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>industry</Value>
</Value>
<Value name="4">
<Value>description</Value>
</Value>
<Value name="5">
<Value>website</Value>
</Value>
</Data>
<DataLocation>^CbTw.CNuI.1</DataLocation>
<DefaultData>companiesDefaultData</DefaultData>
<ExtentLocation>^CbTw.CNuI</ExtentLocation>
<ExtentSize>10</ExtentSize>
<IdFunction>sequence</IdFunction>
<IdLocation>^CbTw.CNuI.1</IdLocation>
<Index name="COMPANIESPKEY1">
<Location>^CbTw.CNuI.3</Location>
</Index>
<Index name="DDLBEIndex">
<Location>^CbTw.CNuI.2</Location>
</Index>
<Index name="IDKEY">
<Location>^CbTw.CNuI.1</Location>
</Index>
<IndexLocation>^CbTw.CNuI.I</IndexLocation>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="description">
<AverageFieldSize>143.4</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="id">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="industry">
<AverageFieldSize>20.6</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>16.2</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="website">
<AverageFieldSize>28.9</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<SQLMap name="COMPANIES_PKEY1">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^CbTw.CNuI.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
