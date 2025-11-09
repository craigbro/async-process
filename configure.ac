AC_INIT([async-process], [0.1])
AC_CONFIG_MACRO_DIR([m4])
AM_CONFIG_HEADER(config.h)

AM_INIT_AUTOMAKE([foreign])
LT_INIT(shared win32-dll)
AC_PROG_CC


AC_CHECK_HEADERS([fcntl.h stdlib.h string.h unistd.h windows.h])

AC_CHECK_HEADER_STDBOOL
AC_TYPE_PID_T

AC_FUNC_FORK
AC_FUNC_MALLOC
AC_CHECK_FUNCS([dup2 strerror])

AC_LANG_PUSH([C])

AC_DEFUN([AM_CHECK_POSIX_OPENPT_O_CLOEXEC],[
AC_MSG_CHECKING([whether posix_openpt supports O_CLOEXEC])
AC_COMPILE_IFELSE(
[AC_LANG_SOURCE([[
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
int mai(n) {
    int fd = posix_openpt(O_RDWR | O_CLOEXEC | O_NOCTTY);
   return (fd == -1 && errno == EINVAL);
}
]])
],
# Compile time success.
[AC_RUN_IFELSE(
[AC_LANG_SOURCE([[
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
int main() {
  int fd = posix_openpt(O_RDWR | O_CLOEXEC | O_NOCTTY);
  if (fd != -1) {
    close(fd);
    return 0; /* Runtime success */
  }
  return 1; /* Runtime failure */
}
]])
],
# Both compile and run success
[AC_DEFINE([HAVE_POSIX_OPENPT_O_CLOEXEC], [1], [Define to 1 if posix_openpt supports O_CLOEXEC])
AC_MSG_RESULT([yes])
],
[AC_MSG_RESULT([no (runtime failure)])
])
],
[AC_MSG_RESULT([no (compile failure)])])
])
AC_LANG_POP([C])


AM_CHECK_POSIX_OPENPT_O_CLOEXEC

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
