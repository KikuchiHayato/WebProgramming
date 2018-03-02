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
    <title>登録確認画面</title>
  </head>

  <br>
  <br>

  <body>
    <div class = "container">
	<div class="wrapper">
	  <form action="" method="post" name="Login_Form" class="form-signin2">
	    <h3 class="form-signin-heading">Registration Complete</h3>
		<hr class="colorgraph"><br>

		<div class="form-group">
          <label for="user-id" class="control-label col-sm-2">UserID</label>
          <a>${complete.loginId}</a>
        </div>

        <div class="form-group">
          <label for="user-id" class="control-label col-sm-2">Password</label>
          <a>****</a>
        </div>

        <div class="form-group">
          <label for="user-name" class="control-label col-sm-2">Name</label>
          <a>${complete.name}</a>
        </div>

        <div class="form-group">
          <label for="continent" class="control-label col-sm-2">Date of Birth</label>
          <a>${complete.birthDate}</a>
        </div>
        　で登録、更新しました。

        <br>
        <br>
        <br>
        <p  align="center">
          <button type="button" class="btn btn-primary"
          type="button"onclick="location.href='UserListServlet'">Return</button>
          　　　
          <button class="btn btn-primary form-submit"
          type="button"onclick="location.href='UserSignUpServlet'">Sign Up</button>
        </p>
      </form>

	</div>
    </div>
	<script type="text/javascript"></script>
  </body>
</html>
