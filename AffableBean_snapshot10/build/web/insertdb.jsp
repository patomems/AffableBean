<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:if test="${ empty param.pname}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please Enter Product Name" />
    </c:redirect>

</c:if>
<c:if test="${ empty param.pprice}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please Enter Price" />
    </c:redirect>

</c:if>
<c:if test="${ empty  param.pdescription }">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please Enter Product Description" />
    </c:redirect>

</c:if>
<c:if test="${ empty  param.pcategory}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please Enter Product Category" />
    </c:redirect>

</c:if>
<c:if test="${ empty  param.sname}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please enter your name" />
    </c:redirect>

</c:if>
<c:if test="${ empty  param.sphone}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please enter your phone number" />
    </c:redirect>

</c:if>
<c:if test="${ empty  param.semail}">
    <c:redirect url="insert.jsp" >
        <c:param name="errMsg" value="Please enter your email address" />
    </c:redirect>

</c:if>

<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/affablebean"
                   user="root"  password="nakuru13"/>

<sql:update dataSource="${dbsource}" var="result">
    INSERT INTO `product` (`name`, price, description, sellername, phone, email, category_id) VALUES (?,?,?,?,?,?,?);
    <sql:param value="${param.pname}" />
    <sql:param value="${param.pprice}" />
    <sql:param value="${param.pdescription}" />   
    <sql:param value="${param.sname}" />
    <sql:param value="${param.sphone}" />
    <sql:param value="${param.semail}" />
    <sql:param value="${param.pcategory}"/>
</sql:update>

<c:if test="${result>=1}">
    <font size="5" color='green'> Congratulations ! Data inserted
    successfully.</font>

    <c:redirect url="insert.jsp" >
        <c:param name="susMsg" value="Congratulations ! Data inserted
                 successfully." />
    </c:redirect>
</c:if> 