if [ $OS == "linux" ]; then
	make -f Makefile
elif [ $OS == "android" ]; then
	source ~/android-ndk-envvars
	export CFLAGS="$CFLAGS --target=$TARGET"
	make -f Makefile
elif [ $OS == "macos" ]; then
	CFLAGS=--target=$TARGET make -f Makefile
elif [ $OS == "ios" ]; then
	if [[ $TARGET == *"-simulator" ]]; then
		make -f Makefile.iphoneSimulator
	else
		make -f Makefile.iphone
	fi
elif [ $OS == "windows" ]; then
	cd psd
	MSBuild.exe psd.sln /property:Configuration=Release /property:Platform=$WINDOWS_PLATFORM | ( iconv -f utf-8 -t utf-8 -c || true )
else
	echo Unknown OS: $OS
	exit 1
fi
