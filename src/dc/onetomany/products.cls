/// 
Class dc.onetomany.products Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {irisowner}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = products ]
{

Property id As %Library.BigInt [ SqlColumnNumber = 2 ];

Property name As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 3 ];

Property listpriceusd As %Library.BigInt [ SqlColumnNumber = 4 ];

Property description As %Library.String(MAXLEN = 65535) [ SqlColumnNumber = 5 ];

Parameter ALLOWIDENTITYINSERT = 1;

Parameter USEEXTENTSET = 1;

Index PRODUCTSPKEY1 On id [ IdKey, PrimaryKey, SqlName = PRODUCTS_PKEY1, Unique ];

Storage Default
{
<Data name="productsDefaultData">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>listpriceusd</Value>
</Value>
<Value name="4">
<Value>description</Value>
</Value>
</Data>
<DataLocation>^CbTw.DI42.1</DataLocation>
<DefaultData>productsDefaultData</DefaultData>
<ExtentLocation>^CbTw.DI42</ExtentLocation>
<ExtentSize>4</ExtentSize>
<IdFunction>sequence</IdFunction>
<IdLocation>^CbTw.DI42.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^CbTw.DI42.2</Location>
</Index>
<Index name="IDKEY">
<Location>^CbTw.DI42.1</Location>
</Index>
<Index name="PRODUCTSPKEY1">
<Location>^CbTw.DI42.3</Location>
</Index>
<IndexLocation>^CbTw.DI42.I</IndexLocation>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="description">
<AverageFieldSize>119.25</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="id">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="listpriceusd">
<AverageFieldSize>4.25</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="name">
<AverageFieldSize>19.25</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<SQLMap name="PRODUCTS_PKEY1">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^CbTw.DI42.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
