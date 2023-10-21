import rosettacode.tests;

import ballerina/io;
import ballerina/test;

@test:Mock {
    moduleName: "ballerina/io",
    functionName: "print"
}
final test:MockFunction printMockFn = new ();

final tests:Output output = new ();

function printFn(io:Printable... values) {
    output.print(...values);
}

@test:Config {}
function test_Hello_world_Newline_omission() {
    test:when(printMockFn).call("printFn");
    main();
    test:assertEquals(output.output, "Goodbye, World!");
}
