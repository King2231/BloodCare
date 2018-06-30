<%-- 
    Document   : newcamp
    Created on : Apr 1, 2018, 10:18:49 PM
    Author     : Ravi
--%>

<%@page import="com.bloodcare.Workers.BloodBank_Worker"%>
<%@page import="com.bloodcare.POJO.Bloodbank_Dt"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        ArrayList<Bloodbank_Dt> blist = BloodBank_Worker.getAllBanks();
%>

<!DOCTYPE html>
<!DOCTYPE html>
<!-- saved from url=(0043)https://semantic-ui.com/examples/login.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Standard Meta -->
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Register</title>
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
    <br><br><br><br>
<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <a href="."><p>Blood Care!</p></a>
      <div class="content">  
        Blood Donation Camp Registration
      </div>
    </h2>
    <form class="ui large form">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="cname" placeholder="Camp Name">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="corganizer" placeholder="Organizer">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="cbuilding" placeholder="Building name">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="carea" placeholder="Area">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="ccity" placeholder="City">
          </div>
            <div class="field">
                <label>Select associated Blood Bank</label>
                <select name="bank">    
                <% for(Bloodbank_Dt bd: blist)
                {%>
                    <option value="<%=bd.getBank_id()%>"><%=bd.getBank_name()%>, <%=bd.getBank_city()%></option>
                <%}%>
            </select><br>
            </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="cpin" placeholder="Pin Code">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="date" name="cdate" placeholder="Date">
          </div>
        </div>  
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="cpassword" placeholder="Confirm Password">
          </div>
        </div>
        <div class="ui fluid large teal submit button">Register</div>
      </div>
      <div class="ui error message"></div>
    </form>
    <div class="ui message">
      Already Registered? <a href="camplogin">Log In</a>
    </div>
  </div>
</div>




</body></html>