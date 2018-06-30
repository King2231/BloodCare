<%-- 
    Document   : hosplogin
    Created on : Apr 1, 2018, 10:20:43 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error="";
    Object err=session.getAttribute("err");
    Object hosp=session.getAttribute("hospital");
    if(hosp!=null){
        response.sendRedirect("hospboard");
    }    
    if(err!=null)
        error=(String)err;
%>
<!DOCTYPE html>
<!DOCTYPE html>
<!-- saved from url=(0043)https://semantic-ui.com/examples/login.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Standard Meta -->
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Hospital Login</title>
  <link rel="stylesheet" type="text/css" href="./login_files/reset.css">
  <link rel="stylesheet" type="text/css" href="./login_files/site.css">

  <link rel="stylesheet" type="text/css" href="./login_files/container.css">
  <link rel="stylesheet" type="text/css" href="./login_files/grid.css">
  <link rel="stylesheet" type="text/css" href="./login_files/header.css">
  <link rel="stylesheet" type="text/css" href="./login_files/image.css">
  <link rel="stylesheet" type="text/css" href="./login_files/menu.css">

  <link rel="stylesheet" type="text/css" href="./login_files/divider.css">
  <link rel="stylesheet" type="text/css" href="./login_files/segment.css">
  <link rel="stylesheet" type="text/css" href="./login_files/form.css">
  <link rel="stylesheet" type="text/css" href="./login_files/input.css">
  <link rel="stylesheet" type="text/css" href="./login_files/button.css">
  <link rel="stylesheet" type="text/css" href="./login_files/list.css">
  <link rel="stylesheet" type="text/css" href="./login_files/message.css">
  <link rel="stylesheet" type="text/css" href="./login_files/icon.css">

  <script src="./login_files/jquery.min.js.download"></script>
  <script src="./login_files/form.js.download"></script>
  <script src="./login_files/transition.js.download"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
  $(document)
    .ready(function() {
      $('.ui.form')
        .form({
          fields: {
            email: {
              identifier  : 'email',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your e-mail'
                },
                {
                  type   : 'email',
                  prompt : 'Please enter a valid e-mail'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[6]',
                  prompt : 'Your password must be at least 6 characters'
                }
              ]
            }
          }
        })
      ;
    })
  ;
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
        <a href="."><h1>Blood Care</h1></a>
      <div class="content">
        Hospital Login
      </div>
    </h2>
    <form class="ui large form" action="hospaction">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="husr" placeholder="Username">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="hpwd" placeholder="Password">
          </div>
        </div>
        <button type="submit" class="ui fluid large teal submit button" name="submit" value="login">Login</button>
      </div>

      <div class="ui error message"></div>

    </form>

    <div class="ui message">
      New to us? <a href="register.html">Sign Up</a>
    </div>
  </div>
</div>




</body></html>