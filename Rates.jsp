<%@ page import = "java.io.*,java.util.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<head>
<title>BOYO HOTELS RATES</title>
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
 
<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from RATES;
</sql:query>
 
      <table>
         <tr>
            <th>Room Type</th>
            <th>Rate (per day)</th>
         </tr>
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Name}"/></td>
               <td><c:out value = "${row.PerDay}"/></td>
            </tr>
         </c:forEach>
      </table>
</body>
</html>
