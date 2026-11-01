# Salemgarh Rides — starter project

This ZIP is a runnable starter scaffold, not a production-ready ride-hailing service. It includes a responsive three-panel UI and a small Express API for health checks and route/fare configuration.

## Requirements
- Node.js 20+

## Run the backend
```bash
cd backend
cp .env.example .env
npm install
npm run dev
```
API: http://localhost:4000/api/health

## Run the frontend
Open `frontend/index.html` in a browser, or serve the folder with any static web server.

## Before real-world launch
Connect and test a database, SMS OTP provider, maps/geocoding provider, push notifications, and an authorized UPI payment gateway. Implement production authentication, authorization, secure document storage, audit logging, and operational monitoring. Do not collect UPI PINs. The sample UI does not process real bookings or payments.

Admin email configured as the intended account identifier: `asarafalamt20@gmail.com`.
No default admin password is included. Set a strong password through a secure admin provisioning flow; change any password already shared in chat.
