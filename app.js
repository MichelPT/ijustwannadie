require('dotenv').config()
const express = require('express');
const cors = require('cors')
const app = express();
const writeRead = require('./routes/writeRead');
const updateDelete = require('./routes/updateDelete');
const PORT = 3001;  

app.use(cors());
app.use(express.json());
app.use('/cr', writeRead);
app.use('/ud', updateDelete);
app.use('/', function (req, res, next) {
    res.sendStatus(404);
});

app.listen(PORT, () => {
    console.log('Server running on port: ' + PORT)
})