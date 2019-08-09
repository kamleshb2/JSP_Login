<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html;
         charset=UTF-8">
      <link href="style.css" rel="stylesheet" type="text/css"/>
      <title>Home Page</title>
   </head>
   <body>
      <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                         url="jdbc:mysql://localhost:3306/test"
                         user="root" password="root"/>
      <sql:query dataSource="${dbSource}" var="dbResult">
         SELECT * FROM address_book;
      </sql:query>

      <div id="myform">
         <form action="insert.jsp" method="post">
            <h1>New Address</h1>
            <p class="mystyle">Add new address details</p>
            <label>ID <span>Insert numeric id</span> </label>
            <input type="text" name="id"/>
            <label>First Name <span>Enter first name of
               the person</span> </label>
            <input type="text" name="fname"/>
            <label>Last Name <span>Enter Last name of
               the person</span> </label>
            <input type="text" name="lname"/>
            <label>
               Phone <span>Enter phone number</span>
            </label>
            <input type="text" name="phone"/>
            <label>
               Email <span>Enter email address</span>
            </label>
            <input type="text" name="email"/>
            <input type="submit" value="Add New"/>
         </form>
      </div>

      <br/>
      <font color="blue">
         <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
         </c:if>
      </font>
      <br/>
      <form>
         <div class="CSSTableGenerator" >
            <table>
               <tr>
                  <td>ID</td>
                  <td>First Name</td>
                  <td>Last Name</td>
                  <td>Phone</td>
                  <td>Email</td>
                  <td colspan="2"></td>
               </tr>
               <c:forEach var="row" items="${dbResult.rows}">
                  <tr>
                     <td><c:out value="${row.id}"/></td>
                     <td><c:out value="${row.fname}"/></td>
                     <td><c:out value="${row.lname}"/></td>
                     <td><c:out value="${row.phone}"/></td>
                     <td><c:out value="${row.email}"/></td>
                     <td>
                        <a href="updateForm.jsp?id=<c:out
                           value="${row.id}"/>">Update</a>
                     </td>
                     <td><a href="delete.jsp?id=<c:out
                        value="${row.id}"/>">Delete</a></td>
                  </tr>
               </c:forEach>
            </table>
         </div>
      </form>
      <br/>
   </body>
</html>