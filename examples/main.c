#include <syslog.h>

#include "verde/verde.h"

int
main(int argc, const char *argv[])
{
	int r;
	struct verde *verde;

	(void) argc;
	openlog(argv[0], LOG_PID | LOG_NDELAY | LOG_PERROR, LOG_LOCAL3);

	syslog(LOG_INFO, "Setting up verde...");
	r = verde_create(&verde);
	if (r != 0) {
		goto out;
	}

	syslog(LOG_INFO, "Beginning dispatch...");
	syslog(LOG_INFO, "---------------------");
	verde_dispatch(verde);
	syslog(LOG_INFO, "---------------------");
	syslog(LOG_INFO, "Finished dispatch");

out:
	syslog(LOG_INFO, "Shutting down verde...");
	verde_destroy(&verde);
	closelog();

	return r;
}
