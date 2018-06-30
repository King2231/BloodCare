<%-- 
    Document   : indx
    Created on : Apr 4, 2018, 10:05:44 PM
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://semantic-ui.com/examples/homepage.html -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Standard Meta -->
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Blood Care</title>
  <link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
  <link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.js">

  <style type="text/css">

    .hidden.menu {
      display: none;
    }

    .masthead.segment {
      min-height: 700px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
    .masthead h1.ui.header {
      margin-top: 3em;
      margin-bottom: 0em;
      font-size: 4em;
      font-weight: normal;
    }
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 8em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 700px) {
      .ui.fixed.menu {
        display: none !important;
      }
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
      .masthead h1.ui.header {
        font-size: 2em;
        margin-top: 1.5em;
      }
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }


  </style>

  <script src="./homepage_files/jquery.min.js.download"></script>
  <script src="./homepage_files/visibility.js.download"></script>
  <script src="./homepage_files/sidebar.js.download"></script>
  <script src="./homepage_files/transition.js.download"></script>
  <script>
  $(document)
    .ready(function() {

      // fix menu when passed
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        })
      ;

      // create sidebar and attach to menu open
      $('.ui.sidebar')
        .sidebar('attach events', '.toc.item')
      ;

    })
  ;
  </script>
</head>
<body class="pushable">

<!-- Following Menu -->
<div class="ui large top fixed menu transition hidden">
  <div class="ui container">
    <a class="active item">Home</a>
    <a class="item">Why Donate?</a>
    <a class="item">Donations</a>
    <a class="item">About Us</a>
    <div class="right menu">
      <div class="item">
        <a href="login.html" class="ui button">Log in</a>
      </div>
      <div class="item">
        <a href="register.html" class="ui primary button">Sign Up</a>
      </div>
    </div>
  </div>
</div>

<!-- Sidebar Menu -->
<div class="ui vertical inverted sidebar menu left">
  <a class="active item">Home</a>
  <a class="item">Why Donate?</a>
  <a class="item">Donations</a>
  <a class="item">About Us</a>
  <a href="login.html" class="item">Login</a>
  <a href="register.html" class="item">Signup</a>
</div>

<!-- Page Contents -->
<div class="pusher">
  <div class="ui inverted vertical masthead center aligned segment">
    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
        <a class="active item">Home</a>
        <a class="item">Why Donate?</a>
        <a class="item">Donations</a>
        <a class="item">About US</a>
          <div class="ui inverted menu">
            <div class="ui simple dropdown item">
              <span class="ui inverted button">Log In</span>
              <div class="menu">
                <div class="item" ><a style="color:black" href="banklogin">Blood Bank</a></div>
                <div class="item"><a style="color:black" href="camplogin">Blood Donation Camp</a></div>
                <div class="item"><a style="color:black" href="hosplogin">Hospital</a></div>
              </div>
            </div>
          </div>
          <div class="ui inverted menu">
            <div class="ui simple dropdown item">
              <span class="ui inverted button">Sign Up</span>
              <div class="menu">
                <div class="item"><a style="color:black" href="newbank">Blood Bank</a></div>
                <div class="item"><a style="color:black" href="newcamp">Blood Donation Camp</a></div>
                <div class="item"><a style="color:black" href="newhosp">Hospital</a></div>
              </div>
            </div>
          </div>          
      </div>
    </div>

    <div class="ui text container">
      <h1 class="ui inverted header">
        Blood Care
      </h1>
      <h2>Organize A Blood donation camp</h2>
        <a href="camplogin"><div class="ui huge primary button">Get Started <i class="right arrow icon"></i></div></a>
    </div>
  </div>
</body>
</html>
