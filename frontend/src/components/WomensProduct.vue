<template>
  <transition name="page-slide">
    <div class="mens">
      <!-- <AppNavbar /> -->
      <header class="header">
        <div class="logo-section">
          <img src="@/assets/company logo.png" alt="Logo" class="logo" />
        </div>
        <div class="header-icons">
          <div class="profile-dropdown" @mouseleave="showDropdown = false">
            <img src="https://img.icons8.com/ios-filled/50/000000/user-male-circle.png" alt="Profile" class="profile-icon" @click="toggleDropdown" />
            <div v-if="showDropdown" class="dropdown-menu">
              <template v-if="isAuthenticated">
                <button class="dropdown-item" @click="signOut">Sign Out</button>
              </template>
              <template v-else>
                <router-link class="dropdown-item" to="/login" @click="showDropdown = false">Sign In</router-link>
                <router-link class="dropdown-item" to="/signup" @click="showDropdown = false">Sign Up</router-link>
              </template>
            </div>
          </div>
          <transition name="fade">
            <template v-if="showSearch">
              <input
                v-model="searchQuery"
                @input="onSearch"
                @blur="closeSearch"
                class="search-bar"
                type="text"
                placeholder="Search for a team jersey..."
                autofocus
                style="height: 36px; font-size: 1rem; border-radius: 4px; border: 1px solid #ccc; padding: 0 12px; outline: none; width: 220px; margin-left: 16px; transition: width 0.3s;"
              />
            </template>
            <template v-else>
              <img src="https://img.icons8.com/ios/50/search--v1.png" alt="Search" style="cursor:pointer;" @click="toggleSearch" />
            </template>
          </transition>
          <img src="https://img.icons8.com/ios/50/shopping-cart--v1.png" alt="Cart" @click="toggleCart" style="cursor:pointer;" />
          <span v-if="cartCount > 0" class="cart-badge">{{ cartCount }}</span>
        </div>
      <!-- Cart Side Panel (always rendered, slides in/out with .active class) -->
      <div class="side-panel cart-panel" :class="{ active: showCart }">
        <div class="panel-header">
          <h3>Your Cart</h3>
          <button @click="toggleCart" class="close-btn">&times;</button>
        </div>
        <div class="panel-content">
          <div v-if="!cartItems || cartItems.length === 0" class="empty-message">
            Your cart is empty
          </div>
          <div v-else>
            <div v-for="(item, index) in cartItems" :key="index" class="cart-item">
              <img :src="item.img_url_home || placeholderImage" :alt="item.jersey_name" class="item-image">
              <div class="item-details">
                <h4>{{ item.jersey_name }}</h4>
                <p>R{{ item.price }}</p>
                <div class="quantity-controls">
                  <button @click="updateQuantity(item, item.quantity - 1)">-</button>
                  <span>{{ item.quantity }}</span>
                  <button @click="updateQuantity(item, item.quantity + 1)">+</button>
                </div>
              </div>
              <button @click="removeFromCart(item)" class="remove-btn">&times;</button>
            </div>
            <div class="cart-total">
              <p>Total: R{{ cartTotal }}</p>
              <button class="checkout-btn" @click="goToCheckout">Checkout</button>
            </div>
          </div>
        </div>
      </div>
      <div class="overlay" :class="{ active: showCart }" @click="closeCart"></div>
      </header><br>
      <div>
        <AppNavbar />
      </div>
  <h2 class="section-title">Women</h2>
      <div class="filters">
        <select v-model="selectedTeam" class="filter-btn filter-select">
          <option value="">All Teams</option>
          <option v-for="team in teams" :key="team.team_id" :value="team.team_id">{{ team.team_name }}</option>
        </select>
        <select v-model="selectedLeague" class="filter-btn filter-select">
          <option value="">All Leagues</option>
          <option v-for="league in leagues" :key="league.league_id" :value="league.league_id">{{ league.league_name }}</option>
        </select>
      </div>
      <div class="product-cards">
        <div class="product-card" v-for="product in products" :key="product.jersey_id">
          <div class="product-image" @click="openModal(product)" style="cursor:pointer;">
            <img 
              :src="product.img_url_home" 
              :alt="product.jersey_name"
              style="width:300px; height:400px; object-fit: cover;" 
            />
          </div>
          <br>
          <div class="product-info">
            <h3>{{ product.jersey_name }}</h3>
            <p>R{{ product.price }}</p>
          </div>
          <div class="product-actions">
            <button class="add-btn" @click="addToCart(product)">ADD TO CART</button>
            
          </div>
        </div>
      </div>
      <!-- Modal Popup -->
      <div v-if="showModal" class="modal-overlay" @click.self="closeModal">
        <div class="modal-content">
          <img :src="selectedProduct.img_url_home" :alt="selectedProduct.jersey_name" style="width: 100%; max-width: 300px; height: auto; margin-bottom: 1rem;" />
          <h2>{{ selectedProduct.jersey_name }}</h2>
          <p style="font-weight:bold; color:#E74C3C;">R{{ selectedProduct.price }}</p>
          <p>{{ selectedProduct.description }}</p>
          <button class="add-btn" @click="addToCart(selectedProduct)">Add to Cart</button>
          <button class="close-btn" @click="closeModal">Close</button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
const placeholderImage = 'https://via.placeholder.com/400x400?text=Product+Image';

import { ref, computed, onMounted } from 'vue';
import { useStore } from 'vuex';
import AppNavbar from './AppNavbar.vue';
import { getTeams, getLeagues } from '../services/filterService';
import { useRouter } from 'vue-router';
import { addToCartDB } from '../services/cartService';

export default {
  name: "WomensProduct",
  components: {
    AppNavbar
  },
  setup() {
    const store = useStore();
    const teams = ref([]);
    const leagues = ref([]);
    const selectedTeam = ref("");
    const selectedLeague = ref("");

    // Fetch products, teams, and leagues when component mounts
    onMounted(async () => {
      store.dispatch('loadProducts');
      teams.value = await getTeams();
      leagues.value = await getLeagues();
    });

    // Search bar state
    const showSearch = ref(false);
    const searchQuery = ref("");
    // Filter products by selected team/league and search query
    const products = computed(() => {
      let filtered = store.state.products;
      if (selectedTeam.value) {
        filtered = filtered.filter(p => p.team_id == selectedTeam.value);
      }
      if (selectedLeague.value) {
        const leagueTeamIds = teams.value
          .filter(team => team.league_id == selectedLeague.value)
          .map(team => team.team_id);
        filtered = filtered.filter(p => leagueTeamIds.includes(p.team_id));
      }
      if (searchQuery.value.trim()) {
        const q = searchQuery.value.trim().toLowerCase();
        filtered = filtered.filter(p =>
          (p.jersey_name && p.jersey_name.toLowerCase().includes(q)) ||
          (p.team_name && p.team_name.toLowerCase().includes(q))
        );
      }
      return filtered;
    });
    function toggleSearch() {
      showSearch.value = true;
      setTimeout(() => {
        const input = document.querySelector('.search-bar');
        if (input) input.focus();
      }, 50);
    }
    function closeSearch() {
      showSearch.value = false;
      searchQuery.value = "";
    }
    function onSearch() {
      // Filtering is reactive via computed
    }

    // Dropdown state and auth logic
    const showDropdown = ref(false);
    const isAuthenticated = computed(() => store.getters.isAuthenticated);
    function toggleDropdown() {
      showDropdown.value = !showDropdown.value;
    }
    function signOut() {
      store.dispatch('logout');
      showDropdown.value = false;
      router.push('/');
    }
    // Cart panel state
    const showCart = ref(false);
    const cartItems = computed(() => store.state.cart || []);
    const cartCount = computed(() => store.getters.cartItemCount || 0);
    const cartTotal = computed(() => store.getters.cartTotal || 0);

    // Add to cart function
    const addToCart = async (product) => {
      store.commit('ADD_TO_CART', {
        product,
        quantity: 1
      });
      showCart.value = true;
      // Also add to DB if user is logged in
      const user = store.state.user;
      if (user && user.user_id) {
        try {
          await addToCartDB({
            userId: user.user_id,
            productId: product.id || product.jersey_id,
            quantity: 1,
            price: product.price
          });
        } catch (err) {
          // Optionally handle error (e.g., show notification)
          console.error('Failed to add to cart in DB:', err);
        }
      }
    };
    // Cart panel functions
    function toggleCart() {
      showCart.value = !showCart.value;
    }
    function closeCart() {
      showCart.value = false;
    }
    function removeFromCart(item) {
      store.commit('REMOVE_FROM_CART', item.id || item.jersey_id);
    }
    function updateQuantity(item, newQuantity) {
      if (newQuantity < 1) return;
      store.commit('UPDATE_QUANTITY', { productId: item.id || item.jersey_id, quantity: newQuantity });
    }
    const router = useRouter();
    function goToCheckout() {
      router.push('/checkout');
    }
    // Modal logic
    const showModal = ref(false);
    const selectedProduct = ref({});
    function openModal(product) {
      selectedProduct.value = product;
      showModal.value = true;
    }
    function closeModal() {
      showModal.value = false;
      selectedProduct.value = {};
    }
    return {
      teams,
      leagues,
      selectedTeam,
      selectedLeague,
      products,
      showCart,
      cartItems,
      cartCount,
      cartTotal,
      addToCart,
      toggleCart,
      closeCart,
      removeFromCart,
      updateQuantity,
      goToCheckout,
      showModal,
      selectedProduct,
      openModal,
      closeModal,
      placeholderImage,
      showDropdown,
      toggleDropdown,
      isAuthenticated,
      signOut,
      showSearch,
      toggleSearch,
      closeSearch,
      searchQuery,
      onSearch
    };
  }
};
</script>

<style scoped>
.profile-dropdown {
  position: relative;
  display: inline-block;
}
.profile-icon {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  cursor: pointer;
  border: 2px solid #ccc;
  background: #fff;
  transition: border 0.2s;
}
.profile-icon:hover {
  border: 2px solid #333;
}
.dropdown-menu {
  position: absolute;
  top: 44px;
  right: 0;
  background: #fff;
  border: 1px solid #eaeaea;
  border-radius: 6px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  min-width: 120px;
  z-index: 100;
  display: flex;
  flex-direction: column;
}
.dropdown-item {
  padding: 10px 16px;
  color: #333;
  text-align: left;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 1rem;
  transition: background 0.2s;
  text-decoration: none;
}
.dropdown-item:hover {
  background: #f0f0f0;
}
</style>
/* Fade transition for search bar */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
<style scoped>
/* Profile link style */
.profile-link {
  display: flex;
  align-items: center;
  margin-right: 8px;
}
/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0,0,0,0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2000;
}
.modal-content {
  background: #fff;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 16px rgba(0,0,0,0.2);
  max-width: 400px;
  width: 100%;
  text-align: center;
  position: relative;
}
.modal-content img {
  margin-bottom: 1rem;
}
.modal-content .add-btn {
  margin-top: 1rem;
}
.modal-content .close-btn {
  margin-top: 1rem;
  background: #eee;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
}
.slide-enter-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.slide-leave-active {
  transition: all 0.25s cubic-bezier(0.4, 0, 1, 1);
}

.slide-enter-from {
  transform: translateX(20px);
  opacity: 0;
}

.slide-leave-to {
  transform: translateX(-20px);
  opacity: 0;
}
.loading-bar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background-color: #42b983;
  transform-origin: 0%;
  transform: scaleX(0);
  transition: transform 0.4s ease;
  z-index: 9999;
}

.loading-bar.active {
  transform: scaleX(0.3);
  animation: loading 1.5s infinite;
}

@keyframes loading {
  0% {
    transform: scaleX(0.1);
  }

  20% {
    transform: scaleX(0.5);
  }

  100% {
    transform: scaleX(0.7);
  }
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
  position: relative;
  display: flex;
  gap: 15px;
}

.header-icons img {
  width: 40px;
  margin-left: 16px;
  cursor: pointer;
}

.section-title {
  text-align: center;
  font-size: 2rem;
  margin: 13px 0 8px 0;
  /* font-family removed to allow global font-family to apply */
}

.filters {
  display: flex;
  gap: 12px;
  justify-content: flex-start;
  margin: 0 0 24px 24px;
  margin-left: 1150px;
}


.filter-btn {
  border: 1px solid #222;
  background: #fff;
  padding: 8px 16px;
  font-size: 1rem;
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  border-radius: 4px;
  transition: background 0.2s, color 0.2s;
}

.filter-select {
  min-width: 140px;
  max-width: 180px;
  width: 160px;
}

.filter-btn:hover {
  background: #393838;
  color: #fff;
}

/* .img{
  color: black;
} */



.product-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  justify-content: center;
  margin: 0 24px;
}

.product-card {
  background: #eee;
  width: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;
  border-radius: 4px;
  overflow: hidden;
  transition: box-shadow 0.3s, transform 0.3s;
  margin-bottom: 24px;
}

.product-card:hover {
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
  transform: translateY(-8px) scale(1.03);
  background: #f8f8f8;
}

.product-image {
  width: 100%;
  height: 400px;
  background: #d3d3d3;
  display: flex;
  align-items: center;
  justify-content: center;
}

.product-actions {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
  justify-content: center;
}

.add-btn {
  background: #000;
  color: #fff;
  border: none;
  padding: 12px 24px;
  font-size: 1.1rem;
  cursor: pointer;
  border-radius: 4px;
  transition: background 0.2s;
}

.add-btn:hover {
  background: #222;
}

.fav-btn {
  background: #eee;
  border: 1px solid #ccc;
  padding: 8px 12px;
  cursor: pointer;
  border-radius: 4px;
  transition: background 0.2s, border 0.2s;
  display: flex;
  align-items: center;
}

.fav-btn:hover {
  background: #ffd6e0;
  border: 1px solid #ff69b4;
}

.product-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  justify-content: center;
  margin: 0 24px;
}
/* Cart Side Panel Styles (copied from LandingPageView.vue) */
.side-panel {
  position: fixed;
  top: 0;
  width: 350px;
  height: 100%;
  background-color: #fff;
  box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
  z-index: 1000;
  display: flex;
  flex-direction: column;
  right: -350px;
}
.cart-panel.active {
  transform: translateX(-350px);
}
.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  border-bottom: 1px solid #eee;
}
.panel-header h3 {
  margin: 0;
  font-size: 1.2rem;
}
.close-btn {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: #666;
}
.panel-content {
  flex: 1;
  overflow-y: auto;
  padding: 1rem;
}
.empty-message {
  padding: 2rem;
  text-align: center;
  color: #666;
}
.cart-item {
  display: flex;
  margin-bottom: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #eee;
  position: relative;
}
.item-image {
  width: 80px;
  height: 80px;
  object-fit: cover;
  border-radius: 4px;
  margin-right: 1rem;
}
.item-details {
  flex: 1;
}
.item-details h4 {
  margin: 0 0 0.5rem 0;
  font-size: 1rem;
}
.item-details p {
  margin: 0 0 0.5rem 0;
  color: #E74C3C;
  font-weight: bold;
}
.quantity-controls {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.quantity-controls button {
  width: 25px;
  height: 25px;
  border: 1px solid #ddd;
  background-color: #F9F9F9;
  cursor: pointer;
  border-radius: 4px;
}
.remove-btn {
  position: absolute;
  top: 0;
  right: 0;
  background: none;
  border: none;
  font-size: 1.2rem;
  color: #999;
  cursor: pointer;
}
.cart-total {
  padding: 1rem;
  border-top: 1px solid #eee;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.cart-total p {
  font-weight: bold;
  font-size: 1.1rem;
  margin: 0;
}
.checkout-btn {
  padding: 0.5rem 1rem;
  background-color: #E74C3C;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}
.checkout-btn:hover {
  background-color: #C0392B;
}
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 999;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.3s ease;
}
.overlay.active {
  opacity: 1;
  pointer-events: all;
}
.cart-badge {
  position: absolute;
  top: 0px;
  right: 0px;
  background-color: #E74C3C;
  color: white;
  border-radius: 50%;
  width: 20px;
  height: 20px;
  font-size: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  box-shadow: 0 2px 6px rgba(0,0,0,0.15);
  z-index: 2;
}
</style>
