var mysql = require('mysql');

var connection = mysql.createConnection({
    user: 'root',
    password: '',
    database: 'pbs'
});

connection.connect();

module.exports = connection;