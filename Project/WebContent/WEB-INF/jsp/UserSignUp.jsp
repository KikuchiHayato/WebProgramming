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
    <link rel="stylesheet" type="text/css" href="css/UserManagement/UserSignUpstyle.css">
    <title>新規登録</title>
  </head>

  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
    <a class="navbar-brand text-primary">${userInfo.name} さん </a>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"></a>
        <button class="btn btn-primary"
        type="button"onclick="location.href='LogoutServlet'">Log Out</button></li>
      </ul>
    </div>
  </div>

  <c:if test="${errMsg != null}" >
    <div class="alert alert-danger" role="alert">
	  ${errMsg}
	</div>
  </c:if>

  <br>
  <br>

  <body>
    <div class = "container">
	<div class="wrapper">
	  <form method="post" action="UserSignUpServlet" class="form-signin2">
	    <h3 class="form-signin-heading">Please Sign Up</h3>
		<hr class="colorgraph"><br>

	    <input type="text" class="form-control" name="loginId" id="inputLoginId" placeholder="UserID"  value ="${userSignUp.loginId}"required autofocus/>
	    <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password" required/>
	    <input type="password" class="form-control" name="password-confirm" id="inputpassword-confirm" placeholder="Password to Confirm" required/>
	    <input type="text" class="form-control" name="name" id="iuputname" placeholder="Name" value ="${userSignUp.name}" required/>
	    <input type="date" class="form-control" name="birthDate" id="inputbirthDate" value ="${userSignUp.birthdate}" required/>

	    <div align="center">
          <button type="submit" class="btn btn-primary form-submit">Sign Up</button>
        </div>

        <br>
	    <br>
        <button type="button" class="btn btn-primary"
        type="button"onclick="location.href='UserListServlet'">Return</button>

	  </form>
	</div>
    </div>
	<script type="text/javascript"></script>
  </body>
</html>
