import ballerina/io;

public function fib(int n) returns int => n < 2 ? n : fib(n - 1) + fib(n - 2);

public function main(string[] args) returns error? {
    foreach string arg in args {
        int n = check int:fromString(arg);
        io:println(`F(${n}) = ${fib(n)}`);
    }
}
