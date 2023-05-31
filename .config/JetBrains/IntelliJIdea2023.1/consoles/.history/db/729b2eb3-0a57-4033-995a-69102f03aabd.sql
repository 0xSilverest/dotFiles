use mmcalldb;
;-- -. . -..- - / . -. - .-. -.--
delete from client_tags;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator_infos;
;-- -. . -..- - / . -. - .-. -.--
delete from clients;
;-- -. . -..- - / . -. - .-. -.--
select * from clients;
;-- -. . -..- - / . -. - .-. -.--
select * from clients where site_id="stellantis_sochaux";
;-- -. . -..- - / . -. - .-. -.--
select * from clients where site_id="johan";
;-- -. . -..- - / . -. - .-. -.--
select * from clients join coordinator_infos ci on clients.id = ci.client_id
    where site_id='johan' and ('123' in (select tag from client_tags where clients.id = client_tags.client_id));
;-- -. . -..- - / . -. - .-. -.--
select * from clients join coordinator_infos ci on clients.id = ci.client_id
    where ('123' in (select tag from client_tags where clients.id = client_tags.client_id));
;-- -. . -..- - / . -. - .-. -.--
select * from clients join coordinator_infos ci on clients.id = ci.client_id
    where '123' in (select tag from client_tags where clients.id = client_tags.client_id);
;-- -. . -..- - / . -. - .-. -.--
select * from clients join coordinator_infos ci on clients.id = ci.client_id
    where '1233' in (select tag from client_tags where clients.id = client_tags.client_id);
;-- -. . -..- - / . -. - .-. -.--
select * from clients join coordinator_infos ci on clients.id = ci.client_id
    where "1233" in (select tag from client_tags where clients.id = client_tags.client_id);
;-- -. . -..- - / . -. - .-. -.--
select * from clients
    join coordinator_infos ci on clients.id = ci.client_id
    where '1233' in (select tag from client_tags where clients.id = client_tags.client_id);
;-- -. . -..- - / . -. - .-. -.--
select * from clients
    left join coordinator_infos ci on clients.id = ci.client_id
    where '1233' in (select tag from client_tags where clients.id = client_tags.client_id);
;-- -. . -..- - / . -. - .-. -.--
select * from clients
    left join coordinator_infos ci on clients.id = ci.client_id
    where site_id = 'johan' and '1233' in (select tag from client_tags where clients.id = client_tags.client_id);