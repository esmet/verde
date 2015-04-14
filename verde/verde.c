#include <assert.h>
#include <event2/event.h>
#include <evhttp.h>
#include <stdio.h>
#include <syslog.h>
#include <zookeeper/zookeeper.h>

static void
zk_watcher(zhandle_t *zh, int type, int state, const char *path, void *ctx)
{

	syslog(LOG_DEBUG, "TODO: Write me: zk_watcher called with %p, %d, %d, %s, %p.",
	    zh, type, state, path, ctx);

	return;
}

static void
peers_handler(struct evhttp_request *req, void *arg)
{

	(void) arg;
	evbuffer_add_printf(req->output_buffer, "TODO: Write me.\n");
	evhttp_send_reply(req, 200, "OK", NULL);

	return;
}

int
main(int argc, const char *argv[])
{
	int r;
	struct evhttp *httpd;
	struct evhttp_bound_socket *socket;
	struct event_base *event_base;
	zhandle_t *zh;

	(void) argc;
	openlog(argv[0], LOG_PID | LOG_NDELAY | LOG_PERROR, LOG_LOCAL3);
	r = 0;

	event_base = event_base_new();
	assert(event_base != NULL);

	httpd = evhttp_new(event_base);
	assert(httpd != NULL);

	evhttp_set_allowed_methods(httpd, EVHTTP_REQ_GET);
	evhttp_set_cb(httpd, "/peers", peers_handler, NULL);

	socket = evhttp_bind_socket_with_handle(httpd, "0.0.0.0", 8080);
	if (socket == NULL) {
		syslog(LOG_CRIT, "Couldn't bind httpd socket.");
		r = -1;
		goto out;
	}

	zh = zookeeper_init("localhost:2081", zk_watcher,
	    /* Timeout, client id, context, and flags */
	    10 * 1000, NULL, NULL, 0);
	if (zh == NULL) {
		syslog(LOG_CRIT, "Couldn't connect to zookeeper.");
		r = -1;
		goto out;
	}

	syslog(LOG_INFO, "Starting event base...");
	event_base_dispatch(event_base);
	syslog(LOG_INFO, "Closing event base...");

out:
	if (zh != NULL) {
		zookeeper_close(zh);
	}

	if (httpd != NULL) {
		evhttp_del_cb(httpd, "/fork");
		evhttp_del_cb(httpd, "/peers");
		evhttp_del_cb(httpd, "/shutdown");
	}

	if (event_base != NULL){
		event_base_free(event_base);
	}

	closelog();

	return r;
}
