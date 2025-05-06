require('dotenv').config();
const express = require('express');

const app = express();

app.use('/', (req, res, next) => {
  res.send("hello");
})

app.listen(process.env.PORT, process.env.HOST, () => {
  console.log(`app listen on port: ${process.env.PORT}, host: ${process.env.HOST}`);
});