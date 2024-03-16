<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>Bed and Breakfast Single page</title>
<meta name="description" content="Simple and easy to edit Bed and Breakfast site template">
<meta name="author" content="">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/skeleton.css">
<link rel="stylesheet" href="css/layout.css">

<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript">
function delayedRedirect(){
    window.location = "index.html"
}
</script>

</head>
<body onLoad="setTimeout('delayedRedirect()', 10000)">
<?php
						$mail = $_POST['email'];

						/*$subject = "".$_POST['subject'];*/
						$to = "test@ansonika.com";  		// Your email
						$subject = "Request for avalilability";
						$headers = "From: Your site <noreply@yourdomain.com>";
						$message = "Message\n";
						$message .= "\nCheck in: " . $_POST['check_in'];
						$message .= "\nCheck out: " . $_POST['check_out'];
						$message .= "\nNumber of guest: " . $_POST['guest'];
						$message .= "\nNumber of rooms: " . $_POST['rooms'];
						$message .= "\nName: " . $_POST['name'];
						$message .= "\nName: " . $_POST['last_name'];
						$message .= "\nEmail: " . $_POST['email'];
						$message .= "\nPhone number: " . $_POST['phone_number'];
						
						//Receive Variable
						$sentOk = mail($to,$subject,$message,$headers);
	
?>

<!-- END SEND MAIL SCRIPT -->   
<div class="container">
<div class="sixteen columns" style="text-align:center; padding-top:60px;">
 <p><img src="images/ok.png" width="200" height="185" class="scale-with-grid"></p>
 <h1 style="color:#333">Thank you!</h1>
  <h3 style="color:#333">Form complete Successfully.</h3>
 <p>Our staff will reply as soon as possible. You will be redirect back in 10 seconds.</p>
</div>
</div>
</body>
</html>