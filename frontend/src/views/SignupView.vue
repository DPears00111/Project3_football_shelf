<template>
  <div>
    <!-- Header Section (same as login page) -->
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
    
    <!-- Signup Content -->
    <div class="signup-container">
      <div class="signup-card">
        <h2>Create Your Account</h2>
        <p>Join The Football Shelf community</p>

        <form @submit.prevent="handleSignup" class="form">
          <div class="form-group">
            <label for="name">Full Name:</label>
            <div class="input-group">
              <input 
                id="name" 
                v-model="form.name" 
                type="text" 
                placeholder="Enter your full name" 
                required 
              />
              <i class="fas fa-user"></i>
            </div>
          </div>

          <div class="form-group">
            <label for="email">Email:</label>
            <div class="input-group">
              <input 
                id="email" 
                v-model="form.email" 
                type="email" 
                placeholder="Enter email" 
                required 
              />
              <i class="fas fa-envelope"></i>
            </div>
          </div>

          <div class="form-group">
            <label for="password">Password:</label>
            <div class="input-group">
              <input 
                id="password" 
                v-model="form.password" 
                type="password" 
                placeholder="Create password (min 8 characters)" 
                required
                minlength="8"
              />
              <i class="fas fa-lock"></i>
            </div>
          </div>

          <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <div class="input-group">
              <input 
                id="confirmPassword" 
                v-model="form.confirmPassword" 
                type="password" 
                placeholder="Confirm your password" 
                required
              />
              <i class="fas fa-lock"></i>
            </div>
          </div>

          <button type="submit" class="signup-button" :disabled="loading">
            <span v-if="!loading">Sign Up</span>
            <span v-else>Creating Account...</span>
          </button>

          <p v-if="error" class="error">{{ error }}</p>

         

          <div class="divider">Already have an account?</div>

          <router-link to="/login" class="login-link">Sign In</router-link>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
import AppNavbar from '../components/AppNavbar.vue';

export default {
  name: "SignupView",
  components: {
    AppNavbar
  },
  setup() {
    const store = useStore();
    const router = useRouter();
    
    const form = ref({
      name: '',
      email: '',
      password: '',
      confirmPassword: ''
    });
    
    const error = ref('');
    const loading = ref(false);

    const handleSignup = async () => {
      // Validate passwords match
      if (form.value.password !== form.value.confirmPassword) {
        error.value = "Passwords don't match";
        return;
      }

      loading.value = true;
      error.value = '';
      
      try {
        await store.dispatch('signup', {
          name: form.value.name,
          email: form.value.email,
          password: form.value.password
        });
        
        // Redirect to home or verification page
        router.push('/');
      } catch (err) {
        error.value = err.response?.data?.message || 'Signup failed. Please try again.';
      } finally {
        loading.value = false;
      }
    };

    return {
      form,
      error,
      loading,
      handleSignup
    };
  }
};
</script>

<style scoped>
/* Reuse header styles from login page */
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

/* Signup Container Styles */
.signup-container {
  width: 100%;
  min-height: calc(100vh - 180px);
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #fffbfb;
  padding: 2rem 0;
}

.signup-card {
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

.signup-button {
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

.signup-button:hover:not(:disabled) {
  background: #222;
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.signup-button:disabled {
  background: #999;
  cursor: not-allowed;
}

.error {
  color: #d32f2f;
  text-align: center;
  margin: 0.5rem 0;
  font-size: 0.9rem;
}

.terms {
  margin: 1rem 0;
  font-size: 0.8rem;
  color: #777;
}

.terms a {
  color: #333;
  text-decoration: none;
}

.terms a:hover {
  text-decoration: underline;
}

.divider {
  display: flex;
  align-items: center;
  color: #777;
  font-size: 0.85rem;
  text-align: center;
}

.divider::before,
.divider::after {
  content: "";
  flex: 1;
  border-bottom: 1px solid #ddd;
  margin: 0 0.5rem;
}

.login-link {
  display: inline-block;
  margin-top: 1rem;
  padding: 0.7rem 1.5rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  color: #f8f7f7;
  text-decoration: none;
  transition: all 0.2s;
  background: #1d1c1c;
}

.login-link:hover {
  transform: translateY(-2px);
}
</style>
