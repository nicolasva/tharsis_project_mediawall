Event.addBehavior({
  '#check_all_checkboxes:click' : function(e){
    $$('.application_cb').each(function(cb){ cb.checked = e.element().checked });
    $$('.checkbox_groupapps').each(function(cb){ cb.checked = e.element().checked }); 
  	if ($('check_all_checkboxes').getAttribute("class") == "class_check_all_checkboxes_apps_update")
		(this.checked == true ? $('id_buton_suivant_etape2_etape1').show() : $('id_buton_suivant_etape2_etape1').hide());
  },

  '#check_all_checkboxes2:click' : function(e){
    $$('.applicationcomparate_cb').each(function(cb){ cb.checked = e.element().checked });
  },

  '#check_average_apps:click' : function(e){
		$("check_total_apps").checked = false;
  },

  '#check_total_apps:click' : function(e){
		$("check_average_apps").checked = false;
  },
});

