WIREMOCK-VERSION=1.57
WIREMOCK=wiremock-$(WIREMOCK-VERSION)-standalone.jar

all: $(WIREMOCK)
	@ if ! ps -ewwo pid,args | grep [j]ava\ -jar\ $(WIREMOCK); then\
		make runserver &\
	fi
	sleep 5 # wait for wiremock to start
	curl http://localhost:8080/api/hello
	curl http://foo.app/api/hello
	curl --insecure https://localhost:8081/api/hello
	curl --insecure https://foo.app/api/hello
	curl http://foo.app/
	curl http://foo.app/about/

runserver:
	java -jar $(WIREMOCK) --https-port 8081 --verbose

$(WIREMOCK):
	wget http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/$(WIREMOCK-VERSION)/$(WIREMOCK)
