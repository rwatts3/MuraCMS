<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->


<cfoutput>
<cfset rc.originalfuseaction=listLast(request.action,".")>
	<div class="nav-module-specific btn-group">
	<cfswitch expression="#rc.originalfuseaction#">
		<cfcase value="list">
			<a class="btn" title="#application.rbFactory.getKeyValue(session.rb,'collections.addlocalindex')#" href="./?muraAction=cFeed.edit&feedID=&siteid=#esapiEncode('url',rc.siteid)#&type=Local"><i class="mi-plus-circle"></i> #application.rbFactory.getKeyValue(session.rb,'collections.addlocalindex')#</a>
			<a class="btn" title="#application.rbFactory.getKeyValue(session.rb,'collections.addremotefeed')#" href="./?muraAction=cFeed.edit&feedID=&siteid=#esapiEncode('url',rc.siteid)#&type=Remote"><i class="mi-plus-circle"></i> #application.rbFactory.getKeyValue(session.rb,'collections.addremotefeed')#</a>
			<cfif listFind(session.mura.memberships,'Admin;#application.settingsManager.getSite(rc.siteid).getPrivateUserPoolID()#;0') or listFind(session.mura.memberships,'S2')>
			<a class="btn <cfif rc.originalfuseaction eq 'module'> active</cfif>" href="./?muraAction=cPerm.module&contentid=00000000000000000000000000000000011&siteid=#esapiEncode('url',rc.siteid)#&moduleid=00000000000000000000000000000000011"><i class="mi-group"></i> #application.rbFactory.getKeyValue(session.rb,'collections.permissions')#</a>
			</cfif>
		</cfcase>
		<cfdefaultcase>
			<a class="btn" href="./?muraAction=cFeed.list&siteid=#esapiEncode('url',rc.siteid)#"><i class="mi-arrow-circle-left"></i> #application.rbFactory.getKeyValue(session.rb,"collections.backtocollections")#</a>
			<cfif isDefined('rc.feedBean') and not rc.feedBean.getIsNew()>
				<cfif rc.feedBean.getType() eq 'Local'>
					<a class="btn" title="#application.rbFactory.getKeyValue(session.rb,'collections.view')#" href="#endpoint#/?feedID=#rc.feedBean.getfeedID()#" target="_blank"><i class="mi-rss"></i> #application.rbFactory.getKeyValue(session.rb,'collections.viewfeed')#</a>
				<cfelse>
					<a class="btn" title="#application.rbFactory.getKeyValue(session.rb,'collections.view')#" href="#rc.feedBean.getChannelLink()#" target="_blank"><i class="mi-rss"></i> #application.rbFactory.getKeyValue(session.rb,'collections.viewfeed')#</a>
				</cfif>
			</cfif>
		</cfdefaultcase>
	</cfswitch>
	</div>
</cfoutput>