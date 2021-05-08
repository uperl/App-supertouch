# supertouch ![linux](https://github.com/uperl/App-supertouch/workflows/linux/badge.svg) ![macos](https://github.com/uperl/App-supertouch/workflows/macos/badge.svg) ![windows](https://github.com/uperl/App-supertouch/workflows/windows/badge.svg) ![cygwin](https://github.com/uperl/App-supertouch/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/uperl/App-supertouch/workflows/msys2-mingw/badge.svg)

Touch with directories

# SYNOPSIS

```
% supertouch foo/bar/baz.txt
```

# DESCRIPTION

`supertouch` is a command similar to `touch`, except it creates the directories structure
necessary if it doesn't already exist.

# OPTIONS

- -v

    Turn on verbose mode.

# SEE ALSO

- touch

    Unix command touch.

- [File::Touch](https://metacpan.org/pod/File::Touch)

    Perl module for touching files.

- [Path::Tiny](https://metacpan.org/pod/Path::Tiny)

    Perl path handling module which also provides an interface for touching files.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2020 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
