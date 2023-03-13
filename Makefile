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
	docker-compose exec php chmod -R 777 src/storage
	docker-compose exec php chmod -R 777 src/bootstrap/cache
	mv src/* .
	mv src/.[^\.]* .
	rm -rf src
ps:
	docker ps
