CHART_NAME := kuard
TEMPLATE_FILENAME := rendered-templates.yaml

.PHONY: template/dev
template/dev:
	helm template $(CHART_NAME) . -f values-base.yaml -f environments/values-dev.yaml > $(TEMPLATE_FILENAME)

.PHONY: template/stg
template/stg:
	helm template $(CHART_NAME) . -f values-base.yaml -f environments/values-stg.yaml > $(TEMPLATE_FILENAME)

.PHONY: install/dev
install/dev:
	helm upgrade --install $(CHART_NAME) . --namespace dev --create-namespace -f values-base.yaml -f environments/values-dev.yaml

.PHONY: uninstall/dev
uninstall/dev:
	helm uninstall $(CHART_NAME) --namespace dev

.PHONY: install/stg
install/stg:
	helm upgrade --install $(CHART_NAME) . --namespace stg --create-namespace -f values-base.yaml -f environments/values-stg.yaml

.PHONY: uninstall/stg
uninstall/stg:
	helm uninstall $(CHART_NAME) --namespace stg
