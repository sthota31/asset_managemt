// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


(function( $, undefined ) {
    $.notification = function(options) {
        var opts = $.extend({}, {type: 'notice', time: 3000}, options);
        var o    = opts;

        timeout          = setTimeout('$.notification.removebar()', o.time);
        var message_span = $('<span />').addClass('alert alert-info').html(o.message);
        var wrap_bar     = $('<div />').addClass('alert alert-info').css("cursor", "pointer");

    if (o.type == 'error') {
          wrap_bar.css({"color": "#D8000C"})
        };

        wrap_bar.click(function(){
            $.notification.removebar()
        });

        wrap_bar.append(message_span).hide()
            .insertAfter($('.flash')).fadeIn('fast');
    };


    var timeout;
    $.notification.removebar    = function(txt) {
        if($('.alert').length){
            clearTimeout(timeout);

            $('.alert').fadeOut('fast',function(){
                $(this).remove();
            });
        }   
    };


})(jQuery)

ddaccordion.init({
  headerclass: "expandable", //Shared CSS class name of headers group that are expandable
  contentclass: "categoryitems", //Shared CSS class name of contents group
  revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
  mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
  collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
  defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
  onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
  animatedefault: false, //Should contents open by default be animated into view?
  persiststate: true, //persist state of opened contents within browser session?
  toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
  togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
  animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
  oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
    //do nothing
  },
  onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
    //do nothing
  }
})