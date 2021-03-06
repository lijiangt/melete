<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/module_post_steps.jsp $
 * $Id: module_post_steps.jsp 64019 2009-10-15 21:02:58Z mallika@etudes.org $  
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


<title>Melete - Module Post Steps</title>
<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
</head>

<f:view>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0" onload="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');" >

<h:form id="ModulePostStepsForm">
<!-- This Begins the Main Text Area -->
<table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse">
        <tr>
          <td width="100%" class="maintabledata1">
			  	<!-- top nav bar -->
				<f:subview id="top">
						<jsp:include page="topnavbar.jsp"/> 
				</f:subview>
				<div class="meletePortletToolBarMessage"><img src="images/view_next.gif" alt="" width="16" height="16" align="absbottom"><h:outputText value="#{msgs.module_post_steps_whats_next}" /> </div>
			</td>
		</tr>
			
		<tr><td height="20"><h:messages showDetail="true" showSummary="false" infoClass="BlueClass" errorClass="RedClass"/></td></tr>
			<tr>
			  <td class="maintabledata6">
				<table width="100%" border="0" cellspacing="0" cellpadding="3">
				  <tr>
				  <td height="20" class="maintabledata5">
							  <h:outputText id="text5" value="#{msgs.module_post_steps_message1}"/> 
				  </td></tr>
				  <tr><td>&nbsp;</td></tr>
                  <tr>
                    <td>
                    <h:outputText id="text6" value="#{msgs.module_post_steps_message2}"/> </td>
                  </tr>
                  <tr><td>&nbsp;</td></tr>
                  <tr>
                    <td>  <h:outputText id="text4"  value="#{moduleNextStepsPage.mdBean.module.title}" /></td>
                  </tr>
                
                  <tr>
                    <td>
                    <h:inputTextarea id="nextsteps" cols="65" rows="7" value="#{moduleNextStepsPage.mdBean.module.whatsNext}" styleClass="formtext"> <f:validateLength maximum="700" minimum="1" /> </h:inputTextarea>   </td>
                  </tr>
                </table>  
                    </td>
              </tr>
              <tr>
                <td>
                 <div class="actionBar" align="left">				
					<h:commandButton id="addsteps"  action="#{moduleNextStepsPage.addPostSteps}" rendered="#{moduleNextStepsPage.mdBean.module.whatsNext == moduleNextStepsPage.isNull}" value="#{msgs.im_add_button}" accesskey="#{msgs.add_access}" title="#{msgs.im_add_button_text}" styleClass="BottomImgAdd"/>
					<h:commandButton id="savesteps" action="#{moduleNextStepsPage.savePostSteps}" rendered="#{moduleNextStepsPage.mdBean.module.whatsNext != moduleNextStepsPage.isNull}" value="#{msgs.im_save}" accesskey="#{msgs.save_access}" title="#{msgs.im_save_text}" styleClass="BottomImgSave"/>	
					<h:commandButton id="cancelButton" immediate="true" action="#{moduleNextStepsPage.cancelChanges}" value="#{msgs.im_cancel}" accesskey="#{msgs.cancel_access}" title="#{msgs.im_cancel_text}" styleClass="BottomImgCancel"/>       
       			 </div>
          </td>
        </tr>
      </table>    
		</h:form>
<!-- This Ends the Main Text Area -->

</body>
</f:view>
</html>	  		
