function searchbyreviews(){
   $("#search_button").click(function(){
     var reviews = $("#reviews").val();
     $.ajax({
        url: "/professional_recipes/Search_by_reviews/" + reviews,
        dataType: "JSON",
        timeout: 10000,
        beforeSend: function(){
           $("#answer").html("Loading...");
        },
        error: function(){
           $("#answer").html("Error while trying to find Professional recipes. Please try again later.");
        },
        success: function(res){
           if(res){
              $("#answer").html('<a href="/professional_recipes/'+res.id+'"> '+res.nombre+' ' + res.description + ' </a>');
           }else{
              $("#answer").html("The rewiews does not belong to any Professional recipes .");
           }
        }
     })
  });
};
$(document).ready(function(){
   searchbyreviews();
});