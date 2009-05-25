# Makefile
# This file is part of libbitconvert.
#
# Copyright (c) 2008-2009, Denver Gingerich <denver@ossguy.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

CFLAGS=-ansi -pedantic -Wall -Wextra -Werror
LDFLAGS=-L. -lbitconvert -lpcre

.PHONY: all clean

all: driver combine
driver: driver.o libbitconvert.a
combine: combine.o libbitconvert.a
libbitconvert.a: bitconvert.o

# .o files explicit to force rebuilt on header change
driver.o: driver.c bitconvert.h
combine.o: combine.c bitconvert.h
bitconvert.o: bitconvert.c bitconvert.h

# Magic AR rule
%.a:
	$(AR) rcs $@ $<

clean:
	$(RM) *.a *.o driver
