// Include the bluebird promise library
// This might not be necesary anymore!!
const promise = require('bluebird');

// initalization options to pass to the pg-promise library
const initOptions = {
    promiseLib: promise
}
// Our database information
// since Port is the standard port this is optional
// same for the user if it is the default user
const config = {
    host: 'localhost',
    post: 5432,
    database: 'music',
    user: 'digitalcrafts'
};

// Include the module in our code
const pgg = require('pg-promise');
//execute the returned function, pasdsing our initialization 
const pg = pgg(initOptions);
// Now connect to the the database
const db = pg(config);
//use the db object to query our database
db.query(`select * from album`).then( results => {
    console.log(results);
});
