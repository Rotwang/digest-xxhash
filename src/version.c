#define REVISION 33
#define SRC_URI "http://xxhash.googlecode.com/svn/trunk/"

int xxhash_revision(void) {
	return REVISION;
}

char *xxhash_src_uri(void) {
	return SRC_URI;
}
