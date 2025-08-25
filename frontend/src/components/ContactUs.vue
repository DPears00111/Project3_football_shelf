<template>
  <transition name="policy-fade">
  <PolicyPageLayout>
  <div class="section">
  <div class="contact-card">
    <img src="@/assets/LOGO 1 (1)(1).png" alt="Company Logo" class="logo" />

    <h2>Contact Us</h2>
    <p>We'd love to hear from you! Fill out the form below.</p>

    <form @submit.prevent="submitForm">
      <input type="text" v-model="form.name" placeholder="Your Name" required />
      <input type="email" v-model="form.email" placeholder="Your Email" required />
      <textarea v-model="form.message" placeholder="Your Message" required></textarea>
      <button type="submit">Send</button>
    </form>
  </div>
  </div>
  </PolicyPageLayout>
  </transition>
</template>

<script>
import PolicyPageLayout from './PolicyPageLayout.vue';
//import emailjs from 'emailjs-com';

export default {
  name: "ContactUs",
  components: {
    PolicyPageLayout
  },
  data() {
    return {
      form: {
        name: '',
        email: '',
        message: ''
      }
    };
  },
  methods: {
    goHome() {
      this.$router.push('/');
    },
    submitForm() {
      const serviceID = 'service_j4xn51k';      // Replace with your EmailJS service ID
      const templateID = 'template_57sqtdg';    // Replace with your EmailJS template ID
      const userID = 'Z4LjWEksvPIIRQuQC';            // Replace with your EmailJS user ID (public key)

      const templateParams = {
        user_name: this.form.name,
        user_email: this.form.email,
        message: this.form.message
      };

      emailjs.send(serviceID, templateID, templateParams, userID)
        .then(() => {
          alert("Message sent!");
          this.form.name = '';
          this.form.email = '';
          this.form.message = '';
        }, (error) => {
          console.error("Failed to send email:", error);
          alert("Oops! Something went wrong. Please try again later.");
        });
    }
  }
};
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
.contact-card {
  width: 450px;
  margin: 4rem auto;
  padding: 2rem;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  border-radius: 10px;
  background: #fff;
  text-align: center;
}
/* .contact-card:hover {
  max-width: 500px;
  margin: 4rem auto;
  padding: 2rem;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  border-radius: 10px;
  background: #fff;
  text-align: center;
} */
.logo {
  width: 200px;
  height: 100px;
  margin-bottom: 1rem;
}
h2 {
  margin-bottom: 0.5rem;
}
p {
  margin-bottom: 1.5rem;
  color: #666;
}
form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
input, textarea {
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 1rem;
}
button {
  background-color: #333;
  color: white;
  padding: 0.75rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background-color: #555;
}
.back-button {
  position: absolute;
  top: 20px;
  right: 1400px;
  display: flex;
  align-items: center;
  background: #fff;
  border: none;
  border-radius: 20px;
  padding: 8px 16px;
  box-shadow: 0 2px 8px rgba(164, 156, 156, 0.15);
  cursor: pointer;
  z-index: 10;
}
.back-button:hover {
  background-color: #e8d9d9;
}
</style>
