const express = require('express');
const scrapeRoute = require('./route');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use('/scrape', scrapeRoute);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});