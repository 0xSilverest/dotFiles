DELETE FROM coordinator_info;
DELETE FROM clients;
DELETE FROM coordinator;
SELECT * FROM clients c LEFT JOIN coordinator_info ci on c.id=ci.client_id WHERE tags @> '"falRrjTVLi"';