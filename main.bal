import rosettacode.Hello_world_Newline_omission;
import rosettacode.Hello_world_Text;
import rosettacode.Loops_Break;
import rosettacode.Loops_For;
import rosettacode.Loops_Foreach;
import rosettacode.Loops_Infinite;
import rosettacode.Loops_While;

import ballerina/io;

public type funcArgs function (string[] args) returns error?;

public type funcErr function () returns error?;

public type func funcArgs|funcErr;

# Contains main functions of implemented tasks.
public final map<func> tasks = {
    "Hello_world/Newline_omission": Hello_world_Newline_omission:main,
    "Hello_world/Text": Hello_world_Text:main,
    "Loops/Break": Loops_Break:main,
    "Loops/For": Loops_For:main,
    "Loops/Foreach": Loops_Foreach:main,
    "Loops/Infinite": Loops_Infinite:main,
    "Loops/While": Loops_While:main
};

function printTasks() {
    io:println("Tasks:\n");
    tasks.keys().forEach(function(string taskName) {
        io:println(taskName);
    });
    io:println("\nPass the task name as an argument!");
}

# Runs a task.
#
# + taskName - A key of the `tasks` map
# + return - An error if `taskName` is not a valid `tasks` key or the task fails
public function runTask(string taskName) returns error? {
    final func? fn = tasks[taskName];
    if fn is funcArgs {
        check fn(tasks.keys());
    } else if fn is funcErr {
        check fn();
    } else {
        return error(string `Task "${taskName}" not found.`);
    }
}

public function main(string[] taskNames = []) returns error? {
    if taskNames.length() == 0 {
        printTasks();
    } else {
        foreach string taskName in taskNames {
            check runTask(taskName);
        }
    }
}
