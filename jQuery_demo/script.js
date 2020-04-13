// Shorthand for $( document ).ready()
$(function() {

	//dropdown menu
	$("#item").click(function() {
		$("#submenu").slideToggle(500);
	});

	// add task to list
	function addTask() {
		var task = $("#new_task").val();
		if (task !== "") {
			var elem = $("<li class='task'></li>");
			$(elem).append($('<div/>', { text: task }));
			$(elem).append("<button class='remove'>X</button>");
			$("#list").append(elem);
			$("#new_task").val("");
		}
	}


	// add task from clicking button
	$("#add").click(function() {
		addTask();
	});

	// add task from hitting enter
	$("#new_task").on("keypress", function (e) {
        if(e.which === 13){
       	    addTask();
        }
    });

	// remove task - must use document here because list is dynamic
    $(document).on("click", ".remove", function(){
        $(this).closest(".task").fadeOut(350, function() { 
        	$(this).remove();
        });
	});

    // bold task on hover
	$(document).on('mouseover', '.task div', function(){
        $(this).closest('.task div').css("font-weight", "bold");
	});

	// unbold task after hover
	$(document).on('mouseleave', '.task div', function(){
        $(this).closest('.task div').css("font-weight", "normal");
	});

	// bold remove button on hover
	$(document).on('mouseover', '.remove', function(){
        $(this).closest('.remove').css("font-weight", "bold");
	});

	// bold remove button after hover
	$(document).on('mouseleave', '.remove', function(){
        $(this).closest('.remove').css("font-weight", "normal");
	});

	// toggle highlight task when clicked
	$(document).on("click", ".task div", function(){
        $(this).closest(".task div").toggleClass("yellow");
	});
}); 