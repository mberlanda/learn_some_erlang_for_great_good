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

These commands have been moved to Makefile and being executed by github actions.

### Modules

Compile

```
➜  learn_some_erlang_for_great_good git:(main) ✗ erl
Erlang/OTP 27 [erts-15.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Eshell V15.2 (press Ctrl+G to abort, type help(). for help)
1> cd("./src").
.../learn_some_erlang_for_great_good/src
ok
2> c(useless).
{ok,useless}
3> useless:add(5,3).
8
4> useless:hello().
Hello, world!
ok
5> useless:greet_and_add_two(4).
Hello, world!
6
```

Add compiler debug_info
```
6> compile:file(useless, [debug_info, export_all]).
{ok,useless}
7> c(useless, [debug_info, export_all]).
{ok,useless}
```

Module info

```
13> c(useless).
{ok,useless}
14> useless:module_info(attributes).
[{vsn,[196039944454595751978011564439718590907]},
 {author,"An Erlang Champ"}]
```

### Syntax in Functions

* https://www.erlang.org/doc/system/typespec.html
* https://learnyousomeerlang.com/syntax-in-functions

### Types

```
is_atom/1           is_binary/1        
is_bitstring/1      is_boolean/1        is_builtin/3       
is_float/1          is_function/1       is_function/2      
is_integer/1        is_list/1           is_number/1        
is_pid/1            is_port/1           is_record/2        
is_record/3         is_reference/1      is_tuple/1 
```