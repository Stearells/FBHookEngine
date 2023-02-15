#include "HookEngine.bi"

constructor HookEngine.CHook()
	pAddress = nullptr
	pOldCode = nullptr
	codeSize = 0
end constructor

destructor HookEngine.CHook()
	if (pOldCode <> nullptr) then _
		Uninstall()
end destructor

function HookEngine.CHook.Install(pSource as any ptr, pDestination as any ptr) as boolean
	if (pOldCode <> nullptr) then _
		return false
	
	if (pSource = nullptr or pDestination = nullptr) then _
		return false
	
#ifdef __FB_64BIT__
	dim newCode(0 to ...) as ubyte = _
	{ _
		&h48, &hB8, _
		&h00, &h00, &h00, &h00, &h00, &h00, &h00, &h00, _
		&h50, _
		&hC3 _
	}
	
	*cast(uint_auto ptr, @newCode(2)) = cast(uint_auto, pDestination)
#else
	dim newCode(0 to ...) as ubyte = _
	{ _
		&hB8, _
		&h00, &h00, &h00, &h00, _
		&h50, _
		&hC3 _
	}
	
	*cast(uint_auto ptr, @newCode(1)) = cast(uint_auto, pDestination)
#endif
	
	pOldCode = new ubyte[arraysize(newCode)]
	if (pOldCode = nullptr) then _
		return false
		
	dim dwBack as DWORD
	VirtualProtect(pSource, arraysize(newCode), PAGE_EXECUTE_READWRITE, @dwBack)
	
	memcpy(pOldCode, pSource, arraysize(newCode))
	memcpy(pSource, @newCode(0), arraysize(newCode))
	
	pAddress = cast(uint_auto ptr, pSource)
	codeSize = arraysize(newCode)
	
	return true
end function

function HookEngine.CHook.Uninstall() as uint_auto ptr
	if (pOldCode = nullptr) then _
		return nullptr
	
	memcpy(pAddress, pOldCode, codeSize)
	
	delete[] pOldCode
	pOldCode = nullptr
	codeSize = 0
	
	return pAddress
end function

function HookEngine.CHook.IsInstalled() as boolean
	if (pOldCode = nullptr) then _
		return false
	
	return true
end function