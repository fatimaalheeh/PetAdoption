<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Save a Soul</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/index.css" />
</head>

<body>
	<main>
		<section class="glass">
			<div class="dashboard">
				<div class="user">
					<a href="/home"><img id="logo" src="/images/logo (2).png" alt="/" /></a>
				</div> 
				<a href="/profile/${user.id }" style="text-decoration: none;">
					<div class="link">
						<img src="/images/Icon=profile.png" alt="" />
						<h2 class="menu-text">Me</h2>
					</div>
				</a> <a href="/pet/new" style="text-decoration: none;">
					<div class="link">
						<img src="/images/Icon=add.png" alt="" />
						<h2 class="menu-text">Add</h2>
					</div>
				</a> <a href="/contact" style="text-decoration: none;">
					<div class="link">
						<img src="/images/Icon=about.png" alt="" />
						<h2 class="menu-text">Contact</h2>
					</div>
				</a> <a href="/logout" style="text-decoration: none;">
					<div class="link">
						<h2>Logout</h2>
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
					<h1>Save a soul, ${user.firstName}</h1>
					<br>
					<br>
					<content>
					<h2>Most recent</h2>
					<br>
					<br>
					<section class="categories">


						<form action="/category/1">
							<button id="meow" name="category" value="">
								<span id="cat">Cat</span>
							</button>
						</form>


						<form action="/category/2">
							<button id="woff">
								<span id="dog">Dog</span>
							</button>
						</form>


						<form action="/category/3">
							<button id="other">
								<span id="other">Other</span>
							</button>
						</form>

					</section>

<c:forEach items="${ listofpets}" var="pet">
					<div class="card">
						<figure class="profile">

							<figcaption>
								<h4><c:out value="${pet.name }"></c:out></h4>
							
								<p>
									<c:out value="${pet.gender }"></c:out>
								</p>
								<p>
									<c:out value="${pet.description }"></c:out>
								</p>
								<p>
									<c:out value="${pet.location }"></c:out>
								</p>
								<p>
									<img src="${pet.picture }" alt="image" width="200px"
										height="200px" />
								</p>
								<p>
									<c:out value="${pet.locationpic }"></c:out>
								</p>
								<p>
									<c:out value="${pet.adoptiondate }"></c:out>
								</p>
								<p>
									<c:out value="${pet.adopter }"></c:out>
								</p>

								
								<p>By creator</p>
								<h2><a id ="delete"  href="/delete/${pet.id}">delete</a></h2>
								
								<form action="/pet/${pet.id}" method="post">
									<h1>
										<input
											style="font-size: 10pt; width: auto; background-color: #FF6648; font-weight: 600;"
											type="submit" value="Adopt me">
									</h1>
								</form>
							</figcaption>
						</figure>
						<div>
					
							<img class="petimg" src="images/moto.png" alt="">
						</div>
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
