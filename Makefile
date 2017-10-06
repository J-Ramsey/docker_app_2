installation:
	docker-compose build
	docker-compose up -d
	grep -q -F "app.docker" /etc/hosts || echo "192.168.99.100 app.docker" | sudo tee -a /etc/hosts
	docker-compose exec php composer install --no-interaction
	docker-compose exec php chown -R www-data:www-data ./var/
