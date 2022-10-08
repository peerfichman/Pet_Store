use pet_store;

insert into pet_type (pet_type_id, pet_type_name)
values 	(1, "dog"),
		(2, "cat"),
		(3, "horse"),
		(4, "parrot"),
		(5,"snake"),
		(6, "rabbit"),
		(7, "hamster"), 
		(8, "fish"),
		(9, "racoon"),
		(10, "lizard");

insert into pet (pet_id,pet_type_id,pet_name,pet_age)
values 	(1, 1, "rexi", 3.5),
		(2, 1, "star", 2.3),
        (3, 2, "mitzi", 1.4),
        (4, 3, "itzko", 7),
        (5, 4, "jacky", 2),
        (6, 5, "alfred", 0.7),
        (7, 6, "rico", 1),
        (8, 6, "shimon", 2.1),
        (9, 7, "pedro", 3.1),
        (10, 2, "rona", 2.1);
        

insert into customer (cust_id, cust_fname, cust_lname, cust_phone, cust_address)
values		(1, "shir", "levi", "0521276651", "herzel 202, rehovot"),
			(2, "dana", "cohen", "0526312249", "hahagana 2, ramat gan"),
            (3, "nimrod", "alush", "0536118401", "binyamin 4, bney brak"),
            (4, "shimon", "nir", "0534442311", "hacarmel 71, haifa"),
            (5, "kobi", "peretz", "0548912735", "halimon 3, bat yam"),
            (6, "leo", "messi", "0555566712", "harimon 12, be'er yakov"),
            (7, "ronen", "farkush", "0547815431", "yabetz 31, ramla"),
            (8, "rotem", "schur", "051456781", "busteny 13, rishon lezion"),
            (9, "dafna", "amrami", "055546328", "hayovel 41, rahat"),
            (10, "shira", "baruch", "0526713481", "hameyasdim 31, sderot"),
			(11, "ofer", "nissim", "0528525361", "geffen 17, kiryat shmona"),
            (12, "yuval", "shual", "055444428", "kineret 21, mode'ein"),
            (13, "yossi", "shem-tov", "0526713566", "shalechet 33, sderot");
		
            
insert into customer_pet (cust_id, pet_id)
values 		(1, 3),
			(2, 5),
			(3, 1),
            (4, 4),
            (5, 2),
            (6, 8),
            (7, 7),
            (8, 10),
            (8, 9),
            (10, 6);
            
insert into prod_catagory (cat_id, cat_name)
values 		(1, "beds"),
			(2, "toys"),
            (3, "food"),
            (4, "placements"),
            (5, "collar"),
            (6, "cleaning products"),
            (7, "medicine"),
            (8, "cages"),
            (9, "doghouse"),
            (10, "aquarium");
            
insert into product (prod_id, prod_name, cat_id, prod_desc, prod_price, prod_quant)
values 		(1, "bed for dog", 1, "bed for dog", 53.4, 250),
			(2, "bed for cat", 1, "bed for cat", 52.4, 253),
            (3, "bone toy", 2, "bone toy for dog", 13.3, 534),
            (4, "mouse toy", 2, "mouse toy for cat", 3.2, 1500),
            (5, "food for dog", 3, "food for dog", 103.5, 1250),
            (6, "food for cat", 3, "food for cat", 103.5, 1353),
            (7, "tuna food for cat", 3, "tuna food for cat", 7.5, 3458),
            (8, "food placement for dog", 4, "food placement for dog", 13.5, 122),
            (9, "food placement for cat", 4, "food placement for cat", 13.5, 137),
            (10, "food placement for hamster", 4, "food placement for hamster", 6.3, 57),
			(11, "collar for dog", 5, "collar for dog", 11.3, 758),
            (12, "collar for cat", 5, "collar for cat", 9, 611),
            (13, "shampoo", 6, "shampoo for any animal", 11.3, 125),
            (14, "soap", 6, "soap for cleaning horseshoe ", 4.7, 35),
            (15, "antibiotics", 7, "antibiotics for animals", 21.3, 65),
            (16, "horse tranquilizer", 7, "horse tranquilizer", 101.75, 12),
			(17, "small bird cage", 8, "small bird cage", 75, 315),
            (18, "medium bird cage", 8, "medium bird cage", 125.5, 155),
            (19, "large bird cage", 8, "large bird cage", 200.7, 33),
            (20, "standard doguhouse", 9, "medium size doghouse for any dog", 131, 74),
            (21, "small aquarium", 10, "small size aquarium for fish", 27.7, 579),
            (22, "medium aquarium", 10, "medium size aquarium for fish", 59.9, 311),
            (23, "large aquarium", 10, "large size aquarium for fish", 129.5, 125);
            
            

insert into role (role_id, role_name)
values 		(1, "seller"),
			(2, "storekeeper"),
            (3, "delivery person");
            
            
insert into worker (worker_id, role_id, work_fname, work_lname, work_phone, work_address)
values 				(1, 1, "shaul", "davidovich", "0502130707", "hayalot 2, petah tekva"),
					(2, 1, "marina", "prekovski", "054742199", "dereh yerushalim 300, ramat gan"),
                    (3, 1, "menahem", "ben-salman", "0509888531", "antiyuchus 90, ashkelon"),
                    (4, 1, "fatima", "abusalim", "0558915734", "derh yafo 12c, tel-aviv-yafo"),
                    (5, 2, "mordehay", "shmueli", "0548937813", "hapoalim 12, givataim"),
                    (6, 2, "sason", "dahari", "0548917854", "hayudika 3, rishon letzion"),
                    (7,3, "avi", "taganga", "055891781", "habroshim 35, rehovot"),
                    (8, 3, "ludmila", "makov", "053784281", "hnetanyatim 35, ashdod"),
                    (9, 3, "moshe", "mesholam", "0558913627", "ben-yehuda 31, bney brak"),
                    (10,3, "yafa", "yarkoni", "051437655", "shalom aliechem 21, harish");


insert into Orders (cust_id, worker_id, ord_time ,ord_act)
values				(1, 1, DATE_ADD(now(), interval -3 month), 0),
					(2, 2, DATE_ADD(now(), interval -7 month), 0),
                    (3, 3, DATE_ADD(now(), interval -11 day), 1),
                    (4, 4, DATE_ADD(now(), interval -15 day) ,0),
                    (5, 3, DATE_ADD(now(), interval -15 day) ,1),
                    (6, 2, DATE_ADD(now(), interval -16 day) ,1),
                    (7, 1, DATE_ADD(now(), interval -18 day) ,1),
                    (8, 4, DATE_ADD(now(), interval -19 day) ,1),
                    (9, 3, DATE_ADD(now(), interval -19 day) ,1),
					(10, 2, DATE_ADD(now(), interval -5 month), 0),
					(8, 4, DATE_ADD(now(), interval -23 day) ,1),
                    (9, 3, DATE_ADD(now(), interval -26 day) ,1),
					(10, 2, DATE_ADD(now(), interval -7 month), 0);
				

               
    
    
insert into orders_products (order_id, prod_id, prod_ord_quant)
values 				(1, 3, 5),
					(1, 1, 1),
                    (1, 5, 2),
					(2, 18, 1),
                    (3, 20, 1),
                    (3, 8, 3),
                    (4, 7, 2),
                    (5, 11, 1),
                    (5, 10, 3),
                    (5, 13, 2),
                    (6, 1, 1),
                    (7, 2, 1),
                    (7, 4, 3),
                    (8, 23, 1),
                    (8, 12, 2),
                    (9, 15, 3),
                    (9, 16, 1),
                    (10, 9, 2),
                    (10, 7, 3),
					(11, 16, 1),
                    (12, 9, 2),
                    (13, 7, 3);
                    

