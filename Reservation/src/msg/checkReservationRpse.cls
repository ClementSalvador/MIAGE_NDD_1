Class msg.checkReservationRpse Extends msg.basic.reponse
{

Property plaque As %String;

Storage Default
{
<Data name="checkReservationRpseDefaultData">
<Subscript>"checkReservationRpse"</Subscript>
<Value name="1">
<Value>plaque</Value>
</Value>
</Data>
<DefaultData>checkReservationRpseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
