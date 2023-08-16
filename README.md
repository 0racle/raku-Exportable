NAME
====

Exportable - Simple function exporting

SYNOPSIS
========

Import in module code, and apply trait to exportable subs. Tags work normally

```raku
use Exportable;

module Foo {
    our sub foo is exportable { ... }
    our sub bar is exportable(:b) { ... }
    our sub baz is exportable(:b) { ... }
    our sub qux { ... }
}
```

Module users can now import subs by name...

```raku
use Foo <foo bar baz>;
```

or with tags...

```raku
use Foo :b;  # 'foo' not imported
```

DESCRIPTION
===========

`Exportable` makes it simple to explicitly declare exportable functions from your module.

There's already an `export` sub trait, but it pollute the users namespace. The `exportable` trait is almost identical, except it does not export by default.

There's no need to write the function name a second time, and/or write your own complicated `EXPORT` sub.

This module is fairly sparse in what it does on purpose, but if you think there is a glaring omission, raise an issue.

CAVEATS
=======

Due to how this module works, it must be imported outside the module scope. Typically this is done either above a `Module` block (as shown in the SYNOPSIS), or above a unit scoped module.

```raku
use Exportable;
unit module Foo;
our sub foo is exportable { ... }
our sub bar is exportable(:b) { ... }
```
On a side note, declaring public facing subs as `our` scoped is a courtesy to users who may not wish to import any functions, and instead use the fully-qualified name, eg. `Foo::bar()`.

ADDENDUM
========

This module was written after a wrote a [blog post](https://0racle.info/articles/exportation_exploration) talking about the function exporting in Raku. Special thanks goes to [FCO](https://github.com/FCO), who helped by figuring out most the core in this module.
