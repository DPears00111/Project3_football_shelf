<template>
  <nav class="nav">
    <router-link to="/" class="nav-link" exact-active-class="nav-link-active"
>Home</router-link>
    <router-link to="/mens" class="nav-link" active-class="nav-link-active">Men</router-link>
    <router-link to="/womens" class="nav-link" active-class="nav-link-active">Women</router-link>
    <router-link to="/kids" class="nav-link" active-class="nav-link-active">Kids</router-link>
  </nav>
  
</template>

<script>
export default {
  name: "AppNavbar"
};
</script>

<style scoped>
.nav {
  display: flex;
  justify-content: center;
  gap: 2rem;
  padding: 0.5rem 0 1rem;
  background-color: #f8f8f8;
  border-top: 1px solid #eaeaea;
  border-bottom: 1px solid #eaeaea;
}

.nav-link {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  transition: all 0.3s ease;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  position: relative;
}

.nav-link:hover {
  background-color: #c7c0c0;
}

.nav-link-active {
  background-color: #333;
  color: white;
  font-weight: 600;
}

/* Optional: Add indicator underline */
.nav-link-active::after {
  content: '';
  position: absolute;
  bottom: -8px;
  left: 50%;
  transform: translateX(-50%);
  width: 20px;
  height: 3px;
  background-color: #797674; /* Your brand accent color */
}


</style>
