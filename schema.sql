-- PostgreSQL production data model blueprint.
-- Apply only after configuring a managed PostgreSQL database.
CREATE TABLE IF NOT EXISTS app_users (
  id BIGSERIAL PRIMARY KEY,
  phone VARCHAR(20) UNIQUE NOT NULL,
  role VARCHAR(20) NOT NULL CHECK (role IN ('customer','rider','admin')),
  display_name VARCHAR(120),
  password_hash TEXT,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS riders (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT UNIQUE REFERENCES app_users(id),
  vehicle_type VARCHAR(40) NOT NULL,
  vehicle_number VARCHAR(30) NOT NULL,
  approval_status VARCHAR(30) NOT NULL DEFAULT 'Submitted',
  is_online BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS service_routes (
  id BIGSERIAL PRIMARY KEY,
  origin VARCHAR(120) NOT NULL,
  destination VARCHAR(120) NOT NULL,
  fare_paise INTEGER NOT NULL CHECK (fare_paise >= 0),
  is_enabled BOOLEAN NOT NULL DEFAULT TRUE,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS bookings (
  id BIGSERIAL PRIMARY KEY,
  booking_code VARCHAR(40) UNIQUE NOT NULL,
  customer_id BIGINT REFERENCES app_users(id),
  rider_id BIGINT REFERENCES riders(id),
  customer_name VARCHAR(120) NOT NULL,
  customer_phone VARCHAR(20) NOT NULL,
  pickup_text TEXT NOT NULL,
  destination_text TEXT NOT NULL,
  vehicle_type VARCHAR(40) NOT NULL,
  fare_paise INTEGER NOT NULL CHECK (fare_paise >= 0),
  status VARCHAR(40) NOT NULL DEFAULT 'Requested',
  payment_status VARCHAR(30) NOT NULL DEFAULT 'Unpaid',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS payment_events (
  id BIGSERIAL PRIMARY KEY,
  booking_id BIGINT NOT NULL REFERENCES bookings(id),
  provider VARCHAR(40) NOT NULL,
  provider_reference VARCHAR(120) UNIQUE,
  amount_paise INTEGER NOT NULL,
  status VARCHAR(30) NOT NULL,
  verified_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS ledger_entries (
  id BIGSERIAL PRIMARY KEY,
  booking_id BIGINT REFERENCES bookings(id),
  account_type VARCHAR(30) NOT NULL CHECK (account_type IN ('collection','rider_earning','platform_commission','payout')),
  user_id BIGINT REFERENCES app_users(id),
  amount_paise BIGINT NOT NULL,
  reference VARCHAR(120) UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS complaints (
  id BIGSERIAL PRIMARY KEY,
  booking_id BIGINT NOT NULL REFERENCES bookings(id),
  category VARCHAR(60) NOT NULL,
  description TEXT NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'Open',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS audit_logs (
  id BIGSERIAL PRIMARY KEY,
  admin_user_id BIGINT REFERENCES app_users(id),
  action VARCHAR(100) NOT NULL,
  entity_type VARCHAR(50) NOT NULL,
  entity_id VARCHAR(80),
  old_value JSONB,
  new_value JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
