const mysql = require('mysql2/promise');
const dotenv = require('dotenv');
dotenv.config();


console.log('HOST:', process.env.HOST);          
console.log('USER:', process.env.USER);          
console.log('PASSWORD:', process.env.PASSWORD);  
console.log('DATABASE:', process.env.DATABASE);  

const connection = mysql.createConnection({
      host: process.env.HOST,
      database: process.env.DATABASE,
      user: process.env.USER,
      password: process.env.PASSWORD
});


const getConnection = async () => await connection;

module.exports = {getConnection};  