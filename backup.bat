@ECHO OFF
mysql\mysqlcheck -uroot -pvertrigo psi_hotel --auto-repair
mysql\mysqldump  -uroot -pvertrigo psi_hotel > backup\mybackup.sql
dir backup\
ver
