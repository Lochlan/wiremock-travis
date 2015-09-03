
all:
	wget http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/1.57/wiremock-1.57-standalone.jar
	java -jar wiremock-1.57-standalone.jar &
	sleep 5 # wait for wiremock to start
	curl http://localhost:8080/api/hello
	curl http://foo.app/api/hello
