<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<head>
<title>BOYO HOTELS</title>
<link rel="stylesheet" type="text/css" href="./styles.css"  />
</head>
<body>

<div class="header">
  <h1><a href="./index.html" style="color: white; text-decoration: none;">BOYO HOTELS</a></h1>
</div>

<div class="topnav">
  <a href="./Rates.jsp">Rates</a>
  <a href="./Availability.html">Availability</a>
  <a href="./Booking.html">Booking</a>
</div>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/HOTEL"
         user = "root"  password = "MySQL"/>
<sql:update dataSource = "${snapshot}" var = "result">
        INSERT INTO BOOKINGS VALUES(<%= request.getParameter("BRoom")%>,"<%= request.getParameter("Name")%>",'<%= request.getParameter("StartDate")%>','<%= request.getParameter("EndDate")%>')
</sql:update>
<h1>Booking Successful!</h1>
</body>
</html>