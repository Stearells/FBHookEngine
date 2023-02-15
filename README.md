HookEngine FreeBASIC implementation
--

HookEngine is a library for hooking windows API calls such as MS Detours.

HookEngine namespace provides the following types:
```freebasic
' for 64-bit target
type uint_auto as ulongint
type int_auto as longint
' for 32-bit target
type uint_auto as ulong
type int_auto as long
```

Main library class (CHook) methods:
```freebasic
' Install hook to function (using ret instruction)
' pSource: pointer to source function
' pDestination: pointer to destination function
' Result: Method returns true if the hook is successfully installed, else false.
declare function Install(pSource as any ptr, pDestination as any ptr) as boolean


' Uninstall hook from function (already installed with Install())
' Result: Method returns true if the hook is successfully uninstalled or false if hook not installed now.
declare function Uninstall() as uint_auto ptr

' Check if hook is installed.
' Method returns true if the hook is installed, else false.
declare function IsInstalled() as boolean
```


Example:
```freebasic
dim shared my_hook as HookEngine.CHook

function test(num as long) as long
	return num * 2
end function

function test_hooked(num as long) as long
	dim reHookAddr as any ptr = my_hook.Uninstall()
	dim result as long = test(num)
	my_hook.Install(reHookAddr, @test_hooked)
	
	printf(!"hello from hook\n")
	return result * 10
end function

printf(!"un-hooked call: %d\n", test(2))
my_hook.Install(@test, @test_hooked)
printf(!"hooked call: %d\n", test(2))
```
