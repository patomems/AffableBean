<div class="container" style="margin-top: 50px;margin-bottom: 50px;">
    <div class="row">

<div class="col-lg-3 col-md-6 col-sm-12">
    <p ><a class="btn btn-primary" href="<c:url value='viewCustomers'/>">view all customers</a></p>

    <p ><a class="btn btn-primary" href="<c:url value='viewOrders'/>">view all orders</a></p>

    <p ><a class="btn btn-primary" href="<c:url value='logout'/>">log out</a></p>
</div>

<div class="col-lg-9 col-md-6 col-sm-12">
    <%-- customerList is requested --%>
<c:if test="${!empty customerList}">

    <table class="table table-bordered table-responsive">

        <thead>
            <tr>
            <th colspan="4">customers</th>
        </tr>

        <tr class="tableHeading">
            <th>customer id</th>
            <th>name</th>
            <th>email</th>
            <th>phone</th>
        </tr>
        </thead>

        <c:forEach var="customer" items="${customerList}" varStatus="iter">

            <tbody>
                <tr onclick="document.location.href='customerRecord?${customer.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.id}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.name}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.email}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.phone}</a></td>
            </tr>
            </tbody>

        </c:forEach>

    </table>

</c:if>

<%-- orderList is requested --%>
<c:if test="${!empty orderList}">

    <table class="table table-bordered table-responsive">

        <thead>
            <tr>
            <th colspan="4">orders</th>
        </tr>

        <tr class="tableHeading">
            <th>order id</th>
            <th>confirmation number</th>
            <th>amount</th>
            <th>date created</th>
        </tr>
        </thead>

        <c:forEach var="order" items="${orderList}" varStatus="iter">

            <tbody>
                <tr onclick="document.location.href='orderRecord?${order.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="orderRecord?${order.id}" class="noDecoration">${order.id}</a></td>
                <td><a href="orderRecord?${order.id}" class="noDecoration">${order.confirmationNumber}</a></td>
                <td><a href="orderRecord?${order.id}" class="noDecoration">
                        <fmt:formatNumber type="currency"
                                          currencySymbol="&euro; "
                                          value="${order.amount}"/></a></td>

                <td><a href="orderRecord?${order.id}" class="noDecoration">
                        <fmt:formatDate value="${order.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></a></td>
            </tr>
            </tbody>

        </c:forEach>

    </table>

</c:if>

<%-- customerRecord is requested --%>
<c:if test="${!empty customerRecord}">

    <table class="table table-striped table-responsive">

        <tr>
            <th colspan="2">customer details</th>
        </tr>
        <tr>
            <td style="width: 290px"><strong>customer id:</strong></td>
            <td>${customerRecord.id}</td>
        </tr>
        <tr>
            <td><strong>name:</strong></td>
            <td>${customerRecord.name}</td>
        </tr>
        <tr>
            <td><strong>email:</strong></td>
            <td>${customerRecord.email}</td>
        </tr>
        <tr>
            <td><strong>phone:</strong></td>
            <td>${customerRecord.phone}</td>
        </tr>
        <tr>
            <td><strong>address:</strong></td>
            <td>${customerRecord.address}</td>
        </tr>
        <tr>
            <td><strong>city region:</strong></td>
            <td>${customerRecord.cityRegion}</td>
        </tr>
        <tr>
            <td><strong>credit card number:</strong></td>
            <td>${customerRecord.ccNumber}</td>
        </tr>

        <tr><td colspan="2" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='orderRecord?${order.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="orderRecord?${order.id}" class="noDecoration">
                <strong>view order summary &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>

<%-- orderRecord is requested --%>
<c:if test="${!empty orderRecord}">

    <table class="table table-bordered table-responsive">

        <tr>
            <th colspan="2">order summary</th>
        </tr>
        <tr>
            <td><strong>order id:</strong></td>
            <td>${orderRecord.id}</td>
        </tr>
        <tr>
            <td><strong>confirmation number:</strong></td>
            <td>${orderRecord.confirmationNumber}</td>
        </tr>
        <tr>
            <td><strong>date processed:</strong></td>
            <td>
                <fmt:formatDate value="${orderRecord.dateCreated}"
                                type="both"
                                dateStyle="short"
                                timeStyle="short"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <table class="table table-striped table-responsive">
                   <tr>
                        <th>product</th>
                        <th>quantity</th>
                        <th>price</th>
                    </tr>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                        <tr>
                            <td>
                                <fmt:message key="${products[iter.index].name}"/>
                            </td>
                            <td>
                                ${orderedProduct.quantity}
                            </td>
                            <td class="confirmationPriceColumn">
                                <fmt:formatNumber type="currency" currencySymbol="&euro; "
                                                  value="${products[iter.index].price * orderedProduct.quantity}"/>
                            </td>
                        </tr>

                    </c:forEach>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <tr>
                        <td colspan="2" id="deliverySurchargeCellLeft"><strong>delivery surcharge:</strong></td>
                        <td id="deliverySurchargeCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${initParam.deliverySurcharge}"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" id="totalCellLeft"><strong>total amount:</strong></td>
                        <td id="totalCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${orderRecord.amount}"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='customerRecord?${customer.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="customerRecord?${customer.id}" class="noDecoration">
                    <strong>view customer details &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>
</div>

</div>
</div>