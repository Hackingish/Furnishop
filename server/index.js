//from packages
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");

//from other files
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//initisization
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://Furnishop:Furnishop@cluster0.yyjk93h.mongodb.net/?retryWrites=true&w=majority";

//Middleware
//Clint-> Server -> Clint
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
