require 'mkmf'
if pkg_config('xmlsec1-openssl')
	# The rightscale image appears to have incorrect
	# pkg-config files - this flag is needed to link against an 
	# 64-bit libxmlsec1 but isn't included in the pkg-config 
	if system("uname -p") == 'x86_64'
		$CFLAGS += " -DXMLSEC_NO_SIZE_T"
	end
	create_makefile('xmlsec')
else
	puts "xmlsec1 is not installed."
end
