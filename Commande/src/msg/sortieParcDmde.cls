Class msg.sortieParcDmde Extends (Ens.Request, %JSON.Adaptor)
{

Property plaque As %String;

Storage Default
{
<Data name="sortieParcDmdeDefaultData">
<Subscript>"sortieParcDmde"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>sortieParcDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
