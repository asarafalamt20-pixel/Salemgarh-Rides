import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
const routes = [
  { id: 'salemgarh-tamkuhi-raj', from: 'Salemgarh', to: 'Tamkuhi Raj', fareINR: 50, enabled: true },
  { id: 'salemgarh-tamkuhi-road', from: 'Salemgarh', to: 'Tamkuhi Road', fareINR: 80, enabled: true },
  { id: 'salemgarh-fazilnagar', from: 'Salemgarh', to: 'Fazilnagar', fareINR: 80, enabled: true }
];
app.get('/api/health', (_req, res) => res.json({ ok: true, app: 'Salemgarh Rides', mode: 'starter-scaffold' }));
app.get('/api/routes', (_req, res) => res.json(routes.filter(r => r.enabled)));
app.use((_req, res) => res.status(404).json({ error: 'Not found' }));
const port = Number(process.env.PORT || 4000);
app.listen(port, () => console.log(`Salemgarh Rides API listening on ${port}`));
