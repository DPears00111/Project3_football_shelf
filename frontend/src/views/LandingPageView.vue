<template>
  <div class="home-page">
    <header class="header">
      <div class="profile-link" style="position: relative;">
        <img src="https://img.icons8.com/ios-filled/50/000000/user-male-circle.png" alt="Profile" style="cursor:pointer;" @click="toggleDropdown" />
  <div v-if="showDropdown" class="dropdown-menu" style="position: absolute; left: 115%; transform: translateX(-50%); top: 48px; background: white; border: 1px solid #ccc; border-radius: 6px; min-width: 160px; box-shadow: 0 2px 8px rgba(0,0,0,0.15); z-index: 1000;">
          <template v-if="!isAuthenticated">
            <router-link to="/login" class="dropdown-item" style="display:block; padding:10px 16px; color:#333; text-decoration:none;" @click="showDropdown = false">Sign In</router-link>
            <router-link to="/signup" class="dropdown-item" style="display:block; padding:10px 16px; color:#333; text-decoration:none;" @click="showDropdown = false">Sign Up</router-link>
          </template>
          <template v-else>
            <button @click="signOut" class="dropdown-item" style="display:block; width:100%; padding:10px 16px; background:none; border:none; text-align:left; color:#333; cursor:pointer;">Sign Out</button>
          </template>
        </div>
      </div>
      <div class="logo-section">
        <img src="@/assets/company logo.png" alt="Logo" class="logo" />
      </div>
      <div class="header-icons">
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
        <img src="https://img.icons8.com/ios/50/shopping-cart--v1.png" alt="Cart" @click="toggleCart" />
        <span v-if="cartCount > 0" class="cart-badge">{{ cartCount }}</span>
      </div>
    </header>
    
    <br>
    <div>
      <AppNavbar />
    </div>
    <br>

    <!-- Side Panels -->
    <div class="side-panel cart-panel" :class="{ 'active': showCart }">
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
            <button @click="removeFromCart(item.id)" class="remove-btn">&times;</button>
          </div>
          <div class="cart-total">
            <p>Total: ${{ cartTotal }}</p>
            <button class="checkout-btn" @click="checkout">Checkout</button>
          </div>
        </div>
      </div>
    </div>

  <div class="overlay" :class="{ 'active': showCart }" @click="closeAllPanels"></div>

    <!-- Hero Section -->
    <section class="hero">
      <img class="hero-image" src="@/assets/ecommerce cp (1).png" alt="Football gear collection">
      <div class="hero-overlay"></div>
      <div class="hero-content">
        <h2 class="hero-title">New Season Collection</h2>
        <p class="hero-subtitle">Discover the latest football gear for all players</p>
        <button class="hero-button" @click="scrollToProducts">
          Shop Now 
          <img src="@/assets/3916831.png" alt="" width="30px" style="margin-bottom: -9px; margin-left: 6px;">
        </button>
      </div>
    </section>

    <main class="main-content" ref="productsSection">
      <h1 class="main-title">THE FOOTBALL SHELF</h1>
      <div class="category-content">
        <div v-if="isLoading" class="loading">Loading products...</div>
        <div v-else-if="error" class="error-message">{{ error }}</div>
        <div v-else class="product-carousel-wrapper">

            <Slide v-for="product in products" :key="product.id">
              <div class="product-card">
                <div class="product-image">
                  <img 
                    :src="product.img_url_home || placeholderImage" 
                    :alt="product.jersey_name || 'Product image'"
                    style="width:300px; height:400px; object-fit: cover;" 
                  />
                </div>
                <br>
                <div class="product-info">
                  <h3>{{ product.jersey_name }}</h3>
                </div>
              </div>
            </Slide>

          
        </div>
      </div>

    </main>

    <!-- New Video Section -->
    <section class="video-section">
      <div class="video-container">
        <video 
          ref="backgroundVideo"
          autoplay 
          loop 
          muted 
          playsinline
          class="fullscreen-video"
        >
          <source src="@/assets/football-promo.mp4" type="video/mp4">
          Your browser does not support the video tag.
        </video>
        <div class="video-overlay"></div>
        <div class="video-content">
          <h2>Experience The Game</h2>
          <p>Premium football gear for players who demand excellence</p>
          <button class="cta-button" @click="scrollToProducts">Shop Collection</button>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { ref, computed, onMounted } from 'vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
import AppNavbar from '@/components/AppNavbar.vue';

export default {
  name: 'HomePage',
  components: {
    AppNavbar,
    Carousel,
    Slide
  },
  setup() {
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
    const store = useStore();
    const router = useRouter();

    // UI State
    const activeCategory = ref(null);
    const showCart = ref(false);
    const showWishlist = ref(false);
    const showAccountDropdown = ref(false);
    const productsSection = ref(null);
    const isLoading = ref(false);
    const error = ref(null);
    const placeholderImage = ref('https://via.placeholder.com/400x400?text=Product+Image');

    // Load products on mount
    onMounted(async () => {
      try {
        isLoading.value = true;
        await store.dispatch('loadProducts');
      } catch (err) {
        error.value = err.message || 'Failed to load products';
      } finally {
        isLoading.value = false;
      }
    });


    // Search bar state
    const showSearch = ref(false);
    const searchQuery = ref("");

    // Data from store with fallbacks
    const products = computed(() => {
      let filtered = (store.state.products || []).filter(p => p.team_id);
      if (searchQuery.value.trim()) {
        const q = searchQuery.value.trim().toLowerCase();
        filtered = filtered.filter(p =>
          (p.jersey_name && p.jersey_name.toLowerCase().includes(q)) ||
          (p.team_name && p.team_name.toLowerCase().includes(q))
        );
      }
      return filtered;
    });
    const cartItems = computed(() => store.state.cart || []);
    const wishlistItems = computed(() => store.state.wishlist || []);
    const user = computed(() => store.state.user || null);
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

    // Computed properties
    const cartCount = computed(() => store.getters.cartItemCount || 0);
    const cartTotal = computed(() => store.getters.cartTotal || 0);
    const wishlistCount = computed(() => (store.state.wishlist || []).length);

    // Methods
    const setActiveCategory = (category) => {
      activeCategory.value = category;
      scrollToProducts();
    };

    const toggleCart = () => {
      showCart.value = !showCart.value;
      showWishlist.value = false;
      showAccountDropdown.value = false;
    };

    const toggleWishlist = () => {
      showWishlist.value = !showWishlist.value;
      showCart.value = false;
      showAccountDropdown.value = false;
    };

    const toggleAccountDropdown = () => {
      showAccountDropdown.value = !showAccountDropdown.value;
      showCart.value = false;
      showWishlist.value = false;
    };

    const closeAllPanels = () => {
      showCart.value = false;
      showWishlist.value = false;
      showAccountDropdown.value = false;
    };

    const addToCart = (product) => {
      store.commit('ADD_TO_CART', {
        product,
        quantity: 1
      });
      showCart.value = true;
    };

    const removeFromCart = (productId) => {
      store.commit('REMOVE_FROM_CART', productId);
    };

    const updateQuantity = (item, newQuantity) => {
      if (newQuantity < 1) return;
      store.commit('UPDATE_QUANTITY', { 
        id: item.id, 
        quantity: newQuantity 
      });
    };

    const toggleWishlistItem = (product) => {
      store.commit('TOGGLE_WISHLIST', product);
    };

    const removeFromWishlist = (index) => {
      store.commit('REMOVE_FROM_WISHLIST', index);
    };

    const checkout = () => {
      router.push('/checkout');
    };

    const scrollToProducts = () => {
      if (productsSection.value) {
        productsSection.value.scrollIntoView({ behavior: 'smooth' });
      }
    };

    const backgroundVideo = ref(null);
    // Ensure video plays correctly
    onMounted(() => {
      // Try to play video programmatically to overcome browser restrictions
      if (backgroundVideo.value) {
        backgroundVideo.value.play().catch(error => {
          console.log('Video autoplay prevented:', error);
        });
      }
    });

    return {
      // State
      activeCategory,
      showCart,
      showWishlist,
      showAccountDropdown,
      productsSection,
      isLoading,
      error,
      placeholderImage,

      // Data
      products,
      cartItems,
      wishlistItems,
      user,

      // Computed
      cartCount,
      cartTotal,
      wishlistCount,

      // Methods
      setActiveCategory,
      toggleCart,
      toggleWishlist,
      toggleAccountDropdown,
      closeAllPanels,
      addToCart,
      removeFromCart,
      updateQuantity,
      toggleWishlistItem,
      removeFromWishlist,
      checkout,
      scrollToProducts,
      showDropdown,
      toggleDropdown,
      isAuthenticated,
      signOut,
      backgroundVideo
  ,showSearch,
  toggleSearch,
  closeSearch,
  searchQuery,
  onSearch
    };
  }
};
</script>

<style scoped>
/* Your existing styles remain the same, just add these new ones */

/* Video Section Styles */
.video-section {
  width: 100%;
  position: relative;
  overflow: hidden;
}

.video-container {
  position: relative;
  width: 100%;
  height: 500px;
}

.fullscreen-video {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.video-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
}

.video-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: white;
  z-index: 2;
  width: 80%;
  max-width: 800px;
}

.video-content h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.video-content p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

.cta-button {
  background-color: #fff;
  color: #333;
  border: none;
  padding: 0.8rem 2rem;
  font-size: 1.1rem;
  font-weight: bold;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.cta-button:hover {
  background-color: #F0F0F0;
  transform: translateY(-2px);
}

/* Responsive adjustments for video */
@media (max-width: 768px) {
  .video-container {
    height: 400px;
  }
  
  .video-content h2 {
    font-size: 2rem;
  }
  
  .video-content p {
    font-size: 1rem;
  }
}

@media (max-width: 480px) {
  .video-container {
    height: 300px;
  }
  
  .video-content h2 {
    font-size: 1.5rem;
  }
  
  .video-content p {
    font-size: 0.9rem;
  }
  
  .cta-button {
    padding: 0.6rem 1.5rem;
    font-size: 1rem;
  }
}
.cart-badge {
  position: absolute;
  top: -8px;
  right: -8px;
  background: #E74C3C;
  color: #fff;
  border-radius: 50%;
  width: 22px;
  height: 22px;
  font-size: 13px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  box-shadow: 0 2px 6px rgba(0,0,0,0.15);
  z-index: 2;
}

.header-icons {
  position: relative;
  display: flex;
  gap: 15px;
}

.loading {
  text-align: center;
  padding: 2rem;
  font-size: 1.2rem;
  color: #666;
}

.error-message {
  color: #e74c3c;
  padding: 1rem;
  text-align: center;
  background: #ffeeee;
  margin: 1rem;
  border-radius: 4px;
}

.product-info {
  padding: 0 15px;
  margin-bottom: 10px;
}

.product-info h3 {
  margin: 5px 0;
  font-size: 1rem;
}

.product-info p {
  margin: 5px 0;
  font-weight: bold;
  color: #000000;
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

.home-page {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  /* font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; */
  position: relative;
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

.logo {
  font-size: 1.8rem;
  font-weight: bold;
  text-align: left;
  flex-grow: 1;
  color: #000000;
  justify-content: center;

}

.action-icons {
  display: flex;
  gap: 1.5rem;
  position: absolute;
  /* Changed from relative to absolute */
  right: 2rem;
  /* Position from the right */
  top: 50%;
  /* Center vertically */
  transform: translateY(-50%);
  /* Center vertically */
}

.icon-btn {
  background: none;
  border: none;
  cursor: pointer;
  padding: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #333;
  transition: all 0.3s ease;
  position: relative;
}

.icon-btn:hover {
  color: #666;
  transform: scale(1.1);
}

.badge {
  position: absolute;
  top: 0;
  right: 0;
  background-color: #E74C3C;
  color: white;
  border-radius: 50%;
  width: 18px;
  height: 18px;
  font-size: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.account-dropdown {
  position: relative;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #F9F9F9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
  border-radius: 4px;
  overflow: hidden;
}

.dropdown-content a {
  color: #333;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  transition: background-color 0.3s;
}

.dropdown-content a:hover {
  background-color: #F1F1F1;
}

.account-dropdown:hover .dropdown-content {
  display: block;
}

/* .nav {
  display: flex;
  justify-content: center;
  gap: 2rem;
  padding: 0.5rem 0;
}
.nav-link {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  transition: all 0.3s ease;
}
.nav-link:hover {
  background-color: #F0F0F0;
}
.nav-link.active {
  background-color: #333;
  color: white;
} */
/* Hero Section */
.hero {
  position: relative;
  height: 350px;
  width: 100%;
  overflow: hidden;
  margin-bottom: 2rem;
}

.hero-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.hero-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to right, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.3));
}

.hero-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: white;
  z-index: 2;
  width: 100%;
  max-width: 800px;
  padding: 0 2rem;
}

.hero-title {
  font-size: 3rem;
  margin-bottom: 1rem;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.hero-subtitle {
  font-size: 1.5rem;
  margin-bottom: 2rem;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

.hero-button {
  background-color: #fff;
  color: #333;
  border: none;
  padding: 0.8rem 2rem;
  font-size: 1.1rem;
  font-weight: bold;
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.hero-button:hover {
  background-color: #F0F0F0;
  transform: translateY(-2px);
}

/* Main Content */
.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #fff;
  /* padding: 2rem; */
}

.main-title {
  font-size: 3rem;
  text-align: center;
  margin-bottom: 2rem;
  color: #333;
}

.category-content {
  display: grid;
  text-align: center;
  /* max-width: 1200px; */
  margin: 0 auto;
  width: 100%;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 2rem;
  padding: 1rem;
}

.product-card {
  background: #eee;
  width: 400px;
  height: 600px;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  border-radius: 4px;
  overflow: hidden;
  transition: box-shadow 0.3s, transform 0.3s;
  /* Add transition for smooth effect */
}

.product-cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(450px, 2fr));
  gap: 2rem;
  /* width: 100%; */
  padding: 2rem;
  justify-content: center;
}

.product-card:hover {
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
  transform: translateY(-8px) scale(1.03);
  /* Slight lift and scale on hover */
  background: #f8f8f8;
  /* Optional: subtle color change */
}

.product-image {
  flex: 1;
  background: #fffefe;
}

.product-actions {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 16px;
  justify-content: center;
}

/* .wishlist-btn {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(255,255,255,0.8);
  border: none;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-size: 16px;
  color: #ccc;
  transition: all 0.3s ease;
}
.wishlist-btn:hover, .wishlist-btn.active {
  color: #E74C3C;
} */
.product-info {
  padding: 1rem;
  text-align: left;
}

.product-info h3 {
  margin: 0 0 0.5rem 0;
  font-size: 1.1rem;
  color: #333;
}

.product-price {
  font-weight: bold;
  color: #E74C3C;
  margin-bottom: 1rem;
}

/* .add-to-cart-btn {
  width: 100%;
  padding: 0.5rem;
  background-color: #333;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}
.add-to-cart-btn:hover {
  background-color: #555;
} */
.empty-category {
  padding: 2rem;
  color: #666;
}

/* Side Panels */
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
}

.cart-panel {
  right: -350px;
}

.cart-panel.active {
  transform: translateX(-350px);
}

.wishlist-panel {
  right: -350px;
}

.wishlist-panel.active {
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

.cart-item,
.wishlist-item {
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

/* Overlay */
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

/* Footer */
.footer {
  padding: 1rem 1rem;
  background-color: #333;
  color: white;

}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1.5rem;
}

.sponsor {
  font-size: 1.5rem;
  font-weight: bold;
  color: #fff;
}

.footer-links {
  display: flex;
  gap: 1.5rem;
  flex-wrap: wrap;
  justify-content: center;
}

.footer-links a {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s;
}

.footer-links a:hover {
  color: #ccc;
}

.social-icons {
  display: flex;
  gap: 1rem;
}

.social-icons a {
  color: white;
  font-size: 1.2rem;
  transition: color 0.3s;
}

.social-icons a:hover {
  color: #ccc;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .header {
    padding: 1rem;
  }

  .logo {
    font-size: 1.5rem;
  }

  .hero-title {
    font-size: 2rem;
  }

  .hero-subtitle {
    font-size: 1.2rem;
  }

  .main-title {
    font-size: 2rem;
  }

  .products-grid {
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  }

  .side-panel {
    width: 300px;
  }

  .cart-panel.active {
    transform: translateX(-300px);
  }

  .wishlist-panel.active {
    transform: translateX(-300px);
  }
}

@media (max-width: 480px) {
  .nav {
    gap: 0.5rem;
  }

  .nav-link {
    padding: 0.5rem;
  }

  .hero {
    height: 400px;
  }

  .hero-title {
    font-size: 1.8rem;
  }

  .hero-subtitle {
    font-size: 1rem;
  }

  .hero-button {
    padding: 0.6rem 1.5rem;
    font-size: 1rem;
  }

  .products-grid {
    grid-template-columns: 1fr;
  }

  .side-panel {
    width: 280px;
  }

  .cart-panel.active {
    transform: translateX(-280px);
  }

  .wishlist-panel.active {
    transform: translateX(-280px);
  }
}

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
}

.nav-link:hover {
  background-color: #f0f0f0;
}

.nav-link.active {
  background-color: #333;
  color: white;
}

.product-carousel-wrapper {
  max-width: 1100px;
  margin: 0 auto 2rem auto;
}
.carousel__slide {
  display: flex;
  justify-content: center;
}
</style>
/* Fade transition for search bar */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}