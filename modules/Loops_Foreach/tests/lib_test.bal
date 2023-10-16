import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

// Test function

@test:Config {}
function testFunction() {
    // TODO add tests
    main(["a", "b", "c"]);
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
