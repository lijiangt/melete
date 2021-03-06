<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/add_module.jsp $
 * $Id: add_module.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
 ***********************************************************************************
 *
 * Copyright (c) 2008,2009 Etudes, Inc.
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>
<%@include file="accesscheck.jsp" %>


<%@ page import="org.sakaiproject.util.ResourceLoader"%>

<% 
	ResourceLoader bundle = new ResourceLoader("org.etudes.tool.melete.bundle.Messages");
	String mensaje=bundle .getString("JS_date");
	
%>

<title>Melete - Add Module</title>

<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
</head>
<script language="JavaScript" src="js/calendar2.js"></script>
<script language="javascript">
function newWindow(newContent){
  winContent = window.open(newContent, 'nextWin', 'right=0, top=20,width=750,height=600, toolbar=no,scrollbars=yes, resizable=no') }
function showSdateCal()
{
  var string2 = "AddModuleForm:startDate";
  //alert(string2);
  var string2val = document.getElementById(string2).value;
  var dt;
    if((null == string2val) || (string2val.length == 0)) dt = new Date();
  else dt = new Date(document.getElementById(string2).value);
  
   if (!isNaN(dt))
  { 
    var cal2 = new calendar2(document.getElementById(string2));
    cal2.popup();
    document.getElementById(string2).select();
  }
  else
  {
    alert('<%=mensaje%>');
     document.getElementById(string2).select();
  }
}
function showEdateCal()
{
  var string2 = "AddModuleForm:endDate";
  //alert(string2);
  // var dt = new Date(document.getElementById(string2).value);
  var string2val = document.getElementById(string2).value;
  var dt;
    if((null == string2val) || (string2val.length == 0)) dt = new Date();
  else dt = new Date(document.getElementById(string2).value);
  
   if (!isNaN(dt))
  { 
    var cal2 = new calendar2(document.getElementById(string2));
    cal2.popup();
    document.getElementById(string2).select();
  }
  else
  {
    alert('<%=mensaje%>');
     document.getElementById(string2).select();
  }
} 
</script>
<f:view>
<body onLoad="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');">
<h:form id="AddModuleForm">
<table border="0" cellpadding="0" cellspacing="0" class ="table3">
	<tr>
		<td valign="top"> &nbsp;</td>
	<td width="1962"  valign="top">
        <table width="100%"  border="1" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA">
          <tr>
			<td width="100%" height="20" class="maintabledata1"> 
					<f:subview id="top">
							<jsp:include page="topnavbar.jsp"/> 
						</f:subview>
						<div class="meletePortletToolBarMessage"><img src="images/document_add.gif" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.add_module_adding_module}" /> </div>
				</td>
			</tr>
		<!--Page Content-->
	 </table>	
	 <table width="100%"  border="0" cellpadding="3" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA">
	  <tr>
   		 <td height="20" class="maintabledata2"> <h:outputText value="#{msgs.add_module_define_properties}" /> 		 
		 </td>
	  </tr>  	
  <tr>  
    <td  class="maintabledata3">	
	<h:messages id="addmoduleerror" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
	<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA" width="100%" id="AutoNumber1" height="57">
        <tr bgcolor="#FFFFFF">
          <td width="100%" height="35" valign="top">
		  	<table width="98%" border="0" align="center" cellpadding="4" cellspacing="0" class="table3">
			<tr> 
				<td>&nbsp;</td>
				<td> </td>
			</tr>
			   <tr>
                <td  align="left" valign="top"> <h:outputText value="#{msgs.add_module_module_title}" /> <span class="required">*</span></td>
                <td  align="left" valign="top">
					<h:inputText id="title" size="45" value="#{addModulePage.module.title}" required="true" styleClass="formtext" />
					
				</td>
              </tr>
			 
              <tr>
                <td width="233" align="left" valign="top"><h:outputText value="#{msgs.add_module_descr_over_object}" /> </td>
                <td width="472" align="left" valign="top">
				<h:inputTextarea id="description" cols="45" rows="5" value="#{addModulePage.module.description}" styleClass="formtext" >
					<f:validateLength maximum="500" minimum="1"/>
				</h:inputTextarea>	
				</td>
              </tr>
			  
              <tr>
                <td align="left" valign="top"><h:outputText value="#{msgs.add_module_keywords}" />				
                 </td>
                <td align="left" valign="top">
				<h:inputTextarea id="keywords" cols="45" rows="3" value="#{addModulePage.module.keywords}"  styleClass="formtext" >
						<f:validateLength maximum="250" minimum="1" />
				</h:inputTextarea>		
				</td>
              </tr>
			  <tr>
			  <td colspan="2">&nbsp;</td>
			  </tr>
              <tr>
                <td width="233" align="left" valign="top"><h:outputText value="#{msgs.add_module_added_by}" /></td>
                <td width="472" align="left" valign="top">
				<h:outputText value="#{addModulePage.author}"  styleClass="formtext"/></td>
              </tr>
			  <tr>
			  <td colspan="2">&nbsp;</td>
			  </tr>
              <tr>
                <td align="left" valign="top"><h:outputText value="#{msgs.add_module_term_year}" /></td>
                <td align="left" valign="top">
					<h:outputText id="season" value="#{addModulePage.season}"/>				 
				   </td>
              </tr>
			   
              <tr>
                <td width="233" align="left" valign="top"><h:outputText value="#{msgs.add_module_start_date}" />
				</td>
                <td width="472" align="left" valign="top">
					  <a name="startCalender"></a> <h:inputText id="startDate" 
                           value="#{addModulePage.moduleShdates.startDate}" size="22" styleClass="formtext">
		        	      <f:convertDateTime  type="both" dateStyle="medium" timeStyle="short"/>
        		    </h:inputText>
		            <h:outputLink id="viewsdateCal" onclick="showSdateCal()" value="#startCalender" >
        	    		<h:graphicImage id="sdateCal"  value="images/date.png" alt="#{msgs.list_auth_modules_alt_popup_cal}" title="#{msgs.list_auth_modules_alt_popup_cal}" styleClass="DatePickerClass"/>
           			</h:outputLink>
					 </td>
              </tr>
			  
              <tr>
                <td width="233" align="left" valign="top"><h:outputText value="#{msgs.add_module_end_date}" /></td>
                <td width="472" align="left" valign="top">
				<a name="endCalender"></a><h:inputText id="endDate" 
                           value="#{addModulePage.moduleShdates.endDate}" size="22" styleClass="formtext">
             			  <f:convertDateTime  type="both" dateStyle="medium" timeStyle="short"/>
          		 </h:inputText>
          <h:outputLink id="viewedateCal" onclick="showEdateCal()" value="#endCalender">
            <h:graphicImage id="edateCal"  value="images/date.png" alt="#{msgs.list_auth_modules_alt_popup_cal}" title="#{msgs.list_auth_modules_alt_popup_cal}" styleClass="DatePickerClass"/>
           </h:outputLink>
					 </td>
              </tr>			  
              <tr>
                <td width="233">&nbsp;</td>
                <td width="472" valign="top">
                 <h:selectBooleanCheckbox id="addtoschedule" title="addtoSchedule" value="#{addModulePage.moduleShdates.addtoSchedule}" rendered="#{addModulePage.calendarFlag}">
		         </h:selectBooleanCheckbox>
		         <h:outputText id="addtoScheduleTxt" value="#{msgs.add_module_schedule}" rendered="#{addModulePage.calendarFlag}"/>
                </td>
              </tr>  
		 </table>
	</td>
  </tr>
  <tr>
          <td colspan="2">
          <div class="actionBar" align="left">
          	<h:commandButton action="#{addModulePage.save}" value="#{msgs.im_add_button}" accesskey="#{msgs.add_access}" title="#{msgs.im_add_button_text}" styleClass="BottomImgAdd"/>
			<h:commandButton id="cancelButton" immediate="true" action="#{addModulePage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
	       </div>
        </td></tr>
		
</table>
	<!-- here -->
	</td>
	</tr>	
	</table>
	</h:form>
	</td>
    </tr>	
</table> 


</body>
</f:view>
</html>
