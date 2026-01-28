use regex1;

-- another connection (testing)
select * from actor_cp2;
insert into actor_cp2 values(6,'tushar');-- coz auto commit is enable
select * from actor_cp2;
set @@autocommit=0;
insert into actor_cp2 values(7,'Ajay');
commit; -- commit to make changes permanent (like now ajay will also show in main connection)
select * from actor_cp2;

-- if i do rollback then again the transaction which i done will be disable 
insert into actor_cp2 values(8,'testoo');
update actor_cp2 set actor_id=1000;
rollback;
select * from actor_cp2;


start transaction; -- either do auto commit enable or start transaction(changes will go on temporary stage)
insert into actor_cp2 values(9,'testo2'); -- let's see on main connection
select * from actor_cp2;
commit; -- make permanent changes

select * from actor_cp2;-- creating another table from another connection also make changes permanent, and now i can see from here

select * from actor_cp2;