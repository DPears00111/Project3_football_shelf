<template>
  <transition name="policy-fade">
    <PolicyPageLayout>
      <div class="section">
        <div class="card">
          <div class="container">
            <div class="title">
              <h1>About Us</h1>
            </div>
            <div class="content">
              <h2>It's More Than a Shirt. It's Our Story.</h2>
              <p>
                At The Football Shelf, we believe a football shirt is more than just fabric—it's a symbol of identity,
                passion, and community. We're fans, just like you, who have felt the rush of pulling on our team's
                colors before a big match. That feeling is the reason we started this journey: to create a place where
                every shirt tells a story of late-night victories, weekend rituals, and the unbreakable bond between a
                fan and their club.
              </p>
              <h2>Curated by Fans, for Fans</h2>
              <p>
                We've dedicated ourselves to curating the finest collection of authentic shirts from Europe's most
                prestigious leagues. We've partnered with the biggest names in football to ensure our selection is not
                only unique but also genuine.
              </p>
              <h2>Our Commitment to You</h2>
              <h3>100% Authentic</h3>
              <p>
                Every shirt in our collection is guaranteed to be genuine, sourced directly from official channels. We
                believe in quality and authenticity above all else.
              </p>
              <h3>Fast Shipping</h3>
              <p>
                We know the excitement of a new shirt. Our fast shipping ensures your gear arrives quickly, so you're
                ready for the next match day without delay.
              </p>
            </div>
          </div>
        </div>
      </div>
    </PolicyPageLayout>
  </transition>
</template>
<script>
import PolicyPageLayout from './PolicyPageLayout.vue';
export default {
  name: "AboutUs",
  components: {
    PolicyPageLayout
  },
  methods: {
    goHome() {
      this.$router.push('/');
    }
  }
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap');

* {
  margin: 0;
  padding: 0;
  font-family: 'Poppins', sans-serif;
}

.section {
  width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 40px 0;
  position: relative;
}

.container {
  width: 80%;
  max-width: 900px;
  position: relative;
}

.card {
  color: #0b0b0b;
  border-radius: 20px;
  padding: 30px 40px;
  box-shadow: 0 0 15px rgba(160, 156, 156, 0.2);
}

.title h1 {
  text-transform: uppercase;
  font-size: 32px;
  margin-bottom: 30px;
  letter-spacing: 2px;
  border-bottom: 1px solid #d2d0d0;
  padding-bottom: 10px;
}

.content h2 {
  margin-top: 25px;
  font-size: 24px;
  font-weight: 600;
}

.content h3 {
  margin-top: 20px;
  color: #181717;
  font-weight: 500;
}

.content p {
  margin-top: 10px;
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  line-height: 1.6;
}
.policy-enter-active {
  transition: all 0.4s ease;
  animation: fadeInUp 0.4s;
}
.policy-leave-active {
  transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}
.policy-fade-enter-active,
.policy-fade-leave-active {
  transition: opacity 0.4s ease;
}

.policy-fade-enter-from,
.policy-fade-leave-to {
  opacity: 0;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>