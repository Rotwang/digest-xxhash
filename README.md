Digest::xxHash
=============

This module provides perl6 bindings for xxHash (https://code.google.com/p/xxhash/).
xxHash source code is bundled along so make and cmake on *NIX are needed!

## Dependencies.

run time: NativeCall (p6 module)
compile time: make (on *NIX), cmake (http://www.cmake.org/)

## Exported subroutines.

### xxhash_revision()
Takes no arguments and returns revision (in form of an Int) of the upstream xxHash svn repository of currently used xxHash sources in the Digest::xxHash.

### xxhash_src_uri()
Takes no arguments and returns uri (Str) to the upstream svn repository from which xxHash c sources were exported.

### xxHash(...)
actual signatures:
    multi sub xxHash(Str $string, Int :$seed = 0)
    multi sub xxHash(Str :$file!, Int :$seed = 0)
    multi sub xxHash(Buf[uint8] :$buf-u8!, Int :$seed = 0)

All of the above return an Int representing hash of the given data.

### Installing on windows.

