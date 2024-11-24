// Library imports
const express = require('express');
const path = require('path');

// Initialize express app
const app = express();

const PORT = 3000;

app.use(express.static('build'));
app.get("/test", (_req, res) => {
    res.sendFile(path.join(__dirname + "/static/testaajille.html"));
})

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
})
