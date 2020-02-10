ifeq ($(OS), Windows_NT)
	PREFIX = .exe
	RM = rm -rf
else
	RM = rm -rf
endif

#----compiler user options-------------
PRJNAME = firmware
#compiler WITHOUT PATH!
CC = sdcc$(PREFIX)
#platform
PLATFORM = stm8
#sdcc flags
CCFLAGS = -m$(PLATFORM) --std-c99 -DSTM8S103
#----flasher user options---------------
#flasher name
FLASHER = stm8flash$(PREFIX)
#hardware programmer/debugger type
PROGRAMMER = stlinkv2
#target for progremmer/debugger
MCU = stm8s103f3
FLASHERFLAGS = -c $(PROGRAMMER) -p $(MCU)
#---------------------------------------

.PHONY: all flash

all: $(PRJNAME).ihx

flash: $(PRJNAME).ihx
	$(FLASHER) $(FLASHERFLAGS) -w $(PRJNAME).ihx

$(PRJNAME).ihx: $(patsubst %.c,%.rel,$(wildcard *.c))
	$(CC) -o $@ $(CCFLAGS) $^

%.rel: %.c
	$(CC) $(CCFLAGS) -c $<

clean:
	rm *.asm *.cdb *.ihx *.lk *.lst *.map *.rel *.rst *.sym