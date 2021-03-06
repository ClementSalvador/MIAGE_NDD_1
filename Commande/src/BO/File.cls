Class BO.File Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.pushVoitureFileDmde, Output pResponse As msg.pushVoitureFileRpse) As %Status
{
    set pResponse = ##class(msg.pushVoitureFileRpse).%New()
    Set stream = ##class(%Library.FileBinaryStream).%New()
    do stream.Write(pRequest.voiture.marque_";"_pRequest.voiture.modele_";"_pRequest.voiture.categorie_";"_pRequest.voiture.plaque_";"_pRequest.voiture.couleur_";"_pRequest.voiture.nbPlaces) 

    Do ..Adapter.PutStream("nouvelleVoiture.csv",stream)
    set pResponse.codeRetour = "OK"

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
     <MapItem MessageType="msg.pushVoitureFileDmde">
        <Method>creerVoiture</Method>
    </MapItem>
</MapItems>
}

}
