-- Active: 1758209741027@@192.168.3.61@3306@mysql
-- Membros: Ricardo Martins Gouveia e Esther Lopes Macedo
-- Primeiro configurar o arquivo de configuração do mysql no Master e depois no Slave, e resetar o serviço do mysql em ambos
-- Após isso criar um usuário responsavel pelas replicas no server Master "create user 'RICARDO'@'%' identified by 'root';" e dar a permissão de replica "GRANT REPLICATION SLAVE ON *.* TO 'RICARDO'@'%';"
-- Para finalização da replica basta executar esses comandos na maquina slave

STOP SLAVE;

CHANGE MASTER TO
  MASTER_HOST='192.168.56.1',
  MASTER_USER='RICARDO',
  MASTER_PASSWORD='root',
  MASTER_LOG_FILE='DESKTOP-6R679JD-bin.000026',
  MASTER_LOG_POS=3480;

START SLAVE;

show slave status\G;
SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;

