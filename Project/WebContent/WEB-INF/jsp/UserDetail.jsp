<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">

  <head>
    <title>ユーザ情報詳細参照</title>
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
    <a class="navbar-brand text-primary">${userInfo.name} さん </a>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#"></a>
        <button class="btn btn-primary"
        type="button"onclick="location.href='LogoutServlet'">Log Out</button></li>
      </ul>
    </div>
  </div>

  <body>
    <div class = "container">
	<div class="wrapper">
	  <form method="post" action="UserDetailservlrt" class="form-horizontal">
	    <h3 class="form-signin-heading">User Information</h3>
		<hr class="colorgraph"><br>

		<div class="form-group">
          <label for="user-id" class="control-label col-sm-2">UserID</label>
          <a>${userdetail.loginId}  ${usersearch.loginId}</a>
        </div>

        <div class="form-group">
          <label for="user-name" class="control-label col-sm-2">Name</label>
          <a>${userdetail.name}  ${usersearch.name}</a>
        </div>

        <div class="form-group">
          <label for="continent" class="control-label col-sm-2">Date of Birth</label>
          <a>${userdetail.birthDate}  ${usersearch.birthDate}</a>
        </div>

        <div class="form-group">
          <label for="continent" class="control-label col-sm-2">Registered Date</label>
          <a>${userdetail.createDate}  ${usersearch.createDate}</a>
        </div>

        <div class="form-group">
          <label for="continent" class="control-label col-sm-2">Date Modified</label>
          <a>${userdetail.updateDate}  ${usersearch.updateDate}</a>
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
