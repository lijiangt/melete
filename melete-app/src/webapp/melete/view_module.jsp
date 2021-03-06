<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/view_module.jsp $
 * $Id: view_module.jsp 65237 2009-12-14 22:08:51Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008 Etudes, Inc.
 *
 * Portions completed before September 1, 2008 Copyright (c) 2004, 2005, 2006, 2007, 2008 Foothill College, ETUDES Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 **********************************************************************************
-->
<html>

<title>Melete - View Module</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
<script type="text/javascript" language="javascript">
function OpenPrintWindow(print_id, windowName)
{
	
  var _info = navigator.userAgent;
  var _ie = (_info.indexOf("MSIE") > 0 && _info.indexOf("Win") > 0 && _info.indexOf("Windows 3.1") < 0);
	var windowDefaults = "status=no, menubar=no, location=no, scrollbars=yes, resizeable=yes, width=700, height=700, left=20, top=20";
	var newWindow;
	if(!_ie) newWindow = window.open('print_module.jsf?printModuleId='+print_id,windowName,windowDefaults);
	else newWindow = window.open('print_module.jsf?printModuleId='+print_id,null,windowDefaults);
if (window.focus) { newWindow.focus(); } ; // force the window to the front if the browser supports it
return newWindow;

}
</script>
</head>
<f:view>
<body onLoad="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');">

<h:form id="viewmoduleform">
<table width="100%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse" >
	<tr>
		<td width="100%" valign="top">
<table border="0" class="table3" width="100%">
<tr>
		<td width="100%" valign="top">
			<table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse" >
				<tr>
				<td>
						<f:subview id="top">
							  <jsp:include page="topnavbar.jsp"/>
							</f:subview>
						<div class="meletePortletToolBarMessage"><img src="images/preview.png" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.view_module_studente_side}" /></div>		
						</td>
					</tr>		
<!--Page Content-->
		 <tr>
			<td align="center">			
			<!-- The getmdbean method correctly determines the prev and next seq nos in the backing bean -->
			<!-- The hidden field below has been added just to get the getmdbean method to execute first -->
		    <h:inputHidden id="hacktitle" value="#{viewModulesPage.mdbean.module.title}"/>
			<f:subview id="topmod">
			<jsp:include page="view_navigate_mod.jsp"/>
			</f:subview>
			</td>
		</tr>                     
<tr>
<td>
	<h:panelGrid id="moduleContentGrid" columns="2" width="97%" border="0" cellpadding="5" rendered="#{viewModulesPage.mdbean != null && viewModulesPage.mdbean.module != null}">
		<h:column>
			<h:outputText id="mod_seq" value="#{viewModulesPage.mdbean.cmod.seqNo}. " styleClass="bold style6" rendered="#{viewModulesPage.autonumber}"/>
			<h:outputText id="title" value="#{viewModulesPage.mdbean.module.title}" styleClass="bold style6" ></h:outputText>
		</h:column>
		<h:column rendered="#{viewModulesPage.printable}">
			<h:outputLink id="printModuleLink" value="view_module_student" onclick="OpenPrintWindow(#{viewModulesPage.mdbean.moduleId},'Melete Print Window');" rendered="#{viewModulesPage.printable}">
		    	<f:param id="printmoduleId" name="printModuleId" value="#{viewModulesPage.mdbean.moduleId}" />
	  			<h:graphicImage id="printImgLink" value="images/printer.png" alt="#{msgs.list_auth_modules_alt_print}" title="#{msgs.list_auth_modules_alt_print}" styleClass="AuthImgClass"/>
		 	</h:outputLink>
		</h:column>
	</h:panelGrid>
	<h:panelGrid id="moduleContentGrid1" columns="1" width="97%" border="0" cellpadding="3" rendered="#{viewModulesPage.mdbean != null && viewModulesPage.mdbean.module != null}">
		<h:column>
			<h:outputText id="description" value="#{viewModulesPage.mdbean.module.description}"  rendered="#{((viewModulesPage.mdbean.module.description != viewModulesPage.nullString)&&(viewModulesPage.mdbean.module.description != viewModulesPage.emptyString))}" />
		</h:column>
	<h:column>
		<h:outputText id="secs" value="#{msgs.view_module_student_content_section}" ></h:outputText>  
		<h:dataTable id="tablesec"  value="#{viewModulesPage.mdbean.sectionBeans}" var="sectionBean" columnClasses="SectionClass"  rowClasses="#{viewModulesPage.mdbean.rowClasses}" rendered="#{viewModulesPage.sectionSize > 0}" styleClass="SectionTableClass">
           	  <h:column>
        		  <h:graphicImage id="bul_gif" value="images/bullet_black.gif" rendered="#{sectionBean.section.title != viewModulesPage.nullString && !viewModulesPage.autonumber}"/>
		          <h:commandLink id="viewSectionEditor"  action="#{viewModulesPage.viewSection}" rendered="#{sectionBean.section.title != viewModulesPage.nullString}" immediate="true">
				      <h:outputText id="sec_seq" value="#{sectionBean.displaySequence}. " rendered="#{viewModulesPage.autonumber}"/>
					  <h:outputText id="sectitleEditor" value="#{sectionBean.section.title}" > </h:outputText>
				  </h:commandLink>
			</h:column>
 		 </h:dataTable>        
	</h:column>
	<h:column rendered="#{viewModulesPage.mdbean.module.whatsNext != viewModulesPage.nullString}">
		<h:outputText value="#{msgs.view_module_student_whats_next}" styleClass="bold style7"></h:outputText>		
	</h:column>
	<h:column rendered="#{viewModulesPage.mdbean.module.whatsNext != viewModulesPage.nullString}">
		<h:outputText id="whatsnext" value="#{viewModulesPage.mdbean.module.whatsNext}"/>
	</h:column>	
	</h:panelGrid>	
</td>
</tr>             

<tr>
	<td align="center">
		<f:subview id="bottommod">
			<jsp:include page="view_navigate_mod.jsp"/>
		</f:subview>	  
		
	</td>	
		</tr>
		<tr><td class="maintabledata5">&nbsp;   </td></tr>    
		</table>
</td>
</tr>  

  </table>
<!--End Content-->
</h:form>
</body>
</f:view>

</html>
 
