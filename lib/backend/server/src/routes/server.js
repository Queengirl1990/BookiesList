const express = require('express');
const authenticationRoutes = require('./src/routes/authentication');

const app = express();
const PORT = 3000;

app.use(express.json());
app.use('/api', authenticationRoutes);

app.listen(PORT, () => {
    console.log(`Server läuft auf http://localhost:${PORT}`);
});