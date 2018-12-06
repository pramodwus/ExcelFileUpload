
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BORAJI.COM</title>
<!-- CSS for Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
  $("#b1").click(function(e) {
    e.preventDefault();
    //Disable submit button
    $(this).prop('disabled',true);
    
    var form = document.forms[0];
    var formData = new FormData(form);
    	
   
    var ajaxReq = $.ajax({
      url : '/uploadfile1',
      type : 'POST',
      data : formData,
      cache : false,
      contentType : false,
      processData : false,
      xhr: function(){
       
         var xhr = $.ajaxSettings.xhr() ;
        
         xhr.upload.onprogress = function(event){
          	
          	
         };
         return xhr ;
    	},
    	beforeSend: function( xhr ) {
    		
    		$('#alertMsg').text('');
    		
              }
    });
  
    // Called on success of file upload
    ajaxReq.done(function(msg) {
      $('#alertMsg').text(msg);
     
    });
    
    // Called on failure of file upload
    ajaxReq.fail(function(jqXHR) {
      $('#alertMsg').text(jqXHR.responseText+'('+jqXHR.status+' - '+jqXHR.statusText+')');
    
    });
  });
});



function sentData()
{
	
	
var data=	$("#order").val();


	
	location.href = "/download?order="+data;
}
</script>





<script type="text/javascript">
$(function() {
  $("#b2").click(function(e) {
    e.preventDefault();
    //Disable submit button
    $(this).prop('disabled',true);
    
    var form = document.forms[1];
    var formData = new FormData(form);
    	
    // Ajax call for file uploaling
    var ajaxReq = $.ajax({
      url : '/uploadfile2',
      type : 'POST',
      data : formData,
      cache : false,
      contentType : false,
      processData : false,
      xhr: function(){
        //Get XmlHttpRequest object
         var xhr = $.ajaxSettings.xhr() ;
        //Set onprogress event handler 
         xhr.upload.onprogress = function(event){
          	
          
         };
         return xhr ;
    	},
    	beforeSend: function( xhr ) {
    		//Reset alert message and progress bar
    		$('#alertMsg1').text('');
    		
              }
    });
  
    // Called on success of file upload
    ajaxReq.done(function(msg) {
      $('#alertMsg1').text(msg);
      
    });
    
    // Called on failure of file upload
    ajaxReq.fail(function(jqXHR) {
      $('#alertMsg1').text(jqXHR.responseText+'('+jqXHR.status+' - '+jqXHR.statusText+')');
      
    });
  });
});
</script>






</head>
<body>
  <div class="container">
    <h2>Spring MVC - File Upload Example With Progress Bar</h2>
    <hr>
   
    
    
    
    <form action="/uploadfile1" method="post"  enctype="multipart/form-data">
      <div class="form-group">
        <label>Select File 1</label> 
        <input  type="file" name="file">
      </div>
      <div class="form-group">
        <button class="btn btn-primary" type="submit"  id="b1">Upload File 1</button>
        <div id="alertMsg" style="color: black;font-size: 18px;"></div>
      </div>
    </form>
    <br />

    

     <form action="/uploadfile2" method="post"   enctype="multipart/form-data">
      <div class="form-group">
        <label>Select File 2</label> 
        <input  type="file" name="file">
      </div>
      <div class="form-group">
        <button class="btn btn-primary" type="submit"  id="b2">Upload File 2</button>
        
        <div id="alertMsg1" style="color: black;font-size: 18px;"></div>
        
      </div>
    </form>
    
     <label>Set Order</label> 
    <div><textarea rows="5" cols="50" id="order"></textarea></div>
    
    <br><br><br>
    
    <a  href="javascript:sentData()">Download Output File</button>
    
    
  </div>
</body>
</html>