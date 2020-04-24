require('dotenv').config();

const express = require('express');
const app = express();

app.use(express.json());

app.get('/health', (req, res) => {
  res.status(200).send('health');
});

app.listen(process.env.PORT, () => {
  console.log(`Running on ${process.env.PORT}`);
});
