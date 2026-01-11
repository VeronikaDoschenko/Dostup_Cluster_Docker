@echo off
echo init Tables...


docker cp .\midpoint-dist\doc\config\sql\native\postgres.sql dostup_cluster_docker-postgres-1:/tmp/postgres.sql
docker cp .\midpoint-dist\doc\config\sql\native\postgres-audit.sql dostup_cluster_docker-postgres-1:/tmp/postgres-audit.sql
docker cp .\midpoint-dist\doc\config\sql\native\postgres-quartz.sql dostup_cluster_docker-postgres-1:/tmp/postgres-quartz.sql


docker compose exec postgres psql -U midpoint_user_cluster -d midpoint_cluster -f /tmp/postgres.sql
docker compose exec postgres psql -U midpoint_user_cluster -d midpoint_cluster -f /tmp/postgres-audit.sql
docker compose exec postgres psql -U midpoint_user_cluster -d midpoint_cluster -f /tmp/postgres-quartz.sql

echo Ready!
pause
