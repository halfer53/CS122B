<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.naming.InitialContext, javax.naming.Context, javax.sql.DataSource"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <%@ include file="../base/head.jsp"%>
        <title>Main</title>
    </head>
<body>
    <%
        
        
          
    %>
    <%@ include file="../base/header.jsp"%>
    

    <div class="container">
    <h3><a href="/fabflix/jsp/Browse.jsp#b_genre">Browse By Genre</a></h3> 
    <h3><a href="/fabflix/jsp/Browse.jsp#b_firstchar">Browse By First Character</a></h3> 
    <h3><a href="/fabflix/jsp/Search.jsp">Search</a></h3> 
    </div>
    <%@ include file="../base/footer.jsp"%>
</body>
</html>