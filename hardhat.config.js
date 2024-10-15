// hardhat.config.js
require("@nomiclabs/hardhat-waffle");

task("build", "Compiles the contracts")
  .setAction(async () => {
    console.log("⚙️ Building the project...");
    await run("compile");
  });

task("fmt", "Checks the formatting")
  .setAction(async () => {
    console.log("⚙️ Checking the format...");
    // Use a tool like Prettier or Solhint for formatting checks
  });

task("init", "Initializes the project")
  .setAction(async () => {
    console.log("⚙️ Initializing project...");
    // Normally, Hardhat handles this automatically, but you can add custom logic if needed
  });

task("lint", "Runs the linter")
  .setAction(async () => {
    console.log("⚙️ Running the linter...");
    // You can integrate solhint or eslint for linting
  });

task("test", "Runs unit tests")
  .setAction(async () => {
    console.log("⚙️ Running unit tests...");
    await run("test");
  });

task("full-test", "Runs all tests")
  .setAction(async () => {
    console.log("⚙️ Running all tests...");
    await run("test", { includeIgnored: true }); // Adjust based on your needs
  });

// Default task to run all
task("all", "Runs all tasks")
  .setAction(async () => {
    await run("init");
    await run("build");
    await run("test");
  });
