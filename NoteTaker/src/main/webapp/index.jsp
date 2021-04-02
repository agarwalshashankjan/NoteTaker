<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="bootstrap.jsp"%>

<title>Note Taker Home</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<div class="card my-5 p-5">
			<img alt="This is NoteTaker LOGO" src="img/noteIcon.jpg"
				class="img-fluid mx-auto" style="max-width: 400px">
			<h1 class="text-primary text-uppercase text-center mt-3">Start
				Taking your Notes now!</h1>
			<div class="container text-center">
				<button class="btn btn-outline-primary text-center" onclick="location.href ='add_notes.jsp'">Start
					Here</button>
			</div>
		</div>
	</div>


</body>
</html>