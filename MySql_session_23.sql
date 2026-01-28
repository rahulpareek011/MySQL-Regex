-- TCL
-- Transaction => set of logical statement (not permanent)
-- update

use regex1;
create table actor_cp2 as select actor_id,first_name from sakila.actor where actor_id between 1 and 5;
select * from actor_cp2;

-- now insertion in same table from another connection will be also shown in database
-- because in mysql by default autocommit is enable
select @@autocommit;-- 1 means enable
-- now after disabling the autocommit
-- then we tcl for maintaing data consistency

select * from actor_cp2; -- from another connection after disabling the auto commit and inserting one value , now that value is not showing
-- this connection

-- to make changes permanent

-- when my transaction are going to be close?
-- when i use tcl commands statement like rollback and commit or in case i use any DDL/DCL Operation then also my connection will get close

commit;
select * from actor_cp2;-- from test connection transaction started for temporary change but then changes commites so, its showing changes here

start transaction;
insert into actor_cp2 values(13,'flipkart');
insert into actor_cp2 value(14,'amazon');
create table temporary(id int);-- this ddl command will make changes permanent
select * from actor_cp2;

start transaction;
insert into actor_cp2 values(14,'abc');

insert into actor_cp2 values(15,'cdf');
delete from actor_cp2 where actor_id in(2,3,5);
rollback;
select * from actor_cp2;

start transaction;-- this will not enable commit even if we write ddl command
insert into actor_cp2 values(18,'afasadsf');
insert into actor_cp2 values(19,'dsjadsfdsdsd');
-- save point (it is basically a check point like i'm saving my work at a particular point)
savepoint db_actor_cp;
delete from actor_cp2 where actor_id in (15);
rollback to db_actor_cp;
select * from actor_cp2;


-- Tuesday Test