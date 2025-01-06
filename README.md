# Learn Some Erlang For Great Good!

This repository collects my first steps in Erlang world.

References to materials will be added to this README over the time:

* **Learn you Some Erlang For Great Good** book online: https://learnyousomeerlang.com/

* **asdf version manager**: https://asdf-vm.com/guide/getting-started.html
  * ohmyzsh plugin configuration: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
  * asdf plugins: https://github.com/asdf-vm/asdf-erlang

```
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
asdf install erlang 27.2
```

Installation failed with error

```
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/unistd.h:639:10: fatal error: cannot open file '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/select.h': Too many open files
```

```
➜  ~ ulimit -a

-t: cpu time (seconds)              unlimited
-f: file size (blocks)              unlimited
-d: data seg size (kbytes)          unlimited
-s: stack size (kbytes)             8176
-c: core file size (blocks)         0
-v: address space (kbytes)          unlimited
-l: locked-in-memory size (kbytes)  unlimited
-u: processes                       1333
-n: file descriptors                256
```

Increasing file descriptors limit fixed the installation issues: `ulimit -S -n 1024`

```
asdf list all erlang
asdf global erlang 27.2
```

* **vs code plugin**: https://marketplace.visualstudio.com/items?itemName=pgourlain.erlang

### Data Types

```
➜  learn_some_erlang_for_great_good git:(main) ✗ mkdir ebin
➜  learn_some_erlang_for_great_good git:(main) ✗ erlc -o ebin src/data_types.erl
➜  learn_some_erlang_for_great_good git:(main) ✗ erlc -o ebin test/data_types_test.erl
➜  learn_some_erlang_for_great_good git:(main) ✗ erl -pa ebin
Erlang/OTP 27 [erts-15.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Eshell V15.2 (press Ctrl+G to abort, type help(). for help)
1> eunit:test(data_types_test).
  All 8 tests passed.
ok
```
