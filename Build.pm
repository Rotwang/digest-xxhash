use v6;
use Panda::Common;
use Panda::Builder;

my $this-is-windows = $*OS eq 'MSWin32';

class Build is Panda::Builder {
        method build(Str $path) {
                if $this-is-windows {
                        note '                           _-';
                        note '                         _-//';
                        note '                      _-_/ /';
                        note '                   _--_/ _/';
                        note '                 _- _/ _/';
                        note '          ___-(O) _/ _/  **************************';
                        note '      __--  __   /_ /    * Please see the README  *';
                        note '____--__----  /    \_    * for information on how *';
                        note ' -----       /   \_  \_  * to install on windows. *';
                        note '           //   // \__ \_**************************';
                        note '         //   //      \_ \_';
                        note '      ///   //          \__-';
                        return;
                }
                my $string-to-execute = "make panda-install";
                say "Executing: {$string-to-execute}";
                my $retval = +shell $string-to-execute;
                if $retval != 0  {
                        note "*** xxhash library build failed with exit status {$retval}!";
                        exit 1;
                }
                
                # just a temporary hack ;}
                #temp $*CWD = IO::Spec.rel2abs("blib");

                #say "Compiling xxHash.pm to {compsuffix}";
                #shell "PERL6LIB='./lib' $*EXECUTABLE_NAME --target={compsuffix} "
                #        ~ "--output=lib/Digest/xxHash.pir lib/Digest/xxHash.pm"
                #        or fail "Failed building xxHash.pir";
        }
}

# vi: ft=perl6
