<!DOCTYPE html>
<%@ page import="java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Tugas Akhir Agus Hermawan</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

	<!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
	<!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
	<!--script src="js/less-1.3.3.min.js"></script-->
	<!--append ?#!watch? to the browser URL, then refresh the page. -->
	
	<link href="asset-layoutit/css/bootstrap.min.css" rel="stylesheet">
	<link href="asset-layoutit/css/style.css" rel="stylesheet">
	<link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="custom.css" rel="stylesheet">

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  <![endif]-->

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="img/favicon.png">
  
	<script type="text/javascript" src="asset-layoutit/js/jquery.min.js"></script>
	<script type="text/javascript" src="asset-layoutit/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="asset-layoutit/js/scripts.js"></script>
</head>

<body>
    
    <% 
        if (request.getParameter("login")==null){
            out.println("");
        }
        else if (request.getParameter("login").equals("gagal")){
            %>
                <div class="alert alert-danger alert-dismissable " style="margin-top: 70px;">
                Login gagal, Username atau Password salah. <a href="index.jsp" class="alert-link"><i class="fa fa-times"></i></a>
                </div>
            <%
        }
    %>
    
    <% 
        if (request.getParameter("daftar")==null){
            out.println("");
        }
        else if (request.getParameter("daftar").equals("berhasil")){
            %>
                <div class="alert alert-info alert-dismissable " style="margin-top: 70px;">
                Selamat, Pendaftaran Sukses. <a href="index.jsp" class="alert-link"><i class="fa fa-check"></i></a>
                </div>
            <%
        }
        
        else if (request.getParameter("daftar").equals("gagal")){
    %>
      <div class="alert alert-danger alert-dismissable " style="margin-top: 70px;">
                Username atau email sudah ada. <a href="index.jsp" class="alert-link"><i class="fa fa-times"></i></a>
                </div>
            <%}%>
    
     
    
<div class="container">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.jsp">Super Market Online</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
                                            <% 
                                            if (session.getAttribute("sessionlevel")==null){
                                              %>
                                               <li>
							<a href="index.jsp?link=bantuan"> Bantuan </a>
						</li>
						<li>
							<a href="#daftar" data-toggle="modal"> Daftar </a>
						</li>
						<li>
							<a href="#login" data-toggle="modal"> Login </a>
						</li>
                                              <%
                                            }
                                            else if (session.getAttribute("sessionlevel").equals("user")){
                                                %>
                                                <li>
							<a href="index.jsp?link=bantuan"> Bantuan </a>
						</li>
                                                <li>
                                                        <a href="#"> Daftar Toko </a>
						</li>
                                                <li>
                                                        <a href="user_logout.jsp"> Logout </a>
						</li>
                                                
                                                <%}%>
						
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text">
						</div> <button type="submit" class="btn btn-default"><i class="fa fa-search"></i> Cari </button>
					</form>
					
				</div>
				
			</nav>
    
    <div class="modal fade" id="login" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								Login User
							</h4>
						</div>
						<div class="modal-body">
							<form role="form" method="post" action="proses.jsp?act=login">
								<div class="form-group">
                                                                        <input class="form-control" name="user" minlength="4" type="text" placeholder="Username" required>
                                                                </div>
                                                                <div class="form-group">
                                                                        <input name="pass" type="password" class="form-control" id="cname" minlength="4" placeholder="Password" required>
                                                                </div>
								<button type="submit" class="btn btn-primary">Login</button>
							</form>
						</div>
					</div>
					
				</div>
				
			</div>
    
    <div class="modal fade" id="daftar" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
                                                             DAFTAR
							</h4>
                                                         <h5> Silahkan isi informasi mengenai diri anda di bawah ini. </h5>
						</div>
						<div class="modal-body">
							<form role="form" method="post" action="proses.jsp?act=daftar">
								<div class="form-group">
                                                                        <label for="exampleInputEmail1"> User Name </label><input name="username" class="form-control" id="exampleInputEmail1" type="text" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                        <label for="exampleInputEmail1"> Nama </label><input name="nama" class="form-control" id="exampleInputEmail1" type="text" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                        <label for="exampleInputEmail1"> Alamat </label><input name="alamat" class="form-control" id="exampleInputEmail1" type="text" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                        <label for="exampleInputEmail1"> Email </label><input name="email" class="form-control" id="exampleInputEmail1" type="email"/>
                                                                </div>
                                                                <div class="form-group">
                                                                        <label for="exampleInputPassword1"> Password </label><input name="password" class="form-control" id="exampleInputPassword1" type="password" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                        <label for="exampleInputEmail1"> Tanggal Lahir </label><input name="tgl" class="form-control" id="exampleInputEmail1" type="date" placeholder="YYYY-MM-DD" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1"> Jenis Kelamin </label><br>
                                                                        <input type="radio" name="jk" value="Laki-laki" checked>Laki-laki
                                                                        <input type="radio" name="jk" value="Perempuan">Perempuan
                                                                </div>
								<button type="submit" class="btn btn-primary"> Daftar </button>
							</form>
						</div>
					</div>
					
				</div>
				
			</div>
    
		<div>
                   

                        <%
                        if (request.getParameter("link")==null){
                        %>
                        <%@include file="index_user.jsp" %>
                        <% } else { %>
                        <%@include file="link.jsp" %>
                        <% } %>
		</div>

	
	
</div>
<br />
<footer>
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left"> Copyright © Supermarket Online | Agus Hermawan 2015. All right reserved. </p>
            <div class="pull-right">
                <div class="text-center center-block">
                <a href="https://www.facebook.com/pbs.zoestho"><i id="social" class="fa fa-facebook-square fa-3x"></i></a>
	            <a href="#"><i id="social" class="fa fa-twitter-square fa-3x"></i></a>
	            <a href="#"><i id="social" class="fa fa-google-plus-square fa-3x"></i></a>
	            <a href="mailto:agushermawan93@gmail.com"><i id="social" class="fa fa-envelope-square fa-3x"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>



    <script>
    $("#commentForm").validate();
    </script>

</body>
</html>
