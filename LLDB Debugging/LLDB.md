## Debugger LLDB

Explore Depth level 1 of myvariable

```
(lldb) e -D 1 -- myvariable

```

Result could be as follows:

```
(LLDB_Debugger_Exploration.myvariable) $R5 = 0x0000608000087e90 {
  currentClassName = "ViewController"
  debuggerStruct ={...}
}
```

Print:

```
(lldb) print
(lldb) p
```

### Editing a value in debugger:
Expression:

```
(lldb) expression
(lldb) e
(lldb) expr myString = @"Foo"

(lldb) expression dict = nil
(NSDictionary *) $5 = nil
```


### Generate a Report

```
(lldb) bu
(lldb) bugreport
```

```
(lldb) bugreport unwind --outfile <path to output file>

(lldb) bugreport unwind --outfile /Users/richie/Desktop/report.rtf
```

### Frames

```
(lldb) frame info
```

Output

```
frame #0: 0x000000010bbe4b4d LLDB-Debugger-Exploration`ViewController.valueOfLifeWithoutSumOf(a=2, b=2, self=0x00007fa0c1406900) -> Int at ViewController.swift:96
```

### Check your Reference Types

`refcount` is also a pretty straightforward command. It shows you reference count for the specific object. 

```
(lldb) language swift refcount logger
refcount data: (strong = 4, weak = 0)
```

### Control app's execution flow

#### Processes

Interacting with processes on the current plattform:

```
(lldb) process
(lldb) pr
```

Example of use:

```
(lldb) process status
Process 15476 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 3.1
    frame #0: 0x0000000109d6a60f LLDBtutorial`ViewController.viewDidLoad(self=0x00007fbb18511730) at ViewController.swift:17
   14  	    super.viewDidLoad()
   15  	    // Do any additional setup after loading the view, typically from a nib.
   16  	    let result = valueof(a: 5, b: 10)
-> 17  	    print([4mr[0mesult)
   18  	    
   19  	  }
```

Continue breakpoint execution:

```
(lldb) process continue
(lldb) c  // or just type 'c'
```
This command is the equivalent of the "Continue" arrow button below Xcode.

#### Breakpoints

Most common commands like: `breakpoint enable`, `breakpoint disable` and `breakpoint delete`.

```
(lldb) breakpoint
(lldb) br
(lldb) br
(lldb) br
```

To explore all your breakpoints let’s use:

```
(lldb) breakpoint list
```

Example:

```
(lldb) breakpoint list
Current breakpoints:
1: file = '/Users/ricardo.montesinos/Documents/GitHub/LLDBtutorial/LLDBtutorial/ViewController.swift', line = 27, exact_match = 0, locations = 1, resolved = 1, hit count = 1

  1.1: where = LLDBtutorial`LLDBtutorial.ViewController.valueof(a: Swift.Int, b: Swift.Int) -> Swift.Int + 27 at ViewController.swift:27, address = 0x0000000109d6a7cb, resolved, hit count = 1 

2: file = '/Users/ricardo.montesinos/Documents/GitHub/LLDBtutorial/LLDBtutorial/ViewController.swift', line = 28, exact_match = 0, locations = 1, resolved = 1, hit count = 1

  2.1: where = LLDBtutorial`LLDBtutorial.ViewController.valueof(a: Swift.Int, b: Swift.Int) -> Swift.Int + 44 at ViewController.swift:28, address = 0x0000000109d6a7dc, resolved, hit count = 1 

3: file = '/Users/ricardo.montesinos/Documents/GitHub/LLDBtutorial/LLDBtutorial/ViewController.swift', line = 17, exact_match = 0, locations = 1, resolved = 1, hit count = 1

  3.1: where = LLDBtutorial`LLDBtutorial.ViewController.viewDidLoad() -> () + 127 at ViewController.swift:17, address = 0x0000000109d6a60f, resolved, hit count = 1 
```

The first number is de *Breakpoint* **ID**.

##### Set new breakpoints

Let’s set some new breakpoint right from the console:

`-f` is a name of the file where you’d like to put a breakpoint. 
`-l` is a line number of a new breakpoint, line 96.

```
(lldb) breakpoint set -f ViewController.swift -l 96
```

Or you can use the compact command:

```
(lldb) b ViewController.swift:96
```

##### Using REGEX with Breakpoints

for example you can set a breakpoint to specific function in code, like so:

```
(lldb) breakpoint set --func-regex myFunctionName
(lldb) b -r myFunctionName // Short version of the command above
```

##### Using REGEX with Breakpoints

Only one hit breakpoint. 

```
(lldb) breakpoint set --one-shot -f ViewController.swift -l 90
(lldb) br s -o -f ViewController.swift -l 91 // Shorter version of the command above
```

##### Breakpoints Commands, run small commands when breakpoint occurs


1.- Add a Breakpoint in some line of code:

```
(lldb) b ViewController.swift:96
```

2.- Setup some commands

```
(lldb) breakpoint command add 2
```

```
Enter your debugger command(s).  Type 'DONE' to end.
> p sum // Print value of "sum" variable
> p a + b // Evaluate a + b
> continue // Resume right after first hit
> DONE
```

To ensure we added correct commands, use `breakpoint command list <breakpoint id>`.

```
(lldb) breakpoint command list 2
```

```
Breakpoint 2:
Breakpoint commands:
p sum
p a + b
```

After executing that Breakpoint, the output will be:

```
p sum
(Int) $R0 = 6
p a + b
(Int) $R1 = 4
continue
Process 36863 resuming
Command #3 'continue' continued the target.
```


### Thread

With `thread`command you can control execution flow:
`step-over, step-in, step-out, continue`.

There are predefined LLDB shortcuts for these particular commands:

```
(lldb) thread step-over
(lldb) next // The same as "thread step-over" command
(lldb) n // The same as "next" command
(lldb) thread step-in
(lldb) step // The same as "thread step-in"
(lldb) s // The same as "step"
```

In order to get info about the thread.
```
(lldb) thread info 
```

To see a list of all currently active threads use list subcommand:

```
(lldb) thread list

Process 50693 stopped
* thread #1: tid = 0x17de17, 0x0000000109429a90 LLDB-Debugger-Exploration`ViewController.sumOf(a=2, b=2, self=0x00007fe775507390) -> Int at ViewController.swift:90, queue = 'com.apple.main-thread', stop reason = step in
  thread #2: tid = 0x17df4a, 0x000000010daa4dc6  libsystem_kernel.dylib`kevent_qos + 10, queue = 'com.apple.libdispatch-manager'
  thread #3: tid = 0x17df4b, 0x000000010daa444e libsystem_kernel.dylib`__workq_kernreturn + 10
  thread #5: tid = 0x17df4e, 0x000000010da9c34a libsystem_kernel.dylib`mach_msg_trap + 10, name = 'com.apple.uikit.eventfetch-thread'
```


## Running Python Scripts

[INTRODUCTION TO LLDB PYTHON SCRIPTING.](http://www.fabianguerra.com/ios/introduction-to-lldb-python-scripting/)

Then we need to import a Python module and start using our script command normally:

```
(lldb) command import ~/Desktop/script.py
The "print_hello" python command has been installed and is ready for use.

(lldb) print_hello
Hello Debugger!
```


## Check current Platform Info

You can quickly check current platform information:

```
(lldb) platform status
```


## GUI

From terminal type:

```
(lldb) gui
```







