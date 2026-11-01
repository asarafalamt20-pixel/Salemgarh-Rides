# Salemgarh Rides — corrected deployable starter

This is a **starter scaffold**, not a complete ride-booking product. It serves the web page and the sample routes API from one Express server so the Render root URL no longer returns `Not found`.

## Files

All project files are at the repository root: `index.html`, `server.js`, `package.json`, and this README.

## Render deployment

Create a **Web Service** connected to this repository and use:

| Setting | Value |
|---|---|
| Root Directory | Leave blank |
| Build Command | `npm install` |
| Start Command | `npm start` |

No environment variables are required for this starter. Render supplies `PORT` automatically.

## Test after deployment

- Main page: `https://YOUR-SERVICE.onrender.com/`
- Health: `https://YOUR-SERVICE.onrender.com/api/health`
- Routes: `https://YOUR-SERVICE.onrender.com/api/routes`

The health response should contain `"ok": true`. The home page should show Salemgarh Rides and the three sample fares.

## Local run

Requires Node.js 20+.

```bash
npm install
npm start
```

Open `http://localhost:4000/`.

## Important limitations

The Customer, Rider, and Admin tabs are presentation-only starter panels. This project does **not** yet implement real customer accounts, SMS OTP, database persistence, GPS/maps, booking creation, rider dispatch, ride OTP, payment processing, UPI verification, rider KYC, payouts, or admin authentication. Do not accept real bookings or payments using this starter. These features require secure backend implementation, provider credentials, testing, and applicable legal/compliance checks. Never collect a UPI PIN or bank password.

Admin account identifier intended by the project owner: `asarafalamt20@gmail.com`. No password is embedded in this project.
