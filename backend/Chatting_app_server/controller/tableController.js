const createUserTable = require("../data/createUserTable");
const createMessageTable = require("../data/createMessageTable");

const createAllTable = async () => {
  //   (async () => {
  //     try {
  //       await createUserTable();
  //     } catch (error) {
  //       console.log("error Creating user_table", error.message);
  //     }
  //   })();

  try {
    await createUserTable();
    await createMessageTable();
  } catch (error) {
    console.log("Error in creating the tables ", error);
  }
};

module.exports = createAllTable;
