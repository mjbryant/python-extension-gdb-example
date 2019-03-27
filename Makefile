MOUNT_DIR ?= ${PWD}

# Docker targets - to be run from outside the container

build-docker:
	docker build -t python-extension-gdb-example .

run-docker:
	docker run -it --cap-add SYS_PTRACE -v $(MOUNT_DIR):/root/home \
		python-extension-gdb-example \
		/bin/bash

# Python/gdb targets - to be run from inside the container

python:
	CFLAGS="-O0 -g" python3 src/python/setup.py install

test-gdb:
	gdb --args python3 src/python/test_gdb.py
