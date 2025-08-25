<template>
    <transition name="policy-fade">
        <PolicyPageLayout>
            <div class="section">
                <div class="card">
                    <div class="container">
                        <div class="title">
                            <h1>Terms & Conditions</h1>
                        </div>
                        <div class="content">
                            <h2>Welcome to The Football Shelf</h2>
                            <p>
                                These terms and conditions outline the rules and regulations for using our website and
                                purchasing our authentic football merchandise.
                            </p>

                            <h2>1. Acceptance of Terms</h2>
                            <p>
                                By accessing this website and making a purchase, you agree to be bound by these Terms
                                and Conditions. If you disagree with any part, you may not use our services.
                            </p>

                            <h2>2. Account Registration</h2>
                            <p>
                                When you create an account, you must provide accurate information. You are responsible
                                for maintaining confidentiality of your account and password.
                            </p>

                            <h2>3. Product Information</h2>
                            <p>
                                We strive for accuracy in product descriptions, colors, and pricing but cannot guarantee
                                complete accuracy. All products are 100% authentic as described in our <router-link
                                    to="/aboutUs">About Us</router-link> section.
                            </p>

                            <h2>4. Order Acceptance</h2>
                            <p>
                                Your order constitutes an offer to purchase. We reserve the right to refuse or cancel
                                any order for any reason, including limitations on quantities available.
                            </p>

                            <h2>5. Pricing and Payment</h2>
                            <p>
                                All prices are in GBP and include VAT where applicable. We accept major credit cards and
                                PayPal. Payment is due immediately upon order placement.
                            </p>

                            <h2>6. Shipping Policy</h2>
                            <p>
                                Shipping times are estimates only. Please see our <router-link
                                    to="/shippingPolicy">Shipping Policy</router-link> for complete details. Risk of
                                loss passes to you upon delivery.
                            </p>

                            <h2>7. Returns & Refunds</h2>
                            <p>
                                Our <router-link to="/returns">Returns Policy</router-link> applies to all purchases. We
                                reserve the right to refuse returns that don't meet our conditions.
                            </p>

                            <h2>8. Intellectual Property</h2>
                            <p>
                                All content on this site (logos, designs, text) is our property or properly licensed. No
                                commercial use without express written permission.
                            </p>

                            <h2>9. User Conduct</h2>
                            <p>
                                You agree not to:
                            </p>
                            <ul>
                                <li>Use the site for unlawful purposes</li>
                                <li>Attempt to gain unauthorized access to our systems</li>
                                <li>Interfere with other users' enjoyment of the site</li>
                                <li>Submit false information</li>
                            </ul>

                            <h2>10. Limitation of Liability</h2>
                            <p>
                                The Football Shelf shall not be liable for any indirect, incidental, or consequential
                                damages arising from use of our site or products.
                            </p>

                            <h2>11. Governing Law</h2>
                            <p>
                                These terms shall be governed by and construed in accordance with the laws of England
                                and Wales.
                            </p>

                            <h2>12. Changes to Terms</h2>
                            <p>
                                We may revise these terms at any time. By continuing to use the site after changes, you
                                agree to be bound by the revised terms.
                            </p>

                            <p class="contact-link">
                                For questions about these terms, please <router-link to="/contactUs">Contact
                                    us</router-link>.
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
    name: "TermsConditions",
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


/* Consistent styling with other policy pages */
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

.contact-link {
    margin-top: 30px;
    font-weight: 500;
}
</style>