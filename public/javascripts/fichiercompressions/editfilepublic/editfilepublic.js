function snatch_close_window()
{
	new Ajax.Request("/javascript/snatch_close_window", {
		method: 'post',
		parameters: { fichiercompression_id: /^.{1,}\/(.{1,})\?.{1,}$/.exec($('id_grossissement').down().getElementsByTagName("li")[0].down().href)[1] }
		//parameters: { fichiercompression_id: 23 }
	});	
};

//window.onbeforeunload=snatch_close_window;
