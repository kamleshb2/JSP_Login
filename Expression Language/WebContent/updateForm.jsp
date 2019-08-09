<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html;
         charset=UTF-8">
      <link href="style.css" rel="stylesheet" type="text/css"/>
      <title>Insert form Page</title>
   </head>
   <body>
      <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                         url="jdbc:mysql://localhost/test"
                         user="root" password="root"/>

      <sql:query dataSource="${dbSource}" var="dbResult">
         SELECT * from address_book where id=?;
         <sql:param value="${param.id}" />
      </sql:query>


      <div id="myform">
         <form action="update.jsp" method="post">
            <h1>Update Address</h1>
            <p class="mystyle">
               Update Address ID <c:out value="${param.id}"/>
            </p>
            <c:forEach var="row" items="${dbResult.rows}">
               <input type="hidden" value="${row.id}" name="id"/>
               <label
                  >First Name <span>Enter first name of the person</span>
               </label>
               <input type="text" value="${row.fname}" name="fname"/>
               <label>
                  Last Name <span>Enter Last name of the person</span>
               </label>
               <input type="text" value="${row.lname}" name="lname"/>
               <label>Phone <span>Enter phone number</span> </label>
               <input type="text" value="${row.phone}" name="phone"/>
               <label>Email <span>Enter email address</span> </label>
               <input type="text" value="${row.email}" name="email"/>
               <input type="submit" value="Update"/>
            </c:forEach>
         </form>
      </div>
   </body>
</html>