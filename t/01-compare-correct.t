use v6;
use Test;

use Digest::xxHash;

my Str $file-for-tests = IO::Spec.catpath("", $*PROGRAM_NAME.IO.path.absolute.directory, "digest-from-file");
die ">>> File: '" ~ $file-for-tests ~ "' doesn't exist (it should be distributed along with this Digest::xxHash archive)!"
	unless $file-for-tests.IO ~~ :f;

plan 4;

{
	is xxHash(""), 0x2CC5D05,
		"digest from empty string is correct";
}

{
	is xxHash("dupa"), 0x1A47C09D,
		"digest from string 'dupa' is correct";
}

{
	is xxHash(file => $file-for-tests), 0x1A47C09D,
		"digest from file content is correct";
}

{
	is xxHash(buf-u8 => Buf[uint8].new(0x64, 0x75, 0x70, 0x61)), 0x1A47C09D,
		"digest from uint8 buffer is correct";
}

# vi: ft=perl6
