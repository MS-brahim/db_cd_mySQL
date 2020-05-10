USE GestionBank;


insert into archive (idArchive, Ser_idService, Gui_idGuichet, Uti_idUtilisateur, Cat_idCategorie, nom, date, taille) VALUES 
(1,23, 45, 40, 50,'BMCBANk', 27-04-2020 05:22:00, 80);


insert into Bureau (idBureau, Sec_idSecteur, nom) values (1, 23,'CIH');
insert into Bureau (idBureau, Sec_idSecteur, nom) values (2, 44,'BMCE');
insert into Bureau (idBureau, Sec_idSecteur, nom) values (3, 90,'CASH');
insert into Bureau (idBureau, Sec_idSecteur, nom) values (4, 67,'CDMR');
insert into Bureau (idBureau, Sec_idSecteur, nom) values (5, 34,'WAFAA');

--update
update Bureau set nom = 'CIH'
WHERE nom='BANK1';


--delete 
DELETE FROM Bureau 
WHERE nom = 'CDMR';
