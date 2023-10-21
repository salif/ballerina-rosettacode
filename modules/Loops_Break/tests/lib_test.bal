import rosettacode.tests;

import ballerina/io;
import ballerina/random;
import ballerina/test;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
final test:MockFunction printlnMockFn = new ();

@test:Mock {
    moduleName: "ballerina/random",
    functionName: "createIntInRange"
}
final test:MockFunction createIntInRangeMockFn = new ();
//

final tests:Output output = new ();

function printlnFn(io:Printable... values) {
    output.println(...values);
}

int i = 0;
const int[] randomNumbers = [0, 1, 10, 3, 4, 10];

function createIntInRangeFn(int startRange, int endRange) returns int|random:Error {
    i += 1;
    return randomNumbers[i];
}

@test:Config {}
function test_Loops_Break() returns error? {
    test:when(printlnMockFn).call("printlnFn");
    test:when(createIntInRangeMockFn).call("createIntInRangeFn");
    check main();
    test:assertEquals(output.output, "1\n10\n3\n4\n10\n");
}
