// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
// require jquery.turbolinks
// Loads all Bootstrap javascripts
//= require bootstrap
//= require cocoon
//= require_tree .

//------------------------------------------------------- PLAY ALL/ RESET

$(function() {
	$("#play_all").click(function() {
		$('.audio_player').each(function( index ) {
			if ($(this)[0].paused) {
				$(this)[0].play();
		} else {
			$(this)[0].pause();
		}
		});
	});
	$('.reset_transient').click(function() {

		$('.audio_player').each(function() {
			$(this)[0].pause();
			$(this)[0].currentTime = 0;
		});

	});

		
});

//----------------------------------------------------------


