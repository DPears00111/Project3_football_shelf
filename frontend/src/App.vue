<template>
  <div id="app">
    <router-view v-slot="{ Component }">
      <transition name="fade" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-logo">
          <img src="@/assets/LOGO 1.png" alt="Company Logo" class="footer-logo-img">
        </div>
        <div class="footer-links">
          <div class="footer-section">
            <h4>SHOP</h4>
            <router-link to="/men">MEN</router-link>
            <router-link to="/women">WOMEN</router-link>
            <router-link to="/kids">KIDS</router-link>
          </div>
          <div class="footer-section">
            <h4>ABOUT</h4>
            <router-link to="/contactUs">CONTACT US</router-link>
            <router-link to="/TermsAndConditions">TCS & CS</router-link>
            <router-link to="/shippingPolicy">SHIPPING</router-link>
            <router-link to="/returns">RETURNS</router-link>
            <router-link to="/aboutUs">ABOUT US</router-link>
          </div>
          <div class="footer-section">
            <h4>CONNECT</h4>
            <div class="social-icons">
              <a href="#" target="_blank"><img src="https://img.icons8.com/ios/50/000000/facebook--v1.png" alt="Facebook"></a>
              <a href="#" target="_blank"><img src="https://img.icons8.com/ios/50/000000/twitter--v1.png" alt="Twitter"></a>
              <a href="https://www.instagram.com/TheFootballShelf_" target="_blank"><img src="https://img.icons8.com/ios/50/000000/instagram-new--v1.png" alt="Instagram"></a>
              <a href="#" target="_blank"><img src="https://img.icons8.com/ios/50/000000/pinterest--v1.png" alt="Pinterest"></a>
            </div>
            <div class="newsletter">
              <h5>Subscribe to our newsletter</h5>
              <div class="newsletter-input">
                <input type="email" placeholder="Your email address">
                <button>Subscribe</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>
<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: -1;
}

#app {
  overflow-x: hidden;
}
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  /* font-family removed to allow global font-family to apply */
}
body {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
main {
  flex: 1;
  padding: 2rem;
}
/* Footer Styles */
.footer {
  background-color: #d8d8d8;
  color: #333;
  padding: 3rem 1rem;
  border-top: 1px solid #EAEAEA;
  margin-top: auto;
}
.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.footer-logo {
  margin-bottom: 2.5rem;
}
.footer-logo-img {
  width: 160px;
  height: auto;
}
.footer-links {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 3rem;
  width: 100%;
  margin-bottom: 2.5rem;
}
.footer-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
.footer-section h4 {
  font-size: 1.1rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  color: #222;
  width: 100%;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #E0E0E0;
}
.footer-section a {
  color: #555;
  text-decoration: none;
  font-size: 0.95rem;
  transition: color 0.2s ease;
  margin: 0.5rem 0;
  width: 100%;
  padding: 0.4rem 0;
}
.footer-section a:hover {
  color: #000;
}
.social-icons {
  display: flex;
  justify-content: center;
  gap: 1.5rem;
  margin: 1rem 0 2rem 0;
  width: 100%;
}
.social-icons a {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  width: 36px;
  height: 25px;
  border-radius: 50%;
  background-color: #FFFFFF;
  transition: all 0.3s ease;
}
.social-icons a:hover {
  background-color: #FFFFFF;
  transform: translateY(-2px);
}
.social-icons a img {
  width: 20px;
  height: 20px;
  opacity: 0.8;
  transition: opacity 0.2s ease;
}
.social-icons a:hover img {
  opacity: 1;
}
.newsletter {
  width: 100%;
  margin-top: 1rem;
}
.newsletter h5 {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 1rem;
  color: #222;
}
.newsletter-input {
  display: flex;
  max-width: 380px;
  margin: 0 auto;
}
.newsletter-input input {
  flex: 1;
  padding: 0.8rem 1rem;
  border: 1px solid #ddd;
  border-radius: 4px 0 0 4px;
  font-size: 0.95rem;
}
.newsletter-input button {
  background-color: #000;
  color: white;
  border: none;
  padding: 0 1.5rem;
  font-weight: 500;
  border-radius: 0 4px 4px 0;
  cursor: pointer;
  transition: background-color 0.2s ease;
}
.newsletter-input button:hover {
  background-color: #333;
}
.footer-bottom {
  width: 100%;
  padding-top: 2rem;
  border-top: 1px solid #E0E0E0;
  font-size: 0.9rem;
  color: #666;
  text-align: center;
}
/* Responsive adjustments */
@media (max-width: 900px) {
  .footer-links {
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
  }
  .footer-section:last-child {
    grid-column: span 2;
  }
}
@media (max-width: 600px) {
  .footer-links {
    grid-template-columns: 1fr;
    gap: 2.5rem;
  }
  .footer-section:last-child {
    grid-column: span 1;
  }
  .newsletter-input {
    flex-direction: column;
    gap: 0.8rem;
  }
  .newsletter-input input,
  .newsletter-input button {
    width: 100%;
    border-radius: 4px;
  }
}
</style>