use Tetraedri;

-- Fill brands
insert into auto_brands values
(null, 'TOYOTA'),(null, 'VOLKSWAGEN'),(null, 'MAZDA'),(null, 'NISSAN'),(null, 'SKODA'),(null, 'RENAULT'),(null, 'MITSUBISHI'),
(null, 'MERSEDES-BENZ'),(null, 'HYUNDAI'),(null, 'KIA'),(null, 'AUDI'),(null, 'HONDA'),(null, 'FORD'),(null, 'BMW'),
(null, 'LEXUS'),(null, 'SUBARU'),(null, 'SUZUKI'),(null, 'CHEVROLET'),(null, 'CHRYSLER'),(null, 'GMC'),(null, 'HUMMER'),
(null, 'JEEP'),(null, 'TESLA'),(null, 'PORSCHE'),(null, 'OPEL'),(null, 'LAND ROVER'),(null, 'VOLVO'),(null, 'SAAB'),
(null, 'CITROEN'),(null, 'FIAT'),(null, 'MINI'),(null, 'ALFA ROMEO'),(null, 'ROVER'),(null, 'FERRARI'),(null, 'ROLLS-ROYCE');

-- Fill persons
call add_person ('ROZA BOGDANAVIČIENĖ', 'ROZA BOGDANAVIČIENĖ', null, 1, 'Architektų gatvė, 136-7, Vilnius, Lietuva', null, null, null, null);
call add_person ('LINA RUTKAUSKAITĖ', 'LINA RUTKAUSKAITĖ', null, 1, 'Vaikų gatvė, 15-27, Vilnius, Lietuva', null, null, null, null);
call add_person ('GENNADIJUS TIURICHINAS', 'GENNADIJUS TIURICHINAS', null, 1, 'Kelmijos sodų 48-oji g.4, Vilnius, Lietuva', null, null, null, null);
call add_person ('JELENA KOVGER', 'JELENA KOVGER', null, 1, 'Fabijoniškių g. 73-93, Vilnius, Lietuva', null, null, null, null);
call add_person ('ANDREJ TARASEVIČ', 'ANDREJ TARASEVIČ', null, 1, 'Kelmijos gatvė, 46, Vilnius, Lietuva', null, null, null, null);
call add_person ('RONALD ŽUKOVSKIJ', 'RONALD ŽUKOVSKIJ', null, 1, 'Stanevičiaus g. 38-16, Vilnius, Lietuva', null, null, null, null);
call add_person ('Jurgena', 'UAB "Jurgena"', null, 2, 'Architektų g. 194-3, Vilnius, Lietuva', null, null, 122769753, null);
call add_person ('SPARTA', 'UAB Apsaugos grupė "SPARTA"', null, 2, 'Lvovo g. 105A, Vilnius, Lietuva', null, null, 303564379, 'LT100009922616');
call add_person ('Nijolė Stankūnienė', 'Nijolė Stankūnienė', null, 1, 'Atgimimo g.32, Lentvaris, Trakų r.sav., Lietuva', null, null, null, null);
call add_person ('Febulas', 'UAB "Febulas"', null, 2, 'Perkūnkiemio g. 13-91, Vilnius, Lietuva', null, null, 304491603, null);
call add_person ('Bentena', 'UAB "BENTENA LT"', null, 2, 'Apkasų 12A-12, Vilnius, Lietuva', null, null, 305425111, 'LT100012919410');
call add_person ('Andžej Rozmyslovič', 'Andžej Rozmyslovič', null, 1, 'Gerviškes Ežero g. 14, Lietuva', null, null, null, null);
call add_person ('DORVITA', 'UAB "DORVITA"', null, 2, 'Justiniškių g.14 - 305, Vilnius, Lietuva', null, null, 300524625, 'LT100004059610');
call add_person ('Magnum iter', 'UAB "Magnum iter"', null, 2, 'Žibuoklių g.2, Kėdainiai, Lietuva', null, null, 161447974, 'LT614479716');
call add_person ('KLIUKOVIČ VIKTOR', 'KLIUKOVIČ VIKTOR', null, 1, 'Pupinės g. 1A-17, Vilnius, Lietuva', null, null, null, null);
call add_person ('DMITRIJ TIURICHIN', 'DMITRIJ TIURICHIN', null, 1, 'Justiniškių g. 69-17, Vilnius, Lietuva', null, null, null, null);
call add_person ('Agnė Pažusytė-Samalavičienė', 'Agnė Pažusytė-Samalavičienė', null, 1, 'Kelmijos sodų 59-oji g.14, Vilnius, Lietuva', null, null, null, null);
-- and fill workers
call add_person ('Vladimir Gorshkov', 'Vladimir Gorshkov', '+37064842096', 3, 'Kelmijos g. 1, Vilnius, Lietuva', null, null, null, null);
call add_person ('Igor', 'Igor mechanik', '+37060841023', 3, 'Kelmijos sodų 63-oji g. 4, Vilnius, Lietuva', null, null, null, null);


-- Fill automobiles
insert into automobile values
(1, 1, 17, 'GRAND VITARA', null, null),
(2, 2, 2, 'GOLF', null, null),
(3, 3, 25, 'ZAFIRA', null, null),
(4, 4, 25, 'ASTRA STATION VAGON', null, null),
(5, 5, 10, '', null, null),
(6, 6, 2, 'PASSAT', null, null),
(7, 8, 27, 'XC60', null, null),
(8, 9, 19, 'CONCORDE', null, null),
(9, 10, 2, 'TOUAREG', null, null),
(10, 11, 2, 'ESPACE', null, null),
(11, 15, 2, 'GOLF', null, null),
(12, 16, 11, 'A6', null, null),
(13, 17, 1, 'COROLLA', null, null),
(14,10, 2, 'Sharan', 'LRL 849', null)
;


-- Fill types_work
insert into types_work values
(1, 'PREP_TECH', 'Подготовка к тех.осмотру', 'Pasirengimas techninei apžiūrai'),
(2, 'REPAIR', 'Ремонт автомобиля','Automobilio remontas'),
(3, 'SELL', 'Продажа запчастей', 'Pardavimas dalys'),
(4, 'CONSULT', 'Консультация', 'Konsultacijos'),
(5, 'SELECT', 'Подбор автомобиля', 'Automobilio pasirinkimas');


-- Fill orders
insert into orders values
(1, STR_TO_DATE('04.01.2021', '%d.%c.%Y'), STR_TO_DATE('04.01.2021', '%d.%c.%Y'), 'ended', null, 1, 1, null, 65.00, null),
(2, STR_TO_DATE('05.01.2021', '%d.%c.%Y'), STR_TO_DATE('05.01.2021', '%d.%c.%Y'),'ended', null, 2, 2, null, 140.00, null),
(3, STR_TO_DATE('14.01.2021', '%d.%c.%Y'), STR_TO_DATE('14.01.2021', '%d.%c.%Y'),'ended', null, 3, 3, null, 250.00, null),
(4, STR_TO_DATE('25.01.2021', '%d.%c.%Y'), STR_TO_DATE('25.01.2021', '%d.%c.%Y'),'ended', null, 4, 4, null, 100.00, null),
(5, STR_TO_DATE('10.02.2021', '%d.%c.%Y'), STR_TO_DATE('10.02.2021', '%d.%c.%Y'),'ended', null, 5, 5, null, 230.00, null),
(6, STR_TO_DATE('15.02.2021', '%d.%c.%Y'), STR_TO_DATE('15.02.2021', '%d.%c.%Y'),'ended', null, 6, 6, null, 180.00, null),
(7, STR_TO_DATE('18.02.2021', '%d.%c.%Y'), STR_TO_DATE('18.02.2021', '%d.%c.%Y'),'ended', null, null, 7, null, 150.00, null),
(8, STR_TO_DATE('10.03.2021', '%d.%c.%Y'), STR_TO_DATE('10.03.2021', '%d.%c.%Y'),'ended', null, 7, 8, null, 1680.00, null),
(9, STR_TO_DATE('31.03.2021', '%d.%c.%Y'), STR_TO_DATE('31.03.2021', '%d.%c.%Y'),'ended', null, 8, 9, null, 200.00, null),
(10, STR_TO_DATE('07.04.2021', '%d.%c.%Y'), STR_TO_DATE('07.04.2021', '%d.%c.%Y'),'ended', null, 9, 10, null, 480.00, null),
(11, STR_TO_DATE('09.04.2021', '%d.%c.%Y'), STR_TO_DATE('09.04.2021', '%d.%c.%Y'),'ended', null, 10, 11, null, 190.00, null),
(12, STR_TO_DATE('14.04.2021', '%d.%c.%Y'), STR_TO_DATE('14.04.2021', '%d.%c.%Y'),'ended', null, 7, 8, null, 730.00, null),
(13, STR_TO_DATE('21.04.2021', '%d.%c.%Y'), STR_TO_DATE('21.04.2021', '%d.%c.%Y'),'ended', null, null, 12, null, 190.00, null),
(14, STR_TO_DATE('14.05.2021', '%d.%c.%Y'), STR_TO_DATE('14.05.2021', '%d.%c.%Y'),'ended', null, null, 13, null, 260.00, null),
(15, STR_TO_DATE('28.05.2021', '%d.%c.%Y'), STR_TO_DATE('28.05.2021', '%d.%c.%Y'),'ended', null, 7, 8, null, 390.00, null),
(16, STR_TO_DATE('07.06.2021', '%d.%c.%Y'), STR_TO_DATE('07.06.2021', '%d.%c.%Y'),'ended', null, null, 14, null, 80.00, null),
(17, STR_TO_DATE('15.06.2021', '%d.%c.%Y'), STR_TO_DATE('15.06.2021', '%d.%c.%Y'),'ended', null, 11, 15, null, 60.00, null),
(18, STR_TO_DATE('17.06.2021', '%d.%c.%Y'), STR_TO_DATE('17.06.2021', '%d.%c.%Y'),'ended', null, 12, 16, null, 490.00, null),
(19, STR_TO_DATE('23.06.2021', '%d.%c.%Y'), STR_TO_DATE('23.06.2021', '%d.%c.%Y'),'ended', null, 13, 17, null, 380.00, null),
(20, STR_TO_DATE('06.07.2021', '%d.%c.%Y'), STR_TO_DATE('06.07.2021', '%d.%c.%Y'),'ended', null, 14, 10, null, 700.00, null)
;


insert into contracts values
(null, 8, 'TET21-1', STR_TO_DATE('10.03.2021', '%d.%c.%Y'), STR_TO_DATE('09.03.2022', '%d.%c.%Y'))
;

-- Fill documents
insert into documents values
(1, 'T21 Nr.1', STR_TO_DATE('04.01.2021', '%d.%c.%Y'), 1),
(2, 'T21 Nr.2', STR_TO_DATE('05.01.2021', '%d.%c.%Y'), 2),
(3, 'T21 Nr.3', STR_TO_DATE('14.01.2021', '%d.%c.%Y'), 3),
(4, 'T21 Nr.4', STR_TO_DATE('25.01.2021', '%d.%c.%Y'), 4),
(5, 'T21 Nr.5', STR_TO_DATE('10.02.2021', '%d.%c.%Y'), 5),
(6, 'T21 Nr.6', STR_TO_DATE('15.02.2021', '%d.%c.%Y'), 6),
(7, 'T21 Nr.7', STR_TO_DATE('18.02.2021', '%d.%c.%Y'), 7),
(8, 'T21 Nr.8', STR_TO_DATE('10.03.2021', '%d.%c.%Y'), 8),
(9, 'T21 Nr.9', STR_TO_DATE('31.03.2021', '%d.%c.%Y'), 9),
(10, 'T21 Nr.10', STR_TO_DATE('07.04.2021', '%d.%c.%Y'), 10),
(11, 'T21 Nr.11', STR_TO_DATE('09.04.2021', '%d.%c.%Y'), 11),
(12, 'T21 Nr.12', STR_TO_DATE('14.04.2021', '%d.%c.%Y'), 12),
(13, 'T21 Nr.13', STR_TO_DATE('21.04.2021', '%d.%c.%Y'), 13),
(14, 'T21 Nr.14', STR_TO_DATE('14.05.2021', '%d.%c.%Y'), 14),
(15, 'T21 Nr.15', STR_TO_DATE('28.05.2021', '%d.%c.%Y'), 15),
(16, 'T21 Nr.16', STR_TO_DATE('07.06.2021', '%d.%c.%Y'), 16),
(17, 'T21 Nr.17', STR_TO_DATE('15.06.2021', '%d.%c.%Y'), 17),
(18, 'T21 Nr.18', STR_TO_DATE('17.06.2021', '%d.%c.%Y'), 18),
(19, 'T21 Nr.19', STR_TO_DATE('17.06.2021', '%d.%c.%Y'), 19),
(20, 'T21 Nr.20', STR_TO_DATE('06.07.2021', '%d.%c.%Y'), 20)
;

-- Fill Kasos orders(KPO) 
ALTER TABLE tetraedri.kpo AUTO_INCREMENT = 1;
call add_kpo('1,2,3,4,5,6,7,8,9,10,12,13,14,15,17,18,19,20,'); 

DELETE FROM tetraedri.orders_items
WHERE id=22;


-- Fill orders_items
insert into orders_items values
(null, 1, 2, 18, null, 18, 30, 35, 'замена лампочек'),
(null, 2, 2, 18, null, 45, 60, 80, 'замена переднего ступичного подшипника'),
(null, 3, 2, 18, null, 97, 140, 110, 'замена ремня ГРМ, комплект ГРМ'),
(null, 4, 2, 18, null, 0, 0, 100, 'ремонт левой передней двери'),
(null, 5, 2, 18, null, 85, 100, 130,'ремонт правой передней двери и крыла'),
(null, 6, 2, 18, null, 53, 80, 100,'замена пыльника шруса, замена шаровой'),
(null, 7, 3, 18, 1, 46, 150, 0, 'продажа пневмозапчастей'),
(null, 8, 2, 18, null, 413, 915, 845, 'кузовные работы'),
(null, 9, 2, 18, null, 64, 110, 90, 'замена заднего ступичного подшипника, подготовка к техосмотру: диски'),
(null, 10, 2, 18, null, 22.5, 60, 70, 'замена масла и фильтров в двигателе, реемент суппортов'),
(null, 10, 2, 19, null, 115, 200, 150, 'замена сцепления'),
(null, 11, 2, 18, null, 38, 95, 85, 'кузовные работы'),
(null, 12, 2, 18, null, 22, 65, 85, 'замена рулевой тяги, тормозных дисков и колодок, замена масла'),
(null, 13, 2, 19, null, 245, 330, 250, 'замена коробки передач'),
(null, 13, 2, 18, null, 25.3, 60, 60, 'ремонт крышки багажника'),
(null, 14, 2, 18, null, 87, 140, 120, 'замена стоек амортизаторов, замена привода'),
(null, 15, 2, 18, null, 156, 210, 180, 'замена сцепления и привода'),
(null, 16, 3, 18, 2, 35, 80, 0, 'ремкомплект'),
(null, 17, 2, 19, null, 25, 40, 20, 'замена бампера'),
(null, 18, 2, 18, null, 207, 300, 190, 'замена сцепления, стоек амортизаторов в сборе, замена масла'),
(null, 19, 2, 18, null, 144, 210, 170, 'заправка кондиционера,замена масла и фильтров, сайлентблока, передних тормозных дисков и колодок')б
(null, 20, 2, 18, null, 273, 400, 300, 'замена двигателя')
;




