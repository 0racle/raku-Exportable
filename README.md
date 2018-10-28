NAME
====

Exportable - Simple function exporting

SYNOPSIS
========

Import in module code, and apply trait to exportable subs. Tags work normally

```perl-6
unit module Foo;

use Exportable;

sub foo is exportable { ... }
sub bar is exportable(:b) { ... }
sub baz is exportable(:b) { ... }
sub qux { ... }
```

Module users can now import subs by name...

```perl-6
use Foo <foo bar baz>;
```

or with tags...

```
use Foo :b;  # 'foo' not imported
```

DESCRIPTION
===========

`Exportable` makes it simple to export functions from your module without polluting the users namespace. Most other methods require you to write the function name a second time, and/or write your own `EXPORT` sub which can be fairly complicated.

This module is fairly spares in what it does on purpose, but if you thing there is a glaring omission, raise an issue.
