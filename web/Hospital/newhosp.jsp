<%-- 
    Document   : newhospital
    Created on : Apr 1, 2018, 10:19:22 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0043)https://semantic-ui.com/examples/login.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Standard Meta -->
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>New Hospital</title>
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
<br><br>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <a href="."><p>Blood Care!</p></a>
      <div class="content">
        Hospital Registration
      </div>
    </h2>
    <form class="ui large form" action="hospaction" method="post">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hname" placeholder="Hospital name">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hbuilding" placeholder="Building name">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="harea" placeholder="Area">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hcity" placeholder="City">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hpin" placeholder="Pin Code">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hmail" placeholder="Email">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="hsite" placeholder="Website, if any">
          </div>
        </div>
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
        
        <button type="submit" class="ui fluid large teal submit button" name="submit" value="add">Register</button>
      </div>

      <div class="ui error message"></div>

    </form>

    <div class="ui message">
      Already Registered? <a href="hosplogin">Log In</a>
    </div>
  </div>
</div>




</body></html>