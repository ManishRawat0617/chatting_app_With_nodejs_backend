// const pool = require("../config/database");

// const createUserTable = async () => {
//   const queryText = `
//     CREATE TABLE IF NOT EXISTS user_API(
//     user_id VARCHAR(255) NOT NULL PRIMARY KEY,
//     name  VARCHAR(255) NOT NULL ,
//     email  VARCHAR(255) NOT NULL,
//     password  VARCHAR(255) NOT NULL,
//     phone  INT NOT NULL ,
//     profile_image  VARCHAR(255) ,
//     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//     );`;
//   try {
//     await pool.query(queryText);
//     console.log("User_table is created successfully !!!");
//   } catch (error) {
//     console.log("Error in creating table ", error);
//     throw error;
//   }
// };

// module.exports = createUserTable;

const pool = require("../config/database");

const createUserTable = async () => {
  const queryText = `
    CREATE TABLE IF NOT EXISTS user_API (
      user_id VARCHAR NOT NULL PRIMARY KEY, -- Reduced size to 50
      name VARCHAR NOT NULL, -- Reduced size to 50
      email VARCHAR NOT NULL, -- Reduced size to 50
      password VARCHAR NOT NULL, -- Reduced size to 50
      salt VARCHAR NOT NULL, -- Added salt column 
      phone VARCHAR NOT NULL, -- Changed to VARCHAR(15) to handle phone numbers better
      profile_image VARCHAR, -- Reduced size to 50
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  `; 

  try {
    await pool.query(queryText);
    console.log("User_table is created successfully !!!");
  } catch (error) {
    console.error("Error in creating table: ", error);
    throw error;
  }
};

module.exports = createUserTable;
