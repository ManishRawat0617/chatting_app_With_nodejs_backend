const pool = require("../config/database");
const { v4: uuidv4 } = require("uuid");
const bcrytp = require("bcrypt");
// get all the user
const getAllUserService = async () => {
  try {
    const result = await pool.query("SELECT * FROM user_api");

    return result.rows; // Return all rows
  } catch (error) {
    console.error("Error fetching roles: ", error);
    throw new Error("Failed to fetch roles.");
  }
};

// create the user
const createUserService = async (
  name,
  email,
  password,
  phone,
  profile_image
) => {
  const user_id = uuidv4();
  const salt = await bcrytp.genSalt(10);
  const hashPassword = await bcrytp.hash(password, salt);

  const queryText = `
    INSERT INTO user_api(user_id,name,email,phone,password,salt,profile_image)
    VALUES($1,$2,$3,$4,$5,$6,$7)
    RETURNING *;
    `;

  const values = [
    user_id,
    name,
    email,
    phone,
    hashPassword,
    salt,
    profile_image,
  ];

  try {
    const result = await pool.query(queryText, values);
    return result.rows[0];
  } catch (error) {
    console.error("Error creating the user: ", error);
    throw new Error("Failed to create the user ", error);
  }
};

const loginUserService = async (email, password) => {
  // const queryText = `
  // Select * from user_api where email = $1;
  // `;
  // const value = [email];
  const queryText = `
  Select * from user_api where email = $1;
  `;
  const value = [email];

  try {
    const result = await pool.query(queryText, value);

    if (result.rows.length === 0) return "email or password is incorrect";
    else {
      const user = result.rows[0];
      const isValidPassword = await bcrytp.compare(password, user.password);

      if (!isValidPassword) return "email or password is incorrect";
      return result.rows[0];
    }
  } catch (error) {
    throw new Error("Failed to create the user ", error);
  }
};

const updateUserService = async (
  user_id,
  email,
  name,
  password,
  profile_image,
  phone
) => {
  const queryText = `
  UPDATE user_api SET email = $1 , name = $2 , phone = $3 , password = $4 , profile_image =$5 
  WHERE user_id = $6;
  `;
  const value = [email, name, phone, password, profile_image, user_id];

  try {
    const result = await pool.query(queryText, value);
    return result.rows[0];
  } catch (error) {
    throw new Error(error);
  }
};

module.exports = {
  getAllUserService,
  createUserService,
  loginUserService,
  updateUserService,
};
