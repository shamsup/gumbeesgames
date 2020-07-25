$(document).ready(function(){
	$('#games-dropdown').click(function(e){
		$(this).toggleClass('active');
		$('#games-dropdown ul').slideToggle('fast');
	});
});