$('input#search').quicksearch('table tbody tr');


$(".chosen-select").chosen({no_results_text: "Leider konnte keine Serie gefunden werden!"});


$(".addItem").click(function(){
    var x = document.getElementById("mySelect").selectedIndex;
    var serie = document.getElementsByTagName("option")[x].value;

    $("#FavoriteListe").append("<li class='rm'>"+serie+"</li>");
});



$(".rm").click(function(){
    $(this).hide();
});