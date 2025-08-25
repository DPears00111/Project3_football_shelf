<template>
  <transition name="policy-fade">
    <PolicyPageLayout>
      <div class="section">
        <div class="card">
          <div class="container">
            <div class="title">
              <h1>Returns Policy</h1>
            </div>
            <div class="content">
              <h2>Our Returns Promise</h2>
              <p>
                At The Football Shelf, we want you to be completely satisfied with your authentic football shirt
                purchase.
                If you're not happy with your item, we'll do our best to make it right.
              </p>

              <h2>30-Day Return Window</h2>
              <p>
                You may return most unworn, unwashed items with original tags attached within <strong>30 days</strong>
                of
                delivery for a full refund or exchange. Due to the authentic nature of our products:
              </p>
              <ul>
                <li>Customized or personalized items cannot be returned</li>
                <li>Items purchased during special promotions may have different return terms</li>
                <li>All returned items must be in original condition with packaging</li>
              </ul>

              <h2>How to Return an Item</h2>
              <ol>
                <li>Contact our customer service team to initiate your return</li>
                <li>You'll receive a Return Authorization Number and instructions</li>
                <li>Pack the item securely in its original packaging</li>
                <li>Include the original packing slip or invoice</li>
                <li>Ship the package to the provided address</li>
              </ol>

              <h2>Return Shipping</h2>
              <p>
                Customers are responsible for return shipping costs unless the return is due to our error (wrong item
                shipped
                or defective product). We recommend using a trackable shipping service as we cannot be responsible for
                lost
                return packages.
              </p>

              <h2>Refund Process</h2>
              <p>
                Once your return is received and inspected (typically within 3-5 business days), we'll process your
                refund
                to the original payment method. Please allow additional time for your bank or credit card company to
                process the refund.
              </p>
              <p>
                Sale items will be refunded at the purchase price.
              </p>

              <h2>Exchanges</h2>
              <p>
                For size exchanges, please return the original item following the standard return process, then place a
                new
                order for the desired size. This ensures you receive the correct item as quickly as possible.
              </p>

              <h2>Defective or Damaged Items</h2>
              <p>
                If you receive a defective or damaged item, please contact us within <strong>7 days</strong> of
                delivery.
                We'll arrange for a replacement or refund and provide a prepaid return label if needed.
              </p>

              <h2>European Returns (If Applicable)</h2>
              <p>
                Customers in the European Union have the right to withdraw from the contract within 14 days without
                giving
                any reason. The withdrawal period expires after 14 days from the day you receive the goods.
              </p>

              <p class="contact-link">
                Questions about our returns policy? Visit our <router-link to="/contactUs">Contact Us</router-link>
                page.
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
  name: "ReturnsPolicy",
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


/* Consistent styling with AboutUs and ShoppingPolicy */
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

.content p {
  margin-top: 10px;
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  line-height: 1.6;
}

.content ul,
.content ol {
  margin-top: 10px;
  margin-left: 20px;
  font-family: 'Open Sans', sans-serif;
  font-size: 18px;
  line-height: 1.6;
}

.content li {
  margin-bottom: 8px;
}

.content a {
  color: #0066cc;
  text-decoration: none;
}

.content a:hover {
  text-decoration: underline;
}

.contact-link {
  margin-top: 30px;
  font-weight: 500;
}
</style>