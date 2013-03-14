		Position.includeScrollOffsets = true;

		Draggables.clear = function (event) {
			while (Draggables.drags.length) {
				var d = Draggables.drags.pop();
				var e = d.element;
				d.stopScrolling();
				d.destroy();
				d.element = null;
			if (e.parentNode) {e.parentNode.removeChild(e)}; 
			}
		}

		function cleanup() { //try to remove circular references
			lis = document.getElementsByTagName("li");
			for (i = 0; i < lis.length; i++) {
				if (lis[i].longListItem) {
					lis[i].longListItem.destroy();
				}
				else if (lis[i].container) {lis[i].container.destroy();}
			}
			Draggables.clear();
		}
	
		window.onload = function() {
			tab_list_id_ol_marque = new Array();
        		tab_list_ol_marque = $("id_liste_marques").getElementsByTagName("ol");

			//alert($("id_liste_marques").getElementsByTagName("ol"));
        		for (e = 0; e < tab_list_ol_marque.length; e++) {
                		tab_list_id_ol_marque.push(tab_list_ol_marque[e].id);
        		}

        		for (i = 0; i < tab_list_ol_marque.length; i++) {
                		Sortable.create(tab_list_ol_marque[i].id,{containment:
					tab_list_id_ol_marque
                		}
                		);
        		}


			var li = $("id_liste_marques").getElementsByTagName('li');
			for (var i = 0; i < li.length; i++) {
			//var d = new LongListItem(li[i]);
			//li[i].onmousedown = d.onMouseDown.bindAsEventListener(d);
			var d = new Draggable(li[i], 
			{revert: true,
			 ghosting: false,
			 scroll: "ul_id_blocks"
			});
			}

        		/*var li = $("id_liste_logos").getElementsByTagName('li');
        		for (var i = 0; i < li.length; i++) {
        			//var d = new LongListItem(li[i]);
        			//li[i].onmousedown = d.onMouseDown.bindAsEventListener(d);
        			var d = new Draggable(li[i],                
         			{revert: true,
          			 ghosting: false,
          			 scroll: "ul_id_blocks"
         			});
        		}*/

	
			var divs = $("ul_id_blocks").getElementsByTagName("li");
			for (i = 0; i < divs.length; i++) {
				if (divs[i].className && Element.hasClassName(divs[i], "class_li_blocks")) {
				Droppables.add(divs[i].id, {hoverclass: "hover", scrollingParent: "ul_id_blocks",  onDrop: function(dragged, dropped, event){
    					//alert('Dragged: ' + dragged.id);
    					//alert('Dropped onto: ' + dropped.id);
					id_dropped = dropped.id.split("_")[2];
    					/*alert('Held ctrl key: ' + event.ctrlKey);*/
					var xhr = Ajax.getTransport();

				       type_rubrique = dragged.id.split("_")[1];
                                     if (type_rubrique == "theme")
                                     {
				       xhr.onreadystatechange = function() {
					if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
						//alert(xhr.readyState);
						//alert(xhr.responseText);
						new Insertion.Bottom('ul_id_block_' + id_dropped, xhr.responseText);
					}
				       }
					//$('span_id_block_' + id_dropped).update(xhr.responseText)
					xhr.open('get', '/fichiercompressions/sortable_marques_topics_javascript?dragged_id='+dragged.id+'&dropped_id='+dropped.id);
        				xhr.send();
                                      }

				     /* if (type_rubrique == "logos")
				      {
					xhr.onreadystatechange = function() {
						if (4 == xhr.readyState && 200 <= xhr.status && xhr.status < 300) {
							new Insertion.Bottom('ul_id_logos_' + id_dropped, xhr.responseText);
						}
					}
					xhr.open('get', '/fichiercompressions/sortable_logos_blocks_javascript?dragged_id='+dragged.id+'&dropped_id='+dropped.id);
					xhr.send();
				      }	*/
					return false; 
  				}
 				});
				}
			}
			Event.observe(window, 'unload', cleanup, false);
	       }
