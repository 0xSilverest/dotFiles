DELETE FROM coordinator_clients;
;-- -. . -..- - / . -. - .-. -.--
select * fROM coordinator;
;-- -. . -..- - / . -. - .-. -.--
select * fROM clients;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients;
;-- -. . -..- - / . -. - .-. -.--
M cl;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE site_id='site1';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE site_id='site10';
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM client_tags WHERE client_id IN (SELECT id FROM clients WHERE id='1');
;-- -. . -..- - / . -. - .-. -.--
delete from client_tags;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator;
;-- -. . -..- - / . -. - .-. -.--
delete from clients;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM client_tags;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM clients;
;-- -. . -..- - / . -. - .-. -.--
SET synchronous_commit = false;
;-- -. . -..- - / . -. - .-. -.--
create database mmcall;
;-- -. . -..- - / . -. - .-. -.--
create table coordinator_info (client_id varchar(255) not null, coordinator_id varchar(255) not null, c_additional_infos jsonb, c_expected_date bigint default 0, order_index integer not null, status smallint, primary key (client_id, coordinator_id)) engine=InnoDB;