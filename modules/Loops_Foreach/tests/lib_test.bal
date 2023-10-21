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
function test_Loops_Foreach() {
    test:when(printlnMockFn).call("printlnFn");
    main(["a", "b", "c"]);
    test:assertEquals(output.output, "a\nb\nc\n");
}
