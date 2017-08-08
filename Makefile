VERSION=$(shell sed -n '/<version>/{s:^.*<version>::;s:</.*$$::;p;}' pom.xml | head -1)

all: test

v:
	echo $(VERSION)

test:
	rm -rf "target/it"
	mkdir -p "target/it/test-parent-pom"
	cp -a "src/it/test-parent-pom/" "target/it/test-parent-pom/"
	sed -i.BAK 's:@project.version@:$(VERSION):;' "target/it/test-parent-pom/pom.xml"
	mvn -f "target/it/test-parent-pom/pom.xml" clean verify
