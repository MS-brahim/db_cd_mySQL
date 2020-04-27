--insert 
insert into archive values(1,'Uti1','Ser1','Cat1','Gui1','BMCBANk',27-04-2020,'20')
insert into Bureau values(3,'Hay wrida 2','CIH')

--update
update Bureau set nom = 'CIH'
WHERE nom='BANK CHAABI';

--delete 
DELETE FROM Bureau 
WHERE nom = 'BANK CHAABI';