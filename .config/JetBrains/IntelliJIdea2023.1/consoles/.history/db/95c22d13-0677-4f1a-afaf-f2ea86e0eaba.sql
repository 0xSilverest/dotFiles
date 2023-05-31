use mmcalldb;
;-- -. . -..- - / . -. - .-. -.--
client.createIndex({"tags":1});
;-- -. . -..- - / . -. - .-. -.--
createIndex({"tags":1});
;-- -. . -..- - / . -. - .-. -.--
mmcalldb.;
;-- -. . -..- - / . -. - .-. -.--
mmcalldb.client.createIndex({"tags":1});
;-- -. . -..- - / . -. - .-. -.--
db.collection.createIndex({"tags":1});
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({"tags":1});
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({ "site_id": 1});;
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({ "tags": 1});;
;-- -. . -..- - / . -. - .-. -.--
db.collections.createIndex({ "tags": 1});;
;-- -. . -..- - / . -. - .-. -.--
db.collection.createIndex({ "tags": 1});;
;-- -. . -..- - / . -. - .-. -.--
db.client.deleteIndex("site_id_1);;
;-- -. . -..- - / . -. - .-. -.--
db.client.deleteIndex("site_id_1");;
;-- -. . -..- - / . -. - .-. -.--
db.client.dropIndex("site_id_1");;
;-- -. . -..- - / . -. - .-. -.--
db.clients.createIndex({"tags": 1});
;-- -. . -..- - / . -. - .-. -.--
db.clients.get({"tags": 1});
;-- -. . -..- - / . -. - .-. -.--
db.clients.getIndexes();;
;-- -. . -..- - / . -. - .-. -.--
db.clients.getIndex();;
;-- -. . -..- - / . -. - .-. -.--
db.client.getIndexes();;
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({ tags: 1 }, { unique: true});
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({ tags: 1 });
;-- -. . -..- - / . -. - .-. -.--
db.client.getIndexes({ tags: -1 });
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({ tags: -1 });
;-- -. . -..- - / . -. - .-. -.--
db.client.dropIndex("tags_1");;
;-- -. . -..- - / . -. - .-. -.--
db.client.ensureIndex({"tags":1});;
;-- -. . -..- - / . -. - .-. -.--
db.client.getIndexes();
;-- -. . -..- - / . -. - .-. -.--
db.client.dropIndex("tags_1");
;-- -. . -..- - / . -. - .-. -.--
db.client.dropIndex("tags_-1");
;-- -. . -..- - / . -. - .-. -.--
db.collections.client.createIndex({"tags": 1});
;-- -. . -..- - / . -. - .-. -.--
db.client.createIndex({"tags": 1});
;-- -. . -..- - / . -. - .-. -.--
mmcalldb.client.createIndex({"tags": 1});