delete from coordinator;
delete from coordinator_info;
Delete from clients;

SET synchronous_commit TO OFF;
SET synchronous_commit=false;

show synchronous_commit ;