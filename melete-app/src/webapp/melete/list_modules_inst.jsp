<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/list_modules_inst.jsp $
 * $Id: list_modules_inst.jsp 65620 2010-01-07 23:44:20Z rashmi@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008, 2009 Etudes, Inc.
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

<title>Melete - Modules: Student View</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@include file="accesscheck.jsp" %>

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
<h:form id="listmodulesform">

<table border="0" width="100%" height="350" cellpadding="0" cellspacing="0" class ="table3">
<tr>
 <td valign="top">
<table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse">
<tr>
<td height="20" class="maintabledata1">
<f:subview id="top">
<jsp:include page="topnavbar.jsp"/> 
</f:subview>
</td>
</tr>
<tr>
<td >

<div class="meletePortletToolBarMessage"><img src="images/preview.png" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.list_modules_inst_viewing_student}" /> </div>

</td>
</tr>
<tr>
<td >
<h:messages showDetail="true" showSummary="false"/>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA" width="100%" id="AutoNumber1" >
  
	<tr> <td colspan="5" valign="top">
 <h:dataTable id="table"  
                  value="#{listModulesPage.viewModuleBeans}" 
                  var="vmbean"  rowClasses="row1,row2" columnClasses="ListTitleClass,ListClosedClass,ListDateClass,ListDateClass,ListPrintClass" headerClass="tableheader"
                  border="0" cellpadding="3" width="100%" binding="#{listModulesPage.modTable}" summary="#{msgs.list_modules_inst_summary}">
        <h:column>      
        <f:facet name="header">
        <h:panelGroup>
         <h:commandLink id="expandCollpaseAction" action="#{listModulesPage.expandCollapseAction}" immediate="true">
     	   <h:graphicImage id="exp_all_gif" alt="#{msgs.list_modules_inst_expand_all}" title="#{msgs.list_modules_inst_expand_all}" value="images/expand-collapse.gif"   rendered="#{listModulesPage.expandAllFlag != listModulesPage.trueFlag}" styleClass="ExpClass"/>
           <h:graphicImage id="col_all_gif" alt="#{msgs.list_modules_inst_collapse_all}" title="#{msgs.list_modules_inst_collapse_all}" value="images/collapse-expand.gif"   rendered="#{listModulesPage.expandAllFlag == listModulesPage.trueFlag}" styleClass="ExpClass"/>
         </h:commandLink>
        </h:panelGroup>
        </f:facet>    
      
      <h:commandLink id="showHideSections" action="#{listModulesPage.showHideSections}" immediate="true">
        <h:graphicImage id="exp_gif" alt="#{msgs.list_modules_inst_expand}" title="#{msgs.list_modules_inst_expand}" value="images/expand.gif" rendered="#{((vmbean.moduleId != listModulesPage.showModuleId)&&(vmbean.vsBeans != listModulesPage.nullList)&&(listModulesPage.expandAllFlag != listModulesPage.trueFlag))}" styleClass="ExpClass"/>
        <h:graphicImage id="col_gif" alt="#{msgs.list_modules_inst_collapse}" title="#{msgs.list_modules_inst_collapse}" value="images/collapse.gif" rendered="#{(((vmbean.moduleId == listModulesPage.showModuleId)&&(vmbean.vsBeans != listModulesPage.nullList))||((listModulesPage.expandAllFlag == listModulesPage.trueFlag)&&(vmbean.vsBeans != listModulesPage.nullList)))}" styleClass="ExpClass"/>
        </h:commandLink>   
       <h:outputText id="mod_seq" value="#{vmbean.seqNo}. " rendered="#{listModulesPage.autonumber}"/>
       <h:commandLink id="viewModule"  actionListener="#{listModulesPage.viewModule}" action="#{listModulesPage.redirectToViewModule}" immediate="true"  
          rendered="#{vmbean.visibleFlag == listModulesPage.trueFlag}">
          <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
              <h:outputText id="title"
                           value="#{vmbean.title}">
         </h:outputText>             
       </h:commandLink>
      <h:commandLink id="viewModule2"  actionListener="#{listModulesPage.viewModule}" action="#{listModulesPage.redirectToViewModule}"  immediate="true" 
         rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}">      
         <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
         <h:outputText id="title2"
                           value="#{vmbean.title}" styleClass="italics">
         </h:outputText>                 
       </h:commandLink>    
                
          
           <h:dataTable id="tablesec" rendered="#{(((vmbean.moduleId == listModulesPage.showModuleId)||(listModulesPage.expandAllFlag == listModulesPage.trueFlag)))}"
                  value="#{vmbean.vsBeans}"
                  var="vsbean" columnClasses="SectionClass" rowClasses="#{vmbean.rowClasses}"  width="95%" binding="#{listModulesPage.secTable}" summary="#{msgs.list_modules_inst_sections_summary}">
                   <h:column>                         
               <h:graphicImage id="bul_gif" value="images/bullet_black.gif" rendered="#{!listModulesPage.autonumber}"/>
	       <h:outputText id="sec_seq" value="#{vsbean.displaySequence}. " rendered="#{listModulesPage.autonumber}"/>
           <h:commandLink id="viewSectionEditor"  actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSection}" rendered="#{((vsbean.contentType == listModulesPage.typeLink)&&(vmbean.visibleFlag == listModulesPage.trueFlag))}" immediate="true">
                  <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
               <h:outputText id="sectitleEditor" 
                           value="#{vsbean.title}">
               </h:outputText>
             </h:commandLink>
            <h:commandLink id="viewSectionEditor2"  actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSection}" rendered="#{((vsbean.contentType == listModulesPage.typeLink)&&(vmbean.visibleFlag != listModulesPage.trueFlag))}" immediate="true">
                  <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
               <h:outputText id="sectitleEditor2" 
                           value="#{vsbean.title}" styleClass="italics">
               </h:outputText>
             </h:commandLink>             
           <h:commandLink id="viewSectionLink"  actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSectionLink}" rendered="#{((vsbean.contentType != listModulesPage.typeLink)&&(vmbean.visibleFlag == listModulesPage.trueFlag))}" immediate="true">
                  <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
               <h:outputText id="sectitleLink" 
                           value="#{vsbean.title}">
               </h:outputText>
             </h:commandLink> 
          
           <h:commandLink id="viewSectionLink2"  actionListener="#{listModulesPage.viewSection}" action="#{listModulesPage.redirectToViewSectionLink}" rendered="#{((vsbean.contentType != listModulesPage.typeLink)&&(vmbean.visibleFlag != listModulesPage.trueFlag))}" immediate="true">
                 <f:param name="modidx" value="#{listModulesPage.modTable.rowIndex}" />
               <f:param name="secidx" value="#{listModulesPage.secTable.rowIndex}" />
               <h:outputText id="sectitleLink2" 
                           value="#{vsbean.title}" styleClass="italics">
               </h:outputText>
             </h:commandLink>  
            </h:column>
          </h:dataTable>
          <h:panelGrid id="nextsteps" columns="1" width="100%" rendered="#{vmbean.whatsNext != listModulesPage.isNull && listModulesPage.expandAllFlag == listModulesPage.trueFlag}">
	          <h:column>
		          <h:outputText id="emp_space6_bul" value="  " styleClass="NextStepsPaddingClass"/>
		          <h:outputText id="next_seq" value="#{vmbean.nextStepsNumber}. " rendered="#{listModulesPage.autonumber}"/>
		          <h:graphicImage id="bul_gif1" value="images/bullet_black.gif" rendered="#{!listModulesPage.autonumber}" style="border:0"/>
		          
		          <h:commandLink id="whatsNext" action="#{listModulesPage.goWhatsNext}" immediate="true" rendered="#{vmbean.visibleFlag == listModulesPage.trueFlag}">
				    <h:outputText  id="whatsNextMsg" value="#{msgs.list_modules_stud_next_steps}" />
				    <f:param name="modidx2" value="#{listModulesPage.modTable.rowIndex}" />
				    <f:param name="modseqno" value="#{vmbean.seqNo}" />
		          </h:commandLink>  
		          
		         <h:commandLink id="whatsNext2" action="#{listModulesPage.goWhatsNext}" immediate="true" rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}">
		 	        <h:outputText  id="whatsNextMsg2" value="#{msgs.list_modules_stud_next_steps}" styleClass="italics"/>
				    <f:param name="modidx2" value="#{listModulesPage.modTable.rowIndex}" />
				    <f:param name="modseqno" value="#{vmbean.seqNo}" />
		          </h:commandLink> 
	          </h:column>
          </h:panelGrid> 
           </h:column>
           <h:column>
               <h:graphicImage id="closed_gif" value="images/closed.gif" alt="#{msgs.list_modules_inst_closed}" title="#{msgs.list_modules_inst_closed}" rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}" styleClass="ExpClass"/>
           </h:column>
           <h:column>
             <f:facet name="header">
               <h:outputText value="#{msgs.list_modules_inst_start_date}" />
             </f:facet>
              <h:outputText id="startDate0" 
                           value="-"    rendered="#{((vmbean.startDate == listModulesPage.nullDate))}">
            </h:outputText>
                  <h:outputText id="startDate" 
                           value="#{vmbean.startDate}"    rendered="#{vmbean.visibleFlag == listModulesPage.trueFlag}">
              <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
            <h:outputText id="startDate2" styleClass="italics" 
                           value="#{vmbean.startDate}"     rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}">      
              <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>            
           </h:column>
            <h:column>
              <f:facet name="header">
                <h:outputText value="#{msgs.list_modules_inst_end_date}" />
              </f:facet>  
               <h:outputText id="endDate0" 
                           value="-"    rendered="#{((vmbean.endDate == listModulesPage.nullDate))}">
              <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
              <h:outputText id="endDate"
                           value="#{vmbean.endDate}"
                              rendered="#{vmbean.visibleFlag == listModulesPage.trueFlag}">
               <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>
            <h:outputText id="endDate2" styleClass="italics" 
                           value="#{vmbean.endDate}"
                             rendered="#{vmbean.visibleFlag != listModulesPage.trueFlag}">      
               <f:convertDateTime pattern="yyyy-MMM-d hh:mm a"/>
            </h:outputText>            
   	 </h:column>   
      <h:column rendered="#{listModulesPage.printable}"> 
         <h:outputLink id="printModuleLink" value="list_modules_inst" onclick="OpenPrintWindow(#{listModulesPage.printModuleId},'Melete Print Window');" rendered="#{vmbean.visibleFlag}">
	  	    	<h:graphicImage id="printImgLink" value="images/printer.png" alt="#{msgs.list_auth_modules_alt_print}" title="#{msgs.list_auth_modules_alt_print}" styleClass="AuthImgClass"/>
	 	 </h:outputLink>
	    
	    </h:column>	     
      </h:dataTable> 
      <h:panelGrid columns="1" rendered="#{listModulesPage.nomodsFlag}">
      	<h:column>
	   	 <h:outputText id="nomodstext" value="#{msgs.no_modules}"  style="text-align:left"/>
	    </h:column> 
      </h:panelGrid>          
	  </td></tr>
	  <tr>
         <td  height="20" colspan="5" class="maintabledata5">&nbsp;   </td>
        </tr>
        <tr>
        <td colspan="5">
         <h:graphicImage id="closed_gif" value="images/closed.gif" alt="" styleClass="ExpClass" rendered="#{listModulesPage.closedModulesFlag == listModulesPage.trueFlag}"/>
         <h:outputText styleClass="style3" value="#{msgs.list_modules_inst_module_not_open}" rendered="#{listModulesPage.closedModulesFlag == listModulesPage.trueFlag}"/>
         </td>
         </tr>
        </table>
 </td>
 </tr>
</table>	

<!--End Content-->
</td>
</tr>
</table>

 </h:form>

</body>
</f:view>
</html>
