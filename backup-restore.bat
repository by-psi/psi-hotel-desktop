@ECHO OFF
mysql\mysqlcheck -uroot -pvertrigo psi_hotel --auto-repair
mysql\mysql -uroot -pvertrigo psi_hotel < backup\mybackup.sql
ver


