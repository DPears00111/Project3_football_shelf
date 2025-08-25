<template>
    <div class="policy-page">
        <header class="header">
            <div class="header-icons">
                <img src="https://img.icons8.com/ios-filled/50/000000/user-male-circle.png" alt="Profile" />
            </div>
            <div class="logo-section">
                <img src="@/assets/company logo.png" alt="Logo" class="logo" />
            </div>
            <div class="header-icons">
                <img src="https://img.icons8.com/ios/50/search--v1.png" alt="Search" />
                <img src="https://img.icons8.com/ios/50/shopping-cart--v1.png" alt="Cart" />
            </div>
        </header>
        <br>
        <AppNavbar />

        <div class="section">
            <slot></slot>
        </div>
    </div>
</template>

<script>
import AppNavbar from './AppNavbar.vue';

export default {
    name: "PolicyPageLayout",
    components: {
        AppNavbar
    }
}
</script>

<style scoped>
.policy-page {
    background-color: #f8f8f8;
    min-height: 100vh;
}

.header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 24px 0 24px;
    background: #fff;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
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
</style>