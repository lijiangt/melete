<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/ContentLinkView.jsp $
 * $Id: ContentLinkView.jsp 63702 2009-09-30 21:29:05Z mallika@etudes.org $  
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
<%@include file="accesscheck.jsp" %>

  <h:panelGrid id="LinkPanel2" columns="2" width="80%" columnClasses="col30,col50" border="0">
   	<h:column><h:outputText id="linkText1" value="#{msgs.contentlinkview_link}"/>
   	<h:outputText id="extraspacesUpload0" value="" styleClass="ExtraPaddingClass" />
			 <h:outputLink id="showResourceLink" value="#{addSectionPage.currLinkUrl}" target="_blank" title="Section Resource" styleClass="a1" rendered="#{addSectionPage.displayCurrLink != null}">	  
				<h:outputText id="editlinkText3" value="#{addSectionPage.displayCurrLink}" />
  			 </h:outputLink>
			 <h:outputText id="linkText2" value="#{msgs.contentlinkview_nofile}" rendered="#{addSectionPage.displayCurrLink == null}" styleClass="bold"/>	
			 <h:outputText id="extraspacesUpload1" value="" styleClass="ExtraPaddingClass" />
			  <h:outputText id="extraspacesUpload2" value="" styleClass="ExtraPaddingClass" />
	</h:column>
	<h:column>		  
			   <h:commandLink id="serverViewButton"  action="#{addSectionPage.gotoServerLinkView}" >
					<h:graphicImage id="replaceImg2" value="images/replace2.gif" styleClass="AuthImgClass"/>
					<h:outputText value="#{msgs.contentuploadview_select}" />
             </h:commandLink>	
	</h:column>
	<h:column/>
   <h:column>     
             <h:selectBooleanCheckbox id="windowopen" title="openWindow" value="#{addSectionPage.section.openWindow}" >
		  </h:selectBooleanCheckbox>
		  <h:outputText id="editlinkText_8" value="#{msgs.editcontentlinkserverview_openwindow}" />
        </h:column>        
</h:panelGrid>
