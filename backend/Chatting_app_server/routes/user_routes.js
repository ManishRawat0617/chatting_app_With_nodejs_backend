const {
  handleGetAllUser,
  handleRegisterUser,
  handleLoginUser,
} = require("../controller/user_controller");

const express = require("express");
const router = express.Router();

router.get("/", handleGetAllUser).post("/", handleRegisterUser);

router.post("/login", handleLoginUser);

module.exports = router;
