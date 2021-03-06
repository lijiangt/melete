<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/move_section.jsp $
 * $Id: move_section.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
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

<title>Melete - Move Sections</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@include file="accesscheck.jsp" %>

<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
</head>
<f:view>
<body onLoad="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');">
<h:form id="moveSectionsForm">

<table border="0" height="350" cellpadding="0" cellspacing="0" class ="table3">
	<tr>
		<td valign="top"> 		&nbsp;		</td>
		<td width="1962" valign="top">
		  <table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse">
			<tr>
				<td>
					<f:subview id="top">
						<jsp:include page="topnavbar.jsp"/> 
					</f:subview>
					<div class="meletePortletToolBarMessage"><img src="images/page_go.png" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.move_sections_msg}" /> </div>
				</td>
			</tr>
			<tr>
				<td class="maintabledata3">
					<h:messages id="movesectionerror" layout="table" showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/>
					<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA" width="100%" id="AutoNumber1" summary="<h:outputText value='#{msgs.move_sections_summary}'/>">
					<tr>
						<td class="tableheader"><h:outputText id="title" value="#{msgs.move_sections_title}" /> 
						</td></tr>
        				<tr>
    	   				<td valign="top">    	   				
		   				     <h:selectOneRadio id="select_module_id" value="#{moveSectionsPage.selectId}" layout="pageDirection" rendered="#{!moveSectionsPage.nomodsFlag}">
	       				     	<f:selectItems value="#{moveSectionsPage.availableModules}" />	       				     
	       				     </h:selectOneRadio>
	       			<h:outputText id="no_modules_text" value="#{msgs.move_section_no_Modules}" rendered="#{moveSectionsPage.nomodsFlag}" />
         		    </td></tr>
         		    <tr>
			          <td>
			          <div class="actionBar" align="left">
			          	<h:commandButton id="moveSectionChanges" action="#{moveSectionsPage.move}"  rendered="#{moveSectionsPage.nomodsFlag == false}" value="#{msgs.im_save}" accesskey="#{msgs.save_access}" title="#{msgs.im_save_text}" styleClass="BottomImgSave"/>
			          	<h:commandButton id="cancelButton" immediate="true" action="#{moveSectionsPage.cancel}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
			          </div>
     				   </td></tr>
         		    </table>         		    	        		    
         		</td></tr>
         	</table>
      </td></tr></table>
      </h:form>
     </body>
   </f:view>     		    		   