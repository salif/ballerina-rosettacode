import ballerina/io;

public function main() {
    foreach int i in int:range(1, 6, 1) {
        foreach int _ in int:range(0, i, 1) {
            io:print("*");
        }
        io:println();
    }
}
