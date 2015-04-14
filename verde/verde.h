struct verde;

int verde_create(struct verde **verde);

void verde_destroy(struct verde **verde);

void verde_dispatch(struct verde *verde);
