import ballerina/io;

public class Output {
    public string output;

    public function init() {
        self.output = "";
    }

    public function print(io:Printable... values) {
        foreach io:Printable value in values {
            if value is io:PrintableRawTemplate {
                // TODO
                panic error("not implemented");
            } else if value is error {
                self.output += value.toString();
            } else {
                self.output += value.toString();
            }
        }
    }
    public function println(io:Printable... values) {
        self.print(...values);
        self.output += "\n";
    }
}
