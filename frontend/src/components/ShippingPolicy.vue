<template>
  <transition name="policy-fade">
    <PolicyPageLayout>
      <div class="section">
        <div class="card">
          <div class="container">
            <div class="title">
              <h1>Shopping Policy</h1>
            </div>
            <div class="content">
              <h2>Our Shopping Commitment</h2>
              <p>
                At The Football Shelf, we're dedicated to providing football fans with an exceptional shopping
                experience.
                Our policy ensures transparency, quality, and satisfaction with every purchase.
              </p>

              <h2>Order Processing</h2>
              <p>
                All orders are processed within 1-2 business days (excluding weekends and holidays). You'll receive an
                email confirmation once your order has been processed and prepared for shipment.
              </p>

              <h2>Payment Methods</h2>
              <p>
                We accept all major credit cards (Visa, MasterCard, American Express), PayPal, and other secure payment
                methods. All transactions are encrypted for your security.
              </p>

              <h2>100% Authentic Guarantee</h2>
              <p>
                Every football shirt in our collection is guaranteed to be 100% authentic, sourced directly from
                official
                club channels and authorized distributors. We never sell counterfeit or replica merchandise.
              </p>

              <h2>Fast Shipping</h2>
              <p>
                We offer multiple shipping options to get your gear to you quickly:
              </p>
              <ul>
                <li>Standard Shipping: 3-5 business days</li>
                <li>Express Shipping: 1-2 business days</li>
                <li>International Shipping: 5-10 business days (varies by destination)</li>
              </ul>
              <p>
                Shipping times are estimates and begin when your order leaves our warehouse, not when you place your
                order.
              </p>

              <h2>Returns & Exchanges</h2>
              <p>
                We accept returns within 30 days of purchase for unworn, unwashed items with original tags attached.
                Due to the authentic nature of our products, we cannot accept returns on customized or special order
                items.
              </p>
              <p>
                To initiate a return, please contact our customer service team. You'll be responsible for return
                shipping
                costs unless the return is due to our error.
              </p>

              <h2>Customer Service</h2>
              <p>
                Our fan-focused customer service team is available to answer any questions about our products, sizing,
                or policies. Contact us through our <router-link to="/contactUs">Contact Us</router-link> page and we'll
                respond within 24 hours.
              </p>

              <h2>Privacy Policy</h2>
              <p>
                We respect your privacy. Your personal information will never be shared or sold to third parties.
                All data is protected using industry-standard security measures.
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
  name: "ShoppingPolicy",
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

<style scoped>
.policy-fade-enter-active,
.policy-fade-leave-active {
  transition: opacity 0.4s ease;
}

.policy-fade-enter-from,
.policy-fade-leave-to {
  opacity: 0;
}

/* Reuse the same styling as AboutUs.vue for consistency */
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

.content ul {
  margin-top: 10px;
  margin-left: 20px;
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  line-height: 1.6;
}

.content a {
  color: #0066cc;
  text-decoration: none;
}

.content a:hover {
  text-decoration: underline;
}
</style>