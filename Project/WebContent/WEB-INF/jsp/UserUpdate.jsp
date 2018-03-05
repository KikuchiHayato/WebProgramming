<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

  <head>
    <title>ユーザ情報更新</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/original/common.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/UserManagement/UserSignUpstyle.css">
  </head>

    <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
    <a class="navbar-brand text-muted" href="#">${userInfo.name} さん </a>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"></a>
        <button class="btn btn-primary"
        type="button"onclick="location.href='LogoutServlet'">Log Out</button></li>
      </ul>
    </div>
  </div>

  <body>
    <div class = "container">

    <c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

	<div class="wrapper">
	  <form method="post" action="UserUpdateServlet" class="form-signin2">
	    <h3 class="form-signin-heading">Please Update</h3>
	    <input type="hidden" name = id value = ${userdetail.id}>
		<hr class="colorgraph"><br>

		UserID　:　<a>${userdetail.loginId}</a>
	    <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password" />
	    <input type="password" class="form-control" name="password-confirm" id="inputpassword-confirm" placeholder="Password to Confirm" />
	    <input type="text" class="form-control" name="name" id="iuputname" value ="${userdetail.name}" required/>
	    <input type="date" class="form-control" name="birthDate" id="inputbirthDate" value ="${userdetail.birthDate}" required/>

	    <div align="center">
          <button type="submit" class="btn btn-primary">Update</button>
        </div>

	    <br>
	    <br>
        <button type="button" class="btn btn-primary"
        type="button"onclick="location.href='UserListServlet'">Return</button>

	  </form>
	</div>
    </div>
  </body>

</html>
