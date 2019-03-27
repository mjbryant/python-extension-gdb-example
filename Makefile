build-docker:
	docker build -t python-extension-gdb-example .

run-docker:
	docker run -it --cap-add SYS_PTRACE -v ${PWD}:/root/home \
		python-extension-gdb-example \
		/bin/bash
