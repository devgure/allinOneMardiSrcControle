// client/mobile/src/services/api.js
const API_BASE = 'http://localhost:4000/api';

const api = {
  register: (data) => fetch(`${API_BASE}/auth/register`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  }).then(res => res.json()),

  login: (data) => fetch(`${API_BASE}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  }).then(res => res.json()),

  getMatches: (token) => fetch(`${API_BASE}/match/recommend`, {
    headers: { 'Authorization': `Bearer ${token}` },
  }).then(res => res.json()),
};

export default api;