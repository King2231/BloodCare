<%-- 
    Document   : login
    Created on : Apr 1, 2018, 8:52:41 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error="";
    Object err=session.getAttribute("err");
    Object bank=session.getAttribute("bank");
    if(bank!=null){
        response.sendRedirect("bdboard");
    }    
    if(err!=null){
        error=(String)err;
        session.removeAttribute("err");
    }     
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Login</title>
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
          .error{
              color: red;
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
                        Blood Bank Login
                    </div>
                </h2>
                <form class="ui large form" action="addbank" method="post">
                <div class="ui stacked segment">
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="user icon"></i>
                            <input type="text" name="busr" placeholder="Username">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <i class="lock icon"></i>
                            <input type="password" name="bpwd" placeholder="Password">
                        </div>
                    </div>
                    <button class="ui fluid large teal submit button" type="submit" value="login" name="submit">Login</button>
                    
                </div> 
            </form>
              <div class="ui message">
                <%
                    if(err!=null){
                %>
                  <div class="ui error message"><p><%=error%></p></div>
                  <%
                  }
                  %>
                New to us? <a href="newbank">Sign Up</a>
              </div>
            </div>
        </div>

        
        
        
        <!--form action="addbank">
            <input type="text" name="busr" required placeholder="Enter username"><br>
            <input type="password" name="bpwd" required placeholder="Enter Password"><br>
            <input type="submit" name="submit" value="login">
            <p style="color: red"><%//=error%></p>
        </form-->
    </body>
</html>
