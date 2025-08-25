import api from './api';

export const addToCartDB = async ({ userId, productId, quantity, price }) => {
  return api.post('/cart/add', { userId, productId, quantity, price });
};
