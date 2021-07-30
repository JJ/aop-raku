use aspects;
aspect LoggingAspect is MethodBoundaryAspect {
    method entry($method, $obj, $args) {
        say "Called $method with $args";
    }
    method exit($method, $obj, $args, $result) {
        say "$method returned with $result.perl()";
    }
}
aspect Example is LoggingAspect {
    method double($x) { $x * 2 }
    method square($x) { $x ** 2 }
}
say Example.double(3);
say Example.square(3);
