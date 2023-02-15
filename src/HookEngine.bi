'    _____ __                       ____
'   / ___// /____  ____ _________  / / /____
'   \__ \/ __/ _ \/ __ `/ ___/ _ \/ / / ___/
'  ___/ / /_/  __/ /_/ / /  /  __/ / (__  )
' /____/\__/\___/\__,_/_/   \___/_/_/____/
' HookEngine Library
' Stearells (C) 2021

#ifndef _HOOK_ENGINE_BI_
#define _HOOK_ENGINE_BI_

#include "windows.bi"
#include "crt/mem.bi"

#ifndef __FB_WIN32__
#error "only windows supported as target platform"
#endif

#ifndef nullptr
#define nullptr 0
#endif

namespace HookEngine
#ifdef __FB_64BIT__
	type uint_auto as ulongint
	type int_auto as longint
#else
	type uint_auto as ulong
	type int_auto as long
#endif

	
	type CHook
	private:
		pOldCode as ubyte ptr
		pAddress as uint_auto ptr
		codeSize as ubyte
	
	public:
		declare constructor()
		declare destructor()
		
		declare function Install(pSource as any ptr, pDestination as any ptr) as boolean
		declare function Uninstall() as uint_auto ptr
		declare function IsInstalled() as boolean
 	end type
end namespace

#endif