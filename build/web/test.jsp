<%-- 
    Document   : test
    Created on : Oct 29, 2022, 10:02:21 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${requestScope.account.getProductID()}</h1>
        <h1>${requestScope.account.getUnitPrice()}</h1>
        <h1>${requestScope.account.getAccountName()}</h1>
        <h1>${requestScope.account.getQuantity()}</h1>
        <h1>${requestScope.account.getStatus()}</h1>
    </body>
</html>
