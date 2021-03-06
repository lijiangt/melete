<!--
 ***********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/melete/tags/2.7.3/melete-app/src/webapp/melete/sections_sort.jsp $
 * $Id: sections_sort.jsp 64898 2009-11-24 22:26:14Z mallika@etudes.org $  
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

<html><head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="description" content="ETUDES-NG Course Management System, Powered by Sakai">
<meta name="keywords" content="ETUDES-NG course management system, e-learning">

<title>Melete - Sort Sections</title>
<script type="text/javascript" language="JavaScript" src="js/headscripts.js"></script>
<script language="javascript">
function resetModuleSelection() {
      	var element = document.getElementById("SortSectionForm:currmodule");
		if ((document.referrer.substring(document.referrer.length-13,document.referrer.length) == "author_manage")||(document.referrer.substring(document.referrer.length-12,document.referrer.length) == "modules_sort"))
  
    	{
    		element.options[0].selected = true;
    	}
    	else
    	{
    	   return;
    	}  
}
</script>
</head>
<f:view>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0" onload="setMainFrameHeight('<h:outputText value="#{meleteSiteAndUserInfo.winEncodeName}"/>');resetModuleSelection();" >
<h:form id="SortSectionForm">
  <h:inputHidden id="formName" value="SortSectionForm"/>  
<!-- This Begins the Main Text Area -->

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
						<div class="meletePortletToolBarMessage"><img src="images/document_exchange.gif" alt="" width="16" height="16" align="absmiddle"><h:outputText value="#{msgs.sort_sections_top_message}" /></div>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<!-- main page contents -->
			 			<h:messages id="sorterror" layout="table" style="color : red" />
						<table width="100%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#EAEAEA" style="border-collapse: collapse">
			   				    <tr>
                    			<td>
									<table width="25%"  border="0" cellspacing="0" cellpadding="0">
                				      <tr>
				                        <td class="style2"><h:outputText value="#{msgs.sort_modules_sort}" /> </td>
										<td>
										 <!-- Begin code to display images horizontally. -->
										  <h:commandButton id="sortmod" immediate="true" action="#{sortModuleSectionPage.goToSortModules}" value="#{msgs.im_sort_modules}" title="#{msgs.im_sort_modules}" styleClass="BottomImgSort"/>
										 </td>
										 <td>
										  <h:commandButton id="Sort_Sections-horz" disabled="true" value="#{msgs.im_sort_sections}" title="#{msgs.im_sort_sections}" styleClass="BottomImgSort"/> 			
										<!-- End code to display images horizontally. -->
										</td>
									  </tr>
									</table>
								</td>
							  </tr>
							  <tr>
										<td height="30"><h:outputText value="#{msgs.sort_sections_choose_module}"/> 
							          <h:selectOneMenu id="currmodule" value="#{sortModuleSectionPage.currModule}"  valueChangeListener="#{sortModuleSectionPage.nextModuleSections}" onchange="this.form.submit();" style="width:30%">
															 <f:selectItems value="#{sortModuleSectionPage.allModulesList}" />							
												 </h:selectOneMenu>													
										</td>
									  </tr>
							   <tr>
							   	<td  bgcolor="#EEEEEE">
							   	<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#EEEEEE">
									<th class="tableheader style4 " height="20"><h:outputText value="#{msgs.sort_modules_curr_seq}" /> </th>
									<th class="tableheader">&nbsp;</th>
									<th class="tableheader style4" height="20"><h:outputText value="#{msgs.sort_modules_new_seq}" /></th>
									<th class="tableheader">&nbsp;</th>
								    <tr>
									<td width="47%" valign="top" align="left" >					
									 <h:selectOneListbox id="sectioncurrList" disabled="true" size="#{sortModuleSectionPage.showSize}" style="width:100%">
												 <f:selectItems value="#{sortModuleSectionPage.currSecList}" />							
									 </h:selectOneListbox>							                      
			                    	  </td>
	        			           <td width="3%">&nbsp;</td>
	                    			<td width="47%" valign="top">
									 	 <h:selectOneListbox id="sectionnewList" value="#{sortModuleSectionPage.newSelectedSection}" size="#{sortModuleSectionPage.showSize}" style="width:100%">
											 <f:selectItems value="#{sortModuleSectionPage.newSecList}" />							
										 </h:selectOneListbox>
									</td>                        
									<td width="3%" align="center">
					                        <h:commandLink id="up_end"  action="#{sortModuleSectionPage.MoveSectionItemAllUpAction}">	
											 <h:graphicImage id="upImg1" value="images/up_end.gif" alt="#{msgs.sort_all_Up}" title="#{msgs.sort_all_Up}" width="20" height="20" style="border:0" />
									   </h:commandLink>	
					                    <h:commandLink id="up_one"  action="#{sortModuleSectionPage.MoveSectionItemUpAction}">	
											 <h:graphicImage id="upImg" value="images/up.gif" alt="#{msgs.sort_Up}" title="#{msgs.sort_Up}" width="20" height="20" style="border:0" />
									   </h:commandLink>		 
	 									<h:commandLink id="down_one"  action="#{sortModuleSectionPage.MoveSectionItemDownAction}">		 
											 <h:graphicImage id="downImg" value="images/down.gif" alt="#{msgs.sort_Down}" title="#{msgs.sort_Down}" width="20" height="20" style="border:0" />
	 									   </h:commandLink>	  
	 									   <h:commandLink id="down_end"  action="#{sortModuleSectionPage.MoveSectionItemAllDownAction}">		 
											 <h:graphicImage id="downImg_end" value="images/down_end.gif" alt="#{msgs.sort_all_Down}" title="#{msgs.sort_all_Down}" width="20" height="20" style="border:0" />
	 									   </h:commandLink>	 										 
										  </td>
					                     </tr>
	                				    </table>
	                				  </td>
				                  </tr>                	
								 <tr><td class="maintabledata5">&nbsp;</td>
				 				</tr>
							</table>							
						</td>
				  	</tr>
				</table>
				</td>
			  </tr>
		    </table>
</h:form>
<!-- This Ends the Main Text Area -->

</body>
</f:view>
</html>	  