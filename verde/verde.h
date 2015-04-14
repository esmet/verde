struct verde;

/* Startup verde. */
int verde_create(struct verde **verde_p);

/* Shutdown verde */
void verde_destroy(struct verde **verde_p);

/* Do service discovery work by polling the underlying event loop. Does not return. */
void verde_dispatch(struct verde *verde);
