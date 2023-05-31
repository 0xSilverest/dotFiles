select * from clients
    left join coordinator_infos ci on clients.id = ci.client_id
    where site_id = 'johan' and '1233' in (select tag from client_tags where clients.id = client_tags.client_id);