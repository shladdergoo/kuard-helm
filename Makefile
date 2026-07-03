CHART_NAME := kuard
TEMPLATE_FILENAME := rendered-templates.yaml

template/%:
	helm template $(CHART_NAME) . -f values-base.yaml -f environments/values-$*.yaml > $(TEMPLATE_FILENAME)

install/%:
	helm upgrade --install $(CHART_NAME) . --namespace $* --create-namespace -f values-base.yaml -f environments/values-$*.yaml

uninstall/%:
	helm uninstall $(CHART_NAME) --namespace $*
