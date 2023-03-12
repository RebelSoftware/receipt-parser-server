.PHONY serve:

generate_cert:
	bash util/generate_certificate.sh

generate_token:
	bash util/generate_token.sh

serve:
	bash util/generate_certificate.sh
	bash util/generate_token.sh
	python src/receipt_server.py

PHONY: docker-build
docker-build:
	docker build -t RebelSoftware/receipt-parser-server .

.PHONY: docker-push
docker-push:
	docker push RebelSoftware/receipt-parser-server

.PHONY: docker-run
docker-run:
	bash util/launcher.sh
