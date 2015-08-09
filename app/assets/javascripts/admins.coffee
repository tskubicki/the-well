# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#http://stackoverflow.com/questions/7093659/how-do-i-get-the-n-th-level-parent-of-an-element-in-jquery -- line 9
`
	$(document).ready(function() {
		$('.delete-order').on("ajax:complete", function(e){
			$(e.currentTarget).parents().eq(1).hide();
		});
		
		$('.delete-user').on("ajax:complete", function(e){
			$(e.currentTarget).parents().eq(1).hide();
		});
		
		$('.delete-waiter').on("ajax:complete", function(e){
			$(e.currentTarget).parents().eq(1).hide();
		});
	});
`
