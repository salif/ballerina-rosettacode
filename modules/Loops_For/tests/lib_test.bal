import rosettacode.tests;

import ballerina/io;
import ballerina/test;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
final test:MockFunction printlnMockFn = new ();

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "print"
}
final test:MockFunction printMockFn = new ();

final tests:Output output = new ();

function printlnFn(io:Printable... values) {
    output.println(...values);
}

function printFn(io:Printable... values) {
    output.print(...values);
}

@test:Config {}
function test_Loops_For() {
    test:when(printlnMockFn).call("printlnFn");
    test:when(printMockFn).call("printFn");
    main();
    test:assertEquals(output.output, "*\n**\n***\n****\n*****\n");
}
