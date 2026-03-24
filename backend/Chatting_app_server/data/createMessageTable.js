const pool = require("../config/database");

const createMessageTable = async () => {
  const quertText = `
    CREATE TABLE IF NOT EXISTS message_log(
    msg_id VARCHAR(100) NOT NULL PRIMARY KEY,
    sender_id   VARCHAR(100) NOT NULL,
     receiver_id VARCHAR(100) NOT NULL,
     message TEXT NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    `;

  try {
    await pool.query(quertText);
    console.log("msg_log table is created !!");
  } catch (error) {
    console.log("Error creating the meg_log table !!", error);
    throw new Error(error);
  }
};

module.exports = createMessageTable;
