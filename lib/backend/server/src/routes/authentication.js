const express = require('express');
const router = express.Router();

router.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Überprüfe Benutzeranmeldeinformationen und sende Antwort zurück
});

module.exports = router;