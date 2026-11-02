# Salemgarh Rides

A mobile-first prototype/starter for a local ride-booking service in Salemgarh, Kushinagar, Uttar Pradesh.

## Run locally
1. Install Node.js 20 or newer.
2. In this folder run `npm install`.
3. Copy `.env.example` to `.env` and set a unique `ADMIN_PASSWORD`.
4. Run `npm start`.
5. Open `http://localhost:4000`.

## Deploy prototype on Render
- Web Service
- Root Directory: blank (when this folder is the repository root)
- Build Command: `npm install`
- Start Command: `npm start`
- Add `ADMIN_PASSWORD` in Render Environment.

## Read before launch
See `docs/PRODUCTION-CHECKLIST.md`. Real OTP, GPS/maps, UPI payments, payouts, secure KYC, production authentication and persistent database are **not activated** in this starter. `db/schema.sql` is a PostgreSQL blueprint and is not connected to the current prototype API.

Never commit `.env` or provider secrets.
