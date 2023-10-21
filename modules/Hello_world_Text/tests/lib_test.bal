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
function test_Hello_world_Text() {
    test:when(printlnMockFn).call("printlnFn");
    main();
    test:assertEquals(output.output, "Hello world!\n");
}
