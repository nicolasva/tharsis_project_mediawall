window.onload = function() {
	status_checked = false;
	table_get_tr = $('id_tab_statistic').getElementsByTagName("tr");

	for (i = 0; i < table_get_tr.length; i++){
	     if (table_get_tr[i].getAttribute("class") != "tr_class_titre_tableau")
	     {

		tab_get_td = table_get_tr[i].getElementsByTagName("td");

		for(e = 0; e < tab_get_td.length; e++){
			//alert(tab_get_td[e].down().name);

			tab_get_td[e].down().name == "categoriecolonnetable[id][]" ? status_checked = tab_get_td[e].down().checked : status_checked ? tab_get_td[e].down().show() : tab_get_td[e].down().hide();
		}
	     }
	}	
}
