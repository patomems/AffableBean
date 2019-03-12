    <div class="container" style="margin-top: 120px">
        <div class="row">
            <c:forEach var="category" items="${categories}">
                <c:choose>
                    <c:when test="${category.name == selectedCategory.name}">
                        <div class="col-md-3 col-sm-6">
                            <span class="btn btn-success btn-large"><fmt:message key="${category.name}"/></span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-3 col-sm-6">
                            <a href="<c:url value='category?${category.id}'/>" >
                            <span class="btn btn-primary btn-large"><fmt:message key="${category.name}"/></span>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <div class="row" style="margin-top: 5px;">
            <table class="table table-striped">
                <c:forEach var="product" items="${categoryProducts}">

                    <tr>
                        <td class="col-md-3 col-sm-6">
                                <img class="thumbnail" src="${initParam.productImagePath}${product.name}.png"
                                     alt="${product.name}" width="244px" height="160px">
                            
                        </td>
                        <td class="col-md-3 col-sm-6" style="padding-top: 40px">
                            ${product.name}
                            <br>
                            ${product.description}
                        </td>
                        <td class="col-md-3 col-sm-6" style="padding-top: 40px">
                            Ksh ${product.price}
                        </td>
                        <td class="col-md-3 col-sm-6" style="padding-top: 40px">
                            <form class="form-inline" action="<c:url value='addToCart'/>" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           class="form-control"
                                           value="${product.id}">
                                    <input type="submit"
                                           name="submit"
                                           class="btn btn-primary btn-sm"
                                           value="<fmt:message key='addToCart'/>">
                            </form>
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>
    </div>

