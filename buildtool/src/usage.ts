const commandLineUsage = require("command-line-usage");

export default commandLineUsage([
  {
    header: "Website Buildtool",
    content: "For ease of use in the monorepo",
  },
  {
    header: "Options",
    optionList: [
      {
        name: "install",
        description: "Bootstrap all dependendencies",
      },
      {
        name: "build",
        description: "Build all repositories",
      },
      {
        name: "test",
        description: "Test all repositories",
      },
      {
        name: "lint",
        description: "Run all linters",
      },
      {
        name: "fix",
        description: "Run all formatters",
      },
    ],
  },
]);
