CREATE OR REPLACE FUNCTION json_intext(text) RETURNS json AS $$
SELECT json_in($1::cstring);
$$ LANGUAGE SQL IMMUTABLE;
;-- -. . -..- - / . -. - .-. -.--
CREATE CAST (text AS json) WITH FUNCTION json_intext(text) AS IMPLICIT;
;-- -. . -..- - / . -. - .-. -.--
delete coordinator;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM client_tags;
;-- -. . -..- - / . -. - .-. -.--
Select * from clients left join client_tags on clients.id = client_tags.client_id where client_tags.tags="0jAHO9nWr7xK";
;-- -. . -..- - / . -. - .-. -.--
Select * from clients left join client_tags on clients.id = client_tags.client_id where client_tags.tags='0jAHO9nWr7xK';
;-- -. . -..- - / . -. - .-. -.--
Select * from clients left join client_tags on clients.id = client_tags.client_id where '0jAHO9nWr7xK' in (client_tags.tags);
;-- -. . -..- - / . -. - .-. -.--
Select * from clients left join client_tags on clients.id = client_tags.client_id where 'TQiFKK-GGrXLpA' in (client_tags.tags);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> ['AlSraWip3ObOB'];
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> "'AlSraWip3ObOB'";
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> "AlSraWip3ObOB";
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> 'AlSraWip3ObOB';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags like 'AlSraWip3ObOB';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags ? 'AlSraWip3ObOB';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags ->> 'name' is not null;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags ->> 'VEqI44s4lGaPQnN' is not null;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> "\"VEqI44s4lGaPQnN;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> '"VEqI44s4lGaPQnN"';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> CAST('falRrjTVLi' as jsonb);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> CAST('"falRrjTVLi"' as jsonb);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients WHERE tags @> '"falRrjTVLi"';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients c INNER JOIN coordinator_info ci on c.id=ci.client_id WHERE tags @> '"falRrjTVLi"';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients c LEFT JOIN coordinator_info ci on c.id=ci.client_id WHERE tags @> '"falRrjTVLi"';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM mmcall.clients;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM clients;
;-- -. . -..- - / . -. - .-. -.--
select * from clients c join coordinator_info ci on c.id = ci.client_id where c.tags @> "UuumljTH"::jsonb;
;-- -. . -..- - / . -. - .-. -.--
select * from clients c join coordinator_info ci on c.id = ci.client_id where c.tags @> 'UuumljTH'::jsonb;
;-- -. . -..- - / . -. - .-. -.--
select * from clients c join coordinator_info ci on c.id = ci.client_id where c.tags @> 'UuumljTH';
;-- -. . -..- - / . -. - .-. -.--
select * from clients c join coordinator_info ci on c.id = ci.client_id where c.tags ? 'UuumljTH';
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags @> ['aXDPPkJj'];
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags ? '"aXDPPkJj"';
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags ? 'aXDPPkJj';
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags @> "'aXDPPkJj'";
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags @> 'aXDPPkJj';
;-- -. . -..- - / . -. - .-. -.--
select * from clients c left join coordinator_info ci
on c.id = ci.client_id where c.tags @> '"aXDPPkJj"';
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
delete from coordinator;
;-- -. . -..- - / . -. - .-. -.--
delete from clients;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM tag_clients;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator_info;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM coordinator;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM client_tag;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM tag;
;-- -. . -..- - / . -. - .-. -.--
DELETE FROM clients;