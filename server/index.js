// Library imports
const express = require('express');
const path = require('path');
const middleware = require('./utils/middleware')

// Initialize express app
const app = express();

const PORT = 3000;

app.use(express.static('build'));
app.get("/test", (_req, res) => {
    res.sendFile(path.join(__dirname + "/static/testaajille.html"));
});

app.get("/static/tailwind.css", (_req, res) => {
    res.sendFile(path.join(__dirname + "/static/tailwind.css"));
});

app.use(middleware.unknownEndpointBuilder(__dirname));

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
})
