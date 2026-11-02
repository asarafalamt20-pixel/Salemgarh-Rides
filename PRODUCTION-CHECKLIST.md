# Salemgarh Rides — production activation checklist

This ZIP is a **starter project with a working prototype UI/API and a production database blueprint**.
It is not yet a production-ready ride-hailing service. Do not accept real customer payments or collect identity documents with this prototype.

## Included
- Customer, rider and admin prototype panels
- Initial Salemgarh route fares
- Rider approval and ride-status demo flow
- Admin fare and booking controls
- PostgreSQL schema blueprint in `db/schema.sql`
- Environment-variable template in `.env.example`

## Required before real public launch
1. Replace the prototype JSON-file storage with managed PostgreSQL and implement migrations/transactions.
2. Implement phone OTP through a registered SMS provider; add rate limits, expiry, replay protection and abuse controls.
3. Implement customer/rider/admin authentication with hashed credentials, short-lived access tokens, refresh-token rotation, role checks and admin 2FA. The current prototype admin password check is not sufficient for public launch.
4. Add a maps provider account and implement geocoding, route distance, ETA, consent-based live location and rider navigation.
5. Complete payment-provider merchant onboarding. Create orders server-side, verify signed webhooks server-side, make payment handling idempotent, and issue receipts. Never ask for a UPI PIN or treat screenshots as payment proof.
6. Implement payout provider/manual bank transfer reconciliation and a double-entry or append-only ledger. Record payouts only after external confirmation.
7. Implement secure, consent-based rider KYC/document handling with restricted access, encryption, retention limits and masking. Do not store full Aadhaar unless legally required; never collect bank passwords or UPI PINs.
8. Add push/SMS notifications, complaint workflow, backups, monitoring, audit review and security testing.
9. Check local transport, commercial vehicle, insurance, tax, privacy and platform requirements with qualified local professionals before operating.

## Render deployment for prototype testing
- Create a **Web Service** from the GitHub repository.
- Root Directory: leave blank when `package.json` is at repository root.
- Build Command: `npm install`
- Start Command: `npm start`
- Add `ADMIN_PASSWORD` in Render Environment as a long, unique secret.
- Deploy and test `/api/health`.

## Important storage warning
The current prototype server uses a local JSON file. Render's normal service filesystem is not a reliable permanent database and data can be lost on redeploy/restart. The PostgreSQL schema is a blueprint only; it is not yet wired into the running API.

## Initial service details
- App: Salemgarh Rides
- Service area: Salemgarh, Kushinagar, Uttar Pradesh
- Support contact: 8957895882
- Operating hours: 6 AM–6 PM IST
- Initial fares: Salemgarh → Tamkuhi Raj ₹50; Salemgarh → Tamkuhi Road ₹80; Salemgarh → Fazilnagar ₹80

## Secrets
Copy `.env.example` to `.env` for local testing and replace placeholders. Never upload `.env` or real API keys to GitHub. Rotate any password previously shared in chat.
