/// 
Class BS.reservation Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='msg.reservationDmde' response='msg.reservationRpse' height='2000' width='2000' >
<context>
<property name='plaque' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='700' >
<call name='appel_checkreservation' target='Reservation' async='0' xpos='200' ypos='250' >
<request type='msg.checkReservationDmde' >
<assign property="callrequest.categorie" value="request.categorie" action="set" />
<assign property="callrequest.dateDebut" value="request.dateDebut" action="set" />
<assign property="callrequest.dateFin" value="request.dateFin" action="set" />
</request>
<response type='msg.checkReservationRpse' >
<assign property="response.codeRetour" value="callresponse.codeRetour" action="set" />
<assign property="context.plaque" value="callresponse.plaque" action="set" />
<assign property="response.libErreur" value="callresponse.libErreur" action="set" />
</response>
</call>
<if name='si_codeRetourEstOK' condition='response.codeRetour="OK"' xpos='200' ypos='350' xend='200' yend='600' >
<true>
<call name='call_creerReservation' target='Reservation' async='0' xpos='335' ypos='500' >
<request type='msg.creerReservationDmde' >
<assign property="callrequest.plaque" value="context.plaque" action="set" />
<assign property="callrequest.dateDebut" value="request.dateDebut" action="set" />
<assign property="callrequest.dateFin" value="request.dateFin" action="set" />
</request>
<response type='msg.creerReservationRpse' />
</call>
</true>
</if>
</sequence>
</process>
}

}
