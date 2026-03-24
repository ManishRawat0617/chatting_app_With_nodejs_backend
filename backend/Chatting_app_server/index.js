const express = require("express");

const http = require("http"); // Import HTTP module
const { Server } = require("socket.io"); //
const errorHandling = require("./middleware/error_Handling");
const createAllTable = require("./controller/tableController");
const userRouter = require("./routes/user_routes");
const { SourceTextModule } = require("vm");

const app = express();
const port = process.env.PORT || 6000;

// Middleware to parse JSON
app.use(express.json());
// Create HTTP server from Express app
const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: "*", // Allow all origins (change this in production)
    methods: ["GET", "POST"],
  },
});
// Initialize database tables or setup
createAllTable();

// Define routes
app.get("/", (req, res) => {
  res.send("This is the server");
  console.log("This is the server speaking");
});

app.use("/user", userRouter);

// Error handling middleware (should be last)
app.use(errorHandling);

io.use((socket, next) => {
  const callerId = socket.handshake.query.userId;
  if (callerId) {
    console.log("Connection attempt with caller ID:", callerId);
    // socket.user = callerId;
    next();
  } else {
    console.error("Connection attempt with missing caller ID");
    // next(new Error("Invalid caller ID"));
  }
});
// Socket.io logic
io.on("connection", (socket) => { 
  console.log(`⚡ New client connected: ${socket.id}`);

  // Listen for a message from the client
  socket.on("message", (data) => {
    console.log("📩 Message received:", data);

    // Broadcast the message to all connected clients
    io.emit("message", data);
  });

  // Handle disconnection
  socket.on("disconnect", () => {
    console.log(`❌ Client disconnected: ${socket.id}`);
  });
});

// Start the server using `server.listen` instead of `app.listen`
server.listen(port, () => {
  console.log(`🚀 Server is running on port ${port}`);
});
