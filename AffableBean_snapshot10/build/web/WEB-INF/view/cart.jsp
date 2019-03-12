    <div class="container" style="margin-top: 120px">
        <div class="row">
            <c:choose>
                <c:when test="${cart.numberOfItems > 1}">
                    <p><fmt:message key="yourCartContains"/> ${cart.numberOfItems} <fmt:message key="items"/>.</p>
                </c:when>
                <c:when test="${cart.numberOfItems == 1}">
                    <p><fmt:message key="yourCartContains"/> ${cart.numberOfItems} <fmt:message key="item"/>.</p>
                </c:when>
                <c:otherwise>
                    <p><fmt:message key="yourCartEmpty"/></p>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12">
                <c:if test="${!empty cart && cart.numberOfItems != 0}">

                    <c:url var="url" value="viewCart">
                        <c:param name="clear" value="true"/>
                    </c:url>

                    <a href="${url}" class="btn btn-link"><fmt:message key="clearCart"/></a>
                </c:if>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-12">
                <c:set var="value">
                    <c:choose>
                        <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                        <c:when test="${!empty selectedCategory}">
                            category
                        </c:when>
                        <%-- otherwise send user to welcome page --%>
                        <c:otherwise>
                            index.jsp
                        </c:otherwise>
                    </c:choose>
                </c:set>

                <c:url var="url" value="${value}"/>
                <a href="${url}" class="btn btn-link"><fmt:message key="continueShopping"/></a>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-12">
                <c:if test="${!empty cart && cart.numberOfItems != 0}">
                    <a href="<c:url value='checkout'/>" class="btn btn-link"><fmt:message key="proceedCheckout"/></a>
                </c:if>
            </div>

        </div>
    </div>


    <div class="container">
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

        <div class="row">
            <h4><fmt:message key="subtotal"/>:
                <fmt:formatNumber type="currency" currencySymbol="Ksh " value="${cart.subtotal}"/>
            </h4>

        </div>

            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th><fmt:message key="product"/></th>
                            <th><fmt:message key="name"/></th>
                            <th><fmt:message key="price"/></th>
                            <th><fmt:message key="quantity"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cartItem" items="${cart.items}">
                        <c:set var="product" value="${cartItem.product}"/>
                        <tr>
                            <td>
                                <img src="${initParam.productImagePath}${product.name}.png"
                                     alt="<fmt:message key="${product.name}"/>">
                            </td>

                            <td><fmt:message key="${product.name}"/></td>

                            <td>
                                <fmt:formatNumber type="currency" currencySymbol="Ksh; " value="${cartItem.total}"/>
                                <br>
                                (<fmt:formatNumber type="currency" currencySymbol="Ksh " value="${product.price}"/> / <fmt:message key="unit"/> )
                            </td>

                            <td>
                                <form class="form-inline" action="<c:url value='updateCart'/>" method="post">
                                    <input type="hidden"
                                           name="productId"
                                           class="form-control"
                                           value="${product.id}">
                                    <input type="text"
                                           class="form-control"
                                           maxlength="2"
                                           size="2"
                                           value="${cartItem.quantity}"
                                           name="quantity"
                                           style="margin:5px">
                                    <input type="submit"
                                           class="btn btn-primary"
                                           name="submit"
                                           value="<fmt:message key='update'/>">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </c:if>

    </div>

