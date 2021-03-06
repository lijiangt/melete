<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/ContentUploadServerView.jsp $
 * $Id: ContentUploadServerView.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
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
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>
<%@include file="accesscheck.jsp" %>

<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="description" content="ETUDES-NG Course Management System, Powered by Sakai">
<meta name="keywords" content="ETUDES-NG course management system, e-learning">

<title>Melete - Select Resource Item</title>

<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
<%@ page import="javax.faces.application.FacesMessage, java.util.ResourceBundle"%>

<% 
	String status = (String)request.getAttribute("upload.status");
		if( status != null && !status.equalsIgnoreCase("ok"))
		{
			final javax.faces.context.FacesContext facesContext = javax.faces.context.FacesContext.getCurrentInstance();
			ResourceBundle bundle = ResourceBundle.getBundle("org.etudes.tool.melete.bundle.Messages", facesContext.getViewRoot().getLocale());
			String infoMsg = bundle.getString("file_too_large");
			FacesMessage msg = new FacesMessage(null, infoMsg);
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			facesContext.addMessage(null, msg);		
	   }
%>
</head>
<script language="javascript1.2">
function fillupload()
{
		var k =document.getElementById("file1").value;
		document.getElementById("ServerViewForm:filename").value=k;
}

</script>
<f:view>

<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0" onload="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');">

<h:form id="UploadServerViewForm" enctype="multipart/form-data">	

<!-- This Begins the Main Text Area -->
	   <table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA"  style="border-collapse: collapse">
         <tr>
				<td width="1962">
        		<table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA"  style="border-collapse: collapse">
          			<tr>
            			<td width="100%" height="20" bordercolor="#E2E4E8">
            			<!-- top nav bar -->
		                <f:subview id="top">
			              <jsp:include page="topnavbar.jsp"/> 
		                </f:subview>
								<div class="meletePortletToolBarMessage"><img src="images/replace2.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.editcontentuploadserverview_selecting}" /></div>
						</td>
					</tr>
					 <tr><td>    	<h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/></td>		  </tr>
					<tr><td>
  					 <h:outputText id="Stext_2" value="#{msgs.contentuploadserverview_msg1}"/> 
<!--replace with local part Begin -->
					<table width="100%" border="0" cellpadding="4" cellspacing="0" bordercolor="#F5F5F5" style="border-collapse: collapse" >
						<tr><td colspan="2"> &nbsp; </td></tr>			
						<tr><td height="20" colspan="2" class="maintabledata8"> <h:outputText id="Stext_add" value="#{msgs.contentuploadserverview_select}" styleClass="bold"/> 									 
						 <tr><td height="20" colspan="2"> <h:outputText id="Stext3" value="#{msgs.editcontentuploadserverview_upload}"/> 				
																			<INPUT TYPE="FILE" id="file1" NAME="file1" style="visibility:visible" onChange="javascript:fillupload()"/>
						</td></tr>	
						<tr><td  colspan="2"> 
							<h:outputText id="note" value="#{msgs.editcontentuploadserverview_note} #{addSectionPage.maxUploadSize}MB."  styleClass="comment red"/>							<h:inputHidden id="filename" value="#{addSectionPage.hiddenUpload}" />
							<h:outputText id="brval" value="<BR>" escape="false"/>
							<h:outputText id="somespaces1" value=" " styleClass="MediumPaddingClass" />
							<h:selectBooleanCheckbox id="windowopen" title="openWindow" value="#{addSectionPage.section.openWindow}" rendered="#{addSectionPage.shouldRenderUpload}">
	                        </h:selectBooleanCheckbox>
		                    <h:outputText id="editlinkText_8" value="#{msgs.editcontentlinkserverview_openwindow}" rendered="#{addSectionPage.shouldRenderUpload}"/>
							
					</td></tr>	
					
					
					</table> </td></tr>        
					     <tr>
					          	<td  colspan="2">
					          	<div class="actionBar" align="left">	
					          	 	<h:commandButton id="addButton" action="#{addSectionPage.setServerFile}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
					          	 	<h:commandButton id="cancelButton" immediate="true" action="#{addSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
						 </div>					              	
					              	</td>
					            </tr>		   
		<!-- replace local end -->			            
					<tr>
						<td>
				<!-- start main -->
						            <tr>
						              <td width="100%" valign="top" align="center">
						          															
														<!-- resource listing begin-->											
											 	<f:subview id="UploadResourceListingForm">	
													<jsp:include page="list_resources.jsp"/> 
													</f:subview>											
				<!-- resource listing end-->		
											
						  </td>
			            </tr>
			            <tr>
					          	<td  colspan="2">
					          	<div class="actionBar" align="left">	
					          	 	<h:commandButton id="addButton_1" action="#{addSectionPage.setServerFile}" value="#{msgs.im_continue}" tabindex="" accesskey="#{msgs.continue_access}" title="#{msgs.im_continue_text}" styleClass="BottomImgContinue"/>
					          	 	<h:commandButton id="cancelButton_1" immediate="true" action="#{addSectionPage.cancelServerFile}" value="#{msgs.im_cancel}" tabindex="" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>
							    </div>					              	
					              	</td>
					            </tr>
					     	</table>					
							<!--end  main -->	
			</td>
  		</tr>
	</table>
	<!-- This Ends the Main Text Area -->
	     	</h:form>
</body>
</f:view>
</html> 




