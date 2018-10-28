multi sub exported-EXPORT(%exports, *@names --> Hash()) {
    do for @names -> $name {
        unless %exports{ $name }:exists {
            die("Unknown name for export: '$name'");
        }
        "&$name" => %exports{ $name }
    }
}

multi sub EXPORT {
    my %exports;
    multi sub trait_mod:<is>(Routine:D \r, :$exportable!) is export {
        if $exportable !~~ Bool {
            trait_mod:<is>(r, :export($exportable));
        }
        %exports{ r.name } = r
    }
    {
        '&EXPORT' => sub (*@names) { exported-EXPORT %exports, |@names }
    }
}
