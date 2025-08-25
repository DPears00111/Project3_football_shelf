


<template>
  <div class="checkout-bg">
  <router-link to="/" class="back-to-home-btn">&larr; Back to Home</router-link>
    <div class="checkout-card">
      <h2>Checkout</h2>
      <div v-if="cartItems.length > 0">
        <div class="order-summary">
          <h3>Order Summary</h3>
          <div v-for="item in cartItems" :key="item.id" class="cart-item">
            <img :src="item.img_url_home" :alt="item.name" class="item-image">
            <div class="item-details">
              <h4>{{ item.jersey_name }}</h4>
              <p>R{{ item.price }} x {{ item.quantity }}</p>
            </div>
          </div>
          <div class="total">
            <h4>Total: R{{ cartTotal }}</h4>
          </div>
        </div>
        <form @submit.prevent="handlePayment" class="form">
          <div class="form-group">
            <label>Delivery Address</label>
            <div class="input-group">
              <input v-model="deliveryAddress.street" type="text" placeholder="Street Address" required />
              <i class="fas fa-home"></i>
            </div>
            <div class="form-row">
              <div class="form-group">
                <div class="input-group">
                  <input v-model="deliveryAddress.city" type="text" placeholder="City" required />
                  <i class="fas fa-city"></i>
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <input v-model="deliveryAddress.postalCode" type="text" placeholder="Postal Code" required />
                  <i class="fas fa-mail-bulk"></i>
                </div>
              </div>
            </div>
            <div class="input-group">
              <input v-model="deliveryAddress.country" type="text" placeholder="Country" required />
              <i class="fas fa-flag"></i>
            </div>
          </div>
          <div class="form-group">
            <label>Payment Method</label>
            <div class="payment-methods">
              <button type="button" :class="{selected: payment.method === 'card'}" @click="payment.method = 'card'">
                <i class="fas fa-credit-card"></i> Credit Card
              </button>
              <button type="button" :class="{selected: payment.method === 'paypal'}" @click="payment.method = 'paypal'">
                <img src="https://img.icons8.com/color/48/000000/paypal.png" alt="PayPal" class="pay-icon"/> PayPal
              </button>
              <button type="button" :class="{selected: payment.method === 'googlepay'}" @click="payment.method = 'googlepay'">
                <img src="https://img.icons8.com/color/48/000000/google-pay-india.png" alt="Google Pay" class="pay-icon"/> Google Pay
              </button>
              <button type="button" :class="{selected: payment.method === 'payfast'}" @click="payment.method = 'payfast'">
                <img src="https://www.payfast.co.za/wp-content/themes/payfast/assets/images/logos/pf-logo.png" alt="PayFast" class="pay-icon payfast-logo"/> PayFast
              </button>
            </div>
          </div>
          <div v-if="payment.method === 'card'">
            <div class="form-group">
              <label for="cardNumber">Card Number</label>
              <div class="input-group">
                <input 
                  id="cardNumber" 
                  v-model="payment.cardNumber" 
                  type="text" 
                  placeholder="1234 5678 9012 3456"
                  required
                />
                <i class="fas fa-credit-card"></i>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group">
                <label for="expiry">Expiry Date</label>
                <div class="input-group">
                  <input 
                    id="expiry" 
                    v-model="payment.expiry" 
                    type="text" 
                    placeholder="MM/YY"
                    required
                  />
                  <i class="fas fa-calendar-alt"></i>
                </div>
              </div>
              <div class="form-group">
                <label for="cvv">CVV</label>
                <div class="input-group">
                  <input 
                    id="cvv" 
                    v-model="payment.cvv" 
                    type="text" 
                    placeholder="123"
                    required
                  />
                  <i class="fas fa-lock"></i>
                </div>
              </div>
            </div>
          </div>
          <div v-else class="alt-pay-info">
            <p>
              <span v-if="payment.method === 'paypal'">You will be redirected to PayPal to complete your payment.</span>
              <span v-else-if="payment.method === 'googlepay'">You will be redirected to Google Pay to complete your payment.</span>
              <span v-else-if="payment.method === 'payfast'">You will be redirected to PayFast to complete your payment.</span>
            </p>
          </div>
          <button type="submit" class="checkout-btn">Complete Payment</button>
        </form>
      </div>
      <div v-else class="empty-cart">
        <p>Your cart is empty</p>
        <router-link to="/mens" class="continue-shopping">Continue Shopping</router-link>
      </div>
    </div>
  </div>
</template>


<script>
import { computed, reactive } from 'vue';
import { useStore } from 'vuex';

export default {
  name: 'Checkout',
  setup() {
    const store = useStore();
    // Defensive: fallback to [] if cart is undefined
    const cartItems = computed(() => store.state.cart || []);
    const cartTotal = computed(() => {
      return cartItems.value.reduce((total, item) => {
        return total + (item.price * item.quantity);
      }, 0).toFixed(2);
    });
    const payment = reactive({
      method: 'card',
      cardNumber: '',
      expiry: '',
      cvv: ''
    });
    const deliveryAddress = reactive({
      street: '',
      city: '',
      postalCode: '',
      country: ''
    });
    const handlePayment = () => {
      if (payment.method === 'card') {
        alert('Payment processed successfully!\nDelivery Address: ' + deliveryAddress.street + ', ' + deliveryAddress.city + ', ' + deliveryAddress.postalCode + ', ' + deliveryAddress.country);
        store.commit('CLEAR_CART');
        // Optionally: store.dispatch('placeOrder', cartItems.value);
      } else if (payment.method === 'paypal') {
        window.open('https://www.paypal.com/signin', '_blank');
      } else if (payment.method === 'googlepay') {
        window.open('https://pay.google.com/', '_blank');
      } else if (payment.method === 'payfast') {
        window.open('https://www.payfast.co.za/eng/process', '_blank');
      }
    };
    return {
      cartItems,
      cartTotal,
      payment,
      deliveryAddress,
      handlePayment
    };
  }
};
</script>

<style scoped>
/* Back to Home Button */
.back-to-home-btn {
  position: absolute;
  top: 32px;
  left: 32px;
  z-index: 10;
  display: inline-block;
  padding: 0.7rem 1.5rem;
  background: #333;
  color: #fff;
  border: none;
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
  text-decoration: none;
  transition: background 0.2s;
  font-size: 1rem;
}
.back-to-home-btn:hover {
  background: #222;
}
.checkout-bg {
  position: relative;
}
.payfast-logo {
  width: 80px;
  height: auto;
  object-fit: contain;
  background: #fff;
  border-radius: 4px;
  border: 1px solid #eee;
  padding: 2px 4px;
  margin-right: 4px;
}
/* Payment Methods */
.payment-methods {
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
  justify-content: center;
  flex-wrap: wrap;
}
.payment-methods button {
  background: #f5f5f5;
  border: 2px solid #ddd;
  border-radius: 8px;
  padding: 0.7rem 1.2rem;
  font-size: 1rem;
  color: #333;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  transition: border 0.2s, background 0.2s;
}
.payment-methods button.selected, .payment-methods button:hover {
  border: 2px solid #42b983;
  background: #e6f7f0;
}
.pay-icon {
  width: 28px;
  height: 28px;
  object-fit: contain;
}
.payfast-icon {
  background: #fff;
  border-radius: 4px;
  border: 1px solid #eee;
  padding: 2px 4px;
  height: 28px;
}
.alt-pay-info {
  background: #f8f8f8;
  border-radius: 8px;
  padding: 1rem;
  margin-bottom: 1rem;
  color: #333;
  font-size: 1rem;
  text-align: center;
}
/* Background and Card Layout */
.checkout-bg {
  width: 100%;
  min-height: calc(100vh - 180px);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #fefafa;
  padding: 2rem 0;
}
.checkout-card {
  width: 480px;
  margin: 2rem auto;
  padding: 2.5rem;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  border-radius: 10px;
  background: #fff;
  text-align: center;
}
.checkout-card h2 {
  margin-bottom: 0.5rem;
  color: #333;
  font-size: 1.8rem;
}
.checkout-card h3 {
  margin-bottom: 1rem;
  color: #222;
  font-size: 1.2rem;
}
.order-summary {
  background: #f8f8f8;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 30px;
  text-align: left;
}
.cart-item {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
  padding-bottom: 15px;
  border-bottom: 1px solid #eee;
}
.item-image {
  width: 80px;
  height: 80px;
  object-fit: cover;
  margin-right: 20px;
}
.item-details {
  flex-grow: 1;
}
.total {
  text-align: right;
  margin-top: 20px;
  font-size: 1.2rem;
}
/* Form Styles */
.form {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  margin-top: 1.5rem;
}
.form-group {
  text-align: left;
}
label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: #333;
  font-size: 0.95rem;
}
.input-group {
  position: relative;
}
.input-group input {
  width: 85%;
  padding: 0.8rem 1rem 0.8rem 2.5rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 0.95rem;
  transition: border 0.2s;
}
.input-group input:focus {
  outline: none;
  border-color: #999;
}
.input-group i {
  position: absolute;
  left: 1rem;
  top: 50%;
  transform: translateY(-50%);
  color: #777;
}
.checkout-btn {
  width: 100%;
  padding: 0.9rem;
  background: #333;
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  margin-top: 0.5rem;
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
.checkout-btn:hover:not(:disabled) {
  background: #222;
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
.checkout-btn:disabled {
  background: #999;
  cursor: not-allowed;
}
.empty-cart {
  text-align: center;
  padding: 50px 0;
}
.continue-shopping {
  display: inline-block;
  margin-top: 20px;
  color: #42b983;
  text-decoration: none;
  font-weight: bold;
}
.continue-shopping:hover {
  text-decoration: underline;
}
</style>
/* Spacing for delivery address fields */
.delivery-address .input-group {
  margin-bottom: 16px;
}
.delivery-address .form-row {
  margin-bottom: 12px;
}