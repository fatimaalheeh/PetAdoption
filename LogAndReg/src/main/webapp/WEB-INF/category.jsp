<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Save a Soul</title>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/css/category.css" />
</head>

<body>
  <main>
    <section class="glass">
      <div class="dashboard">
        <div class="user">
          <a href="/home"><img id="logo" src="/images/logo (2).png" alt="/" /></a>
        </div>
        <a href="/profile/${creator.id}" style="text-decoration: none;">
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
            <h2 >Logout</h2>
          </div>
        </a>
        <!-- <div class="link">
              <img src="/images/library.png" alt="" />
              <h2>Library</h2>
            </div> -->
      </div>

      </div>
      <div class="games">
        <div class="status">
          <h1>Save a soul</h1>
          <br><br>
          <h2 style="background-color: #1D2437;border-radius: 50px;padding: 10px;color: whitesmoke;">Category name</h2>
          <content>
            
				<c:forEach items="${category.pets}" var="pet">
	<div class="card">
		
                <h2>${pet.name}</h2>
                <p>${pet.gender}</p>
                <p>${pet.description}</p>
                <p>${pet.location}</p>
                <td ><img style="width:200px; height:200px;" src="${pet.picture}"/></td>
                <h2>${pet.locationpic}</h2>
                
                
                  	<form action="/pet/${pet.id}" method="post">
									<h1>
										<input
											style="font-size: 10pt; width: auto; background-color: #FF6648; font-weight: 600;"
											type="submit" value="Adopt me">
									</h1>
								</form>
</div>
                </c:forEach>

					

					</content>
					
        </div>
      </div>



  </main>
  <div class="circle1"></div>
  <div class="circle2"></div>
</body>

</html>
