rebuild: clean build

build:
	mkdir build
	cp http-ping build/__main__.py
	zip -j build/http-ping.zip build/__main__.py
	zip -r build/http-ping.zip lib
	echo "#!/usr/bin/env python3" > build/http-ping
	cat build/http-ping.zip >> build/http-ping
	chmod +x build/http-ping
	rm build/http-ping.zip build/__main__.py

install: build
	cp build/http-ping /usr/local/bin/http-ping

clean:
	rm -rf build