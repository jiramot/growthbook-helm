.PHONY: test init install upgrade uninstall

test:
	helm template . -f values.yaml
init:
	brew install helm
install: test
	helm install growthbook -n growthbook --create-namespace .
upgrade: test
	helm upgrade growthbook -n growthbook .
uninstall:
	helm uninstall growthbook -n growthbook
dependencies:
	helm dependencies build .
build: dependencies
	helm package .


