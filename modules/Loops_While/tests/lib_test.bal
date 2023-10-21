import rosettacode.tests;

import ballerina/io;
import ballerina/test;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
final test:MockFunction printlnMockFn = new ();

final tests:Output output = new ();

function printlnFn(io:Printable... values) {
    output.println(...values);
}

@test:Config {}
function test_Loops_While() {
    test:when(printlnMockFn).call("printlnFn");
    main();
    test:assertEquals(output.output, "1024\n512\n256\n128\n64\n32\n16\n8\n4\n2\n1\n");
}
