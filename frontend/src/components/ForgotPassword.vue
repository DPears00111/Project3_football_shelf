<template>
  <div>
    <!-- Header Section -->
    <header class="header">
      <div class="header-icons">
        <img src="https://img.icons8.com/ios-filled/50/000000/user-male-circle.png" alt="Profile" />
      </div>
      <div class="logo-section">
        <img src="@/assets/company logo.png" alt="Logo" class="logo" />
      </div>
      <div class="header-icons">
        <img src="https://img.icons8.com/ios/50/search--v1.png" alt="Search" />
  <!-- Heart icon removed -->
        <img src="https://img.icons8.com/ios/50/shopping-cart--v1.png" alt="Cart" />
      </div>
    </header>
    <br>
    <!-- Navbar -->
    <AppNavbar />
    <br>
    <!-- Forgot Password Content -->
    <div class="forgot-container">
      <div class="forgot-card">
        <h2>Forgot Password</h2>
        <p>Enter your email to receive a password reset link</p>

        <form @submit.prevent="handleSubmit" class="form">
          <div class="form-group">
            <label for="email">Email:</label>
            <div class="input-group">
              <input 
                id="email" 
                v-model="email" 
                type="email" 
                placeholder="Enter your email" 
                required 
              />
              <i class="fas fa-envelope"></i>
            </div>
          </div>

          <button type="submit" class="submit-button" :disabled="loading">
            <span v-if="!loading">Send Reset Link</span>
            <span v-else>Sending Email...</span>
          </button>

          <p v-if="error" class="error">{{ error }}</p>
          <p v-if="success" class="success">{{ success }}</p>

          <div class="back-to-login">
            <router-link to="/login" class="login-link">
              <i class="fas fa-arrow-left"></i> Back to Login
            </router-link>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import AppNavbar from './AppNavbar.vue';
import authService from '@/services/authService';

export default {
  name: "ForgotPassword",
  components: {
    AppNavbar
  },
  data() {
    return {
      email: '',
      error: '',
      success: '',
      loading: false
    };
  },
  methods: {
    async handleSubmit() {
      this.loading = true;
      this.error = '';
      this.success = '';

      if (!this.isValidEmail(this.email)) {
        this.error = 'Please enter a valid email address';
        this.loading = false;
        return;
      }

      try {
        await authService.forgotPassword(this.email);
        this.success = 'Password reset link sent to your email!';
        this.email = '';
      } catch (err) {
        this.error = err.response?.data?.message || 'Failed to send reset link. Please try again.';
      } finally {
        this.loading = false;
      }
    },

    isValidEmail(email) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return re.test(email);
    }
  }
};
</script>

<style scoped>
/* ...existing styles from your original file... */
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 24px 0 24px;
  background: #fff;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
}

.logo-section {
  display: flex;
  align-items: center;
  flex-direction: column;
}

.logo {
  width: 400px;
  margin-bottom: 4px;
}

.header-icons {
  margin-bottom: 15px;
}

.header-icons img {
  width: 40px;
  margin-left: 16px;
  cursor: pointer;
}

.forgot-container {
  width: 100%;
  min-height: calc(100vh - 180px);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f5f5f5;
  padding: 2rem 0;
}

.forgot-card {
  width: 450px;
  margin: 2rem auto;
  padding: 2.5rem;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  border-radius: 10px;
  background: #fff;
  text-align: center;
}

h2 {
  margin-bottom: 0.5rem;
  color: #333;
  font-size: 1.8rem;
}

p {
  margin-bottom: 1.5rem;
  color: #666;
}

.form {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
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

.submit-button {
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
}

.submit-button:hover:not(:disabled) {
  background: #222;
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.submit-button:disabled {
  background: #999;
  cursor: not-allowed;
}

.error {
  color: #d32f2f;
  text-align: center;
  margin: 0.5rem 0;
  font-size: 0.9rem;
}

.success {
  color: #42b983;
  text-align: center;
  margin: 0.5rem 0;
  font-size: 0.9rem;
}

.back-to-login {
  margin-top: 1.5rem;
}

.login-link {
  color: #555;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  transition: color 0.2s;
}

.login-link:hover {
  color: #222;
  text-decoration: underline;
}

.login-link i {
  font-size: 0.8rem;
}
</style>
