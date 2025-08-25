// Service to fetch teams and leagues
import api from './api';

export const getTeams = async () => {
  const response = await api.get('/teams');
  return response.data;
};

export const getLeagues = async () => {
  const response = await api.get('/leagues');
  return response.data;
};
