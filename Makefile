CHART_NAME := kuard
TEMPLATE_FILENAME := rendered-templates.yaml

.PHONY: template/dev
template/dev:
	helm template $(CHART_NAME) . -f values-base.yaml -f environments/values-dev.yaml > $(TEMPLATE_FILENAME)

/PHONY: install/dev
install/dev:
	helm upgrade --install $(CHART_NAME) . -f values-base.yaml -f environments/values-dev.yaml
