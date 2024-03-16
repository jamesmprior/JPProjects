/*--------------------------------------------------------
Scrollpage
--------------------------------------------------------*/
$('a.scroll_a, .scroll_home, .links-home a').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top- 43
    }, 500);
    return false;
});

	$('#top-nav').onePageNav({
        filter : ':not(.external a)',
		easing: 'swing',
		scrollOffset: 43,
        scrollThreshold : 0.95
    });
	
if( window.innerWidth < 767 ) {

	$('#top-nav').onePageNav({
		easing: 'swing',
		filter : ':not(.external a)',
		scrollOffset: 0,
        scrollThreshold : 0.95
    });
	$('a.scroll_a, .scroll_home, .links-home a').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top- 0
    }, 500);
    return false;
});
}

/*--------------------------------------------------------
Tooltip
--------------------------------------------------------*/
$('.tooltip_1').poshytip({
				className: 'tip-twitter',
				showTimeout: 1,
				alignTo: 'target',
				alignX: 'center',
				offsetY: 5,
				allowTipHover: false,
				fade: true,
				slide: true
			})			
			
/*--------------------------------------------------------
Flexslider
--------------------------------------------------------*/
$(window).load(function() {
			$('.flexslider').flexslider();
		});		
		
/*--------------------------------------------------------
Quote rotator
--------------------------------------------------------*/	

            $('#testimonials ul').quote_rotator({
                buttons: { next: 'Next', previous: 'Previous' }
            });

/*--------------------------------------------------------
Carousel
--------------------------------------------------------*/	
jQuery(document).ready(function() {
    jQuery('.mycarousel').jcarousel({
        scroll:1,
        wrap: 'circular'
    });
});

/*--------------------------------------------------------
Hover images icon
--------------------------------------------------------*/	
    //Set opacity on each span to 0%
    $(".icon-hover").css({'opacity':'0'});

	$('figure a').hover(
		function() {
			$(this).find('.icon-hover').stop().fadeTo(800, 1);
		},
		function() {
			$(this).find('.icon-hover').stop().fadeTo(800, 0);
		}
	)
/*--------------------------------------------------------
Gallery func
--------------------------------------------------------*/	
$(function(){
	// Initialize the gallery
	$('.thumbs a').touchTouch();

});
/*--------------------------------------------------------
Accordion
--------------------------------------------------------*/	
 jQuery('.accordion').each(function(){
    var $this = jQuery(this),
        $toggle = $this.find('dt');
    
    $toggle.click(function(){
      if( jQuery(this).next().is(':hidden') ) {
        $this.find('dt').removeClass('active').next().slideUp();
        jQuery(this).toggleClass('active').next().slideDown();
      }
      return false;
    });
    
  });
  
/*--------------------------------------------------------
Weather
--------------------------------------------------------*/	  
$('#weather').weatherfeed(['SPXX0047'], {
		forecast: true
	});

/*--------------------------------------------------------
Form validate and date
--------------------------------------------------------*/	  
$("#availability-form").validate();
$("#contact-form").validate();
$(".datepicker").datepicker();

// MENU MOBILE ===============================================================================
 $(document).ready(function(){   
    
		//When btn is clicked
		$(".btn-responsive-menu").click(function() {
			$("#top-nav").slideToggle(400);
		
		});
    
    });
