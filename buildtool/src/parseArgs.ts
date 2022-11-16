import usage from "./usage";

const commandLineArgs = require("command-line-args");

interface MainCommand {
  name: string;
}

const commandList = ["install", "build", "test", "lint", "fix"];

export default function parseArgs(): MainCommand {
  const mainCommand: MainCommand = commandLineArgs(
    commandList.map((command) => ({
      name: command,
      alias: command.charAt(0),
    })),
    {
      stopAtFirstUnknown: true,
    }
  );

  if (!commandList.includes(mainCommand.name)) {
    console.log(usage);
    process.exit(1);
  }
  return mainCommand;
}
