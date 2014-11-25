<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page import="com.lyra.vads.test.action.OrderAction"%>
<%@page import="com.lyra.vads.util.PlatformUtil"%>

<html:xhtml/>

<%
if (PlatformUtil.isProductionPlatform() && (session == null || session.getAttribute("userObject") == null) ) {
	request.setAttribute("comeBackForward", "order");
%>
<logic:redirect forward="initLogin" paramId="comeBackTo"
	paramName="comeBackForward" />
<%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" type="image/x-icon" href="/static/<%=com.lyra.vads.product.ProductInformation.getProductVersion()%>/images/favicons/lyra.ico"/>
<title>Page de paiment de test pour Lyra</title>
<style type="text/css">
body{
font: 0.85em arial;
text-align: left;
}

h1 {
	text-align: center;
	margin-bottom: 10px;
}

fieldset {
	width: 1000px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 15px;
	border: 1px solid #B5B8C8;
}

legend {
	color: #15428B;
    font: bold 15px tahoma,arial,helvetica,sans-serif;
}

.paramV1,.paramV2 { /*line-height: 10px;
	margin-top: 2px;
	margin-bottom: 2px;
	clear: both;*/
	height: 25px;
	width: 480px;
	display: block;
	float: left;
	margin-right: 20px;
	margin-bottom: 3px;
    margin-top: 3px;
}

.paramV1 { /* TODO icone en background ? couleur ? */

}

.paramV2 { /* TODO icone en background ? couleur ? */

}

.paramV1 label,.paramV2 label {
	display: block;
	float: left;
	width: 240px;
}

.paramV1 input,.paramV2 input,.paramV1 select,.paramV2 select {
	display: block;
	float: left;
	width: 220px;
	font: 90%/180% "Trebuchet MS", "Lucida Grande", "Bitstream Vera Sans",
		Arial, Helvetica, sans-serif;
	color:#666666;
}

.links_table {
	border: 1px dotted #B5B8C8;
}

.links_table td{
	height: 2em;
    padding: 0 5px;
    text-align: left;
    font-size: 0.9em;
}

.params {
width:30%;
float:left;
margin-left: 10%;
}

.ensureDivHeight {
	clear:both;
	visibility : hidden;
}

.button {
	background-image: url('images/batchman.png');
	background-repeat: no-repeat;
	width:64px;
	height:97px;
	margin-left:auto;
	margin-right:auto;
	border:none;
	cursor:pointer;
}

.button:hover {
	background-image: url('images/batchman_hover.png');
	background-repeat: no-repeat;
	width:64px;
	height:97px;
	margin-left:auto;
	margin-right:auto;
	border:none;
	cursor:pointer;
}

.accessKeyTip {
	text-decoration: underline;
	font-weight: bold;
}

/*
.extinfo-key label,.extinfo-value label,.extinfo-key input,.extinfo-value input
{
	display: block;
	float: left;
	width: 100px;
	margin-right: 20px;
}

.extinfo-key {
	clear: both;
}

.logout {
font: 0.8em arial;
}

//*/
</style>
</head>
<body>
<%
		if (PlatformUtil.isProductionPlatform()) {
	%>
	<p>
		<a class="logout" href="logout.do?comeBackTo=order">Déconnexion</a>
	</p>
	<%
}
%>
	<h1>Test de l'interface de paiement</h1>
	<html:form action="/order.do" method="post">
		<input type="hidden" name="action" value="execute" />

		<%
			if (PlatformUtil.isTestPlatform() || PlatformUtil.isDevelopmentPlatform()) {
		%>
		<table style="margin-left: 10%;">
			<tr>
			<td rowspan="2"><table class="links_table" >
				<!-- PayZen -->
				<tr>
					<td><b>PayZen</b></td>
					<td><a href="order.do?config=payzen_test">Test</a></td>
							<td><a href="order.do?config=sonde_interne">Sonde
									Interne</a></td>
							<td><a href="order.do?config=amexglobal_test">AmexGlobal
									Test</a></td>
							<td><a href="order.do?config=payzen_pit_testing">PIT
									Testing</a></td>
					<td><a href="order.do?config=cof3xcb_test">Cof3XCB Test</a></td>
					<td><a href="order.do?config=gicc_test">GICC Test</a></td>
					<td><a href="order.do?config=cybs_test">Cybs Test</a></td>
					<td><a href="order.do?config=risk_test">Risk Test</a></td>
				</tr>

				<tr>
					<td></td>
					<td><a href="order.do?config=payzen_prod">Prod</a></td>
							<td><a href="order.do?config=sonde_externe">Sonde
									Externe</a></td>
							<td><a href="order.do?config=amexglobal_prod">AmexGlobal
									Prod</a></td>
					<td><a href="order.do?config=payzen_paysafecard">Paysafecard</a></td>
							<td><a href="order.do?config=payzen_banque_accord">Banque
									Accord</a></td>
					<td><a href="order.do?config=wirecard_test">Germany Test</a></td>
					<td><a href="order.do?config=wirecard_prod">Germany Prod</a></td>
				</tr>
			</table></td>
			<td rowspan="2"><table class="links_table" >
				<!-- SYSTEMPAY -->
				<tr>
					<td><b>SYSTEMPAY</b></td>
					<td><a href="order.do?config=systempay_test">BP Test</a></td>
					<td><a href="order.do?config=ce_test">CE Test</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="order.do?config=systempay_prod">BP Prod</a></td>
					<td><a href="order.do?config=ce_prod">CE Prod</a></td>
				</tr>
			</table></td>
			<td rowspan="2" colspan="2"><table class="links_table">
				<!-- BRASIL -->
				<tr>
					<td><b>BRASIL</b></td>
					<td><a href="order.do?config=brasil_test">Test</a></td>
					<td><a href="order.do?config=sonde_interne_brasil">Sonde
							Interne</a></td>
					<td><a href="order.do?config=brasil_clearsale_test">ClearSale
							Test</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="order.do?config=brasil_prod">Prod</a></td>
					<td><a href="order.do?config=sonde_externe_brasil">Sonde Externe</a></td>

				</tr>
			</table></td>
			</tr>
			</table>
			<table style="margin-left: 10%;">
			<tr>

				<td><table class="links_table">
						<!-- INNOCARD -->
						<tr>
							<td><b>INNOCARD</b></td>
							<td><a href="order.do?config=innocard_test">Test</a></td>
							<td><a href="order.do?config=innocard_prod">Prod</a></td>
						</tr>
					</table></td>
				<td><table class="links_table">
					<!-- EDEL -->
					<tr>
						<td><b>EDEL</b></td>
						<td><a href="order.do?config=edel_test">Test</a></td>
						<td><a href="order.do?config=edel_prod">Prod</a></td>
					</tr>
				</table></td>
				<td><table class="links_table">
					<!-- OSB -->
					<tr>
						<td><b>OSB</b></td>
						<td><a href="order.do?config=osb_test">Test</a></td>
						<td><a href="order.do?config=osb_prod">Prod</a></td>
					</tr>
				</table></td>
				<td><table class="links_table">
						<!-- MAIL_FOR_GOOD -->
						<tr>
							<td><b>MAIL FOR GOOD</b></td>
							<td><a href="order.do?config=mail_for_good_test">Test</a></td>
							<td><a href="order.do?config=mail_for_good_prod">Prod</a></td>
						</tr>
				</table></td>

        <td><table class="links_table">
            <!-- India -->
            <tr>
              <td><b>INDIA</b></td>
              <td><a href="order.do?config=india_test">Test</a></td>
              <td><a href="order.do?config=india_prod">Prod</a></td>
            </tr>
        </table></td>
        <td>
        	<!-- Chilli -->
        	<table class="links_table">
        	<tr>
        		<td><b>CHILI</b></td>
        		<td><a href="order.do?config=chili_test">Test</a></td>
        	</tr>
        	</table>
        </td>
			</tr>
		</table>
		<%
			}
		%>

		<!-- Paramètres appli vads-test -->
		<table align="center" class="params">
			<tr>
				<td class="col1">Version application de paiement :</td>
				<td><html:select property="version" styleId="version">
						<html:option value="V1" />
						<html:option value="V2" />
						<html:option value="01" />
						<html:option value="V 1" />
						<html:option value="" />
						<html:option value="0123456789" />
					</html:select></td>
			</tr>
			<tr>
				<td class="col1">Pas de soumission auto (debug):</td>
				<td><html:checkbox property="noSubmit" styleId="noSubmit" /></td>
			</tr>
			<tr>
				<td class="col1">Ajouter la signature en param :</td>
				<td><html:checkbox property="addSignature"
						styleId="addSignature" /></td>
			</tr>
		</table>
		<%
			if (/*PlatformUtil.isDevelopmentPlatform()*/false) {
		%>
		<!--  Lol en dev uniquement -->
		<input name="cmd" class="button"
			onclick="javascript:document.forms[0].submit();" />
		<%
			} else {
		%>
		<span style="text-align: center; padding-top: 10px;"> <input
			type="image" src="/static/%vad_version%/%app_name%/images/pay.gif" name="cmd" />
		</span>
		<%
			}
		%>
<hr class="ensureDivHeight"/>

		<!-- Le reste du formulaire -->
		<fieldset>
			<legend accesskey="a"><span class="accessKeyTip">A</span>ccès plateforme</legend>
			<div class="paramV1 paramV2">
				<label>Url page paiement (V1,V2)</label>
				<html:text styleClass="appar" property="url" styleId="url" />
			</div>
			<div class="paramV1 paramV2">
				<label>Identifiant site (V1,V2)</label>
				<html:text styleClass="appar" property="siteId" styleId="siteId" />
			</div>
			<div class="paramV1 paramV2">
				<label>Clef de codage (V1,V2)</label>
				<html:text styleClass="appar" property="key" styleId="key" />
			</div>
			<div class="paramV1 paramV2">
				<label>Contexte (V1,V2)</label>
				<html:select property="ctxMode" styleId="ctxMode">
					<html:option value="PRODUCTION" />
					<html:option value="TEST" />
					<html:option value="PROD" />
					<html:option value="TESTING" />
					<html:option value="&lt;b/&gt;" />
					<html:option value="" />
				</html:select>
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="t">Infos <span class="accessKeyTip">t</span>ransaction</legend>
			<div class="paramV1 paramV2">
				<label>Transaction Id (V1,V2)</label>
				<html:text styleClass="appar" property="transId" styleId="transId" />
			</div>
			<div class="paramV1 paramV2">
				<label>Date du paiement (V1,V2)</label>
				<html:text styleClass="appar" property="date" styleId="date" />
			</div>
			<div class="paramV1 paramV2">
				<label>Montant de la commande (V1,V2)</label>
				<html:text styleClass="appar" property="amount" styleId="amount" />
			</div>
			<div class="paramV1 paramV2">
				<label>Devise (V1,V2)</label>
				<html:text styleClass="appar" property="currency" styleId="currency" />
			</div>
			<div class="paramV1 paramV2">
				<label>Délai remise (V1,V2)</label>
				<html:text styleClass="appar" property="captureDelay"
					styleId="captureDelay" />
			</div>
			<div class="paramV1 paramV2">
				<label>PaymentConfig (V1,V2)</label>
				<html:text styleClass="appar" property="paymentConfig"
					styleId="paymentConfig" />
			</div>
			<div class="paramV1 paramV2">
				<label>Source du paiement (V1,V2)</label>
				<html:select property="paymentSrc" styleId="paymentSrc">
					<html:option value="" />
					<html:option value="BO" />
					<html:option value="MOTO" />
					<html:option value="CC" />
					<html:option value="CPWS" />
					<html:option value="TK" />
					<html:option value="OTHER" />
					<html:option value="ERROR" />
					<html:option value="null" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Page action (V2) 123</label>
				<html:select property="pageAction" styleId="pageAction">
					<html:option value="PAYMENT" />
					<html:option value="REGISTER" />
					<html:option value="REGISTER_UPDATE" />
					<html:option value="REGISTER_PAY" />
					<html:option value="REGISTER_UPDATE_PAY" />
					<html:option value="REGISTER_SUBSCRIBE" />
					<html:option value="REGISTER_PAY_SUBSCRIBE" />
					<html:option value="ASK_REGISTER_PAY" />
					<html:option value="SUBSCRIBE" />
					<html:option value="ERROR" />
				</html:select>
			</div>
			<div class="paramV1 paramV2">
				<label>Mode de validation (V1,V2)</label>
				<html:text styleClass="appar" property="validationMode"
					styleId="validationMode" />
			</div>
			<div class="paramV2">
				<label>Paramètres de step up(V2)</label>
				<html:text styleClass="appar" property="stepUpData"
					styleId="stepUpData" />
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="c">Infos <span class="accessKeyTip">c</span>lient</legend>
			<div class="paramV1 paramV2">
				<label>Id sur le site commerçant (V1,V2)</label>
				<html:text styleClass="appar" property="custId" styleId="custId" />
			</div>
			<div class="paramV2">
				<label>Identifiant paiement 1 clic (V2)</label>
				<html:text styleClass="appar" property="identifierId"
					styleId="identifierId" />
			</div>
			<div class="paramV1 paramV2">
				<label>Nom complet du client (V1,V2)</label>
				<html:text styleClass="appar" property="custName" styleId="custName" />
			</div>
			<div class="paramV2">
				<label>Nom du client (V2)</label>
				<html:text styleClass="appar" property="custLastName"
					styleId="custLastName" />
			</div>
			<div class="paramV2">
				<label>Prénom du client (V2)</label>
				<html:text styleClass="appar" property="custFirstName"
					styleId="custFirstName" />
			</div>
			<div class="paramV2">
				<label>Qualité (V2)</label>
				<html:select property="custStatus" styleId="custStatus" >
					<html:option value="" />
					<html:option value="PRIVATE" />
					<html:option value="COMPANY" />
					<html:option value="INVALID" />
				</html:select>
			</div>
			<div class="paramV1 paramV2">
				<label>Titre du client (V1,V2)</label>
				<html:text styleClass="appar" property="custTitle"
					styleId="custTitle" />
			</div>
			<div class="paramV1 paramV2">
				<label>Numéro d'Adresse du client (V1,V2)</label>
				<html:text styleClass="appar" property="custAddressNumber"
					styleId="custAddressNumber" />
			</div>
			<div class="paramV1 paramV2">
				<label>Adresse du client (V1,V2)</label>
				<html:text styleClass="appar" property="custAddress"
					styleId="custAddress" />
			</div>
			<div class="paramV1 paramV2">
				<label>District du client (V1,V2)</label>
				<html:text styleClass="appar" property="custDistrict"
					styleId="custDistrict" />
			</div>
			<div class="paramV1 paramV2">
				<label>Code postal du client (V1,V2)</label>
				<html:text styleClass="appar" property="custZIP" styleId="custZIP" />
			</div>
			<div class="paramV1 paramV2">
				<label>Ville du client (V1,V2)</label>
				<html:text styleClass="appar" property="custCity" styleId="custCity" />
			</div>
			<div class="paramV1 paramV2">
				<label>Etat du client (V1,V2)</label>
				<html:text styleClass="appar" property="custState"
					styleId="custState" />
			</div>
			<div class="paramV1 paramV2">
				<label>Pays du client (V1,V2)</label>
				<html:text styleClass="appar" property="custCountry"
					styleId="custCountry" />
			</div>
			<div class="paramV1 paramV2">
				<label>Email du client (V1,V2)</label>
				<html:text styleClass="appar" property="custMail" styleId="custMail" />
			</div>
			<div class="paramV1 paramV2">
				<label>Téléphone du client (V1,V2)</label>
				<html:text styleClass="appar" property="custPhone"
					styleId="custPhone" />
			</div>
			<div class="paramV1 paramV2">
				<label>Téléphone portable du client (V1,V2)</label>
				<html:text styleClass="appar" property="custCellPhone"
					styleId="custCellPhone" />
			</div>
			<div class="paramV1 paramV2">
				<label>Informations utilisateur (V1,V2)</label>
				<html:text styleClass="appar" property="userInfo" styleId="userInfo" />
			</div>
			<div class="paramV1 paramV2">
				<label>Données d'authentification (V2)</label>
				<html:text styleClass="appar" property="authenticationData"
					styleId="authenticationData" />
			</div>
			<div class="paramV1 paramV2">
                <label>Raison sociale (V2)</label>
                <html:text styleClass="appar" property="custLegalName" styleId="custLegalName" />
            </div>
		</fieldset>

		<fieldset>
			<legend accesskey="s">Paiement <span class="accessKeyTip">s</span>ilencieux</legend>
			<div class="paramV2">
				<label>Numéro de carte (V2)</label>
				<html:text styleClass="appar" property="cardNumber"
					styleId="cardNumber" />
			</div>
			<div class="paramV2">
				<label>Mois d'expiration (V2)</label>
				<html:text styleClass="appar" property="expiryMonth"
					styleId="expiryMonth" />
			</div>
			<div class="paramV2">
				<label>Année d'expiration (V2)</label>
				<html:text styleClass="appar" property="expiryYear"
					styleId="expiryYear" />
			</div>
			<div class="paramV1 paramV2">
				<label>Jour naissance (V1,V2)</label>
				<html:text styleClass="appar" property="birthDay" styleId="birthDay" />
			</div>
			<div class="paramV2">
				<label>Mois naissance (V2)</label>
				<html:text styleClass="appar" property="birthMonth"
					styleId="birthMonth" />
			</div>
			<div class="paramV2">
				<label>Année naissance (V2)</label>
				<html:text styleClass="appar" property="birthYear"
					styleId="birthYear" />
			</div>
			<div class="paramV2">
				<label>Cvv (V2)</label>
				<html:text styleClass="appar" property="cvv" styleId="cvv" />
			</div>
			<div class="paramV2">
				<label>Secure MPI (V2)</label>
				<html:select property="secureMpi" styleId="secureMpi">
					<html:option value="" />
					<html:option value="0">MPI Lyra</html:option>
					<html:option value="1">MPI Integrateur</html:option>
					<html:option value="2">Forcer désactiver 3DS</html:option>
					<html:option value="3">ERROR</html:option>
				</html:select>
			</div>
			<div class="paramV2">
				<label>Secure Enrolled (V2)</label>
				<html:select property="secureEnrolled" styleId="secureEnrolled">
					<html:option value="" />
					<html:option value="Y" />
					<html:option value="N" />
					<html:option value="U" />
					<html:option value="ERROR" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Secure ECI (V2)</label>
				<html:text styleClass="appar" property="secureEci"
					styleId="secureEci" />
			</div>
			<div class="paramV2">
				<label>Secure XID (V2)</label>
				<html:text styleClass="appar" property="secureXid"
					styleId="secureXid" />
			</div>
			<div class="paramV2">
				<label>Secure CAVV (V2)</label>
				<html:text styleClass="appar" property="secureCavv"
					styleId="secureCavv" />
			</div>
			<div class="paramV2">
				<label>Secure CAVV Algorithm (V2)</label>
				<html:select property="secureCavvAlgorithm"
					styleId="secureCavvAlgorithm">
					<html:option value="" />
					<html:option value="0" />
					<html:option value="1" />
					<html:option value="2" />
					<html:option value="3" />
					<html:option value="ERROR" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Secure Status (V2)</label>
				<html:select property="secureStatus" styleId="secureStatus">
					<html:option value="" />
					<html:option value="Y" />
					<html:option value="N" />
					<html:option value="U" />
					<html:option value="A" />
					<html:option value="ERROR" />
				</html:select>
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="r">Paiement <span class="accessKeyTip">r</span>écurrent</legend>
			<div class="paramV2">
				<label>Identifiant de recurrence (V2)</label>
				<html:text styleClass="appar" property="subId" styleId="subId" />
			</div>
			<div class="paramV2">
				<label>Description de récurrence (V2)</label>
				<html:text styleClass="appar" property="subDesc" styleId="subDesc" />
			</div>
			<div class="paramV2">
				<label>Montant de la récurrence (V2)</label>
				<html:text styleClass="appar" property="subAmount"
					styleId="subAmount" />
			</div>
			<div class="paramV2">
				<label>Montant initial de la récurrence (V2)</label>
				<html:text styleClass="appar" property="subInitAmount"
					styleId="subInitAmount" />
			</div>
			<div class="paramV2">
				<label>Nombre de récurrences initiales (V2)</label>
				<html:text styleClass="appar" property="subInitAmountNumber"
					styleId="subInitAmountNumber" />
			</div>
			<div class="paramV2">
				<label>Date effet récurrence (V2)</label>
				<html:text styleClass="appar" property="subEffectDate"
					styleId="subEffectDate" />
			</div>
			<div class="paramV2">
				<label>Devise de la récurrence (V2)</label>
				<html:text styleClass="appar" property="subCurrency"
					styleId="subCurrency" />
			</div>
		</fieldset>
		<fieldset>
			<legend accesskey="p"><span class="accessKeyTip">P</span>ersonnalisation de la page de paiement</legend>
			<div class="paramV1 paramV2">
				<label>Langue (V1,V2)</label>
				<html:text styleClass="appar" property="language" styleId="language" />
				<!--<html:select property="language" styleId="language">
					<html:option value="" />
					<html:option value="fr" />
					<html:option value="en" />
					<html:option value="pt" />
					<html:option value="nl" />
					<html:option value="ja" />
					<html:option value="de" />
					<html:option value="it" />
					<html:option value="es" />
					<html:option value="zh" />
					<html:option value="XX" />
					<html:option value="FRA" />
					<html:option value="12" />
				</html:select>-->
			</div>
			<div class="paramV2">
				<label>Locales disponibles (V2)</label>
				<html:text styleClass="appar" property="availableLocales"
					styleId="availableLocales" />
			</div>
			<div class="paramV2">
				<label>Libellé marchand (V2)</label>
				<html:text styleClass="appar" property="shopName" styleId="shopName" />
			</div>
			<div class="paramV2">
				<label>URL marchand (V2)</label>
				<html:text styleClass="appar" property="shopUrl" styleId="shopUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>Configuration thème (V1,V2)</label>
				<html:text styleClass="appar" property="themeConfig"
					styleId="themeConfig" />
			</div>
			<div class="paramV1 paramV2">
				<label>Moyens de paiment (V1,V2)</label>
				<html:text styleClass="appar" property="paymentMeans"
					styleId="paymentMeans" />
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="l">Infos <span class="accessKeyTip">l</span>ivraison</legend>
			<div class="paramV2">
				<label>Nom complet de la livraison (V2)</label>
				<html:text styleClass="appar" property="shipToName"
					styleId="shipToName" />
			</div>
			<div class="paramV2">
				<label>Nom du client de la livraison (V2)</label>
				<html:text styleClass="appar" property="shipToLastName"
					styleId="shipToLastName" />
			</div>
			<div class="paramV2">
				<label>Prénom du client de la livraison (V2)</label>
				<html:text styleClass="appar" property="shipToFirstName"
					styleId="shipToFirstName" />
			</div>
			<div class="paramV2">
				<label>Qualité (V2)</label>
				<html:select property="shipToStatus" styleId="shipToStatus" >
					<html:option value="" />
					<html:option value="PRIVATE" />
					<html:option value="COMPANY" />
					<html:option value="INVALID" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Numéro d'Adresse livraison (V2)</label>
				<html:text styleClass="appar" property="shipToStreetNumber"
					styleId="shipToStreetNumber" />
			</div>
			<div class="paramV2">
				<label>Adresse livraison (V2)</label>
				<html:text styleClass="appar" property="shipToStreet"
					styleId="shipToStreet" />
			</div>
			<div class="paramV2">
				<label>Adresse livraison 2 (V2)</label>
				<html:text styleClass="appar" property="shipToStreet2"
					styleId="shipToStreet2" />
			</div>
			<div class="paramV2">
				<label>District livraison (V2)</label>
				<html:text styleClass="appar" property="shipToDistrict"
					styleId="shipToDistrict" />
			</div>
			<div class="paramV2">
				<label>Ville livraison (V2)</label>
				<html:text styleClass="appar" property="shipToCity"
					styleId="shipToCity" />
			</div>
			<div class="paramV2">
				<label>Code postal livraison (V2)</label>
				<html:text styleClass="appar" property="shipToZip"
					styleId="shipToZip" />
			</div>
			<div class="paramV2">
				<label>Etat livraison (V2)</label>
				<html:text styleClass="appar" property="shipToState"
					styleId="shipToState" />
			</div>
			<div class="paramV2">
				<label>Pays livraison (V2)</label>
				<html:text styleClass="appar" property="shipToCountry"
					styleId="shipToCountry" />
			</div>
			<div class="paramV2">
				<label>Téléphone livraison (V2)</label>
				<html:text styleClass="appar" property="shipToPhoneNum"
					styleId="shipToPhoneNum" />
			</div>
			<div class="paramV2">
				<label>Type (V2)</label>
				<html:select property="shipToType" styleId="shipToType" >
					<html:option value="" />
					<html:option value="RECLAIM_IN_SHOP" />
					<html:option value="RELAY_POINT" />
					<html:option value="RECLAIM_IN_STATION" />
					<html:option value="PACKAGE_DELIVERY_COMPANY" />
					<html:option value="ETICKET" />
					<html:option value="INVALID" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Rapidité (V2)</label>
				<html:select property="shipToSpeed" styleId="shipToSpeed" >
					<html:option value="" />
					<html:option value="STANDARD" />
					<html:option value="EXPRESS" />
					<html:option value="INVALID" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Transporteur (V2)</label>
				<html:text styleClass="appar" property="shipToDeliveryCompanyName"
					styleId="shipToDeliveryCompanyName" />
			</div>

			<div class="paramV2">
				<label>Informations utilisateur (V2)</label>
				<html:text styleClass="appar" property="shipToUserInfo"
					styleId="shipToUserInfo" />
			</div>

			<div class="paramV2">
                <label>Raison sociale (V2)</label>
                <html:text styleClass="appar" property="shipToLegalName"
                    styleId="shipToLegalName" />
            </div>

		</fieldset>

		<fieldset>
			<legend accesskey="b">Retour <span class="accessKeyTip">b</span>outique</legend>
			<div class="paramV1 paramV2">
				<label>URL serveur (V1,V2)</label>
				<html:text styleClass="appar" property="urlCheck" styleId="urlCheck" />
			</div>
			<div class="paramV1 paramV2">
				<label>URL de retour (V1,V2)</label>
				<html:text styleClass="appar" property="returnUrl"
					styleId="returnUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>URL d'annulation (V1,V2)</label>
				<html:text styleClass="appar" property="cancelUrl"
					styleId="cancelUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>URL d'erreur (V1,V2)</label>
				<html:text styleClass="appar" property="errorUrl" styleId="errorUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>URL de succes (V1,V2)</label>
				<html:text styleClass="appar" property="successUrl"
					styleId="successUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>URL de refus (V1,V2)</label>
				<html:text styleClass="appar" property="refusedUrl"
					styleId="refusedUrl" />
			</div>
			<div class="paramV1 paramV2">
				<label>Redirect success timeout (V1,V2)</label>
				<html:text styleClass="appar" property="redirectSuccessTimeout"
					styleId="redirectSuccessTimeout" />
			</div>
			<div class="paramV1 paramV2">
				<label>Redirect success message (V1,V2)</label>
				<html:text styleClass="appar" property="redirectSuccessMessage"
					styleId="redirectSuccessMessage" />
			</div>
			<div class="paramV1 paramV2">
				<label>Redirect error timeout (V1,V2)</label>
				<html:text styleClass="appar" property="redirectErrorTimeout"
					styleId="redirectErrorTimeout" />
			</div>
			<div class="paramV1 paramV2">
				<label>Redirect error message (V1,V2)</label>
				<html:text styleClass="appar" property="redirectErrorMessage"
					styleId="redirectErrorMessage" />
			</div>
			<div class="paramV1 paramV2">
				<label>Return get params (V1,V2)</label>
				<html:text styleClass="appar" property="returnGetParams"
					styleId="returnGetParams" />
			</div>
			<div class="paramV1 paramV2">
				<label>Return post params (V1,V2)</label>
				<html:text styleClass="appar" property="returnPostParams"
					styleId="returnPostParams" />
			</div>
			<div class="paramV1 paramV2">
				<label>Mode retour (V1,V2)</label>
				<html:select property="returnMode" styleId="returnMode">
					<html:option value="" />
					<html:option value="POST" />
					<html:option value="GET" />
					<html:option value="NONE" />
					<html:option value="ERROR" />
				</html:select>
			</div>
		</fieldset>

		<fieldset>
			<legend>À trier</legend>
			<div class="paramV1 paramV2">
				<label>Identifiant commande (V1,V2)</label>
				<html:text styleClass="appar" property="orderId" styleId="orderId" />
			</div>
			<div class="paramV2">
				<label>Option Cofinoga (V2)</label>
				<html:text styleClass="appar" property="opCofinoga"
					styleId="opCofinoga" />
			</div>
			<div class="paramV2">
				<label>Option Cetelem (V2)</label>
				<html:text styleClass="appar" property="opCetelem"
					styleId="opCetelem" />
			</div>
			<div class="paramV1 paramV2">
				<label>Order info (V1,V2)</label>
				<html:text styleClass="appar" property="orderInfo"
					styleId="orderInfo" />
			</div>
			<div class="paramV1 paramV2">
				<label>Order info 2 (V1,V2)</label>
				<html:text styleClass="appar" property="orderInfo2"
					styleId="orderInfo2" />
			</div>
			<div class="paramV1 paramV2">
				<label>Order info 3 (V1,V2)</label>
				<html:text styleClass="appar" property="orderInfo3"
					styleId="orderInfo3" />
			</div>
			<div class="paramV1 paramV2">
				<label>Contrats (V1,V2)</label>
				<html:text styleClass="appar" property="contracts"
					styleId="contracts" />
			</div>
			<div class="paramV2">
				<label>Mode action (V2)</label>
				<html:select property="actionMode" styleId="actionMode">
					<html:option value="INTERACTIVE" />
					<html:option value="SILENT" />
					<html:option value="ERROR" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Informations abstraites (V2)</label>
				<html:select property="abstractInfo" styleId="abstractInfo">
					<html:option value="" />
					<html:option value="SRC_INFO" />
					<html:option value="SRC_HASH" />
					<html:option value="ERROR" />
				</html:select>
			</div>
			<div class="paramV1 paramV2">
				<label>Contribution (V1,V2)</label>
				<html:text styleClass="appar" property="contrib" styleId="contrib" />
			</div>
			<div class="paramV2">
				<label>Token id (V2)</label>
				<html:text styleClass="appar" property="tokenId" styleId="tokenId" />
			</div>
			<div class="paramV2">
				<label>Type du paiement (V2)</label>
				<html:select property="paymentType" styleId="paymentType">
					<html:option value="" />
					<html:option value="BOL_AP" />
					<html:option value="BOL_CH" />
					<html:option value="BOL_DM" />
					<html:option value="BOL_DMI" />
					<html:option value="BOL_DR" />
					<html:option value="BOL_DS" />
					<html:option value="BOL_DSI" />
					<html:option value="BOL_FAT" />
					<html:option value="BOL_LC" />
					<html:option value="BOL_ME" />
					<html:option value="BOL_NCC" />
					<html:option value="BOL_NCE" />
					<html:option value="BOL_NCI" />
					<html:option value="BOL_NCR" />
					<html:option value="BOL_ND" />
					<html:option value="BOL_NP" />
					<html:option value="BOL_NPR" />
					<html:option value="BOL_NS" />
					<html:option value="BOL_PC" />
					<html:option value="BOL_RC" />
					<html:option value="BOL_TM" />
					<html:option value="BOL_TS" />
					<html:option value="OTHER" />
					<html:option value="ERROR" />
					<html:option value="null" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Requestor du paiement (V2)</label>
				<html:select property="requestor" styleId="requestor">
					<html:option value="" />
					<html:option value="BANK" />
					<html:option value="MERCHANT" />
					<html:option value="ERROR" />
					<html:option value="null" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Option Payment (V2)</label>
				<html:text styleClass="appar" property="paymentOptionCode"
					styleId="paymentOptionCode" />
			</div>
			<div class="paramV2">
				<label>Garantie sur transaction primaire (V2)</label>
				<html:select property="riskPrimaryWarranty" styleId="riskPrimaryWarranty">
					<html:option value="" />
					<html:option value="DEFAULT" />
					<html:option value="IGNORE" />
					<html:option value="CHECK" />
					<html:option value="null" />
				</html:select>
			</div>
			<div class="paramV2">
				<label>Platforme de paiement (V2)</label>
				<html:select property="targetPtf" styleId="targetPtf">
					<html:option value="" />
					<html:option value="OLD" />
					<html:option value="NEW" />
				</html:select>
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="n">Pa<span class="accessKeyTip">n</span>ier (V2)</legend>
			<logic:iterate name="order" id="product" property="productList">
				<fieldset>
				<legend>Produit</legend>
				<div class="paramV2">
					<label>Libellé</label>
					<html:text name="product" property="label" indexed="true" />
				</div>
				<div class="paramV2">
					<label>Montant</label>
					<html:text name="product" property="amount" indexed="true" />
				</div>
				<div class="paramV2">
					<label>Référence</label>
					<html:text name="product" property="ref" indexed="true" />
				</div>
				<div class="paramV2">
					<label>Quantité</label>
					<html:text name="product" property="qty" indexed="true" />
				</div>
				<div class="paramV2">
					<label>Type</label>
						<html:select name="product" property="type" styleId="type"
							indexed="true">
						<html:option value="" />
						<html:option value="FOOD_AND_GROCERY" />
						<html:option value="AUTOMOTIVE" />
						<html:option value="ENTERTAINMENT" />
						<html:option value="HOME_AND_GARDEN" />
						<html:option value="HOME_APPLIANCE" />
						<html:option value="AUCTION_AND_GROUP_BUYING" />
						<html:option value="FLOWERS_AND_GIFTS" />
						<html:option value="COMPUTER_AND_SOFTWARE" />
						<html:option value="HEALTH_AND_BEAUTY" />
						<html:option value="SERVICE_FOR_INDIVIDUAL" />
						<html:option value="SERVICE_FOR_BUSINESS" />
						<html:option value="SPORTS" />
						<html:option value="CLOTHING_AND_ACCESSORIES" />
						<html:option value="TRAVEL" />
						<html:option value="HOME_AUDIO_PHOTO_VIDEO" />
						<html:option value="TELEPHONY" />
						<html:option value="INVALID" />
					</html:select>
				</div>
				<div class="paramV2">
					<label>External UUID</label>
					<html:text name="product" property="extId" indexed="true" />
				</div>
				</fieldset>
			</logic:iterate>
			<div class="paramV2">
				<label>Montant des taxes</label>
				<html:text styleClass="appar" property="taxAmount"
					styleId="taxAmount" />
			</div>
			<div class="paramV2">
				<label>Frais de port</label>
				<html:text styleClass="appar" property="shippingAmount"
					styleId="shippingAmount" />
			</div>
			<div class="paramV2">
				<label>Montant de l'assurance</label>
				<html:text styleClass="appar" property="insuranceAmount"
					styleId="insuranceAmount" />
			</div>
		</fieldset>

		<fieldset>
			<legend accesskey="x">E<span class="accessKeyTip">x</span>tInfo (V2)</legend>
			<%
				for (int i = 0; i < 10; i++) {
						String name = "extInfoKey(key-" + i + ")";
						String value = "extInfoValue(key-" + i + ")";
			%>

			<div class="paramV2 extinfo-key">
				<label>Ext Info key <%=i%></label>
				<html:text styleClass="appar" property="<%= name %>"
					styleId="<%= name %>" />
			</div>
			<div class="paramV2 extinfo-value">
				<label>Ext Info value <%=i%></label>
				<html:text styleClass="appar" property="<%= value %>"
					styleId="<%= value %>" />
			</div>
			<%
				}
			%>

		</fieldset>
	</html:form>
</body>
</html>
