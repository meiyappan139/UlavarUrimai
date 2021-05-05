<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
	<head>
		<title>Login Page</title>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!--Custom styles-->
		<link rel="stylesheet" type="text/css" href="styles.css">
	</head>
	<style>
	
		@import url('https://fonts.googleapis.com/css?family=Numans');
		
		html,body{
		background-color:lightgreen;
		background-size: cover;
		background-repeat: no-repeat;
		height: 100%;
		font-family: 'Numans', sans-serif;
		}
		
		.container{
		height: 100%;
		margin-top:-100px;
		align-content: center;
		}
		
		.card{
		height: 370px;
		margin-top: auto;
		margin-bottom: auto;
		width: 400px;
		background-color: rgba(0,0,0,0.5) !important;
		}
		
		
		
		.card-header h3{
		color: white;
		}
		
		
		
		.input-group-prepend span{
		width: 50px;
		background-color: #669900;
		color: black;
		border:0 !important;
		}
		
		input:focus{
		outline: 0 0 0 0  !important;
		box-shadow: 0 0 0 0 !important;
		
		}
		
		
		
		.login_btn{
		color: black;
		background-color: #669900;
		width: 100px;
		}
		
		.login_btn:hover{
		color: black;
		background-color: white;
		}
		
		
		
		.links a{
		margin-left: 4px;
		}
	</style>
	<body onLoad="initGeolocation();">
	   <br>
	    <center><h1><b>UlarvarUrimai</b></h1></center>
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3>Sign In</h3>
						<div class="d-flex justify-content-end social_icon">
						
						</div>
					</div>
					<div class="card-body">
						<form method="post" action="GeneralLogin">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name="phno" placeholder="phone number" Required>
								
							</div>
							
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" class="form-control" name="password" placeholder="password" Required>
							</div>
							
                             <input type="hidden"  class="form-control"  id="long" name="logitude" placeholder="Longitude *" value="" Required/>
                       
                        
                             <input type="hidden" class="form-control" id="lat" name="latitude" placeholder="Latitude *" value="" Required/>
	                                      
							
							<div class="form-group">
								<input type="submit" value="Login" class="btn float-right login_btn">
							</div>
							
							
								<input type="radio" class="radio-btn" name="choice" value="f" required/>
								<label style="color:white;" for="a-opt" class="label">Farmer</label>
								<br>
								<input type="radio" class="radio-btn" name="choice" value="c" required/>
								<label style="color:white;" for="b-opt" class="label">Consumer</label>
							
							
						
						</form>
						  <p style="color:white;">Don't have an account ?<a href="Register.jsp" style="color:black">  Register here!</a></p>
					</div>
					
				
				</div>
			
		    </div>
		
		</div>
		<jsp:include page="DeleteSpoiledItems.jsp"></jsp:include>
		 <script type="text/javascript">
	
					function initGeolocation()
					{
					   if( navigator.geolocation )
					   {
					      // Call getCurrentPosition with success and failure callbacks
					      navigator.geolocation.getCurrentPosition( success, fail );
					   }
					   else
					   {
					      alert("Sorry, your browser does not support geolocation services.");
					   }
					}
					
					function success(position)
					{
					
					    document.getElementById('long').value = position.coords.longitude;
					    document.getElementById('lat').value = position.coords.latitude
					}
					
					function fail()
					{
					   // Could not obtain location
					}
				</script>    
	</body>
</html>
