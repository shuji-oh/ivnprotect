
KERNEL_DIR = /lib/modules/$(shell uname -r)/build

obj-m := mcp251x_ivnprotect.o

release:
	make -C $(KERNEL_DIR) M=$(shell pwd) modules
debug:
	KCPPFLAGS="-DDEBUG" make -C $(KERNEL_DIR) M=$(shell pwd) modules
eval_isolation_time:
	KCPPFLAGS="-DEVAL_IT" make -C $(KERNEL_DIR) M=$(shell pwd) modules
clean:
	make -C $(KERNEL_DIR) M=$(shell pwd) clean
