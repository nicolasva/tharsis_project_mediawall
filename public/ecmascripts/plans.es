      var SVGDocument = null;
      var SVGRoot = null;
      var TrueCoords = null;
      var GrabPoint = null;
      var BackDrop = null;
      var DragTarget = null;
      var svgplan = null;
      var class_sup_shapes = null;
      var xmlns = "http://www.w3.org/2000/svg";
      var xlinkns = "http://www.w3.org/1999/xlink";
      objRequete = creeXMLHttpRequestObject();

      function Init(evt)
      {
		SVGDocument = evt.target.ownerDocument;
		SVGRoot = SVGDocument.documentElement;
		
		TrueCoords = SVGRoot.createSVGPoint();
		GrabPoint = SVGRoot.createSVGPoint();
		
		BackDrop = SVGDocument.getElementById('BackDrop');
		svgplan = SVGDocument.getElementById('svgplan');
      };

      function creeXMLHttpRequestObject()
      {
		var objRequete = null;
		objRequete = new XMLHttpRequest();

		return objRequete;
      };

      function Grab(evt)
      {
	//Trouver quelle est l'élément dont la souris est dessus
	var targetElement = evt.target;
	    // Condition pour l'impossibilité de draguer l'arrière plan
      	  if (targetElement.getAttribute("class") != "logos_image" && targetElement.getAttribute("class") != "zone_shapes" && targetElement.getAttribute("class") != "class_chemin" && targetElement.getAttribute("class") != "class_sup_shapes" && targetElement != svgplan && BackDrop != targetElement && targetElement.getAttribute("class") != "class_sup_logos" && targetElement.getAttribute("class") != "class_chemin" && targetElement.getAttribute("class") != "circle_point_red")
          {
		//Enregistrer les mouvements de la souris infligé a l'élément
		DragTarget = targetElement;

		DragTarget.parentNode.appendChild( DragTarget );
		DragTarget.setAttributeNS(null, 'pointer-events', 'none');

		
		var transMatrix = DragTarget.getCTM();
            	GrabPoint.x = TrueCoords.x - Number(transMatrix.e);
            	GrabPoint.y = TrueCoords.y - Number(transMatrix.f);
          }
      };

      function ObjectAttendant(newX,newY)
      {	
        //alert(DragTarget.getAttribute("class"));
	if (DragTarget.getAttribute("class") != "circle_point")	
	{
          Object = SVGDocument.getElementById('id_shapes_sup_'+DragTarget.id);
	}
	else
	{
		//alert(DragTarget.id);
		id_circle = DragTarget.id.split("_")[3];
		//alert(id_logos);
		Object = SVGDocument.getElementById('id_logos_'+id_circle);
		var ObjectTextBlock = SVGDocument.getElementById('id_text_block_'+id_circle) ;
		var ObjectSupLogos = SVGDocument.getElementById('id_logos_sup_'+id_circle); 
		ObjectTextBlock.setAttributeNS(null, 'transform', 'translate(' + newX + ',' + newY + ')');	
		ObjectSupLogos.setAttributeNS(null, 'transform', 'translate(' + newX + ',' + newY + ')');
	}
	  if (Object != null)
	  Object.setAttributeNS(null, 'transform', 'translate(' + newX + ',' + newY + ')');
	 //Objectaddnameshapes.setAttributeNS(null, 'transform', 'translate(' + newX + ',' + newY + ')');
      };

      function ObjectAttendantOrigin(position_x,position_y,evt)
      {
	 evt.setAttributeNS(null, 'transform', position_x + ',' + position_y);
	 //Objectaddnameshapes.setAttributeNS(null, 'transform', position_x + ',' + position_y);
      };

      function Drag(evt)
      {	
	var targetElement = evt.target;
	// Condition pour l'impossibilité de draguer l'arrière plan
      if (targetElement.getAttribute("class") != "logos_image" && targetElement.getAttribute("class") != "class_sup_shapes" && targetElement.getAttribute("class") != "class_chemin" && targetElement.getAttribute("class") != "class_sup_logos" && targetElement.getAttribute("class") != "class_chemin" && targetElement.getAttribute("class") != "circle_point_red")
      {
           //Obtenir les coordonnées des nouveaux points
	   GetTrueCoords(evt);

 	  // Si nous avons pas d'élément cible ne rien faire
        
	  if (DragTarget)
          {
	    var newX = TrueCoords.x - GrabPoint.x;
	    var newY = TrueCoords.y - GrabPoint.y;

	    //Applique la translation pour l'élément déplacé, pour l'afficher à la nouvelle localisation
	    DragTarget.setAttributeNS(null, 'transform', 'translate(' + newX + ',' + newY + ')');
	    	ObjectAttendant(newX,newY);
        }
      }
      };

      function OriginPosition(position_x,position_y,evt)
      {	
	     //alert("position_x"+ position_x + "position_y" + position_y);
             //var reposition = document.createElementNS(xmlns, 'animate');	
		//reposition.setAttributeNS(null, 'x', position_x);
		//reposition.setAttributeNS(null, 'y', position_y);
	     //DragTarget.appendChild(reposition);	
	    //evt.setAttributeNS(null, 'transform', position_x + ',' + position_y);
	    ObjectAttendantOrigin(position_x,position_y,evt);
      };

      function link_sup(targetelement_id,id_link_sup,class_link_sup,class_image_sup,x,y,link_sup)
      { 
	var a = SVGDocument.createElementNS(xmlns, "a");
	a.setAttributeNS(xlinkns, "xlink:href", link_sup);
	a.setAttribute("class", class_link_sup);
	a.setAttribute("id", id_link_sup);
				
	var shapes = SVGDocument.createElementNS(xmlns, "image");
	shapes.setAttribute("x", x);
	shapes.setAttribute("y", y);
	shapes.setAttribute("height", '20');
	shapes.setAttribute("width", '20');
	shapes.setAttribute("id", targetelement_id);
	shapes.setAttribute("class", class_image_sup);
	shapes.setAttributeNS(xlinkns, "xlink:href", "/images/img_general/close.gif");
	a.appendChild(shapes);
	//DragTarget.appendChild(shapes);
	SVGDocument.documentElement.appendChild(a);
      }//;

      function create_circle(cx,cy,r,transform,stroke,class,fill,draget_id,hauteur_logos,largeur_logos)
      {
	//alert(draget_id);
	//var id_logos_sup = "id_logos_sup_"+draget_id.split("_")[3];
	//var id_liens_sup_logos = "id_liens_sup_logo_"+draget_id.split("_")[3];
	var circle = SVGDocument.createElementNS(xmlns,"circle");
	circle.setAttribute("cx", cx);
	circle.setAttribute("cy", cy);
	circle.setAttribute("r", r);
	circle.setAttribute("stroke", stroke);
	circle.setAttribute("class", class);
	circle.setAttribute("fill", fill);
	circle.setAttribute("id", draget_id);
	circle.setAttribute("class", class);
	circle.setAttribute("fill", fill);
	circle.setAttribute("transform", transform);
	//link_sup(targetElement.id,"id_sup_shapes_"+targetElement.id.split("_")[3],"class_sup_shapes","class_sup_shapes",info_text_shapes.getAttribute("x"),info_text_shapes.getAttribute("y"), "http://localhost:3000/fichiercompressions/supnameshapes?shapes_id="+targetElement.id.split("_")[3]);
	SVGDocument.documentElement.appendChild(circle);
	//link_sup(id_logos_sup,id_liens_sup_logos,"class_liens_sup_logos","class_sup_logos",cx,cy,"/fichiercompressions/suplogosplans?point_id="+draget_id.split("_")[3]);	
	
	//var logo_image = SVGDocument.createElementNS(xmlns,"image");
	//logo_image.setAttribute("x", cx);
	//logo_image.setAttribute("y", cy);
	//logo_image.setAttribute("height", hauteur_logos);
	//logo_image.setAttribute("width", largeur_logos);
	//logo_image.setAttributeNS(xlinkns, "xlink:href", "http://localhost:3000/images/img_general/close.gif");
	//logo_image.setAttribute("class", "logos_image");
	//logo_image.setAttribute("id", "id_logos_"+draget_id.split("_")[3]);
	//logo_image.setAttribute("transform", 'translate(-300,-300)');
	//SVGDocument.documentElement.appendChild(logo_image);	
      };

      function Drop(evt)
      {
	//objRequete = creeXMLHttpRequestObject();	
	//Si il n'y a pas d'évènement courant ne rien faire
	if (DragTarget)
	{
		//Arrêter le déplacement de l'objet courant et l'enregistrer à l'endroit courant
		//Nous avons les moyens de connaître les élèments  en dehors de celui que nous avons déplacé
	       var targetElement = evt.target;
	if (targetElement.id != svgplan.id && targetElement.id != BackDrop.id)
        {
         if (DragTarget.getAttribute("class") != "circle_point")
	 {
               var liens_id_supnameshapes = SVGDocument.getElementById('id_sup_shapes_'+DragTarget.id);
	       //var id_addnameshapes = SVGDocument.getElementById('shapes_add_name_'+DragTarget.id);
               //var id_supnameshapes_dest = SVGDocument.getElementById('shapes_sup_'+targetElement.id);
	       //var id_addnameshapes_dest = SVGDocument.getElementById('shapes_add_name_'+targetElement.id);
          
         if (DragTarget.getAttribute("class") != "logos_image" && DragTarget.getAttribute("class") != "zone_shapes" && DragTarget.getAttribute("class") != "class_chemin" && DragTarget.getAttribute("class") != "class_sup_shapes")
	 {
                  if ( SVGDocument.getElementById('zone_shapes_id_' + targetElement.id) == null )
                  {
		    //info_text_shapes = SVGDocument.getElementById(DragTarget.id);
		    target_id = targetElement.id.split("_")[3];	
		    SVGRoot.removeChild(DragTarget);

		    if (target_id != DragTarget.id)
		    {
		    	info_text_shapes = SVGDocument.getElementById(target_id);
		    	SVGRoot.removeChild(info_text_shapes);

	 	    	//DragTarget.setAttribute('x', info_text_shapes.getAttribute("x") - ( evt.clientX - DragTarget.getAttribute("x")));
		    	//DragTarget.setAttribute('y', info_text_shapes.getAttribute("y") - ( evt.clientY - DragTarget.getAttribute("y")));
		    	//SVGRoot.removeChild(liens_id_supnameshapes);
		    	//SVGRoot.removeChild(DragTarget);
                    	//DragTarget vide
		    	var dragtarget = SVGDocument.createElementNS(xmlns, "text");
		    	dragtarget.setAttribute("x", DragTarget.getAttribute("x"));
		    	dragtarget.setAttribute("y", DragTarget.getAttribute("y"));
		    	dragtarget.setAttribute("id", DragTarget.id);
			dragtarget.setAttribute("text", "");
		    	dragtarget.setAttribute("class", "class_theme_map");
		    	dragtarget.appendChild(SVGDocument.createTextNode(""));
		    	SVGDocument.documentElement.appendChild(dragtarget);	   
 
		    	//DragTarget.setAttribute(SVGDocument.TextNode(""));
	       	    	SVGRoot.removeChild(liens_id_supnameshapes);
		    	data = SVGDocument.createTextNode(DragTarget.getAttribute("text"));
		    	var text = SVGDocument.createElementNS(xmlns, "text");
		    	text.setAttribute("x", info_text_shapes.getAttribute("x"));
		    	text.setAttribute("y", info_text_shapes.getAttribute("y"))
		    	text.setAttribute("id", target_id);
		    	text.setAttribute("text", DragTarget.getAttribute("text"));
		    	text.setAttribute("class", "class_theme_map");
		    	text.appendChild(data);
		    	SVGDocument.documentElement.appendChild(text);

		    
		    
		    	//id_supnameshapes.setAttribute("x", info_text_shapes.getAttribute("x"));
		    	//id_supnameshapes.setAttribute("y", info_text_shapes.getAttribute("y"));

	       	    	//id_supnameshapes.setAttributeNS(null, 'visibility', 'hidden');
	            	//id_addnameshapes.setAttributeNS(null, 'visibility', 'hidden');
		    	//alert(DragTarget.id + ' has been dropped on top of ' + targetElement.id  + 'targetElement_x' + info_text_shapes.getAttribute("x") + 'targetElement_y' + info_text_shapes.getAttribute("y"));
		    	//info_text_shapes.setAttributeNS(null, 'visibility', 'hidden');
		   
	       	    	//id_supnameshapes.setAttributeNS(null, 'visibility', 'hidden');

		    	//info_text_shapes.setAttributeNS(null, 'visibility', 'hidden');
	 	
			objRequete.open('get','/fichiercompressions/remplacement_shapes?shapesname_origin='+info_text_shapes.id+'~shapesremplacement='+DragTarget.id);
	 		//objRequete.onreadystatechange = traiteReponse(targetElement.getAttribute("x"),targetElement.getAttribute("y"));
			//traiteReponse(targetElement.getAttribute("x"),targetElement.getAttribute("y"));
			//alert(traiteReponse);
	 		objRequete.send(null);
			//id_supnameshapes.setAttribute("x", info_text_shapes.getAttribute("x"));
			//id_supnameshapes.setAttribute("y", info_text_shapes.getAttribute("y"));
			
			if ( SVGDocument.getElementById('id_shapes_sup_'+info_text_shapes.id) == null)
			{
				//link_sup(targetelement_id,id_link_sup,class_link_sup,class_image_sup,x,y,link_sup)
				link_sup("id_shapes_sup_"+targetElement.id.split("_")[3],"id_sup_shapes_"+targetElement.id.split("_")[3],"class_liens_sup_shapes","class_sup_shapes",info_text_shapes.getAttribute("x"),info_text_shapes.getAttribute("y"), "http://localhost:3000/fichiercompressions/supnameshapes?shapes_id="+targetElement.id.split("_")[3]);
			}
	
		     }
		     else
	             {
			
		    	var dragtarget = SVGDocument.createElementNS(xmlns, "text");
		    	dragtarget.setAttribute("x", DragTarget.getAttribute("x"));
		    	dragtarget.setAttribute("y", DragTarget.getAttribute("y"));
		    	dragtarget.setAttribute("id", DragTarget.id);
		        dragtarget.setAttribute("text", DragTarget.getAttribute("text"));
		    	dragtarget.setAttribute("class", "class_theme_map");
		    	dragtarget.appendChild(SVGDocument.createTextNode(DragTarget.getAttribute("text")));
		    	SVGDocument.documentElement.appendChild(dragtarget);	 
			  
	       	    	//SVGRoot.removeChild(liens_id_supnameshapes);

			link_sup("id_shapes_sup_"+DragTarget.id,"id_sup_shapes_"+DragTarget.id,"class_liens_sup_shapes","class_sup_shapes",DragTarget.getAttribute("x"),DragTarget.getAttribute("y"), "http://localhost:3000/fichiercompressions/supnameshapes?shapes_id="+DragTarget.id);
			
	       	    	SVGRoot.removeChild(liens_id_supnameshapes);
			//alert("test");
			//OriginPosition(DragTarget.setAttribute("x"),DragTarget.setAttribute("x"),DragTarget)
			//DragTarget.setAttribute("x", DragTarget.getAttribute("x"));
			//DragTarget.setAttribute("y", DragTarget.getAttribute("y"));

		        //liens_id_supnameshapes.setAttribute("x", dragtarget.getAttribute("x"));
		        //liens_id_supnameshapes.setAttribute("y", dragtarget.getAttribute("y"));
		     }
 		    //id_supnameshapes_dest.setAttribute(xlinkns, "xlink:href", "/fichiercompressions/supnameshapes?shapes_id="+DragTarget.id)
		    //id_addnameshapes_dest.setAttribute(xlinkns, "xlink:href", "/fichiercompressions/addnameshapes?shapes_id"+DragTarget.id)
		 
		   }
               }
          }
          else
          {
		if (DragTarget.getAttribute("class") == "circle_point")
		{
			id = DragTarget.id.split("_")[3];
				var ObjectBlockText = SVGDocument.getElementById("id_text_block_"+id);
				var ObjectLogos = SVGDocument.getElementById("id_logos_"+id);
 				var ObjectSupLogos = SVGDocument.getElementById("id_logos_sup_"+id);
				var ObjectLiensSupLogos = SVGDocument.getElementById("id_liens_sup_logo_"+id);
				liens_href_sup_logos = ObjectLiensSupLogos.getAttribute("xlink:href");
			if (targetElement.getAttribute("class") != "zone_shapes" && targetElement.id != BackDrop.id && targetElement.getAttribute("class") != "logos_image" && targetElement.getAttribute("class") != "class_sup_logos" && targetElement.getAttribute("class") != "class_theme_map")
			{
			     //alert(targetElement.getAttribute("class"));
				ObjectBlockText.setAttribute("fill", "green");
			     if (targetElement.getAttribute("class") == "circle_point_red" || targetElement.getAttribute("class") == "circle_point")
                             {
				 x_value = targetElement.getAttribute("cy"); 
				 y_value = targetElement.getAttribute("cx");
				 x_origin_dragtarget = DragTarget.getAttribute("cx");
				 y_origin_dragtarget = DragTarget.getAttribute("cy");
				 //alert(DragTarget.getAttribute("transform"));
				 SVGRoot.removeChild(DragTarget);
				 /*SVGRoot.removeChild(ObjectBlockText);
				 SVGRoot.removeChild(ObjectLogos);
				 SVGRoot.removeChild(ObjectLiensSupLogos);*/
				 ObjectLogos.setAttribute("x", targetElement.getAttribute("cx"));	
				 ObjectLogos.setAttribute("y", targetElement.getAttribute("cy"));
				 ObjectLogos.setAttribute("transform", targetElement.getAttribute("transform"));
				 ObjectBlockText.setAttribute("x", targetElement.getAttribute("cx"));
				 ObjectBlockText.setAttribute("y", parseFloat(targetElement.getAttribute("cy")) + 40);
				 ObjectBlockText.setAttribute("transform", targetElement.getAttribute("transform"));
				 ObjectSupLogos.setAttribute("x", parseFloat(targetElement.getAttribute("cx")) + 3);
				 ObjectSupLogos.setAttribute("y", parseFloat(targetElement.getAttribute("cy")) - 14);
				 ObjectSupLogos.setAttribute("transform", targetElement.getAttribute("transform"));
				 ObjectLiensSupLogos.setAttributeNS(xlinkns, "xlink:href", "/fichiercompressions/suplogosplans?point_id="+targetElement.id+"~block_id="+liens_href_sup_logos.split("~")[1].split("=")[1]);
				 create_circle(targetElement.getAttribute("cx"),targetElement.getAttribute("cy"),targetElement.getAttribute("r"),targetElement.getAttribute("transform"),"yellow","circle_point","green",DragTarget.id,ObjectBlockText.id,ObjectLogos.id,ObjectLiensSupLogos.id,ObjectLogos.getAttribute("height"),ObjectLogos.getAttribute("width"));
			     	if (targetElement.getAttribute("class") == "circle_point_red")
                             	{	
	 				objRequete.open('get','/fichiercompressions/set_position_logos_circle_red?id_point_circle_id='+targetElement.id.split("_")[4]+'~id_point='+id);
			     	}
			        else
				{
				       objRequete.open('get', '/fichiercompressions/set_position_logos_remplacement?id_point_target='+targetElement.id.split("_")[3]+'~id_point_dragtarget='+id)
                                } 
	 			objRequete.send(null);
			      }
			      //else
			      //{

					//x_value = evt.clientY;
					//y_value = evt.clientX;
					//DragTarget.setAttribute("fill", "green");
					//DragTarget.setAttribute("stroke", "yellow");
	 				//objRequete.open('get','/fichiercompressions/set_position_logos?position_x='+x_value+'~position_y='+y_value+'~id_point='+id);
			      //}
				//alert(evt.clientX);

	 			//objRequete.open('get','/fichiercompressions/position_logos?position_x='+x_value+'~position_y='+y_value+'~id_point='+id);
	 			//objRequete.send(null);
                             
			}
			else
			{
				//alert("test");
				var ObjectBlockText = SVGDocument.getElementById("id_text_block_"+id);
				var ObjectLogos = SVGDocument.getElementById("id_logos_"+id);
 				var ObjectLinkSupLogos = SVGDocument.getElementById("id_liens_sup_logo_"+id);
				var ObjectLogosSup  = SVGDocument.getElementById("id_logos_sup_"+id);
				var CirclePoint = SVGDocument.getElementById("id_point_logo_"+id);
				//ObjectBlockText.setAttribute("x", ObjectBlockText.getAttribute("x"));
				//ObjectBlockText.setAttribute("y", ObjectBlockText.getAttribute("y"));



				//ObjectBlockText//
		    		var objectblocktext = SVGDocument.createElementNS(xmlns, "text");
		    		objectblocktext.setAttribute("x", ObjectBlockText.getAttribute("x"));
		    		objectblocktext.setAttribute("y", ObjectBlockText.getAttribute("y"));
		    		objectblocktext.setAttribute("id", ObjectBlockText.id);
		        	objectblocktext.setAttribute("text", ObjectBlockText.getAttribute("text"));
		    		objectblocktext.setAttribute("class", "class_theme_map");
				objectblocktext.setAttribute("font-size", ObjectBlockText.getAttribute("font-size"));
				objectblocktext.setAttribute("fill", ObjectBlockText.getAttribute("fill"));
		    		objectblocktext.appendChild(SVGDocument.createTextNode(ObjectBlockText.getAttribute("text")));
		    		SVGDocument.documentElement.appendChild(objectblocktext);	 
		    		//Supression ObjectBlockText
				SVGRoot.removeChild(ObjectBlockText);

				//ObjectLogos//
				var  objectlogos = SVGDocument.createElementNS(xmlns, "image");
				objectlogos.setAttribute("x", ObjectLogos.getAttribute("x"));
				objectlogos.setAttribute("y", ObjectLogos.getAttribute("y"));
				objectlogos.setAttribute("height", ObjectLogos.getAttribute("height"));
				objectlogos.setAttribute("width", ObjectLogos.getAttribute("width"));
				objectlogos.setAttributeNS(xlinkns, "xlink:href", ObjectLogos.getAttribute("xlink:href"));
				objectlogos.setAttribute("class", ObjectLogos.getAttribute("class"));
				objectlogos.setAttribute("id", ObjectLogos.getAttribute("id"));
				SVGDocument.documentElement.appendChild(objectlogos);
				SVGRoot.removeChild(ObjectLogos);

			        //CirclePoint//
				var circlepoint = SVGDocument.createElementNS(xmlns, "circle");
				circlepoint.setAttribute("cx", CirclePoint.getAttribute("cx"));
				circlepoint.setAttribute("cy", CirclePoint.getAttribute("cy"));
				circlepoint.setAttribute("r", CirclePoint.getAttribute("r"));
				circlepoint.setAttribute("stroke", CirclePoint.getAttribute("stroke"));
				circlepoint.setAttribute("class", CirclePoint.getAttribute("class"));
				circlepoint.setAttribute("fill", CirclePoint.getAttribute("fill"));
				circlepoint.setAttribute("id", "id_point_logo_"+id);
				SVGDocument.documentElement.appendChild(circlepoint);
				SVGRoot.removeChild(CirclePoint);

				
				//link_sup(targetelement_id,id_link_sup,class_link_sup,class_image_sup,x,y,link_sup)
				link_sup("id_logos_sup_"+id,"id_liens_sup_logo_"+id,"class_liens_sup_logos","class_sup_logos",ObjectLogosSup.getAttribute("x"),ObjectLogosSup.getAttribute("y"), ObjectLinkSupLogos.getAttribute("xlink:href"));
				SVGRoot.removeChild(ObjectLinkSupLogos);
		   		//OriginPosition(DragTarget.getAttribute("cx"),DragTarget.getAttribute("cy"),DragTarget);
				//OriginPosition(ObjectLogos.getAttribute("x"),ObjectLogos.getAttribute("y"),ObjectLogos);
				//OriginPosition(ObjectSupLogos.getAttribute("x"),ObjectSupLogos.getAttribute("y"),ObjectSupLogos);
				//OriginPosition(ObjectBlockText.getAttribute("x"),ObjectBlockText.getAttribute("y"),ObjectBlockText);
			}
		}
		/*if (targetElement.getAttribute("class") == "class_chemin") 
		{
			alert(targetElement.getAttribute("class"));
		}
		else
		{
			alert(targetElement.getAttribute("class"));
		}*/
            }

	  }
	  else
	  {	
		if (DragTarget.getAttribute("class") == "circle_point")
		{
				id = DragTarget.id.split("_")[3];
				//alert("test");
				var ObjectBlockText = SVGDocument.getElementById("id_text_block_"+id);
				var ObjectLogos = SVGDocument.getElementById("id_logos_"+id);
 				var ObjectLinkSupLogos = SVGDocument.getElementById("id_liens_sup_logo_"+id);
				var ObjectLogosSup  = SVGDocument.getElementById("id_logos_sup_"+id);
				var CirclePoint = SVGDocument.getElementById("id_point_logo_"+id);
				//ObjectBlockText.setAttribute("x", ObjectBlockText.getAttribute("x"));
				//ObjectBlockText.setAttribute("y", ObjectBlockText.getAttribute("y"));



				//ObjectBlockText//
		    		var objectblocktext = SVGDocument.createElementNS(xmlns, "text");
		    		objectblocktext.setAttribute("x", ObjectBlockText.getAttribute("x"));
		    		objectblocktext.setAttribute("y", ObjectBlockText.getAttribute("y"));
		    		objectblocktext.setAttribute("id", ObjectBlockText.id);
		        	objectblocktext.setAttribute("text", ObjectBlockText.getAttribute("text"));
		    		objectblocktext.setAttribute("class", "class_theme_map");
				objectblocktext.setAttribute("font-size", ObjectBlockText.getAttribute("font-size"));
				objectblocktext.setAttribute("fill", ObjectBlockText.getAttribute("fill"));
		    		objectblocktext.appendChild(SVGDocument.createTextNode(ObjectBlockText.getAttribute("text")));
		    		SVGDocument.documentElement.appendChild(objectblocktext);	 
		    		//Supression ObjectBlockText
				SVGRoot.removeChild(ObjectBlockText);

				//ObjectLogos//
				var  objectlogos = SVGDocument.createElementNS(xmlns, "image");
				objectlogos.setAttribute("x", ObjectLogos.getAttribute("x"));
				objectlogos.setAttribute("y", ObjectLogos.getAttribute("y"));
				objectlogos.setAttribute("height", ObjectLogos.getAttribute("height"));
				objectlogos.setAttribute("width", ObjectLogos.getAttribute("width"));
				objectlogos.setAttributeNS(xlinkns, "xlink:href", ObjectLogos.getAttribute("xlink:href"));
				objectlogos.setAttribute("class", ObjectLogos.getAttribute("class"));
				objectlogos.setAttribute("id", ObjectLogos.getAttribute("id"));
				SVGDocument.documentElement.appendChild(objectlogos);
				SVGRoot.removeChild(ObjectLogos);

			        //CirclePoint//
				var circlepoint = SVGDocument.createElementNS(xmlns, "circle");
				circlepoint.setAttribute("cx", CirclePoint.getAttribute("cx"));
				circlepoint.setAttribute("cy", CirclePoint.getAttribute("cy"));
				circlepoint.setAttribute("r", CirclePoint.getAttribute("r"));
				circlepoint.setAttribute("stroke", CirclePoint.getAttribute("stroke"));
				circlepoint.setAttribute("class", CirclePoint.getAttribute("class"));
				circlepoint.setAttribute("fill", CirclePoint.getAttribute("fill"));
				circlepoint.setAttribute("id", "id_point_logo_"+id);
				SVGDocument.documentElement.appendChild(circlepoint);
				SVGRoot.removeChild(CirclePoint);

				
				//link_sup(targetelement_id,id_link_sup,class_link_sup,class_image_sup,x,y,link_sup)
				link_sup("id_logos_sup_"+id,"id_liens_sup_logo_"+id,"class_liens_sup_logos","class_sup_logos",ObjectLogosSup.getAttribute("x"),ObjectLogosSup.getAttribute("y"), ObjectLinkSupLogos.getAttribute("xlink:href"));
				SVGRoot.removeChild(ObjectLinkSupLogos);
		}
		else
		{

		    	var dragtarget = SVGDocument.createElementNS(xmlns, "text");
		    	dragtarget.setAttribute("x", DragTarget.getAttribute("x"));
		    	dragtarget.setAttribute("y", DragTarget.getAttribute("y"));
		    	dragtarget.setAttribute("id", DragTarget.id);
		        dragtarget.setAttribute("text", DragTarget.getAttribute("text"));
		    	dragtarget.setAttribute("class", "class_theme_map");
		    	dragtarget.appendChild(SVGDocument.createTextNode(DragTarget.getAttribute("text")));
		    	SVGDocument.documentElement.appendChild(dragtarget);
			SVGRoot.removeChild(DragTarget);	 
			  
	       	    	//SVGRoot.removeChild(liens_id_supnameshapes);

			link_sup("id_shapes_sup_"+DragTarget.id,"id_sup_shapes_"+DragTarget.id,"class_liens_sup_shapes","class_sup_shapes",DragTarget.getAttribute("x"),DragTarget.getAttribute("y"), "http://localhost:3000/fichiercompressions/supnameshapes?shapes_id="+DragTarget.id);
			
	       	    	SVGRoot.removeChild(SVGDocument.getElementById('id_sup_shapes_'+DragTarget.id));
		   //alert(DragTarget.getAttribute("x"));	
		   //alert("test");
		   //Objectsupnameshapes = SVGDocument.getElementById('id_shapes_sup_'+DragTarget.id);
		   //ObjectAttendantOrigin(parseFloat(DragTarget.getAttribute("x")), parseFloat(DragTarget.getAttribute("y")),Objectsupnameshapes);
		   //OriginPosition(parseFloat(DragTarget.getAttribute("x")), parseFloat(DragTarget.getAttribute("y")),Objectsupnameshapes);
		   //OriginPosition( parseFloat(DragTarget.getAttribute("x")), parseFloat(DragTarget.getAttribute("y")),DragTarget);
		}
	  }

		//Retourner à lévénement arrière afin de pouvoir saisir ce point ultérieurement
		DragTarget.setAttributeNS(null, 'pointer-events', 'all');
		//Enregistré la variable global quand il n'y pas de déplacement
		DragTarget = null;
	}

      };

      function GetTrueCoords(evt)
      {
	// find the current zoom level and pan setting, and adjust the raported
	// mouse position accordingly
	var newScale = SVGRoot.currentScale;
	var translation = SVGRoot.currentTranslate;
	TrueCoords.x = (evt.clientX - translation.x)/newScale;
	TrueCoords.y = (evt.clientY - translation.y)/newScale;
      };
