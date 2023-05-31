select * from clients c join left  cross join coordinator_info ci on c.id = ci.client_f_id;
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci on ci.client_f_id = c.id;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
Delete from clients;
;-- -. . -..- - / . -. - .-. -.--
SET synchronous_commit TO OFF;
;-- -. . -..- - / . -. - .-. -.--
SET synchronous_commit=false;
;-- -. . -..- - / . -. - .-. -.--
show synchronous_commit;
;-- -. . -..- - / . -. - .-. -.--
set synchronous_commit = OFF;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM clients;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator;
;-- -. . -..- - / . -. - .-. -.--
create database mmcall;
;-- -. . -..- - / . -. - .-. -.--
set synchronous_commit to off;