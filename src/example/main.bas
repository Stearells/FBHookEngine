#include "main.bi"

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