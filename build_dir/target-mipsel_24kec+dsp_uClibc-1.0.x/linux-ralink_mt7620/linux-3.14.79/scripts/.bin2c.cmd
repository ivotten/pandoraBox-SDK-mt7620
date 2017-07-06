cmd_scripts/bin2c := gcc -Wp,-MD,scripts/.bin2c.d -O2 -I/home/lintel/PandoraBox-MT7620/staging_dir/host/include -I/home/lintel/PandoraBox-MT7620/staging_dir/host/usr/include  -Wall -Wmissing-prototypes -Wstrict-prototypes   -I/home/lintel/PandoraBox-MT7620/staging_dir/host/include -I/home/lintel/PandoraBox-MT7620/build_dir/target-mipsel_24kec+dsp_uClibc-1.0.x/linux-ralink_mt7620/linux-3.14.79/tools/include  -o scripts/bin2c scripts/bin2c.c -L/home/lintel/PandoraBox-MT7620/staging_dir/host/lib 

source_scripts/bin2c := scripts/bin2c.c

deps_scripts/bin2c := \
  /usr/include/stdc-predef.h \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/x86_64-linux-gnu/sys/cdefs.h \
  /usr/include/x86_64-linux-gnu/bits/wordsize.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
  /usr/include/x86_64-linux-gnu/bits/types.h \
  /usr/include/x86_64-linux-gnu/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
  /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/sys_errlist.h \
  /usr/include/x86_64-linux-gnu/bits/stdio.h \
  /usr/include/x86_64-linux-gnu/bits/stdio2.h \

scripts/bin2c: $(deps_scripts/bin2c)

$(deps_scripts/bin2c):
