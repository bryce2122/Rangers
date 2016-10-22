<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>NY Rangers Breakaway Blog!</title>

  <!-- JS & JQUERY -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="main.js"></script>

  <!-- STYLE -->
<link rel="stylesheet" type="text/css" href="http://localhost:4567/user.css">

  <!-- FONTS -->
<link href="https://fonts.googleapis.com/css?family=Audiowide|Russo+One" rel="stylesheet"> 
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/default.css">

</head>
<body>
  <nav class="clearfix">
    <ul class="clearfix">

      <li><a href="/">Home</a></li>
      <li><a href="/users/2"> View Profile</a></li>
      <li><a href="/account">Account</a></li>
      <li><a href="/feed">Feed</a></li>
      <li><a href="/sample">Teammates</a></li>
      <li><a href="/signout">Sign Out</a></li>  

    </ul>
    <a href="#" id="pull">Menu</a>
  </nav>


      
  
  <link href="https://fonts.googleapis.com/css?family=Abhaya+Libre" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://localhost:4567/user.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
 


<h3> User #main.js</h3>




<div class="card">
<h1 id="their">Their Posts</h1>
<ul id="listm" class="list-group list-group-flush">
</ul>
</div>





<button class="btn btn-default" id="f">Follow</button>







<script type="text/javascript">
var arr = [];
$( init );
 
function init() {
  $('.list-group-item').draggable({

  	cursor: 'move',
  	helper: 'clone',
  	stop: alertme
  	});}

$('#box').droppable({
	 drop: function(e, ui){  
	 	console.log("pleaaaase",e)
        $(ui.draggable).clone().appendTo($(this)); }

});

function alertme() {
console.log($('#box').text())
arr.push($('#box').text() + "ss");
console.log(arr);
$('#box').find('*').not('.goal').remove();
}

$(document).ready(function() {

var ru = $("#w").text();

alert(ru);
 var map = $(".con").map(function() {
    return $(this).text();
});

alert(map[0]);
$("#f").click(function() {
var a = window.location.href.split("/");
var b = a[a.length - 1]
console.log(b);
$.ajax({url : "/users/follow", type : "post", data : {data_value: (b) }});
});

var i = -1;
$(document).keydown(function(e) {
    switch(e.which) {
        case 37: // left
       
       if(i == 0) {

      $("#c").text("Collection");

       }

       else {

       i--;
       $("#c").text(map[i]);}
      
        break;

        case 38: // up
        break;

        case 39: // right
        if(i == map.length - 1){

        }
        else {
        i++;
        $("#c").text(map[i]);}
        
        break;

        case 40: // down
        break;

        default: return; // exit this handler for other keys
    }
    e.preventDefault(); // prevent the default action (scroll / move caret)
});


$("#create").click(function(){

$.ajax({
              url : "/sample",
              type : "post",
              data : { data_value: JSON.stringify(arr) },
            });


});


});
</script>
  


</body>
</html>
