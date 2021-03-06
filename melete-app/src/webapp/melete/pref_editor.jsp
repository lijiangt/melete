<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/pref_editor.jsp $
 * $Id: pref_editor.jsp 63702 2009-09-30 21:29:05Z mallika@etudes.org $  
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


<title>Melete - Editor Preference</title>
<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
</head>

<f:view>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0" onload="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');" >
 <h:form id="EditorPreferenceForm">
<table>
	<tr>
		<td valign="top"></td>
    	<td width="1962" valign="top">
        	<table width="100%"  border="1" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA"  style="border-collapse: collapse">
          		<tr>
            		<td width="100%" height="20" bordercolor="#E2E4E8">
					<!-- top nav bar -->
						<f:subview id="top">
								<jsp:include page="topnavbar.jsp"/> 
						</f:subview>
		  <div class="meletePortletToolBarMessage"><img src="images/user1_preferences.gif" width="16" height="16" align="absbottom" border="0"><h:outputText value="#{msgs.pref_editor_editor_preferences}" /></div>				
				</td>
        </tr>
        <tr>
          <td class="maintabledata3" valign="top">
		  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#EAEAEA" width="100%" id="AutoNumber1">
		  	<tr><td  height="20" class="maintabledata5" ><h:outputText id="t1" value="#{msgs.pref_editor_select}"  styleClass="tableheader2"/>          </td></tr>
              <tr>
                <td>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr><td>
                	<h:outputText id="editortxt" value="#{msgs.pref_editor_available}" /></td>
					<td>
							<h:selectOneRadio value="#{authorPreferences.userEditor}" layout="pageDirection">
									<f:selectItems value="#{authorPreferences.availableEditors}" />
								</h:selectOneRadio>	
					</td>	
					</tr>		
					</table></td></tr>						
              <tr>
                <td height="30" >         
                <div align="center">				
				<h:commandLink id="SetButton"  action="#{authorPreferences.setEditorChoice}">
					<h:graphicImage id="setImg" value="#{msgs.im_set}" styleClass="BottomImgSpace"
						onmouseover="this.src = '#{msgs.im_set_over}'" 
						onmouseout="this.src = '#{msgs.im_set}'" 
						onmousedown="this.src = '#{msgs.im_set_down}'" 
						onmouseup="this.src = '#{msgs.im_set_over}'"/>
                </h:commandLink>	
			</div></td>
              </tr>
			 <tr><td  height="20" class="maintabledata5">&nbsp;</td></tr>
            </table>
          </td>
        </tr>
      </table>
	</h:form>

</td>
  </tr>
</table>
</td></tr></table>
  <!-- This Ends the Main Text Area -->
</body>
</f:view>
</html>
