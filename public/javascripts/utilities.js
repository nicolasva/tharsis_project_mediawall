// use this instead of console.debug (which is not compatible in Safari)
function ddd() {
  var browser = navigator.appName;
  var version = parseFloat(navigator.appVersion);
  if(!(browser=="Microsoft Internet Explorer" || browser=="Netscape"))
    console.log.apply(console, arguments);
}

var DeleteLink = Class.create({
  initialize: function(form) {
    form.observe('submit', this.commitDeletion.bindAsEventListener(form));
  },

  commitDeletion: function(event) {
    var form = event.element();
    var user_confirm = form.hasClassName('confirm');

    if(!user_confirm || (user_confirm && confirm(form.select("input[name='confirm_text']")[0].value))) {
      if(form.hasClassName('ajax')) {
        event.stop(); new Ajax.Request(form.action, { parameters: Form.serialize(form) });
      }
    }
    else {
      event.stop();
    }
  }
});

/*-------------------- Global Useful Functions ------------------------------*/
var Global = {
  spinner: function(visible) {
    if (visible)
    $('spinner').visualEffect('appear', {duration: 0.2});
    else
    $('spinner').visualEffect('fade', {duration: 0.2});
  },

  getIDFromEvenmentHrefURL: function(ev, sep) {
    if (sep == null) sep = '=';
    var source_id = ev.element().toString();
    return source_id.substring(source_id.lastIndexOf(sep) + 1, source_id.length);
  },

  getIDFromEvenmentDOMID: function(ev, sep) {
    if (sep == null) sep = '_';
    var source_id = ev.element().id;
    return source_id.substring(source_id.lastIndexOf(sep) + 1, source_id.length);
  },
  
  getIDFromEvenmentDOMClass: function(ev, sep) {
    if (sep == null) sep = '_';
    var source_class = ev.element().className;
    return source_class.substring(source_class.lastIndexOf(sep) + 1, source_class.length);
  },

  setActiveButton: function(button_name) {
    var lis = $$('li.on');
    lis.each (function(li) {
      li.removeClassName('on');
    });
    $(button_name).addClassName('on');
  },

  toggleMultipleClass: function(item, classNames) {
    classNames.each (function(className) {
      item.toggleClassName(className);
    });
  },

  scrollToWith2Item: function(item1, item2, choice) {
    $(choice ? item1 : item2).scrollTo();
  },

  show: function(item, show_or_not) {
    (show_or_not ? $(item).show() : $(item).hide());
  },

  showMultiple: function(items, show_or_not) {
    items.each (function(item) {
      Global.show(item, show_or_not);
    });
  },
  
  setOpacity: function(item, opacity) {
    $(item).setOpacity(opacity);
  },
  
  setMultipleOpacity: function(items, opacity) {
    items.each (function(item) {
      Global.setOpacity(item, opacity);
    });
  }
};

/*-------------------- Flash Functions ------------------------------*/
var Flash = {
  flash: function() {
    return $('flash');
  },
  displayFromDOM: function() {
    var flash = Flash.flash();
    if(flash == null) return;
    if(!flash.empty()) Flash.flashEffect();
  },
  display: function(notice, error) {
    var flash = Flash.flash();
    if(flash == null) return;

    var new_flash = new Element('div', { 'id': 'flash' });
    // Add a div for each flash type in this base div
    if(notice != '')
    new_flash.insert(new Element('div', { 'id': 'flash_notice', 'class': 'message notice'}).insert(new Element('p').update(notice)));
    if(error != '')
    new_flash.replace(new Element('div', { 'id': 'flash_error',  'class': 'message error'}).insert(new Element('p').update(error)));

    // Reset the flash div
    if(notice != '' || error != '') flash.replace(new_flash);

    // Make it beautiful!
    Flash.flashEffect();
  },
  flashEffect: function() {
    var flash = Flash.flash();
    if(flash == null) return;
    Global.show(flash, true);
    Effect.Pulsate(flash, { duration: 2.0, pulses: 2, from: 0.8 });
    Effect.Fade(flash, { delay: 6.0, duration: 1.5 });
  }
};

/*-------------------- Other Utility Functions ------------------------------*/
function getPosition(e) {
    e = e || window.event;
    var cursor = {x:0, y:0};
    if (e.pageX || e.pageY) {
      cursor.x = e.pageX;
      cursor.y = e.pageY;
    } 
    else {
      var de = document.documentElement;
      var b = document.body;
      cursor.x = e.clientX + (de.scrollLeft || b.scrollLeft) - (de.clientLeft || 0);
      cursor.y = e.clientY + (de.scrollTop || b.scrollTop) - (de.clientTop || 0);
    }
    return cursor;
}

function wedge(event) {
  event.stop();
  return false;
}