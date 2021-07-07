<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Glass Website</title>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/css/contact.css" />
</head>

<body>
  <main>
    <section class="glass">
      <div class="dashboard">
        <div class="user">
          <a href="/home"><img id="logo" src="/images/logo (2).png" alt="/"></a>
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
            <h2>Logout</h2>
          </div>
        </a>
        <!-- <div class="link">
              <img src="./images/library.png" alt="" />
              <h2>Library</h2>
            </div> -->
      </div>

      </div>
      <div class="games">
        <div class="status">
          <h1>Save a soul, ${user.firstName}</h1>
          <content>
            <section class="categories">
              <span id="meow">About Save a Soul</span>
            </section>
            <div class="card">
              <h2>We are a non-profit website to help you adopt pets or upload a pet for adoption</h2>
            </div>
            <section>
              <span id="woff">Who are we</span>
            </section>
            <div class="card" style="display:flex;flex-wrap: wrap;flex-direction: row;">
              <figure class="profile">
                <div class="link"><img src="images/moto.png" alt=""></div>
                <figcaption>
                  <h4>Jad Dawani</h4>
                  <p>about Jad</p>
                </figcaption>
              </figure>
              <figure class="profile">
                <div class="link"><img src="images/moto.png" alt=""></div>
                <figcaption>
                  <h4>Fatima Harahsheh</h4>
                  <p>about Fatima</p>
                </figcaption>
              </figure>
              <figure class="profile">
                <div class="link"><img src="images/moto.png" alt=""></div>
                <figcaption>
                  <h4>Hani Ikhmais</h4>
                  <p>about Hani</p>
                </figcaption>
              </figure>
              <figure class="profile">
                <div class="link"><img src="images/moto.png" alt=""></div>
                <figcaption>
                  <h4>Fatima Alheeh</h4>
                  <p>about Fatima</p>
                </figcaption>
              </figure>
              </figure>

            </div>
            <section>
              <span id="other">Contacts</span>
            </section>
            <div class="card">
              <h2>our official Email: <p>petsadopt@gmail.com</p>
              </h2>
            </div>

          </content>
        </div>
      </div>


      </div>
      </div>
    </section>
  </main>
  <div class="circle1"></div>
  <div class="circle2"></div>
</body>

</html>
