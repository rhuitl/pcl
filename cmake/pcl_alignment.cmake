check_cxx_source_runs("
  // Intel compiler defines an incompatible _mm_malloc signature
  #if defined(__INTEL_COMPILER)
    #include <malloc.h>
  #else
    #include <mm_malloc.h>
  #endif
  int main()
  {
    void* mem = _mm_malloc (100, 16);
    return 0;
  }"
  HAVE_MM_MALLOC)

check_cxx_source_runs("
  #include <stdlib.h>
  int main()
  {
    void* mem;
    return posix_memalign (&mem, 16, 100);
  }"
  HAVE_POSIX_MEMALIGN)
