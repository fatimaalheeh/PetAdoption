<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<div class="card">
<form:form action="/category/new" method="post" modelAttribute="cat">
       
            <form:label path="category_name">Name</form:label>
          <!-- <form:errors path="category_name"/> --> 
            <form:input path="category_name"/>
        
        <input type="submit" style="background: #f14444;border-color: #f14444; color: whitesmoke" value="Create" class="btn btn-primary"/>
    </form:form>

</div>
</body>
</html>