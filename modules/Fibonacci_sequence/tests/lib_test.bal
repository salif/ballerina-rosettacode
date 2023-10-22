import ballerina/test;

@test:Config {}
function test_Fibonacci_sequence() {
    test:assertEquals(fib(4), 3);
}
