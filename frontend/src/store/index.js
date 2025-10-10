import { createStore } from 'vuex';
import api from '../services/api';

export default createStore({
  state: {
    products: [],
    cart: [],
    user: null,
    loading: false,
    error: null
  },
  mutations: {
    SET_PRODUCTS(state, products) {
      state.products = products;
    },
  ADD_TO_CART(state, payload) {
    // Make sure we have a proper product object
    if (!payload?.product) return;
    
    const product = payload.product;
    const quantity = payload.quantity || 1;
    
    // Check if product has an id (use jersey_id if available)
    const productId = product.id || product.jersey_id;
    if (!productId) return;

    const existingItem = state.cart.find(item => {
      const itemId = item.id || item.jersey_id;
      return itemId === productId;
    });

    if (existingItem) {
      existingItem.quantity += quantity;
    } else {
      state.cart.push({ 
        ...product,
        id: productId, // Ensure we have an id
        quantity 
      });
    }
  },
    REMOVE_FROM_CART(state, productId) {
      state.cart = state.cart.filter(item => item.id !== productId);
    },
    UPDATE_QUANTITY(state, { productId, quantity }) {
      const item = state.cart.find(item => item.id === productId);
      if (item) {
        item.quantity = quantity;
      }
    },
    SET_USER(state, user) {
      state.user = user;
    },
    CLEAR_CART(state) {
      state.cart = [];
    },
    SET_LOADING(state, isLoading) {
      state.loading = isLoading;
    },
    SET_ERROR(state, error) {
      state.error = error;
    }
  },
  actions: {
    async loadProducts({ commit }) {
      commit('SET_LOADING', true);
      try {
        const response = await api.get('https://project3-football-shelf.onrender.com/jerseys');
        commit('SET_PRODUCTS', response.data);
        commit('SET_ERROR', null);
      } catch (error) {
        commit('SET_ERROR', error.message);
        console.error('Error loading products:', error);
      } finally {
        commit('SET_LOADING', false);
      }
    },
    async login({ commit }, credentials) {
      commit('SET_LOADING', true);
      try {
        const response = await api.post('https://project3-football-shelf.onrender.com/auth/login', credentials);
        commit('SET_USER', response.data.user);
        localStorage.setItem('token', response.data.token);
        commit('SET_ERROR', null);
        return response.data;
      } catch (error) {
        commit('SET_ERROR', error.response?.data?.message || 'Login failed');
        throw error;
      } finally {
        commit('SET_LOADING', false);
      }
    },
    async signup({ commit }, userData) {
      commit('SET_LOADING', true);
      try {
        const response = await api.post('https://project3-football-shelf.onrender.com/auth/signup', userData);
        commit('SET_USER', response.data.user);
        localStorage.setItem('token', response.data.token);
        commit('SET_ERROR', null);
        return response.data;
      } catch (error) {
        commit('SET_ERROR', error.response?.data?.message || 'Signup failed');
        throw error;
      } finally {
        commit('SET_LOADING', false);
      }
    },
    addToCart({ commit }, { product, quantity }) {
      commit('ADD_TO_CART', { product, quantity });
    },
    removeFromCart({ commit }, productId) {
      commit('REMOVE_FROM_CART', productId);
    },
    updateQuantity({ commit }, { productId, quantity }) {
      commit('UPDATE_QUANTITY', { productId, quantity });
    },
    clearCart({ commit }) {
      commit('CLEAR_CART');
    },
    logout({ commit }) {
      localStorage.removeItem('token');
      commit('SET_USER', null);
      commit('CLEAR_CART');
    }
  },
  getters: {
    allProducts: state => state.products,
    mensProducts: state => state.products.filter(product => product.category === 'men'),
    womensProducts: state => state.products.filter(product => product.category === 'women'),
    kidsProducts: state => state.products.filter(product => product.category === 'kids'),
    cartItems: state => state.cart,
    cartTotal: state => state.cart.reduce((total, item) => total + (item.price * item.quantity), 0),
    cartItemCount: state => state.cart.reduce((count, item) => count + item.quantity, 0),
    isAuthenticated: state => !!state.user,
    isLoading: state => state.loading,
    error: state => state.error
  }
});