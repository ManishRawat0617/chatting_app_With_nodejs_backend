const {
  getAllUserService,
  createUserService,
  loginUserService,
  updateUserService,
} = require("../models/userModel");
const handleResponse = require("../middleware/handle_response");

const handleGetAllUser = async (req, res, next) => {
  try {
    const users = await getAllUserService();
    console.log("this is ");
    handleResponse(res, 200, "All users are fetched successfully", users);
  } catch (err) {
    next(err);
  }
};

const handleRegisterUser = async (req, res, next) => {
  const { name, email, password, phone, profile_image } = req.body;

  try {
    const user = await createUserService(
      name,
      email,
      password,
      phone,

      profile_image
    );
    handleResponse(res, 200, "User resgister successfully", user);
  } catch (error) {
    next(error);
  }
};

const handleLoginUser = async (req, res, next) => {
  const { email, password } = req.body;
 
  try { 
    const user = await loginUserService(email, password);

    handleResponse(res, 200, "user", user);
  } catch (error) {}
};

const handleUpdateUser = async (req, res, next) => {
  const { user_id, email, name, phone, password, profile_image } = req.body;
  try {
    const updateUser = await updateUserService(
      user_id,
      email,
      name,
      phone,
      password,
      profile_image
    );
    handleResponse(res, 200, "User Uppdated successfully", updateUser);
  } catch (error) {
    throw new Error(error);
  }
};
module.exports = {
  handleGetAllUser,
  handleRegisterUser,
  handleLoginUser,
  handleUpdateUser,
};
