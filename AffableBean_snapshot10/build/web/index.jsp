<!-- Page Content -->
<div class="container"  style="margin-top: 70px">

    <!-- Jumbotron Header -->
    <header class="jumbotron hero-spacer">
        <h4><fmt:message key='greeting' /></h4>
        <p><fmt:message key='introText' /></p>
    </header>

    <hr>

    <!-- Title -->
    <div class="row">
        <div class="col-lg-12">
            <h3><fmt:message key='select_category'/></h3>
        </div>
    </div>
    <!-- /.row -->

    <div class="row text-center">
        <c:forEach var="category" items="${categories}">
            <a href="<c:url value='category?${category.id}'/>">

                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">

                        <img src="${initParam.categoryImagePath}${category.name}.jpg"
                             alt="<fmt:message key='${category.name}'/>">

                        <div class="caption">
                            <h3><fmt:message key='${category.name}'/></h3>
                            <!--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>-->
                        </div>
                    </div>
                </div>
            </a>

        </c:forEach>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->