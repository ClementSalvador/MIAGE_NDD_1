Class msg.checkReservationDmde Extends Ens.Request
{

Property categorie As %String;

Property dateDebut As %TimeStamp;

Property dateFin As %TimeStamp;

Storage Default
{
<Data name="checkReservationDmdeDefaultData">
<Subscript>"checkReservationDmde"</Subscript>
<Value name="1">
<Value>categorie</Value>
</Value>
<Value name="2">
<Value>dateDebut</Value>
</Value>
<Value name="3">
<Value>dateFin</Value>
</Value>
</Data>
<DefaultData>checkReservationDmdeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
