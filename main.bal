import rosettacode.Hello_world_Newline_omission;
import rosettacode.Hello_world_Text;
import rosettacode.Loops_Break;
import rosettacode.Loops_Foreach;
import rosettacode.Loops_Infinite;
import rosettacode.Loops_While;

import ballerina/io;

public type func_args function (string[] args) returns error?;

public type func_err function () returns error?;

public type func func_args|func_err;

public final map<func> tasks = {
    "Hello_world/Newline_omission": Hello_world_Newline_omission:main,
    "Hello_world/Text": Hello_world_Text:main,
    "Loops/Break": Loops_Break:main,
    "Loops/Foreach": Loops_Foreach:main,
    "Loops/Infinite": Loops_Infinite:main,
    "Loops/While": Loops_While:main
};

function print_tasks() {
    io:println("Tasks:\n");
    tasks.keys().forEach(function(string tn) {
        io:println(tn);
    });
    io:println("\nPass the task name as an argument!");
}

public function main(string[] task_names = []) returns error? {
    if task_names.length() == 0 {
        print_tasks();
    } else {
        foreach string task_name in task_names {
            final func? fn = tasks[task_name];
            if fn is func_args {
                check fn(tasks.keys());
            } else if fn is func_err {
                check fn();
            } else {
                return error(string `Task "${task_name}" not found.`);
            }
        }
    }
}
