Class BS.ServiceReservation Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "ServiceReservation";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    set tsc = $CASE(pHint,
        "creerReservation":..creerReservation(pInput,.pOutput),
        "checkReservationParPlaque":..checkReservationParPlaque(pInput,.pOutput),
	 	: $$$ERROR($$$NotImplemented)
    )
    Quit tsc
}

Method creerReservation(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("reserv",pInput,.pOutput)
    Quit $$$OK
}

Method checkReservationParPlaque(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set tsc = ..SendRequestSync("Reservation",pInput,.pOutput)
    Quit $$$OK
}

}
