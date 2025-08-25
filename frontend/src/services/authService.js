import api from './api';

export default {
  login(email, password) {
    return api.post('/auth/login', { email, password });
  },
  signup(userData) {
    return api.post('/auth/signup', userData);
  },
  forgotPassword(email) {
    return api.post('/password/forgot', { email });
  },
  resetPassword(token, password) {
    return api.post(`/password/reset/${token}`, { password });
  }
};