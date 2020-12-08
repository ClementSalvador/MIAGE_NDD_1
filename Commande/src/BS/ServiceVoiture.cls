Class BS.ServiceVoiture Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceVoiture";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "CommandeVoiture":..CommandeVoiture(pInput,.pOutput),
        "sortieParcVoiture":..sortieParcVoiture(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method CommandeVoiture(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("processusCommande",pInput,.pOutput)
    Quit $$$OK
}

Method sortieParcVoiture(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("sortieParc",pInput,.pOutput)
    Quit $$$OK
}

}
