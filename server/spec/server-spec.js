var mysql = require('mysql');
var request = require('request');
var expect = require('chai').expect;

describe('Persistent PBS Node Server', () => {
    var dbConnection;

    beforeEach((done) => {
        dbConnection = mysql.createConnection({
            user: 'root',
            password: '',
            database: 'pbs'
    });

    dbConnection.connect();

    var tableName = 'customers';

    dbConnection.query('truncate ' + tableName, done);
});

afterEach(() => {
    dbConnection.end();
});

it('Should post a customer to the DB', (done) => {
    request({
        method: 'POST',
        uri: 'http://127.0.0.1:3000/customers',
        json: { companyName: 'McKessonTest'}
    }, () => {
        var queryString = 'SELECT * FROM customers';
        var queryArgs = [];

        dbConnection.query(queryString, queryArgs, (err, results) => {
            expect(results.length).to.equal(1);
            expect(results[0].customer_name).to.equal('McKessonTest');

            done();
        });
    });
});
});
