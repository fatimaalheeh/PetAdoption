<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Save a soul</title>
</head>
<body>
<form:form action="/pet/{id}" method="post" modelAttribute="pet">
    <input type="hidden" name="_method" value="put">
                   <table>
                    <tr><td><form:label path="name">Name</form:label></td><td><form:input type="text" path="name" name="name"/></td></tr>
                    <tr><td><form:label path="gender">Gender</form:label></td><td><form:input type="text" path="gender" name="gender"/></td></tr>
                    <tr><td><form:label path="description">Description</form:label></td><td><form:textarea name="description" path="description" id="" cols="30" rows="10"></form:textarea></td></tr>
                 
                  <tr ><td><form:label path="picture">Add picture</form:label></td>
                 <td>
                 <form:input type="text" path="picture"/></td>
                 <form:errors path="picture"></form:errors></tr>
                 <tr>
                 <td><form:input type="Date" path="adoptiondate"/></td>
                <td> <form:errors path="adoptiondate"></form:errors></td></tr>
                  <tr>
                 <td><form:input type="text" path="locationpic"/></td>
                <td> <form:errors path="locationpic"></form:errors></td></tr>
                    <tr><td><form:label path="location">Location</form:label></td><td><form:input name="location" path="location" type="text"/></td></tr>
                 
                  </table>
                  <figure id="sideright">
                  <img class="abstract" src="images/logoabstract.png" alt="">
                  <figcaption>
                 
                    <button>Submit</button>
    </form:form>
    </div>
</body>
</html>