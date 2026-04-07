const express = require('express');
const cors = require('cors');
const projectRoutes = require('./routes/project.routes');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'TailorFit backend is running' });
});

app.use('/api/projects', projectRoutes);

module.exports = app;