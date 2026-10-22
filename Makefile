CHART_NAME := kuard
TEMPLATE_FILENAME := rendered-templates.yaml

# e.g. make template/dev
template/%:
	helm template $(CHART_NAME) . -f values-base.yaml -f environments/values-$*.yaml > $(TEMPLATE_FILENAME)

# e.g. make install/dev
install/%:
	helm upgrade --install $(CHART_NAME) . --namespace $* --create-namespace -f values-base.yaml -f environments/values-$*.yaml

# e.g. make uninstall/dev
uninstall/%:
	helm uninstall $(CHART_NAME) --namespace $*
