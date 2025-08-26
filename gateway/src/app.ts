// gateway/src/app.ts
import express from 'express';
import cors from 'cors';
import rateLimit from 'express-rate-limit';
import authRoute from './routes/auth.route';
import matchRoute from './routes/match.route';

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
});
app.use(limiter);

// Routes
app.use('/api/auth', authRoute);
app.use('/api/match', matchRoute);

app.get('/health', (req, res) => {
  res.json({ status: 'OK', service: 'gateway' });
});

export default app;