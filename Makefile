d-up:
	docker-compose up -d
d-down:
	docker-compose down
d-build:
	docker-compose build --no-cache
d-destroy:
	docker-compose down --rmi all --volumes --remove-orphans
p-bash:
	docker-compose exec php bash
n-bash:
	docker-compose exec node bash
i-laravel:
	docker-compose exec php composer create-project --prefer-dist laravel/laravel src
	docker-compose exec php php src/artisan key:generate
	chmod -R 777 src
	mv src/* src/.[^\.]* .
	rm -rf src
	docker-compose exec php chown www-data:www-data storage
	docker-compose exec php chown www-data:www-data bootstrap/cache
ps:
	docker ps
