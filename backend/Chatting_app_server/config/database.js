const {Pool} = require('pg');
const pool = new Pool({
    user:"postgres",
    host:"localhost",
    database:"chatting_server",
    password:"1331",
    port:5432
});

pool.connect(function(err){
    if(err){
        
        console.log("this is the error while connecting to the database",err);
        throw errr;
    }
    console.log("The postgreSQL is connected !!!!")
});

module.exports = pool;