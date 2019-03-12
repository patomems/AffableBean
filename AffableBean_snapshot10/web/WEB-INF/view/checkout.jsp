<c:set var='view' value='/checkout' scope='session' />

<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                address: {
                    required: true
                }
            }
        });
    });
</script>


<div class="container" style="margin-top: 120px">
    <div class="row">
        <h2><fmt:message key="checkout"/></h2>

        <p><fmt:message key="checkoutText"/></p>
        <c:if test="${!empty orderFailureFlag}">
            <p class="error"><fmt:message key="orderFailureError"/></p>
        </c:if>
    </div>
    <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-10">

                <table style="color:red">
                    <c:if test="${!empty validationErrorFlag}">
                        <tr>
                            <td colspan="2" style="text-align:left">
                    <span class="error smallText">Please provide valid entries for the following field(s):

                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><strong>name</strong> (e.g., Bilbo Baggins)</span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><strong>email</strong> (e.g., b.baggins@hobbit.com)</span>
                      </c:if>
                      <c:if test="${!empty phoneError}">
                        <br><span class="indent"><strong>phone</strong> (e.g., 222333444)</span>
                      </c:if>
                      <c:if test="${!empty addressError}">
                        <br><span class="indent"><strong>address</strong> (e.g., Korunní 56)</span>
                      </c:if>
                      <c:if test="${!empty cityRegionError}">
                        <br><span class="indent"><strong>city region</strong> (e.g., 2)</span>
                      </c:if>
                     

                    </span>
                            </td>
                        </tr>
                    </c:if>
                </table>

            <form  action="<c:url value='purchase'/>" method="post">
                 <div class="form-group">
                     <label for="name"><fmt:message key="customerName"/>:</label>
                     <input class="form-control" type="text"
                                     size="31"
                                     class="form-control"
                                     maxlength="45"
                                     id="name"
                                     name="name"
                                     value="${param.name}"/>
                 </div>
                <div class="form-group">
                    <label for="email"><fmt:message key="email"/>:</label>
                    <input type="text"
                           class="form-control"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </div>
                <div class="form-group">
                    <label for="phone"><fmt:message key="phone"/>:</label>
                    <input type="text"
                           size="31"
                           class="form-control"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </div>
                <div class="form-group">
                    <label for="address"><fmt:message key="address"/>:</label>
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           class="form-control"
                           name="address"
                           value="${param.address}">
                </div>
                <div class="form-group">
                    <label for="address"><fmt:message key="address"/>:</label>
                    <br>
                    <fmt:message key="juja"/>
                    <select name="cityRegion">                        
                        <option value="1">Gate A</option> 
                        <option value="2">Gate B</option> 
                        <option value="3">Gate C</option> 
                        <option value="4">Gate D</option> 
                    </select>
                </div>

               
                <input type="submit" class="btn btn-primary" value="<fmt:message key='submit'/>">

            </form>
        </div>
                
        <div class="col-lg-2 col-md-2"></div>



        <div class="col-lg-5 col-md-5 col-sm-10" style="background-color:#D3EDE8">
            <ul>
                <li><fmt:message key="nextDayGuarantee"/></li>
                <li><fmt:message key="deliveryFee1"/>
                    <fmt:formatNumber type="currency" currencySymbol="Ksh " value="${initParam.deliverySurcharge}"/>
                    <fmt:message key="deliveryFee2"/></li>
            </ul>
            <div class="table-responsive">
                    <table class="table table-striped"  >
                            <tr>
                                <td><fmt:message key="subtotal"/>:</td>
                                <td class="checkoutPriceColumn">
                                    <fmt:formatNumber type="currency" currencySymbol="Ksh " value="${cart.subtotal}"/></td>
                            </tr>
                            <tr>
                                <td><fmt:message key="surcharge"/>:</td>
                                <td class="checkoutPriceColumn">
                                    <fmt:formatNumber type="currency" currencySymbol="Ksh " value="${initParam.deliverySurcharge}"/></td>
                            </tr>
                            <tr>
                                <td class="total"><fmt:message key="total"/>:</td>
                                <td class="total checkoutPriceColumn">
                                    <fmt:formatNumber type="currency" currencySymbol="Ksh " value="${cart.total}"/></td>
                            </tr>
                     </table>
            </div>
        </div>
    </div>
</div>