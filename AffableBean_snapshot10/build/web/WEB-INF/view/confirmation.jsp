<div class="container" style="margin-top:120px">
    <div class="row">
        <p style="background-color: #f5eabe;">
            <strong><fmt:message key="successMessage"/></strong>
            <br><br>
            <fmt:message key="confirmationNumberMessage"/>
            <strong>${orderRecord.confirmationNumber}</strong>
            <br>
            <fmt:message key="contactMessage"/>
            <br><br>
            <fmt:message key="thankYouMessage"/>
        </p>
    </div>

    <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-10">
            <table class="table table-striped table-responsive">
                <thead>
                    <tr class="header">
                        <th colspan="3"><fmt:message key="orderSummary"/></th>
                    </tr>

                    <tr>
                        <th><fmt:message key="product"/></th>
                        <th><fmt:message key="quantity"/></th>
                        <th><fmt:message key="price"/></th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                    <tr>
                        <td>
                            <fmt:message key="${products[iter.index].name}"/>
                        </td>
                        <td class="quantityColumn">
                            ${orderedProduct.quantity}
                        </td>
                        <td class="confirmationPriceColumn">
                            <fmt:formatNumber type="currency" currencySymbol="Ksh "
                                              value="${products[iter.index].price * orderedProduct.quantity}"/>
                        </td>
                    </tr>

                </c:forEach>

                <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                <tr class="lightBlue">
                    <td colspan="2"><strong><fmt:message key="surcharge"/>:</strong></td>
                    <td>
                        <fmt:formatNumber type="currency"
                                          currencySymbol="Ksh "
                                          value="${initParam.deliverySurcharge}"/></td>
                </tr>

                <tr class="lightBlue">
                    <td colspan="2"><strong><fmt:message key="total"/>:</strong></td>
                    <td>
                        <fmt:formatNumber type="currency"
                                          currencySymbol="Ksh "
                                          value="${orderRecord.amount}"/></td>
                </tr>

                <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                <tr class="lightBlue">
                    <td colspan="3"><strong><fmt:message key="dateProcessed"/>:</strong>
                        <fmt:formatDate value="${orderRecord.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></td>
                </tr>
                </tbody>

            </table>
        </div>

        <div class="col-lg-2 col-md-2"></div>

        <div class="col-lg-5 col-md-5 col-sm-10">
            <table class="table table-responsive table-striped">
                <tr class="header">
                    <th colspan="3"><fmt:message key="deliveryAddress"/></th>
                </tr>

                <tr>
                    <td colspan="3">
                        ${customer.name}
                        <br>
                        ${customer.address}
                        <br>
                        <fmt:message key="prague"/> ${customer.cityRegion}
                        <br>
                        <hr>
                        <strong><fmt:message key="email"/>:</strong> ${customer.email}
                        <br>
                        <strong><fmt:message key="phone"/>:</strong> ${customer.phone}
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>