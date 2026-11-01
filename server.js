import express from 'express';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const app = express();
const PORT = Number(process.env.PORT || 4000);
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.disable('x-powered-by');
app.use(express.json({ limit: '100kb' }));

// Initial configured routes. These are display-only starter fares; no ride is booked.
const routes = [
  { id: 'salemgarh-tamkuhi-raj', from: 'Salemgarh', to: 'Tamkuhi Raj', fareINR: 50, enabled: true },
  { id: 'salemgarh-tamkuhi-road', from: 'Salemgarh', to: 'Tamkuhi Road', fareINR: 80, enabled: true },
  { id: 'salemgarh-fazilnagar', from: 'Salemgarh', to: 'Fazilnagar', fareINR: 80, enabled: true }
];

app.get('/api/health', (_req, res) => {
  res.json({ ok: true, app: 'Salemgarh Rides', mode: 'starter-scaffold' });
});

app.get('/api/routes', (_req, res) => {
  res.json(routes.filter((route) => route.enabled));
});

// Serve the customer/rider/admin starter page from the repository root.
app.use(express.static(__dirname, { index: false, extensions: ['html'] }));
app.get('/', (_req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.use((_req, res) => {
  res.status(404).json({ error: 'Not found' });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Salemgarh Rides listening on port ${PORT}`);
});
