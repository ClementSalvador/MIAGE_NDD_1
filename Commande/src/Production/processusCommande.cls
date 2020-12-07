/// 
Class Production.processusCommande Extends Ens.BusinessProcessBPL
{

/// This BPLError block indicates that a BPL Diagram 
/// containing errors was saved.
/// To correct this class:
/// * Open it using the Studio BPL Editor,
/// * Correct the errors, and,
/// * Save the diagram.
/// Do not edit the contents of the BPLError block
/// or you may lose your diagram.
XData BPLError
{
<diagram Name="Production.processusCommande" Width="2000" Height="2000" Layout="automatic" Language="objectscript" Request="msg.commandeDmde" Response="msg.commandeRpse" LastModified="" Version="" Includes="" ShowAnnotation="0">
<shape _index="0" _Type="start" Name="" xPos="423" yPos="157" />
<shape _index="1" _Type="end" Name="" xPos="269" yPos="538" />
<shape _index="2" _Type="call" Name="call_catalogue" xPos="513" yPos="273" Async="0" Target="Catalogue" Timeout="" >
<request type='msg.consulterVoitureCatalogueDmde' >
<assign property="callrequest.marque" value="request.marque" action="set" />
<assign property="callrequest.modele" value="request.modele" action="set" />
</request>
<response type='msg.consulterVoitureCatalogueRpse' />
</shape>
<shape _index="3" _Type="if" Name="Check in catalogue" xPos="517" yPos="392" Condition="response.codeRetour = &quot;OK&quot;" />
<shape _index="4" _Type="join" Name="" xPos="757" yPos="514" />
<shape _index="6" _Type="transform" Name="trnasform voiture to catalogue" xPos="760" yPos="619" Class="Transform.WsCatalogueToCatalogue" Source="" Target="" />
<connection _Type="connector" Name="" from="0" to="2"/>
<connection _Type="connector" Name="" from="2" to="3"/>
<connection _Type="connector" Name="true" from="3" to="4" ConnectType="branch"/>
<connection _Type="connector" Name="false" from="3" to="1" ConnectType="branch"/>
<connection _Type="connector" Name="" from="4" to="6"/>
</diagram>
}

}
