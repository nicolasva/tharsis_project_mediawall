function etape_color_applications(id_buton_applications)
{
	tab_list_ul_etape = $("ul_id_form_new_apps").getElementsByTagName("li");

		/*$(tab_list_ul_etape[0]).style.color = "black";
		$(tab_list_ul_etape[0]).style.fontWeight = "normal";
		//$(tab_list_ul_etape[1]).style.backgroundColor = "black";
		$(tab_list_ul_etape[1]).style.color = "#98CC54";
		$(tab_list_ul_etape[1]).style.fontWeight = "bold";*/
	switch (id_buton_applications) {
		case "id_buton_next_1_to_2":
			$(tab_list_ul_etape[0]).style.color = "black";
			$(tab_list_ul_etape[0]).style.fontWeight = "normal";
			$(tab_list_ul_etape[1]).style.color = "#98CC54";
			$(tab_list_ul_etape[1]).style.fontWeight = "bold";
		break;
		case "id_buton_retour_2_to_1":
			$(tab_list_ul_etape[1]).style.color = "black";
			$(tab_list_ul_etape[1]).style.fontWeight = "normal";
			$(tab_list_ul_etape[0]).style.color = "#98CC54";
			$(tab_list_ul_etape[0]).style.fontWeight = "bold";
		break;
		case "id_buton_next_2_to_3":
			$(tab_list_ul_etape[1]).style.color = "black";
			$(tab_list_ul_etape[1]).style.fontWeight = "normal";
			$(tab_list_ul_etape[2]).style.color = "#98CC54";
			$(tab_list_ul_etape[2]).style.fontWeight = "bold";
		break;
		case "id_buton_retour_3_to_2":
			$(tab_list_ul_etape[2]).style.color = "black";
			$(tab_list_ul_etape[2]).style.fontWeight = "normal";
			$(tab_list_ul_etape[1]).style.color = "#98CC54";
			$(tab_list_ul_etape[1]).style.fontWeight = "bold";
		break;
	}
}

function check_message_sup_logos_themes(choix,id,id_box)
{
	/*switch(choix)
	{
		case "themes":
			return "Pour supprimer ce thème cliquer dessus";
		break;
		case "logos":
			return "Pour supprimer ce logo cliquer dessus";
		break;
		case "add_logos":
			return "Pour Ajouter ce logo cliquer dessus";
		break;
	}*/
	var result_affichage;
	xhr = Ajax.getTransport();

	xhr.onreadystatechange = function() {	
		//alert("test");		
		if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
					//return xhr.responseText;
  					$(id).insert("<div id='"+id_box+"' style='border:1px solid #aaa;color:#aaa;-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px; '>"+xhr.responseText+"</div>")
		}
							//document.getElementById("id_choix_applications").innerHTML = xhr.responseText;	
	}
	xhr.open('get', '/javascript/message_popup_affichage?choix='+choix);
	xhr.send();
	//return result_affichage;
};

function set_value_description_checked_file()
{
	tab_liste_ul_result_liste_versions = new Array();
	tab_liste_ul_result_liste_versions = $('div_id_result_liste_versions').getElementsByTagName("ul");

	for(i = 0; i < tab_liste_ul_result_liste_versions.length; i++){
		tab_list_ol_role_version = new Array();
	        tab_list_ol_role_version = tab_liste_ul_result_liste_versions[i].getElementsByTagName("ol");
		
		for(e = 0; e < tab_list_ol_role_version.length; e++){
			tab_list_ul_file = new Array();
			tab_list_ul_file = tab_list_ol_role_version[e].getElementsByTagName("ul");
			
			for(j = 0; j < tab_list_ul_file.length; j++){
				tab_list_input_file = tab_list_ul_file[j].getElementsByTagName("input");
				for(k = 0; k < tab_list_input_file.length; k++){
					if (tab_list_input_file[k].checked)
					{
						//alert(tab_list_input_file[k].value);
						
						xhr = Ajax.getTransport();

						xhr.onreadystatechange = function() {
							if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
								if ($('id_span_champs_current_version').innerHTML == "Version courante")
								{
									$("id_span_champs_current_version").innerHTML =  xhr.responseText;	
								}
								else
								{
									$("id_span_champs_current_version").innerHTML = "; " + xhr.responseText;
								}
							}
						}	
						xhr.open('get', '/javascript/get_info_fichiercompressions?fichiercompression_id='+tab_list_input_file[k].value);
						xhr.send();
					}
				}
			}	
		}	
	}
};

function checked_sub_apps()
{
 	//alert('test');
	result_check_apps = false;
	$$('.application_cb').each(function(cb){
		if (cb.checked)
		{
			result_check_apps = cb.checked;
		}
	});
	verif_checked_apps(result_check_apps)
	
	//(result_check_apps ? $('id_buton_suivant_etape2_etape1').show() : $('id_buton_suivant_etape2_etape1').hide());
};

function checked_versions(state_checked,application_id)
{
	set_value_description_checked_file();
	//alert("ul_fichiercompression_"+application_id);
	tab_liste_input_versions = $("ul_fichiercompression_"+application_id).getElementsByTagName("input");

	for(i = 0; i < tab_liste_input_versions.length; i++){
		tab_liste_input_versions[i].checked = true;
	}
	verif_checked_versions(state_checked);
};

function display_apps_roles(role_id)
{
      if ($("ol_role_apps_"+role_id) != null)
      {
	if (Element.visible("ol_role_apps_"+role_id))
	{
		new Effect.Fade("ol_role_apps_"+role_id);
	}
	else
	{
		Effect.SlideDown("ol_role_apps_"+role_id,{duration:1.0});
	}
      }

};

function display_apps_versions(role_id)
{
	if ($("ol_role_versions_"+role_id) != null)
	{
		if (Element.visible("ol_role_versions_"+role_id))
		{
			new Effect.Fade("ol_role_versions_"+role_id);
		}
		else
		{
			Effect.SlideDown("ol_role_versions_"+role_id,{duration:1.0});
		}
	}
};

function verif_checked_versions(state_checked)
{
	//alert('test');
	       set_value_description_checked_file();
	       var file_merge = "";
	       var checkedinput_versions = false;
	       tab_liste_input_versions = $("div_id_result_liste_versions").getElementsByTagName("input");

	       for (i = 0; i < tab_liste_input_versions.length; i++)
	       {
		       if (tab_liste_input_versions[i].checked)
		       {
			       checkedinput_versions = true;
		       }

	       }

		//tab_liste_input_apps = new Array();
		//tab_liste_input_apps = $("div_id_result_liste_bornes").getElementsByTagName("input");
		//for (i = 0; i < tab_liste_input_apps.length; i++){
		//	tab_liste_input_apps[i].disabled = ((state_checked || checkedinput_versions) ? true : false);	
		//}
		//Insertion.After(element, html)
};

function verif_checked_apps(state_checked)
{
	var checkedinput_apps = false;
	tab_liste_input_apps = $("div_id_result_liste_bornes").getElementsByTagName("input");

	for (i = 0; i < tab_liste_input_apps.length; i++)
	{
		if (tab_liste_input_apps[i].checked)
			checkedinput_apps = true;
	}

	//tab_liste_input_versions = new Array();
	//tab_liste_input_versions = $("div_id_result_liste_versions").getElementsByTagName("input");
	//for (i = 0; i < tab_liste_input_versions.length; i++){
	//	tab_liste_input_versions[i].disabled = ((state_checked || checkedinput_apps) ? true : false);
	//}
};

function check_apps(state_checked, role_id)
{
     if ($("ol_role_apps_"+role_id) != null) 
     {
	//alert(role_id);
	tab_list_ol_id_applications = new Array();
	tab_list_ol_id_applications = $("ol_role_apps_"+role_id).getElementsByTagName("li");

	for (i = 0; i < tab_list_ol_id_applications.length; i++){
		tab_list_ol_id_applications[i].down().checked = state_checked;
	}

	if (!Element.visible("ol_role_apps_"+role_id))
	{
		Effect.SlideDown("ol_role_apps_"+role_id,{duration:1.0});
	}
	verif_checked_apps(state_checked);
     }
	//(state_checked == true ? $("id_buton_suivant_etape2_etape1").show() : $("id_buton_suivant_etape2_etape1").hide());	
  	
};


function check_versions(state_checked, role_id)
{
     if($("ol_role_versions_"+role_id) != null)
     {
	tab_list_ol_id_applications = new Array();
	tab_list_ol_id_applications = $("ol_role_versions_"+role_id).getElementsByTagName("li");

	for(i = 0; i < tab_list_ol_id_applications.length; i++){
		tab_list_ol_id_applications[i].down().checked = state_checked;
	}

	if (!Element.visible("ol_role_versions_"+role_id))
	{
		Effect.SlideDown("ol_role_versions_"+role_id,{duration:1.0});
	}

	verif_checked_versions(state_checked);
     }
};

Event.addBehavior({
  '#paper_department_id:change' : function(e) {
    Global.showMultiple($$('.paper_template_id'), this.value=="2"); // Telematin
  },
  
  '.simple_confirm:click' : function(e) {
    if(!confirm(Translation.are_you_ready())) {
      return false;
    }
  },

  '#user_username:keyup' : function(e) {
	var champs_origin_lowercase = this.value.toLowerCase(); 
	if (champs_origin_lowercase != this.value)
		$("user_username").value = champs_origin_lowercase;
	
  },

  '#check_all_checkboxes_apps:click' : function(e) {
  	//alert($("div_id_result_liste_bornes").getElementsByTagName("input")[0].checked);
  	tab_input_lists_bornes = $("div_id_result_liste_bornes").getElementsByTagName("input")

	for (i = 0; i < tab_input_lists_bornes.length; i++)
	{
		tab_input_lists_bornes[i].checked = this.checked;
	}
  },

  '#type:click' : function(e) {
	xhr = Ajax.getTransport();

	xhr.onreadystatechange = function() {
		if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {	
			xhr.responseText == "PDF Reader" ? $("id_choix_merge").hide() : $("id_choix_merge").show(); 	
		}
	}	
	
	xhr.open('get', '/javascript/get_groupapp_name?groupapp_id='+this.value);
	xhr.send();

  },

  /*'#fichiercompression_currentversion:click' : function(e) {
  	//alert(this.checked);
      if ($('p_id_base_version') != null)
      {
	if (this.checked)
	{
		if ($('p_id_base_version').visible() == true)
			$('p_id_base_version').hide();

		if ($('fichiercompression_base_version').checked)
			$('fichiercompression_base_version').checked = false;
	}
	else
	{
		if ($('p_id_base_version').visible() == false)	
			$('p_id_base_version').show();

	}
      }
  },*/


  /*'#fichiercompression_base_version:click' : function(e) {
  	if (this.checked)
	{
		if ($('p_id_currentversion').visible() == true)
			$('p_id_currentversion').hide();

		if ($('fichiercompression_currentversion').checked)
			$('fichiercompression_currentversion').checked = false;
	}
	else
	{
		if ($("p_id_currentversion").visible() == false)
			$("p_id_currentversion").show();
	}
  },*/

  'input.class_buton_name_apps:click' : function(e) {
	  //alert(this.id);
  	//alert($('application_name').value);
	//alert($('application_groupapp_id').value != "")
      if (this.name == "buton_suivant")
      {
 	var etat_checked = false;
	tab_list_ul_etape = $("ul_id_form_new_apps").getElementsByTagName("li");
	//$('etape2').childElements()[1].childElements()[3].down().getElementsByTagName("li")[0].down().checked;
	tab_verif_groupuser_input_checked = $('etape2').childElements()[1].childElements()[3].down().getElementsByTagName("input");
		for(i = 0; i < tab_verif_groupuser_input_checked.length; i++){
			if (tab_verif_groupuser_input_checked[i].checked == true)
			{
				etat_checked = tab_verif_groupuser_input_checked[i].checked;
			}		
		}
	if (this.id != "id_buton_next_1_to_2" && etat_checked == false )
	{
		$("div_id_result_new_application").innerHTML = "Veuillez séléctionner un groupe afin de pouvoir continuer"; 
		Effect.SlideDown("div_id_result_new_application",{duration:1.0});
		Effect.Highlight("div_id_result_new_application", {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#ff0000', endcolor:'#00ff00', restorecolor:'white'});
		//alert("problème");	
		Effect.Highlight("p_id_select_groups", {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#ff0000', endcolor:'#00ff00', restorecolor:'white'});
	}

	else
	{
		if (this.id == "id_buton_next_1_to_2")
		{
				xhr = Ajax.getTransport();

				xhr.onreadystatechange = function() {
					if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
						$("application_name").value = xhr.responseText;	
					}
				}	
				xhr.open('get', '/javascript/check_number_apps?application_groupapp_id='+$('application_groupapp_id').value);
				xhr.send();

				//alert($('application_groupapp_id').value.childElements());
		}
		etape_color_applications(this.id);
   		//$("p_id_select_groups").style.backgroundColor = 'white';
		//$(tab_list_ul_etape[0]).style.backgroundColor = "white";
		//$(tab_list_ul_etape[0]).style.color = "black";
		//$(tab_list_ul_etape[0]).style.fontWeight = "normal";
		//$(tab_list_ul_etape[1]).style.backgroundColor = "black";
		//$(tab_list_ul_etape[1]).style.color = "#98CC54";
		//$(tab_list_ul_etape[1]).style.fontWeight = "bold";
		Position.prepare();
		container_y = Position.cumulativeOffset($('etape1'))[1]
		container_x = Position.cumulativeOffset($('etape1'))[0]
		element_y = Position.cumulativeOffset($('etape2'))[1]
		//new Effect.SlideDown("etape2",{duration:1.0});
		//$("etape2").show();
		new Effect.MoveBy('main', 0, -container_y-element_y-360, {duration:0.5, fps:25, from:0.0, to:1.0});
		//new Effect.Fade("etape1")
		//new Effect.MoveBy('etape2', 0, -container_y, {duration:3, fps:25, from:0.0, to:1.0});	
		//$("etape1").hide();	
		//moveTo('main', 'nokia2');
		//moveTo('p_id_name_apps', 'p_id_select_groups');
		//new Effect.MoveBy('etape1', 0, element_y-container_y, {duration: 0.4, transition: Effect.Transitions.sinoidal}); 
                //alert(element_y+'-'+container_y);
		//new Effect.Highlight("etape2", {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#7DCB74', endcolor:'#7DCB74', restorecolor:'transparent'});

		if (Element.visible("div_id_result_new_application"))
			new Effect.Fade("div_id_result_new_application");	
	}
       }
       else
       { 
		etape_color_applications(this.id);
		//$(tab_list_ul_etape[0]).style.backgroundColor = "black";
		//$(tab_list_ul_etape[0]).style.color = "#98CC54";
		//$(tab_list_ul_etape[0]).style.fontWeight = "bold";
		//$(tab_list_ul_etape[1]).style.backgroundColor = "white";
		//$(tab_list_ul_etape[1]).style.color = "black";	
		//$(tab_list_ul_etape[1]).style.fontWeight = "normal";
		Position.prepare();
		container_y = Position.cumulativeOffset($('etape1'))[1]
		container_x = Position.cumulativeOffset($('etape1'))[0]
		element_y = Position.cumulativeOffset($('etape2'))[1]

		new Effect.MoveBy('main', 0, element_y+container_y+360, {duration:0.5, fps:25, from:0.0, to:1.0});
       }
  },

  '.div_class_height_contenu a.class_link_add_type_apps:click' :function(e) {
  	//alert(this.title);
	Modalbox.show(this.href, {title: "Ajouter un groupe d'applications", width: 585, height: 440});
	return false;
  },


  '.class_check_choixfile:click' : function(e) {
  	//alert("test");
	//alert(this.value);
	tab_list_ul_class_choix_file = $("ul_id_choix_file").getElementsByTagName("li");
	if (this.value == 'ftp')
	{
		$(tab_list_ul_class_choix_file[0]).style.color = 'silver';
		$(tab_list_ul_class_choix_file[0]).childElements()[3].disabled = true;
		$(tab_list_ul_class_choix_file[1]).style.color = 'black';
		/*$(tab_list_ul_class_choix_file[1]).down().childElements().each(function(lii) {
			alert(lii.id);	
		});*/
		$(tab_list_ul_class_choix_file[1]).childElements()[3].borderColor= 'black';
		$$('.class_file_check_ftp').each(function(cb){
			cb.disabled = false;
		});
	}
	else
	{	
		$(tab_list_ul_class_choix_file[0]).style.color = 'black';
		$(tab_list_ul_class_choix_file[0]).childElements()[3].disabled = false;
		$(tab_list_ul_class_choix_file[1]).style.color = 'silver';
		$$('.class_file_check_ftp').each(function(cb){
			cb.disabled = false;
		});
	}
  },

  '.application_cb:click' : function(e) {
 	//alert('test');
	result_check_apps = false;
	$$('.application_cb').each(function(cb){
		if (cb.checked)
		{
			result_check_apps = cb.checked;
		}
	});
	(result_check_apps ? $('id_buton_suivant_etape2_etape1').show() : $('id_buton_suivant_etape2_etape1').hide());
  },

//'#fichiercompression_update_file:click' : function(e) {
  //	this.checked == true ? $('id_version_apps').childElements()[2].show() : $('id_version_apps').childElements()[2].hide() 
  //},

  '.class_buton_name_fichiercompressions:click' : function(e) {
  	//alert("test");
	//var number_move_by = $("id_choix_update_all").checked && this.name == "buton_suivant_etape1_etape0" ? 450*2.6 : $("id_choix_update_all").checked && this.name == "buton_retour_etape1_etape2" ?  450*2.6 : 450;    
	//var number_move_by = $("id_choix_update_all").checked && (this.name == "buton_suivant_etape1_etape0" || this.name == "buton_retour_etape1_etape2") ? 450*2.6 : 430;
	var number_move_by = 430;
	    if (this.name == "buton_suivant_etape1_etape0" || this.name == "buton_suivant_etape2_etape1")
	    {
		//$('id_buton_suivant_etape2_etape1').show();
		        var result_check_apps = false;
			$$('.application_cb').each(function(cb){
				if (cb.checked)
				{
					result_check_apps = cb.checked;
				}
			});

	       if (this.name == "buton_suivant_etape1_etape0" || this.name == "buton_suivant_etape2_etape1")
	       {
		//alert(result_check_apps);
		id_etape_next = this.name.split("_")[2];
		id_etape_precedente = this.name.split("_")[3];
		Position.prepare();
		container_y = Position.cumulativeOffset($(id_etape_precedente))[1]
		container_x = Position.cumulativeOffset($(id_etape_precedente))[0]
		element_y = Position.cumulativeOffset($(id_etape_next))[1]
			if (this.name == "buton_suivant_etape2_etape1")
			{
				

				//$$('.application_cb').each(function(cb){ cb.checked = e.element().checked });
				/*var_tab_application_cheked = ""
				$$('.application_cb').each(function(cb){
					if (cb.checked)
					{
						var_tab_application_cheked += "tab_application[]="+cb.value+"&";
					
					}
				});
				xhr = Ajax.getTransport();

				xhr.onreadystatechange = function() {
					if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
						$("div_id_apps_update").update(xhr.responseText);	
					}
				}	

				if ($("fichiercompression_update_file").checked)
				{

					xhr.open('get', '/javascript/tableau_recapitulatif_fichiercompressions?'+var_tab_application_cheked);
				}
				else
				{
					xhr.open('get', '/javascript/tableau_recapitulatif_all_apps?type='+$("type").value);
				}
				xhr.send();*/		

				xhr = Ajax.getTransport();
			   
			        xhr.onreadystatechange = function() {
					if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
						$("div_id_result_liste_bornes").update(xhr.responseText);	
					}
					
				}

				xhr.open('get', '/javascript/file_liste_all_apps?id_type='+$("fichiercompression_type_id").value);
				xhr.send();
			}	

			new Effect.MoveBy('main', 0, -container_y-element_y-number_move_by+30, {duration:0.5, fps:25, form:0.0, to:1.0});
	       }
	       else
	       {
			$("id_notice_fichiercompressions").update("Veuillez séléctionner des applications afin de pouvoir continuer");
			$("id_notice_fichiercompressions").show();	
			new Effect.Highlight("id_notice_fichiercompressions", {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#ff0000', restorecolor:'white'}); 
			new Effect.Highlight("etape1", {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#FFFF99', restorecolor:'white'});
		}
            }
	    else
	    {
		id_etape_precedente = this.name.split("_")[2];
		id_etape_next = this.name.split("_")[3];
		Position.prepare();
		container_y = Position.cumulativeOffset($(id_etape_precedente))[1]
		container_x = Position.cumulativeOffset($(id_etape_precedente))[0]
		element_y = Position.cumulativeOffset($(id_etape_next))[1]

		new Effect.MoveBy('main', 0, element_y+container_y+number_move_by-30, {duration:0.5, fps:25, from:0.0, to:1.0});
            }
  },

  'ul.ul_class_liste_application ol li:mouseover': function(e) {	
 	tab_liste_groups_apps = $("ul_id_groups_applications").getElementsByTagName("ol");

	for(e = 0; e < tab_liste_groups_apps.length-1; e++)
	{
		tab_liste_apps_groups = $(tab_liste_groups_apps[e]).getElementsByTagName("li");
		for (i = 0; i < tab_liste_apps_groups.length-1; i++)
		{
			//alert(tab_liste_apps_groups[i].id);
			id_apps = tab_liste_apps_groups[i].id.split("_")[1];
			if ($("id_box_apps_"+id_apps) != null)
			{
				$("id_box_apps_"+id_apps).remove();
			}
				
			//alert(id_apps);
		}
	}	
	id_apps = this.id.split("_")[1];
	this_id = this.id
	var xhr = Ajax.getTransport();
		xhr.onreadystatechange = function() {
			if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {

				$(this_id).insert("<div id='id_box_apps_"+id_apps+"' style='position:fixed;height:70px;width:150px;margin-left:80px;background-color:white;border:1px solid black;'>"+xhr.responseText+"</div>");
			
			}
		}	
	xhr.open('get', '/javascript/detail_apps?application_id='+id_apps);
	xhr.send();
		
  },

  'ul.ul_class_liste_application ol li:mouseout': function(e) {
  //	alert('test');
	tab_liste_groups_apps = $("ul_id_groups_applications").getElementsByTagName("ol");
	for (e = 0; e <  tab_liste_groups_apps.length-1; e++)
	{
		tab_liste_apps_groups = $(tab_liste_groups_apps[e]).getElementsByTagName("li");
		for (i = 0; i < tab_liste_apps_groups.length-1; i++)
		{
			id_apps = tab_liste_apps_groups[i].id.split("_")[1];
			if ($("id_box_apps_"+id_apps) != null)
				$("id_box_apps_"+id_apps).remove();
		}
	}
  },

  '.checkbox_groupapps:click' : function(e) {
		state_checked = this.checked;
		tab_list_ol_id_applications = new Array();
		tab_list_ol_id_applications = $("ol_id_applications_"+this.value).getElementsByTagName("li");

		for (i = 0; i < tab_list_ol_id_applications.length; i++){
			tab_list_ol_id_applications[i].down().checked = state_checked;
		}
	
		if (!Element.visible("ol_id_applications_"+this.value))
		{
			Effect.SlideDown("ol_id_applications_"+this.value,{duration:1.0});	
		}
	
		   (state_checked == true ? $("id_buton_suivant_etape2_etape1").show() : $("id_buton_suivant_etape2_etape1").hide());	
  },

  '.checkbox_roles_apps:click' : function(e) {
 	state_checked = this.checked;
        tab_liste_ol_id_applications = new Array();
  	//alert(this.up());
	state_checked ? $("ol_id_applications_"+this.value).show() : $("ol_id_applications_"+this.value).hide();
	tab_list_ol_id_applications = $("ol_id_applications_"+this.value).getElementsByTagName("li");
	//alert(tab_list_ol_id_applications);

	for (i = 0; i < tab_list_ol_id_applications.length; i++){
		tab_list_ol_id_applications[i].down().checked = state_checked;	
	}
  },

  '.class_choix_applications ul li a:click' : function(e){
	  //id_link_name_role_3
	  //alert(this.id);
	  var role_id = this.id.split("_")[4];
	  //alert(role_id);
	  $("ol_id_applications_"+role_id).visible() ? $("ol_id_applications_"+role_id).hide() : $("ol_id_applications_"+role_id).show();
  },

  '.class_categoriecolonnetable_name:click' : function(e){
  	//tab_list_ol_id_applications = $("ol_role_apps_"+this.value).getElementsByTagName("li");
	tab_td_value = this.up().up().getElementsByTagName("td");
	
      for (i = 0; i < tab_td_value.length; i++){
	if (this.checked)
	{
		      if (tab_td_value[i].getAttribute("class") != 'class_name_categoriecolonnetable')
			      tab_td_value[i].down().show();
	}
	else
	{
		      if (tab_td_value[i].getAttribute("class") != 'class_name_categoriecolonnetable')
			tab_td_value[i].down().hide();
	}
      }
  },

  '.class_checkbox_statistic:click' : function(e){
  	//alert(this.value);	
	//alert(this.checked);
	
	if (this.checked) {
		if ($("id_checkbox_imagegrand_"+this.value).visible() == false)
			$("id_checkbox_imagegrand_"+this.value).show();
	}	
	else
	{
		if ($("id_checkbox_imagegrand_"+this.value).visible())
			$("id_checkbox_imagegrand_"+this.value).hide();
	}
  },


  '.checkbox_roles:click' : function(e) {
	//alert($("ol_role_apps_"+this.value));
	state_checked = this.checked;
	tab_list_ol_id_applications = new Array();
	tab_list_ol_id_applications = $("ol_role_apps_"+this.value).getElementsByTagName("li");

	for (i = 0; i < tab_list_ol_id_applications.length; i++){
		tab_list_ol_id_applications[i].down().checked = state_checked;
	}

	if (!Element.visible("ol_role_apps_"+this.value))
	{
		Effect.SlideDown("ol_role_apps_"+this.value,{duration:1.0});
	}
		   (state_checked == true ? $("id_buton_suivant_etape2_etape1").show() : $("id_buton_suivant_etape2_etape1").hide());	
  	
  },

  'a.class_liens_name_group:click': function(e) {
	groupapp_id = this.id.split("_")[4];
  	//alert(groupapp_id);
	if (Element.visible("ol_id_applications_"+groupapp_id))
	{
		new Effect.Fade("ol_id_applications_"+groupapp_id);
	}
	else
	{

		Effect.SlideDown("ol_id_applications_"+groupapp_id,{duration:1.0});	
		//new Effect.Highlight('ol_id_applications_'+groupapp_id, {duration:1, fps:25, from:0.0, to:1.0, startcolor:'#ff0000', endcolor:'#00ff00', restorecolor:'white'});
	}
  },

  'a.class_liens_roles:click': function(e) {
  	role_id = this.id.split("_")[3];
      if ($("ol_role_apps_"+role_id) != null)
      {
	if (Element.visible("ol_role_apps_"+role_id))
	{
		new Effect.Fade("ol_role_apps_"+role_id);
	}
	else
	{
		Effect.SlideDown("ol_role_apps_"+role_id,{duration:1.0});
	}
      }
  },

  'li.statistic_table input.class_select_table:click': function(e) {
	//alert(this.value);
	result = $(this.value).checked;
        $$(".class_select_table").each(function(cb){ cb.checked = e.element().unchecked });	
	$("categoriecolonnetable_typegraph").disabled = $(this.value).checked = result;
	Effect.Fade("id_nbrubriquecontenu");
	$(this.value).checked ? $("id_titrelegendestatglobal").show() : $("id_titrelegendestatglobal").hide();
	$("categoriecolonnetable_typegraph").value = "0";
  },

  'a#id_choix_file_ftp:click': function(e) {
      $('id_choix_file_ftp').innerHTML = (Element.visible("id_select_file_ftp") ? "Choisir un fichier dans le ftp" : "Annuler l'affichage du choix du fichier dans le ftp") 	
      Effect.toggle("id_select_file_ftp", 'BLIND');
  },

  //'.topics_names:click': function(e) {
  //	targetElement = e.target.value;
//	alert(targetElement);
 // },

  '.id_remove_table_column :click': function(e) {
	//(this.checked ? alert("test") : "" );
	if (this.checked)
	{
		$("div_delete_sup_contenu").hide();
	}
	else
	{
	    if ($('id_remove_column').checked == false && $('id_remove_table').checked == false) 
	    {
		$("div_delete_sup_contenu").show();
	    }
	}
  },

  'a#id_link_limit_acces_apps:click': function(e) {
  	Effect.toggle('div_id_groupapps', 'BLIND');
  },

  '#user_role_id option:click': function(e) {	
	//alert(this.value);
	var xhr = Ajax.getTransport();
		xhr.onreadystatechange = function() {
			if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
				$('div_id_groupapps').innerHTML = xhr.responseText;
				Element.visible("id_link_limit_acces_apps") ? $("id_link_limit_acces_apps").hide() : $("id_link_limit_acces_apps").show();
			
			}
		}	
	xhr.open('get', '/javascript/liste_applications_groupapps?role_id='+this.value);
	xhr.send();
  },

  'a.class_liens_topics_marques:click': function(e){
       marque_id = this.id;
       id_ol_topics_marques = marque_id.split('_')[2];
       id_ol_topics_marques = "oltopicsmarques_" + id_ol_topics_marques
       //alert(id_ol_topics_marques);
	Effect.toggle(id_ol_topics_marques,'BLIND'); 
	return false;
  },

  'a.class_app:click': function(e) {	
	id_groupapp = this.id.split("_")[2];
	//alert("test");
	Effect.toggle("ol_id_applications_"+id_groupapp,'BLIND');
  },

  '#id_calendar_contenu :click': function(e) {
	//alert("test nicolas");
	Effect.toggle("div_calendar_delete_contenu", "blind");
  },

  '#id_search_apps:click': function(e) {
		//alert("nicolas est un ouf");
		Effect.toggle("div_id_search_apps", "blind");
  },

  '#categoriecolonnetable_typegraph option:click' : function(e) {
  	//alert(this.value);
	(this.value == 1 || this.value == 2 ? Effect.Appear("id_nbrubriquecontenu") : Effect.Fade("id_nbrubriquecontenu"));
  },

  '.id_liens_box:click': function(e) {
	//alert("sdfdsfsd");
	Modalbox.show(this.href, {title: 'Autres informations', width: 600, height: 600});
	return false;
  },

  'ul.class_liste_table a:click' : function(e) {
	Global.showMultiple($$('.class_table_colonne'), false);
	Effect.toggle('id_table_colonne_'+this.id,'blind');	
  },

  '#visugraph_period option:click' : function(e) {
	this.value == "manual" ? Effect.Appear("div_class_manual_period") : Effect.Fade("div_class_manual_period")
  },

  //'#id_liens_stat_precis:click' : function(e) {
  	//alert("nicolas test");
//	Effect.toggle('div_id_form_statistic','blind');
  //},
  
  'ul.class_topics_blocks li a:mouseover' : function(e) { 
  	//$("p_id_mark").insert("<div id='id_box_legende' style='border:1px solid #aaa;color:#aaa;-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px; '>"+check_message_sup_logos_themes('themes')+"</div>")	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
	  check_message_sup_logos_themes('themes','p_id_mark','id_box_legende');
  },

  'a.class_add_marque_plan:mouseover' : function(e) {	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
	  check_message_sup_logos_themes('add_logo_plan','p_id_mark','id_box_legende');
  },

  'a.class_add_theme:mouseover' : function(e) {
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}	
	check_message_sup_logos_themes('add_theme_plan','id_titre_theme','id_box_themes_legende');
  },

  'a#id_liens_update_theme:mouseover' : function(e) {
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}

	check_message_sup_logos_themes('update_logo','id_titre_theme','id_box_themes_legende');
  },

  'a#id_liens_update_theme:mouseout' : function(e) {	
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}	
  },

  'a.class_liens_sup_theme:mouseover' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}	


	check_message_sup_logos_themes('sup_logo','id_titre_theme','id_box_themes_legende');
  },

  'a.class_liens_sup_theme:mouseout' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}	
  },

  'a.class_liens_topics_marques:mouseover' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
	check_message_sup_logos_themes('see_sous_theme','id_titre_theme','id_box_themes_legende');
  },

  'a.class_liens_topics_marques:mouseout' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
  },

  'a.link_sous_theme:mouseover' : function(e) {	
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
	check_message_sup_logos_themes('add_sous_theme_plan','id_titre_theme','id_box_themes_legende');
  },

  'a.link_sous_theme:mouseout' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
  },

  'a#id_liens_update_sous_theme:mouseover' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
	check_message_sup_logos_themes('update_sous_theme_plan','id_titre_theme','id_box_themes_legende');
  },

  'a#id_liens_update_sous_theme:mouseout' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}
  }, 

  'a.class_add_theme:mouseout' : function(e) { 
  	if ($("id_box_themes_legende") != null)
	{
		$("id_box_themes_legende").remove();
	}	
  },

  'a#id_update_marques_javascript:mouseover' : function(e) {
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}

	check_message_sup_logos_themes("update_marque",'p_id_mark','id_box_legende');
  },

  'a#id_update_marques_javascript:mouseout' : function(e) { 
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  },

  'a.class_sup_marque:mouseover' : function(e) {	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}

	check_message_sup_logos_themes("remove_marque",'p_id_mark','id_box_legende');
  },

  'a.class_sup_marque:mouseout' : function(e) { 
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  }, 

  'a.class_add_marque_plan:mouseout' : function(e) {	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  },

  'ul.class_topics_blocks li a:mouseout' : function(e) {	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  },

  'a.class_logos_for_mark:click' : function(e) {
  	//alert("test");
	Modalbox.show(this.href, {title: "Ajouter des logos dans les marques", height: 800});
	return false;
  },

  'ul.ul_class_blocks li a.class_logos_for_mark:mouseover' : function(e) {
  	//$("p_id_mark").insert("<div id='id_box_legende' style='border:1px solid #aaa;color:#aaa;-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px; '>"+check_message_sup_logos_themes('add_logos')+"</div>");	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
	  check_message_sup_logos_themes('add_logos','p_id_mark','id_box_legende');
  },

  'ul.ul_class_blocks li a.class_logos_for_mark:mouseout' : function(e) { 
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  },

  'a.class_liens_add_logo:click' : function(e) {	
	Effect.toggle('div_class_add_logos','blind');
  },

  'ol.class_logos_block li a:mouseover' : function(e) {
  	  /*alert(this);
	  alert(this.down());*/ /* result = [object HTMLImageElement] */

	//$("p_id_mark").insert("<div id='id_box_legende' style='border:1px solid #aaa;color:#aaa;-moz-border-radius:8px;-webkit-border-radius:8px;border-radius:8px; '>"+check_message_sup_logos_themes('logos')+"</div>");	
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
	check_message_sup_logos_themes('logos','p_id_mark','id_box_legende');
	/*tab_liste_groups_apps = $("ul_id_groups_applications").getElementsByTagName("ol");

	for(e = 0; e < tab_liste_groups_apps.length-1; e++)
	{
		tab_liste_apps_groups = $(tab_liste_groups_apps[e]).getElementsByTagName("li");
		for (i = 0; i < tab_liste_apps_groups.length-1; i++)
		{
			//alert(tab_liste_apps_groups[i].id);
			id_apps = tab_liste_apps_groups[i].id.split("_")[1];
			if ($("id_box_apps_"+id_apps) != null)
			{
				$("id_box_apps_"+id_apps).remove();
			}
				
			//alert(id_apps);
		}
	}	
	id_apps = this.id.split("_")[1];
	this_id = this.id
	var xhr = Ajax.getTransport();
		xhr.onreadystatechange = function() {
			if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {

				$(this_id).insert("<div id='id_box_apps_"+id_apps+"' style='position:fixed;height:70px;width:150px;margin-left:80px;background-color:white;border:1px solid black;'>"+xhr.responseText+"</div>");
			
			}
		}	
	xhr.open('get', '/javascript/detail_apps?application_id='+id_apps);
	xhr.send();*/
		
  },

  'ol.class_logos_block li a:mouseout' : function(e) {
  	//alert("nicolas");
	if ($("id_box_legende") != null)
	{
		$("id_box_legende").remove();
	}
  },

  'li.topics_names:click': function(e){
	//alert(this.getAttribute("class"));
	var tab_parameters =  new Array;
        var id_shapes_emplacement = this.up().id.split('_')[1]
	//alert(id_shapes_emplacement);
	tab_parameters = Sortable.serialize(this.up().id);
	//alert(tab_parameters);
	var xhr = Ajax.getTransport();
	xhr.open('get', '/fichiercompressions/sortable_marques_topics?'+tab_parameters+'&id_shapes_emplacement='+id_shapes_emplacement);
	xhr.send();
  },

  'input#fichiercompression_update_file:click': function(e){
       if (this.checked)
       {
	       $('id_span_champs_current_version').style.color = 'black';
     	       $('id_span_champs_current_version').style.borderColor = 'black';	
	       $('span_id_box_merge').hide();  
	       $('span_id_link_box_merge').show();     
       }
       else
       {
		$('id_span_champs_current_version').InnerHTML = "Version courrante"	
	       $('id_span_champs_current_version').style.color = 'gray';
     	       $('id_span_champs_current_version').style.borderColor = 'gray';	        
	       $('span_id_box_merge').show();  
	       $('span_id_link_box_merge').hide();     
       }
  },

  'ul.class_table_colonne input:click' : function(e){
	li_courant = this.up().up().up().id;
	$$(".class_select_table").each(function(cb){ cb.checked = e.element().unchecked });
        $("id_titrelegendestatglobal").hide();
	$("categoriecolonnetable_typegraph").disabled = false;
	//alert(li_courant)
	this.up().up().up().up().childElements().each(function(lii) {
		if (li_courant != lii.id)
		{
			//alert(lii.down().id)
			//alert(lii)
			lii.childElements()[2].childElements().each(function(li_input) {
				li_input.childElements()[0].checked = false;	
			});
		}
	});
  },


  'ul.ul_class_table_colonne a.liens_info_colonne:click' : function(e) {
	//li_courant = this.up().up().id;
		//alert(li_courant);
	Global.showMultiple($$('.div_choix_stat'), false);
	Effect.toggle('id_donne_demande_'+this.id,'blind');
	return false;
  },

  /*'a#id_select_files_migrate:click' : function(e) {
  	//alert($("type").value);
	tab_liste_ul_result_liste_versions = new Array();
	tab_liste_ul_result_liste_versions = $('div_id_result_liste_versions').getElementsByTagName("ul");	

	for(i = 0; i < tab_liste_ul_result_liste_versions.length; i++)
	{
		tab_list_ol_role_version = new Array();
		tab_list_ol_role_version = tab_liste_ul_result_liste_versions[i].getElementsByTagName("ol");

		//alert(tab_list_ol_role_version[0].id);
		for(e = 0; e < tab_list_ol_role_version.length; e++){
			//alert(tab_list_ol_role_version[1].id);
			//tab_list_ul_file = new Array();
			tab_list_li_applications_grouppapps = new Array();
			tab_list_li_applications_grouppapps = tab_list_ol_role_version[e].getElementsByTagName("li");

			//id_application_7_groupappid_1
			//alert(tab_list_li_applications_grouppapps[e].id);
			array_application_groupappid = new Array();
			array_application_groupappid = tab_list_li_applications_grouppapps[e].id.split("_");
			var id_groupapp_id = array_application_groupappid[array_application_groupappid.length-1];
		        if (id_groupapp_id == $("type").value)
				tab_list_li_applications_grouppapps[e].show();	

		}
	}
	Modalbox.show($('div_id_versions_bornes'), {title: 'Selection des versions et des bornes', width: 370});
  },*/

  'ul.checklist a.radio-select:click' : function(e) {
    e.stop();
    var li = this.up();
    var ul = this.up().up();
    var input = this.adjacent("input:not([type='hidden'])")[0];
    var checked = "checked";
    
    if(this.hasClassName("media_type")) {
      hide_or_show_field_regarding_media_type_checkbox_checked(this.up("table"), input.value);
      if(input.value == "4") {
        Global.show($('paper_scenes_attributes_0_actors_attributes_0_size_y').up('p'), $('paper_scenes_attributes_0_actors_attributes_0_shape_id').value=="1");
      }
    }
    
    if(input.readAttribute("type") == "radio") {
      ul.childElements().each(function(lii) {
        lii.childElements()[1].removeClassName("selected");   li.adjacent("input:checked[name='"+input.readAttribute("name")+"']").invoke("writeAttribute", "checked", null);
      });
    }
    else if(input.readAttribute("type") == "checkbox" && input.checked) {
      checked = null;
    }
    this.toggleClassName("selected");
    input.writeAttribute("checked", checked);
  },

  'td.class_td_list_version_apps a:click' : function(e) {
	Modalbox.show(this.up().childElements()[0], {title: "Liste des applications associables pour la version " + this.up().childElements()[0].id.split("_")[this.up().childElements()[0].id.split("_").length-1], width: 300})
	return false;	
  },

});

Event.onReady(function() {
  Flash.displayFromDOM();

  // Common
  $$('form.delete-form').each(function(form) { new DeleteLink(form); });
  if($('paper_department_id')) {
    Global.showMultiple($$('.paper_template_id'), $('paper_department_id').value=="2"); 
  }

  if($('edit_actor')) {
    $$('ul.media_type_select').each(function(ul) {
      if(ul.select('input:checked.media_type').size()==1) {
        hide_or_show_field_regarding_media_type_checkbox_checked(ul.up('table'), ul.select('input:checked.media_type')[0].value);
        if(ul.select('input:checked.media_type')[0].value=="4")
        Global.show($('paper_scenes_attributes_0_actors_attributes_0_size_y').up('p'), $('paper_scenes_attributes_0_actors_attributes_0_shape_id').value=="1");
      }
    });
  }
});

function hide_or_show_field_regarding_media_type_checkbox_checked(papa, checkbox_value) {
  Global.showMultiple(papa.select('.hide_'+checkbox_value), false);
  Global.showMultiple(papa.select('.show_'+checkbox_value), true);
}
