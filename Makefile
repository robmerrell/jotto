VERSION = $(shell cat VERSION)

build:
	vagrant ssh -c "export LC_ALL=en_US.UTF-8; cd /vagrant; mix local.hex --force; yes | mix deps.get; MIX_ENV=prod mix release"

deploy:
	scp rel/jotto/jotto-$(VERSION).tar.gz freebsd@robdor.com:/home/freebsd/deployments/jotto.robdor.com
	ssh freebsd@robdor.com "cd deployments/jotto.robdor.com; mkdir -p $(VERSION); tar xvfz jotto-$(VERSION).tar.gz -C ./$(VERSION)"
