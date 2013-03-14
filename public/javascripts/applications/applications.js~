function get_role_for_tab() {
	tab_applications_li_html = $("applications").getElementsByTagName("li");
	//tab_url_home = $('span_id_url_home').innerHTML.split("/");
	//return tab_url_home[tab_url_home.length-1];
	//alert(tab_url_home[tab_url_home.length-1]);
	//alert(tab_url_home.length-1);
	//alert(tab_url_home[tab_url_home.length-1]);
	//alert(tab_applications_li[2].innerHTML);
	tab_applications = new Array();
	for (i=0; i < tab_applications_li_html.length; i++) {
		tab_applications[i] = tab_applications_li_html[i].id;	
	}
	return tab_applications;
	//alert(tab_applications);
}

window.onload =  function() {
	//get_role_for_tab()
          new Ajax.PeriodicalUpdater (
		'applications', 
		'javascript/apps_javascript_periodicalupdater', 
		{ 	method: 'post',
			frequency: 30,
		        parameters: "application_id="+get_role_for_tab(),
			//insertion: Insertion.Top,
			evalScripts: true
		}
          );
}

