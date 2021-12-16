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
<sql:query dataSource = "${snapshot}" var = "result">
        
         SELECT * FROM ROOMS WHERE RNo NOT IN (SELECT RNo FROM BOOKINGS WHERE (StartDate<= '<%=request.getParameter("StartDate")%>' AND EndDate>='<%=request.getParameter("StartDate")%>') OR (StartDate<= '<%=request.getParameter("EndDate")%>' AND EndDate>='<%=request.getParameter("EndDate")%>')) AND RType="<%=request.getParameter("Type")%>";
</sql:query>
<div class="frm">
<form action="./Booking2.jsp" method="post">
    Select room:
    <select name="BRoom">
        <c:forEach var = "row" items = "${result.rows}">
            <option value="${row.Rno}"><c:out value = "${row.Rno}"/></option>
        </c:forEach>
    </select><br>
    <input type="hidden" name="Name" value="<%= request.getParameter("Name")%>">
    <input type="hidden" name="StartDate" value="<%= request.getParameter("StartDate")%>">
    <input type="hidden" name="EndDate" value="<%= request.getParameter("EndDate")%>">
    <input type="submit">
</form>
</div>
</body>
</html>