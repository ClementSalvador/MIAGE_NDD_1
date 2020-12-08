/// 
Class BS.sortieParc Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.sortieParcDmde' response='msg.sortieParcRpse' height='2000' width='2000' >
<sequence xend='200' yend='700' >
<call name='appel_checkReservationExistParPlaque' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.checkReservationExistParPlaqueDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.checkReservationExistParPlaqueRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='Si_LibErreurTrue' condition='response.libErreur= "true"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='appel_supprimerVoitureParPlaque' target='Voiture' async='0' xpos='335' ypos='500' >
<request type='msg.supprimerVoitureDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
</request>
<response type='msg.supprimerVoitureRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
