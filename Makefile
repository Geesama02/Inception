all:
	cd srcs && docker compose build && docker compose up -d

down:
	cd srcs && docker compose down

fclean:
	@docker stop $$(docker ps -qa) 2>/dev/null; \
	docker rm $$(docker ps -qa) 2>/dev/null; \
	docker rmi -f $$(docker images -qa) 2>/dev/null; \
	docker volume rm $$(docker volume ls -q) 2>/dev/null; \
	docker network rm $$(docker network ls -q) 2>/dev/null || true; \
	rm -rf /home/oait-laa/data/wordpress_files/* /home/oait-laa/data/wordpress_data/*

re: fclean all
