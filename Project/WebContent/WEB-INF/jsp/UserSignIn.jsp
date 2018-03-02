<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/original/common.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/UserManagement/UserSignInstyle.css">
    <title>ログイン画面</title>
  </head>

  <br>
  <br>

  <body>
	<div class = "container">

	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<div class="wrapper">
		<form method="post" action="LoginServlet" class="form-signin">
		   <h3 class="form-signin-heading">Please Sign In</h3>
		   <hr class="colorgraph"><br>
		   <span id="reauth-email" class="reauth-email"></span>

		   <input type="text" class="form-control" name="loginId" id="inputLoginId" placeholder="UserID" required autofocus>
		   <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password" required>

		   <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Login</button>
		</form>
	</div>
    </div>
	<script type="text/javascript"></script>
  </body>
</html>
