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
    <!-- Login Content -->
    <div class="login-container">
      <div class="login-card">
        <h2>Welcome Back</h2>
        <p>Sign in to access your account</p>
        <form @submit.prevent="handleLogin" class="form">
          <div class="form-group">
            <label for="email">Email</label>
            <div class="input-group">
              <input 
                id="email" 
                v-model="email" 
                type="email" 
                placeholder="Enter email" 
                required 
              />
              <i class="fas fa-envelope"></i>
            </div>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <div class="input-group">
              <input 
                id="password" 
                v-model="password" 
                :type="showPassword ? 'text' : 'password'" 
                placeholder="Enter password" 
                required 
              />
              <i class="fas fa-lock"></i>
              <i 
                v-if="showPassword" 
                class="fas fa-eye toggle-eye" 
                @click="togglePasswordVisibility" 
                title="Hide Password"
              ></i>
              <i 
                v-else 
                class="fas fa-eye-slash toggle-eye" 
                @click="togglePasswordVisibility" 
                title="Show Password"
              ></i>
            </div>
          </div>
          <button type="submit" class="signin-button" :disabled="loading">
            <span v-if="!loading">Sign In</span>
            <span v-else>Signing In...</span>
          </button>
          <p v-if="error" class="error">{{ error }}</p>
          <div class="links">
            <router-link to="/forgot-password" class="link">Forgot Password?</router-link>
            <router-link to="/signup" class="link">Create an account</router-link>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import AppNavbar from './AppNavbar.vue';
export default {
  name: "LoginView",
  components: {
    AppNavbar
  },
  data() {
    return {
      email: '',
      showPassword: false,
      password: '',
      error: '',
      loading: false
    };
  },
  methods: {
    togglePasswordVisibility() {
      this.showPassword = !this.showPassword;
    },
    async handleLogin() {
      this.loading = true;
      this.error = '';
      try {
        await this.$store.dispatch('login', {
          email: this.email,
          password: this.password
        });
        // Redirect to intended route or home
        const redirect = this.$router.currentRoute.value.query.redirect || '/';
        this.$router.push(redirect);
      } catch (err) {
        this.error = err?.response?.data?.message || 'Login failed. Please try again.';
      } finally {
        this.loading = false;
      }
    }
  }
};
</script>

<style scoped>
.input-group .toggle-eye {
  position: absolute;
  right: 1rem;
  top: 50%;
  margin-left: 380px;
  transform: translateY(-50%);
  cursor: pointer;
  color: #777;
}
/* Header Styles */
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
/* Login Container Styles */
.login-container {
  width: 100%;
  min-height: calc(100vh - 180px);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #fefafa;
  padding: 2rem 0;
}
.login-card {
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
  .signin-button {
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
  .signin-button:hover:not(:disabled) {
    background: #222;
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }
  .signin-button:disabled {
    background: #999;
    cursor: not-allowed;
  }
  .error {
    color: #d32f2f;
    text-align: center;
    margin: 0.5rem 0;
    font-size: 0.9rem;
  }
  .links {
    display: flex;
    justify-content: space-between;
    margin: 1rem 0;
  }
  .link {
    color: #555;
    text-decoration: none;
    font-size: 0.85rem;
    transition: color 0.2s;
  }
  .link:hover {
    color: #222;
    text-decoration: underline;
  }
  .divider {
    display: flex;
    align-items: center;
    color: #777;
    font-size: 0.85rem;
    margin: 1.5rem 0;
    text-align: center;
  }
  .divider::before,
  .divider::after {
    content: "";
    flex: 1;
    border-bottom: 1px solid #ddd;
    margin: 0 0.5rem;
  }
  .social-buttons {
    display: flex;
    justify-content: center;
    gap: 1rem;
    margin-top: 1rem;
  }
  .social-btn {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    border: 1px solid #ddd;
    background: white;
    color: #333;
    cursor: pointer;
    transition: all 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .social-btn:hover {
    background: #f5f5f5;
    transform: translateY(-1px);
  }
  .social-btn i {
    font-size: 1.1rem;
  }
  </style>