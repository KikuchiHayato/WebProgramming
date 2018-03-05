<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

  <head>
    <title>ユーザ削除確認</title>
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

  <br>
  <br>

  <body>
    <div class = "container">
	<div class="wrapper">
	  <form action="UserDeleteServlet" method="post" class="form-signin2">
	    <h3 class="form-signin-heading">Please Delete</h3>
		<input type="hidden" name = id value = ${userdetail.id}>
		<hr class="colorgraph"><br>

        UserID　:　${userdetail.name}<br>
        を本当に削除してよろしいでしょうか。
        <br>
        <br>
        <br>
        <p  align="center">
          <button type="button" class="btn btn-outline-dark form-submit"
          type="button"onclick="location.href='UserListServlet'">Cancel</button>
          　　　
          <button type="submit" class="btn btn-outline-dark form-submit">　OK　</button>
        </p>

        <br>
        <br>
        <button type="button" class="btn btn-primary"
        type="button"onclick="location.href='UserListServlet'">Return</button>

      </form>
    </div>
   </div>
  </body>
</html>