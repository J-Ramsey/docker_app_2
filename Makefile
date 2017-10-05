DM_IP := $(shell docker-machine ip)

du:
	docker-compose up -d --build
	grep -q -F "app.docker" /etc/hosts || echo "$(DM_IP) app.docker" | sudo tee -a /etc/hosts