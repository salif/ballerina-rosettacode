import ballerina/io;

public function main(string[] items) {
    foreach string item in items {
        io:println(item);
    }
}
