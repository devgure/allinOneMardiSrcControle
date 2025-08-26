import { Router } from 'express';
import authService from '../services/authService';

const router = Router();

router.post('/register', async (req, res) => {
  try {
    const user = await authService.register(req.body);
    res.status(201).json(user);
  } catch (err: any) {
    res.status(400).json({ error: err.message });
  }
});

router.post('/login', async (req, res) => {
  try {
    const token = await authService.login(req.body);
    res.json({ token });
  } catch (err: any) {
    res.status(401).json({ error: err.message });
  }
});

export default router;