import api from './api';

export default {
  async getAll() {
    try {
      const response = await api.get('/jerseys');
      return response.data;
    } catch (error) {
      console.error('Error fetching products:', error);
      throw error;
    }
  },
  
  async getByCategory(category) {
    try {
      const response = await api.get(`/jerseys?category=${category}`);
      return response.data;
    } catch (error) {
      console.error(`Error fetching ${category} products:`, error);
      throw error;
    }
  }
};