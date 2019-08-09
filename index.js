
const promise = require('bluebird');

const initOptions = {
    promiseLib: promise
}

const config = {
    host: 'localhost',
    post: 5432,
    database: 'music',
    user: 'digitalcrafts'
};

const pgg = require('pg-promise');
const pg = pgg(initOptions);
const db = pg(config);

db.query(`select * from album`).then( results => {
    console.log(results);
});
