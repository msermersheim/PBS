const express = require('express');
const app = express();

app.get('/', (req, res) => res.send('Hello World!!!'));

app.listen(3000, () => 'app is listening on port 3000');