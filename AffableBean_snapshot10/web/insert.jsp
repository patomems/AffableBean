

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Set language based on user's choice --%>
<c:if test="${!empty language}">
    <fmt:setLocale value="${language}" scope="session" />
</c:if>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link rel="stylesheet" type="text/css" href="css/affablebean.css">
                 Bootstrap Core CSS 
            <link href="css/bootstrap.min.css" rel="stylesheet">
        
             Custom CSS 
            <link href="css/heroic-features.css" rel="stylesheet">
                <link rel="shortcut icon" href="img/favicon.ico">
        
                <script src="js/jquery-1.4.2.js" type="text/javascript"></script>
                <script src="js/jquery-ui-1.8.4.custom.min.js" type="text/javascript"></script>
                
                [if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/heroic-features.css" rel="stylesheet">
        <link rel="shortcut icon" href="img/favicon.ico">

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript">
            $(document).ready(function () {
                $('a.categoryButton').hover(
                        function () {
                            $(this).animate({backgroundColor: '#b2d2d2'})
                        },
                        function () {
                            $(this).animate({backgroundColor: '#d3ede8'})
                        }
                );

                $('div.categoryBox').hover(over, out);

                function over() {
                    var span = this.getElementsByTagName('span');
                    $(span[0]).animate({opacity: 0.3});
                    $(span[1]).animate({color: 'white'});

                }

                function out() {
                    var span = this.getElementsByTagName('span');
                    $(span[0]).animate({opacity: 0.7});
                    $(span[1]).animate({color: '#444'});
                }
            });
        </script>

        <title><fmt:message key='title' /></title>
    </head>
    <body>
        <div id="main">
            <nav class="navbar navbar-inverse  navbar-fixed-top" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>                        
                        <a class="navbar-brand" href="<c:url value='/'/>"><img class="img-thumbnail" src="img/logo.png" style="width: 100px;height: 80px"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                       


                        <ul class="nav navbar-nav navbar-right">
                            
                            <li><a href="<c:url value='admin'/>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                         
                           
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->

            </nav>
<div class="container" style="margin-top: 150px;margin-bottom: 100px;">
    
<!--    <form class="form-horizontal" action="UploadServlet" method="post" enctype="multipart/form-data">
        <h2>Upload Product</h2>
        
        <div>
            <label class="control-label col-sm-4" for="pimage">Product Image:</label>
            <div class="col-sm-6">
                <input class="btn btn-primary" id="fileChooser" name="dataFile" type="submit" value="Upload File">
            </div>
        </div>

        <input type="file" name="file" />

        <input type="submit" value="upload" />

    </form>-->
    
    <form class="form-horizontal" method="post" action="FileUploadServlet" enctype="multipart/form-data">
        <h2>Upload Product</h2>
        Select image to upload:
        <input type="file" name="uploadImage" />
        <br/><br/>
        <input class="btn btn-primary" id="fileChooser" name="dataFile" type="submit" value="Upload File">
    </form>
    <center>
        <h2>${message}</h2>
    </center>
    
    <form class="form-horizontal" action="insertdb.jsp" method="post">
        

        <div class="form-group">
            <label class="control-label col-sm-4" for="pname">Product Name:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="pname"  placeholder="Enter product name">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-4" for="pprice">Product Price:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="pprice"  placeholder="Enter price">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-4" for="pdescription">Product Description:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="pdescription"  placeholder="Enter description">
            </div>
        </div>

        <div class="form-group"> 
            <label class="control-label col-sm-4" for="pcategory">Product Category:</label>
            <div class="col-sm-6">                
                <select class="form-control" id="sel1" name="pcategory">
                  <option value="1">Electronics</option>
                  <option value="2">Clothes</option>
                  <option value="3">Furniture</option>
                  <option value="4">Home&Living</option>
                </select>
            </div>
        </div>
        <center class="">Seller Details:</center>
       <div class="form-group">            
            <label class="control-label col-sm-4" for="sname">Name in Full:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="sname"  placeholder="Patrick Paul">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4" for="sphone">Phone:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="sphone"  placeholder="0708342345">
            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4" for="semail">Email:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="semail"  placeholder="john@sellnow.com">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-10">
                <div class="col-sm-3 left">
                    <input type="submit" class="btn btn-primary" value="upload"/>
                </div>

                <div class="col-sm-3 right">
                    <input type="reset" class="btn btn-primary" value="reset"/>
                </div>

            </div>
        </div>

    </form>
    <font color="red"><c:if test="${not empty param.errMsg}">
        <c:out value="${param.errMsg}" />
        <a href="insert.jsp">Go Back</a>
    </c:if></font>

</div>



<hr style="border: 0.01px solid black">
<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p> <a href="<c:url value='#'/>"><fmt:message key="privacy" /></a>
                    &nbsp;&nbsp;::&nbsp;&nbsp;
                    <a href="<c:url value='#'/>"><fmt:message key="contact" /></a>
                    &nbsp;&nbsp;&copy;&nbsp;&nbsp;
                    2018 Sell Now
                </p>
            </div>
        </div>
    </div>
</footer>

</div>
</body>
</html>