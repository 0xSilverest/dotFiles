create table coordinator_info (
    client_id varchar(255) not null,
     coordinator_id varchar(255) not null,
      c_additional_infos jsonb, c_expected_date bigint default 0, order_index integer not null, status smallint, primary key (client_id, coordinator_id)) engine=InnoDB