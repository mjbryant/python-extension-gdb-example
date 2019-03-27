# python-extension-gdb-example
A simple example showing how to build and debug a CPython extension with gdb

## Summary
I came to the world of CPython extensions as a python programmer with very little C
experience, so segfaults were (and still are, to a certain extent) inordinately confusing.
Tutorials for setting up and using `gdb` on Mac involve complex codesigning and multiple
restarts, so I made this simple Docker setup to help make debugging extensions with `gdb`
straightforward.

## Running the example
```bash
$ git clone https://github.com/mjbryant/python-extension-gdb-example
$ cd python-extension-gdb-example
$ make build-docker
$ make run-docker
(in-docker)$ make python
(in-docker)$ make test-gdb # prints a bunch of gdb initialization
(in-docker)(gdb) run
```

This will run a test script that calls the extension inside `gdb`. To set a breakpoint
and step through the program, enter `break python_extension.c:4` in the `(gdb)` prompt
before calling `run`.

## Running with your own extension
Using this to debug your own CPython extension isn't as straightforward, since you'll
have to make sure your extension install commands and test scripts work. But you can
drop into the docker container with your own directory mounted by doing
`MOUNT_DIR=${YOUR_DIR} make run-docker`. This should at least get you to an environment
with all dependencies necessary to debug your extension.

Remember to compile your extension with `CFLAGS="-O0 -g"` to get better visibility into
variable values!

## Using python2
You're not still using python2, are you? It's EOL 2020-01-01! Update! But if you really
have to, you should be able to remove the `3` from the python `apt-get` installs and
invocations and it should all work.
