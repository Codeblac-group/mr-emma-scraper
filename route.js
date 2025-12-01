const express = require('express');
const router = express.Router();
const scrape = require('./scraper');

router.post('/', scrape.scrape)

module.exports = router;