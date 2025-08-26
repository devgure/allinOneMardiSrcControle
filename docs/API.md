# Sparkly API Docs

## Auth Service
- `POST /api/auth/register` - Register user
- `POST /api/auth/login` - Login, get JWT

## Match Service
- `GET /api/match/recommend` - Get AI-recommended users
- `POST /api/match/swipe` - { direction: "right"|"left" }

## Media Service
- `POST /media/upload` - Upload profile photo (JWT required)

## Billing
- `POST /billing/checkout` - Create Stripe session