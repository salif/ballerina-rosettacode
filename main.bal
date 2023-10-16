import rosettacode.Hello_world_Newline_omission;
import rosettacode.Hello_world_Text;

import ballerina/io;

public type func_args_err function (string[]? args) returns error?;

public type func_err function () returns error?;

public type func_ function ();

public type func func_args_err|func_args_err|func_;

public final map<func> tasks = {
    "Hello_world/Text": Hello_world_Text:main,
    "Hello_world/Newline_omission": Hello_world_Newline_omission:main
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
            if fn is func_ {
                fn();
            } else {
                return error(string `Task "${task_name}" not found.`);
            }
        }
    }
}
