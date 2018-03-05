<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ja">

  <head>
    <title>ユーザー一覧</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/original/common.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/UserManagement/UserListstyle.css">
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

  <br>
  <br>

  <body>
    <div class = "container">
    <div class = "wrapper">
		<form method="post" action="UserListServlet" class="form-signin">
		   <h3 class="form-signin-heading">User List</h3>

		   <hr class="colorgraph"><br>

		   <input type="text" class="form-control" name="loginId" id="inputLoginId" placeholder="UserID"/>
		   <input type="text" class="form-control" name="name" id="iuputname" placeholder="Name">
		   <input type="date" class="form-control" name="birthDate" id="inputbirthDate" >

		   <button type="submit" class="btn btn-lg btn-primary btn-block">Search</button>
		</form>
    </div>
    </div>
	<script type="text/javascript"></script>
  </body>

  <body>
    <form action="" method="post" name="Login_Form" class="form-signin2">

      <div align="right">
        <button class="btn btn-primary form-submit"
        type="button"onclick="location.href='UserSignUpServlet'">Sign Up</button>
      </div>

      <hr class="colorgraph"><br>

      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">UserID</th>
            <th scope="col">Name</th>
            <th scope="col">Date of Birth</th>
            <th scope="col"></th>
          </tr>
        </thead>
	    <tbody>
	      <c:forEach var="user" items="${userList}" >
	        <tr>
	          <td>${user.loginId}</td>
	          <td>${user.name}</td>
	          <td>${user.birthDate}</td>
	          <td>
                <button class="btn btn-outline-primary" type="button"onclick="location.href='UserDetailServlet?id=${user.id}'">&nbsp;Detail&nbsp;</button>　

	            <c:choose>
	              <c:when test="${userInfo.id == 1}">
	                <button class="btn btn-outline-success" type="button"onclick="location.href='UserUpdateServlet?id=${user.id}'">Update</button>　
                    <button class="btn btn-outline-warning" type="button"onclick="location.href='UserDeleteServlet?id=${user.id}'">Delete</button>
                  </c:when>

	              <c:when test="${userInfo.id == user.id}">
	                <button class="btn btn-outline-success" type="button"onclick="location.href='UserUpdateServlet?id=${user.id}'">Update</button>　
                  </c:when>
                </c:choose>
	          </td>
	        </tr>
	      </c:forEach>
	    </tbody>
	  </table>

	</form>
  </body>

</html>