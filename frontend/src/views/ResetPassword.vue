<!-- No heart icon found in header, nothing to remove. -->
<template>
  <div class="reset-container">
    <div class="reset-card">
      <h2>Reset Password</h2>
      <p>Enter your new password below.</p>
      <form @submit.prevent="handleReset" class="form">
        <div class="form-group">
          <label for="password">New Password:</label>
          <input
            id="password"
            v-model="password"
            type="password"
            placeholder="Enter new password"
            required
          />
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password:</label>
          <input
            id="confirmPassword"
            v-model="confirmPassword"
            type="password"
            placeholder="Confirm new password"
            required
          />
        </div>
        <button type="submit" class="submit-button" :disabled="loading">
          <span v-if="!loading">Reset Password</span>
          <span v-else>Resetting...</span>
        </button>
        <p v-if="error" class="error">{{ error }}</p>
        <p v-if="success" class="success">{{ success }}</p>
      </form>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import authService from '@/services/authService';

export default {
  name: 'ResetPassword',
  setup() {
    const route = useRoute();
    const router = useRouter();
    const password = ref('');
    const confirmPassword = ref('');
    const error = ref('');
    const success = ref('');
    const loading = ref(false);
    const token = route.params.token || route.query.token;

    const handleReset = async () => {
      error.value = '';
      success.value = '';
      loading.value = true;

      if (!password.value || !confirmPassword.value) {
        error.value = 'Please fill in all fields.';
        loading.value = false;
        return;
      }
      if (password.value !== confirmPassword.value) {
        error.value = 'Passwords do not match.';
        loading.value = false;
        return;
      }
      try {
        await authService.resetPassword(token, password.value);
        success.value = 'Password reset successful! Redirecting to login...';
        setTimeout(() => router.push('/login'), 2000);
      } catch (err) {
        error.value = err.response?.data?.message || 'Failed to reset password. Please try again.';
      } finally {
        loading.value = false;
      }
    };

    return {
      password,
      confirmPassword,
      error,
      success,
      loading,
      handleReset
    };
  }
};
</script>

<style scoped>
.reset-container {
  width: 100vw;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f5f5f5;
}
.reset-card {
  width: 400px;
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
input[type="password"] {
  width: 100%;
  padding: 0.8rem 1rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 0.95rem;
  transition: border 0.2s;
}
input[type="password"]:focus {
  outline: none;
  border-color: #999;
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
</style>
