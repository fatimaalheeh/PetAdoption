<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Save a Soul, ${user.firstName}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link rel="stylesheet" href="/css/trial.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet" />
  
</head>

<body>
  <main>
    <section class="glass">
      <div class="dashboard">
        <div class="user">
          <a href="/home"><img id="logo" src="/images/logo (2).png" alt="/" /></a>
        </div>
        <a href="" style="text-decoration: none;">
          <div class="link">
            <img src="/images/Icon=profile.png" alt="" />
            <h2 class="menu-text">Me</h2>
          </div>
        </a>
        <a href="/pet/new" style="text-decoration: none;">
          <div class="link">
            <img src="/images/Icon=add.png" alt="" />
            <h2 class="menu-text">Add</h2>
          </div>
        </a>

        <a href="/contact" style="text-decoration: none;">
          <div class="link">
            <img src="/images/Icon=about.png" alt="" />
            <h2 class="menu-text">Contact</h2>
          </div>
        </a>

        <a href="/logout" style="text-decoration: none;">
          <div class="link">
            <h2>Logout</h2>
          </div>
        </a>
      
      </div>

      </div>
      <div class="games">
        <div class="status">
          <h1>Save a soul, ${user.firstName }</h1>
          <br><br>
          <content>
                      <h1>You created</h1>
				`	<c:forEach items="${user.createdpets}" var="pet">
           <div class="card">
            <div>
                <p>${pet.gender}</p>
                <p>${pet.description}</p>
                <p>${pet.location}</p>
                <p ><img style="width:200px; height:200px;" src="${pet.picture}"/></p>
                <p>${pet.locationpic}</p>
                <h2><a id ="delete" href="/delete/${pet.id}">delete</a></h2>
                
                
              
            </div>
           </div>
        </c:forEach>

           <h1>You Adopted</h1>
<c:forEach items="${user.adoptedpets}" var="pet">
           <div class="card">
            <div>
                <p>${pet.gender}</p>
                <p>${pet.description}</p>
                <p>${pet.location}</p>
                <p ><img style="width:200px; height:200px;" src="${pet.picture}"/></p>
                <p>${pet.locationpic}</p>
                <h2><a id ="delete" href="/delete/${pet.id}">delete</a></h2>
                
                
              
            </div>
           </div>
        </c:forEach>
          </content>
        </div>
      </div>


    </section>
  </main>
  <div class="circle1"></div>
  <div class="circle2"></div>
</body>

</html>