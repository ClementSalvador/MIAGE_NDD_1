Class BO.Reservation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerReservation(pRequest As msg.creerReservationDmde, Output pResponse As msg.creerReservationRpse) As %Status
{
    set pResponse = ##class(msg.creerReservationRpse).%New()

    set reservation = ##class(data.Reservation).%New()
    set reservation.dateDebut = pRequest.dateDebut
    set reservation.dateFin = pRequest.dateFin
    do ##class(data.Voiture).consulterParPlaqueExists(pRequest.plaque,.idVoiture)
    set reservation.voiture = ##class(data.Voiture).%OpenId(idVoiture)
    do reservation.%Save()
    
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

Method checkReservationExist(pRequest As msg.checkReservationDmde, Output pResponse As msg.checkReservationRpse) As %Status
{
    set pResponse = ##class(msg.checkReservationRpse).%New()
    set pResponse.plaque = "000-00-00"
    set pResponse.codeRetour = "KO"
    set pResponse.libErreur = "Aucune voitures disponibles"

    set sql = "select plaque from data.Voiture where categorie ='"_pRequest.categorie_"' and plaque not in ("
    set sql = sql_" SELECT voiture->plaque FROM data.Reservation where voiture->categorie = '"_pRequest.categorie_"'"
    set sql = sql_" and ((dateDebut >='"_pRequest.dateDebut_"' and dateDebut <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateFin >= '"_pRequest.dateDebut_"' and dateFin <= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut <= '"_pRequest.dateDebut_"' and dateFin >= '"_pRequest.dateFin_"' ) "
    set sql = sql_" or (dateDebut >= '"_pRequest.dateDebut_"' and dateFin <='"_pRequest.dateFin_"' )) "
    set sql = sql_" ) "

    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set SQLRequest = statement.%Execute()

    While SQLRequest.%Next(){
        set pResponse.plaque = SQLRequest.%Get("plaque")
        set pResponse.codeRetour = "OK"
        set pResponse.libErreur = ""
    }
    
    Quit $$$OK
}

/**
    Vérifie si il existe une réservation dans le future pour une voiture dont on passe la plaque
    On return true si on a aucune réservation bloquante sinon false
*/
Method checkReservationParPlaque(pRequest As msg.checkReservationParPlaqueDmde, Output pResponse As msg.checkReservationParPlaqueRpse) As %Status
{
    set pResponse = ##class(msg.checkReservationRpse).%New()
    set pResponse.codeRetour = "OK"
    set pResponse.libErreur = "true"

    PRINT pRequest

    set sql = "SELECT voiture "
    set sql = sql_"FROM data.Reservation "
    set sql = sql_"WHERE voiture->plaque = '"_pRequest.plaque_"' AND dateFin >= NOW() "

    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set SQLRequest = statement.%Execute()

     While SQLRequest.%Next(){
        set pResponse.libErreur = "false"
     }

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerReservationDmde">
        <Method>creerReservation</Method>
    </MapItem>
    <MapItem MessageType="msg.checkReservationDmde">
        <Method>checkReservationExist</Method>
    </MapItem>
    <MapItem MessageType="msg.checkReservationParPlaqueDmde">
        <Method>checkReservationParPlaque</Method>
    </MapItem>
</MapItems>
}

}
