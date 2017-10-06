DM_IP := $(shell docker-machine ip)

install:
	docker-compose build
	docker-compose up -d
	grep -q -F "app.docker" /etc/hosts || echo "$(DM_IP) app.docker" | sudo tee -a /etc/hosts
	docker-compose exec php composer install --no-interaction
	docker-compose exec chown -R www-data:www-data ./var/
