USE market_star_schema;

SELECT * FROM employees;

SHOW INDEXES FROM employees;

CREATE INDEX last_name_idx
ON employees(last_name);

SHOW INDEXES FROM employees;

ALTER TABLE employees
DROP INDEX last_name_idx;

SHOW INDEXES FROM employees;

SELECT * 
FROM employees
WHERE last_name='Krabs';

CREATE INDEX last_name_first_name_idx
ON employees(last_name, first_name);


CREATE TABLE `orders_dimen`(
	`Order_id` varchar(12) NOT NULL,
    `Order_Number` int(11) NOT NULL,
    `Order_Date` date DEFAULT NULL,
	`Order_Priority` varchar(25) DEFAULT NULL,
	PRIMARY KEY (`Order_id`),
    KEY `Order_Number_index` (`Order_Number`)
    );
    
    
CREATE TABLE `orders_dimen`(
	`Order_id` VARCHAR(12) NOT NULL,
    `Order_Number` INT NOT NULL,
    `Order_Date` date DEFAULT NULL,
    `Order_Priority` VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY (`Order_id`),
    KEY `Order_Number_Index`(`Order_Number`)
);

CREATE TABLE `orders_dimen`(
	`Order_id` VARCHAR(12) NOT NULL,
    `Order_Number` INT NOT NULL,
    `Order_Date` DATE DEFAULT NULL,
    `Order_Priority` VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY (`Order_id`),
    UNIQUE KEY `Order_number_index`(`Order_Number`)
    );
    
with least_losses as (
	select Prod_id, Profit, Product_Base_Margin
	from market_fact_full
	where Profit<0
	order by Profit desc
	limit 5)select *
    from least_losses
    where Product_Base_Margin=(
		select max(Product_Base_Margin)
        from least_losses
);


WITH least_losses AS (
	SELECT Prod_id, Profit, Product_Base_Margin
    FROM market_fact_full
    WHERE Profit<0
    ORDER BY Profit DESC
    limit 5
    )SELECT *
FROM least_losses
WHERE Product_Base_Margin=(
SELECT MA(Product_Base_Margin)
FROM least_losses);


create view order_info
as select Ord_id, Sales, Order_Quantity, Profit, Shipping_Cost
from market_fact_full;

USE market_star_schema;

CREATE VIEW order_info
AS(SELECT Ord_id, Sales,Order_Quantity, Profit, Shipping_Cost
FROM market_fact_full);

CREATE VIEW order_info AS 
(SELECT Ord_id, Sales, Order_Quantity, Profit, Shipping_Cost
FROM market_fact_full);

CREATE VIEW order_info AS 
(SELECT Ord_id, Sales, Order_Quantity, Profit, Shipping_Cost
FROM market_fact_full);

CREATE INDEX index_name
ON table_name(column_1,column_2,....);

CREATE INDEX indeX_name
ON table_name(column_1,column_2,...);


ALTER TABLE table_name
ADD INDEX index_name(column1,column2,...);

ALTER TABLE table_name
ADD INDEX index_name(column1,column2,....);


ALTER TABLE table_name
ADD INDEX index_name(column1,column2);

ALTER TABLE table_name
DROP INDEX index_name;


UPDATE `accounts`
SET `Balance` =`Balance`+50.00
WHERE `AccountID`=1;


UPDATE `table_name`
SET `column_name`=`column_name`+value
WHERE `condition`;



CREATE table department(
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);


CREATE TABLE `market_fact_full`(
	`Market_fact_id` INT NOT NULL,
    `Ord_id` VARCHAR(12) DEFAULT NULL,
    `Prod_id` VARCHAR(12) DEFAULT NULL,
    `Ship_id` VARCHAR(12) DEFAULT NULL,
    `Cust_id` VARCHAR(12) DEFAULT NULL,
    `Sales` DECIMAL(12,2) DEFAULT NULL,
    `Discount` DECIMAL(12,2) DEFAULT NULL,
    `Order_Quantity` INT NOT NULL,
    `Profit` DECIMAL (12,2) DEFAULT NULL,
	`Shipping_Cost` DECIMAL(12,2) DEFAULT NULL,
	`Product_Base_Margin` DECIMAL(12,2) DEFAULT NULL,
    PRIMARY KEY (`Market_fact_id`),
    KEY `Order_Quantity_index` (`Order_Quantity`),
    KEY  `Ship_Id_idx` (`Ship_id`),
    CONSTRAINT `Ship_Id` FOREIGN KEY (`Ship_id`) REFERENCES `shipping_dimen`(`Ship_id`) 
    
    );
    

alter table cust_dimen
change `Customer Name` Customer_Name varchar(25);

ALTER TABLE cust_dimen
CHANGE `Customer Name` Customer_Name VARCHAR(25);

SELECT *
FROM employees;


UPDATE employees
SET job='manager'
WHERE job='Manager';

DESCRIBE employees;

UPDATE employees
SET salary=salary+50
WHERE first_name='Eugene';

SELECT * FROM employees;

INSERT INTO `cust_dimen` VALUES(),(),();
INSERT INTO `cust_dimen` VALUES ('Cust_1','MUHAMMED MACINTYRE','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_10','CLAUDIA MINER','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_100','CHARLOTTE MELTON','Mumbai','Maharashtra','HOME OFFICE'),('Cust_1000','JANE WACO','Mysore','Karnataka','CORPORATE'),('Cust_1001','SANDRA FLANAGAN','Mysore','Karnataka','HOME OFFICE'),('Cust_1002','STEVE NGUYEN','Mysore','Karnataka','CONSUMER'),('Cust_1003','HERBERT FLENTYE','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1004','SANDRA FLANAGAN','Mysore','Karnataka','CORPORATE'),('Cust_1005','LIZ WILLINGHAM','Mysore','Karnataka','HOME OFFICE'),('Cust_1006','XYLONA PRICE','Mysore','Karnataka','CORPORATE'),('Cust_1007','JOHN LUCAS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1008','BILL OVERFELT','Mysore','Karnataka','CORPORATE'),('Cust_1009','JOHN GRADY','Mysore','Karnataka','CORPORATE'),('Cust_101','BARRY FRENCH','Mumbai','Maharashtra','CONSUMER'),('Cust_1010','ROBERT MARLEY','Mysore','Karnataka','CORPORATE'),('Cust_1011','MICK HERNANDEZ','Mysore','Karnataka','HOME OFFICE'),('Cust_1012','GUY PHONELY','Mysore','Karnataka','CORPORATE'),('Cust_1013','JAY KIMMEL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1014','MATT CONNELL','Mysore','Karnataka','CORPORATE'),('Cust_1015','STEVE NGUYEN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1016','VIVEK GRADY','Mysore','Karnataka','HOME OFFICE'),('Cust_1017','BEN FERRER','Mysore','Karnataka','CORPORATE'),('Cust_1018','KAREN DANIELS','Mysore','Karnataka','CONSUMER'),('Cust_1019','PAMELA COAKLEY','Mysore','Karnataka','CORPORATE'),('Cust_102','HENRY GOLDWYN','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_1020','KATHERINE NOCKTON','Mysore','Karnataka','HOME OFFICE'),('Cust_1021','DENNY BLANTON','Mysore','Karnataka','HOME OFFICE'),('Cust_1022','KATHERINE NOCKTON','Mysore','Karnataka','CORPORATE'),('Cust_1023','KEAN NGUYEN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1024','LAURA ARMSTRONG','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1025','VIVEK GRADY','Mysore','Karnataka','CORPORATE'),('Cust_1026','LINDSAY SHAGIARI','Mysore','Karnataka','HOME OFFICE'),('Cust_1027','CATHY PRESCOTT','Mysore','Karnataka','CORPORATE'),('Cust_1028','LIZ WILLINGHAM','Mysore','Karnataka','CORPORATE'),('Cust_1029','STEPHANIE ULPRIGHT','Mysore','Karnataka','CONSUMER'),('Cust_103','ROY SKARIA','Mumbai','Maharashtra','CORPORATE'),('Cust_1030','ODELLA NELSON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1031','SALLY HUGHSBY','Mysore','Karnataka','HOME OFFICE'),('Cust_1032','ARTHUR PRICHEP','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1033','RYAN AKIN','Mysore','Karnataka','CONSUMER'),('Cust_1034','SCOTT COHEN','Mysore','Karnataka','CONSUMER'),('Cust_1035','TODD SUMRALL','Mysore','Karnataka','CONSUMER'),('Cust_1036','ALEJANDRO GROVE','Mysore','Karnataka','CONSUMER'),('Cust_1037','TONY CHAPMAN','Mysore','Karnataka','CONSUMER'),('Cust_1038','JOHN CASTELL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1039','SARAH FOSTER','Mysore','Karnataka','CORPORATE'),('Cust_104','JEREMY LONSDALE','Mumbai','Maharashtra','CORPORATE'),('Cust_1040','LAURA ARMSTRONG','Mysore','Karnataka','CORPORATE'),('Cust_1041','JOHN CASTELL','Mysore','Karnataka','CONSUMER'),('Cust_1042','GREG HANSEN','Mysore','Karnataka','HOME OFFICE'),('Cust_1043','DARRIN MARTIN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1044','KEN BRENNAN','Mysore','Karnataka','CONSUMER'),('Cust_1045','MAX JONES','Mysore','Karnataka','HOME OFFICE'),('Cust_1046','KEN BRENNAN','Mysore','Karnataka','HOME OFFICE'),('Cust_1047','JOE KAMBEROVA','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1048','BARRY FRANZ','Mysore','Karnataka','CORPORATE'),('Cust_1049','FILIA MCADAMS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_105','CARLOS DALY','Mumbai','Maharashtra','CORPORATE'),('Cust_1050','MAUREEN FRITZLER','Mysore','Karnataka','CORPORATE'),('Cust_1051','DENNIS BOLTON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1052','ART FOSTER','Mysore','Karnataka','HOME OFFICE'),('Cust_1053','ERICA HACKNEY','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1054','DON WEISS','Mysore','Karnataka','CORPORATE'),('Cust_1055','JESSICA MYRICK','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1056','BRUCE DEGENHARDT','Mysore','Karnataka','HOME OFFICE'),('Cust_1057','JENNA CAFFEY','Mysore','Karnataka','CONSUMER'),('Cust_1058','KALYCA MEADE','Mysore','Karnataka','CORPORATE'),('Cust_1059','TROY BLACKWELL','Mysore','Karnataka','HOME OFFICE'),('Cust_106','CINDY SCHNELLING','Mumbai','Maharashtra','CORPORATE'),('Cust_1060','CLYTIE KELTY','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1061','MARK COUSINS','Mysore','Karnataka','HOME OFFICE'),('Cust_1062','JIM SINK','Mysore','Karnataka','CORPORATE'),('Cust_1063','STEVEN ROELLE','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1064','FRED WASSERMAN','Mysore','Karnataka','HOME OFFICE'),('Cust_1065','BETH THOMPSON','Mysore','Karnataka','CORPORATE'),('Cust_1066','PETE TAKAHITO','Mysore','Karnataka','CORPORATE'),('Cust_1067','ROB HABERLIN','Mysore','Karnataka','CONSUMER'),('Cust_1068','ROB HABERLIN','Mysore','Karnataka','CORPORATE'),('Cust_1069','HALLIE REDMOND','Mysore','Karnataka','HOME OFFICE'),('Cust_107','SUSAN VITTORINI','Mumbai','Maharashtra','CORPORATE'),('Cust_1070','KATRINA WILLMAN','Mysore','Karnataka','CONSUMER'),('Cust_1071','BENJAMIN PATTERSON','Mysore','Karnataka','CORPORATE'),('Cust_1072','MARK COUSINS','Mysore','Karnataka','CORPORATE'),('Cust_1073','GENE MCCLURE','Mysore','Karnataka','CONSUMER'),('Cust_1074','DENNY JOY','Mysore','Karnataka','CORPORATE'),('Cust_1075','HALLIE REDMOND','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1076','AMY COX','Mysore','Karnataka','HOME OFFICE'),('Cust_1077','KRISTEN HASTINGS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1078','KRISTEN HASTINGS','Mysore','Karnataka','CORPORATE'),('Cust_1079','BENJAMIN VENIER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_108','TOBY BRAUNHARDT','Mumbai','Maharashtra','CORPORATE'),('Cust_1080','KATHERINE MURRAY','Mysore','Karnataka','HOME OFFICE'),('Cust_1081','ALAN SCHOENBERGER','Mysore','Karnataka','CORPORATE'),('Cust_1082','MARK PACKER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1083','ERIC BARRETO','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1084','KARL BROWN','Mysore','Karnataka','CORPORATE'),('Cust_1085','KARL BROWN','Mysore','Karnataka','HOME OFFICE'),('Cust_1086','BEN PETERMAN','Mysore','Karnataka','CORPORATE'),('Cust_1087','DAVE POIRIER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1088','AARON HAWKINS','Mysore','Karnataka','HOME OFFICE'),('Cust_1089','RICK DUSTON','Mysore','Karnataka','CORPORATE'),('Cust_109','JULIA WEST','Mumbai','Maharashtra','CONSUMER'),('Cust_1090','ALEX GRAYSON','Mysore','Karnataka','CONSUMER'),('Cust_1091','DIANNA WILSON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1092','ERICA HERNANDEZ','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1093','CHRISTY BRITTAIN','Mysore','Karnataka','CONSUMER'),('Cust_1094','DAVID KENDRICK','Mysore','Karnataka','HOME OFFICE'),('Cust_1095','PAUL LUCAS','Mysore','Karnataka','CORPORATE'),('Cust_1096','RAYMOND FAIR','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1097','DEBRA CATINI','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1098','FRED MCMATH','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1099','ASTREA JONES','Mysore','Karnataka','CORPORATE'),('Cust_11','ALLEN ROSENBLATT','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_110','SUSAN VITTORINI','Mumbai','Maharashtra','HOME OFFICE'),('Cust_1100','TROY STAEBEL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1101','ALEJANDRO SAVELY','Mysore','Karnataka','CORPORATE'),('Cust_1102','CHRIS CORTES','Mysore','Karnataka','CONSUMER'),('Cust_1103','CRAIG YEDWAB','Mysore','Karnataka','CONSUMER'),('Cust_1104','ALAN SHONELY','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1105','BECKY MARTIN','Mysore','Karnataka','HOME OFFICE'),('Cust_1106','TONY MOLINARI','Mysore','Karnataka','CORPORATE'),('Cust_1107','STEFANIA PERRINO','Mysore','Karnataka','CORPORATE'),('Cust_1108','HUNTER LOPEZ','Mysore','Karnataka','CONSUMER'),('Cust_1109','DIANNA ARNETT','Mysore','Karnataka','HOME OFFICE'),('Cust_111','MIKE PELLETIER','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_1110','GIULIETTA DORTCH','Mysore','Karnataka','CORPORATE'),('Cust_1111','MICHAEL KENNEDY','Mysore','Karnataka','CORPORATE'),('Cust_1112','ELENI MCCRARY','Mysore','Karnataka','HOME OFFICE'),('Cust_1113','ELENI MCCRARY','Mysore','Karnataka','CORPORATE'),('Cust_1114','GEORGE ZREBASSA','Mysore','Karnataka','HOME OFFICE'),('Cust_1115','DEANRA ENO','Mysore','Karnataka','CORPORATE'),('Cust_1116','SARA LUXEMBURG','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1117','PIERRE WENER','Mysore','Karnataka','HOME OFFICE'),('Cust_1118','ERIC BARRETO','Mysore','Karnataka','CONSUMER'),('Cust_1119','DAN CAMPBELL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_112','NEOLA SCHNEIDER','Mumbai','Maharashtra','HOME OFFICE'),('Cust_1120','PAUL KNUTSON','Mysore','Karnataka','CORPORATE'),('Cust_1121','JENNIFER PATT','Mysore','Karnataka','HOME OFFICE'),('Cust_1122','CHUCK SACHS','Mysore','Karnataka','CONSUMER'),('Cust_1123','DENISE LEINENBACH','Mysore','Karnataka','HOME OFFICE'),('Cust_1124','CATHY HWANG','Mysore','Karnataka','HOME OFFICE'),('Cust_1125','EVAN HENRY','Mysore','Karnataka','CORPORATE'),('Cust_1126','CARLOS MEADOR','Mysore','Karnataka','CORPORATE'),('Cust_1127','BOBBY ELIAS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1128','KEAN THORNTON','Mysore','Karnataka','CORPORATE'),('Cust_1129','BRIAN STUGART','Mysore','Karnataka','CORPORATE'),('Cust_113','CARI SCHNELLING','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_1130','GRANT DONATELLI','Mysore','Karnataka','CONSUMER'),('Cust_1131','JASON FORTUNE','Mysore','Karnataka','CORPORATE'),('Cust_1132','DAVE BROOKS','Mysore','Karnataka','CORPORATE'),('Cust_1133','JIM KARLSSON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1134','PHILIP FOX','Mysore','Karnataka','HOME OFFICE'),('Cust_1135','GRANT CARROLL','Mysore','Karnataka','CORPORATE'),('Cust_1136','GRANT CARROLL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_1137','IONIA MCGRATH','Hyderabad','Telangana','HOME OFFICE'),('Cust_1138','LORI OLSON','Hyderabad','Telangana','CONSUMER'),('Cust_1139','QUINCY JONES','Hyderabad','Telangana','HOME OFFICE'),('Cust_114','ANDREW GJERTSEN','Mumbai','Maharashtra','CONSUMER'),('Cust_1140','PATRICK JONES','Hyderabad','Telangana','HOME OFFICE'),('Cust_1141','IONIA MCGRATH','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1142','NATHAN MAUTZ','Hyderabad','Telangana','CORPORATE'),('Cust_1143','NATHAN MAUTZ','Hyderabad','Telangana','HOME OFFICE'),('Cust_1144','KAREN SEIO','Hyderabad','Telangana','CONSUMER'),('Cust_1145','KEN LONSDALE','Hyderabad','Telangana','CONSUMER'),('Cust_1146','PATRICK GARDNER','Hyderabad','Telangana','CONSUMER'),('Cust_1147','QUINCY JONES','Hyderabad','Telangana','CORPORATE'),('Cust_1148','NONA BALK','Hyderabad','Telangana','CORPORATE'),('Cust_1149','ERIN MULL','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_115','RALPH ARNETT','Mumbai','Maharashtra','CONSUMER'),('Cust_1150','JOHN LEE','Hyderabad','Telangana','CORPORATE'),('Cust_1151','EMILY PHAN','Hyderabad','Telangana','CONSUMER'),('Cust_1152','ERIN MULL','Hyderabad','Telangana','CORPORATE'),('Cust_1153','JUSTIN DEGGELLER','Hyderabad','Telangana','CORPORATE'),('Cust_1154','TONY SAYRE','Hyderabad','Telangana','HOME OFFICE'),('Cust_1155','KEITH DAWKINS','Cochin','Kerala','HOME OFFICE'),('Cust_1156','JOE ELIJAH','Cochin','Kerala','HOME OFFICE'),('Cust_1157','SHERI GORDON','Cochin','Kerala','CORPORATE'),('Cust_1158','STEFANIE HOLLOMAN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1159','KEN BLACK','Cochin','Kerala','CONSUMER'),('Cust_116','BRYAN MILLS','Mumbai','Maharashtra','CORPORATE'),('Cust_1160','LINDSAY WILLIAMS','Cochin','Kerala','CORPORATE'),('Cust_1161','LOGAN CURRIE','Cochin','Kerala','SMALL BUSINESS'),('Cust_1162','STEVE CHAPMAN','Cochin','Kerala','CORPORATE'),('Cust_1163','MARC CRIER','Cochin','Kerala','CORPORATE'),('Cust_1164','DAVE BROOKS','Cochin','Kerala','CORPORATE'),('Cust_1165','DEBORAH BRUMFIELD','Cochin','Kerala','CORPORATE'),('Cust_1166','SCOT WOOTEN','Cochin','Kerala','CORPORATE'),('Cust_1167','NICOLE BRENNAN','Cochin','Kerala','CONSUMER'),('Cust_1168','JOHN LEE','Cochin','Kerala','CORPORATE'),('Cust_1169','DENISE MONTON','Cochin','Kerala','HOME OFFICE'),('Cust_117','GRANT CARROLL','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1170','DEBORAH BRUMFIELD','Cochin','Kerala','SMALL BUSINESS'),('Cust_1171','MARC CRIER','Cochin','Kerala','CONSUMER'),('Cust_1172','CYNTHIA DELANEY','Cochin','Kerala','CORPORATE'),('Cust_1173','ED BRAXTON','Cochin','Kerala','HOME OFFICE'),('Cust_1174','ED BRAXTON','Cochin','Kerala','CONSUMER'),('Cust_1175','PHILLIP FLATHMANN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1176','COREY CATLETT','Cochin','Kerala','HOME OFFICE'),('Cust_1177','VALERIE TAKAHITO','Cochin','Kerala','CONSUMER'),('Cust_1178','PENELOPE SEWALL','Cochin','Kerala','HOME OFFICE'),('Cust_1179','SEAN BRAXTON','Cochin','Kerala','SMALL BUSINESS'),('Cust_118','JULIA WEST','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1180','VALERIE DOMINGUEZ','Cochin','Kerala','CORPORATE'),('Cust_1181','SUSAN MACKENDRICK','Cochin','Kerala','CORPORATE'),('Cust_1182','THAIS SISSMAN','Cochin','Kerala','CORPORATE'),('Cust_1183','TANJA NORVELL','Cochin','Kerala','CONSUMER'),('Cust_1184','LINDA SOUTHWORTH','Cochin','Kerala','CONSUMER'),('Cust_1185','MICHAEL MOORE','Cochin','Kerala','CORPORATE'),('Cust_1186','PATRICK RYAN','Cochin','Kerala','CORPORATE'),('Cust_1187','TROY BLACKWELL','Cochin','Kerala','HOME OFFICE'),('Cust_1188','THAIS SISSMAN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1189','ROSS BAIRD','Cochin','Kerala','CORPORATE'),('Cust_119','MUHAMMED MACINTYRE','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1190','TRACY ZIC','Cochin','Kerala','CONSUMER'),('Cust_1191','JACK GARZA','Cochin','Kerala','CORPORATE'),('Cust_1192','GARY MCGARR','Cochin','Kerala','HOME OFFICE'),('Cust_1193','MICK CREBAGGA','Cochin','Kerala','HOME OFFICE'),('Cust_1194','ROY SKARIA','Cochin','Kerala','CORPORATE'),('Cust_1195','STEVEN WARD','Cochin','Kerala','CONSUMER'),('Cust_1196','TANJA NORVELL','Cochin','Kerala','CORPORATE'),('Cust_1197','RYAN CROWE','Cochin','Kerala','SMALL BUSINESS'),('Cust_1198','IRENE MADDOX','Cochin','Kerala','CONSUMER'),('Cust_1199','NICK RADFORD','Cochin','Kerala','CORPORATE'),('Cust_12','SYLVIA FOULSTON','Kolkata','West Bengal','HOME OFFICE'),('Cust_120','SUSAN VITTORINI','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1200','THERESA SWINT','Cochin','Kerala','CONSUMER'),('Cust_1201','MAURICE SATTY','Cochin','Kerala','CORPORATE'),('Cust_1202','HENRY GOLDWYN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1203','VICTOR PRICE','Cochin','Kerala','CONSUMER'),('Cust_1204','MAUREEN GRACE','Cochin','Kerala','CORPORATE'),('Cust_1205','ERIC HOFFMANN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1206','JILL STEVENSON','Cochin','Kerala','CONSUMER'),('Cust_1207','EVAN BAILLIET','Cochin','Kerala','CORPORATE'),('Cust_1208','MEG TILLMAN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1209','RUSSELL D\'ASCENZO','Cochin','Kerala','CONSUMER'),('Cust_121','SYLVIA FOULSTON','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1210','GARY HWANG','Cochin','Kerala','HOME OFFICE'),('Cust_1211','JOSEPH AIRDO','Cochin','Kerala','CONSUMER'),('Cust_1212','EMILY DUCICH','Cochin','Kerala','CONSUMER'),('Cust_1213','STEWART VISINSKY','Cochin','Kerala','CORPORATE'),('Cust_1214','STEVEN CARTWRIGHT','Cochin','Kerala','HOME OFFICE'),('Cust_1215','SUE ANN REED','Cochin','Kerala','CONSUMER'),('Cust_1216','SANJIT ENGLE','Cochin','Kerala','HOME OFFICE'),('Cust_1217','KATHERINE DUCICH','Cochin','Kerala','CORPORATE'),('Cust_1218','MIKE GOCKENBACH','Cochin','Kerala','CONSUMER'),('Cust_1219','TOM ZANDUSKY','Cochin','Kerala','HOME OFFICE'),('Cust_122','DOUG BICKFORD','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1220','DENNY JOY','Cochin','Kerala','CORPORATE'),('Cust_1221','HENIA ZYDLO','Cochin','Kerala','HOME OFFICE'),('Cust_1222','TRACY COLLINS','Cochin','Kerala','CONSUMER'),('Cust_1223','NATALIE WEBBER','Cochin','Kerala','CONSUMER'),('Cust_1224','TOBY KNIGHT','Cochin','Kerala','CONSUMER'),('Cust_1225','MARIA ZETTNER','Cochin','Kerala','CORPORATE'),('Cust_1226','THEA HUDGINGS','Cochin','Kerala','CONSUMER'),('Cust_1227','NATALIE WEBBER','Cochin','Kerala','CORPORATE'),('Cust_1228','NORA PELLETIER','Cochin','Kerala','CORPORATE'),('Cust_1229','MATTHEW CLASEN','Cochin','Kerala','CONSUMER'),('Cust_123','DOROTHY BADDERS','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1230','NORA PELLETIER','Cochin','Kerala','HOME OFFICE'),('Cust_1231','MICK CREBAGGA','Cochin','Kerala','CORPORATE'),('Cust_1232','JAMIE FRAZER','Cochin','Kerala','SMALL BUSINESS'),('Cust_1233','MICHAEL OAKMAN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1234','JOSEPH AIRDO','Cochin','Kerala','CORPORATE'),('Cust_1235','TRACY COLLINS','Cochin','Kerala','CORPORATE'),('Cust_1236','RACHEL PAYNE','Cochin','Kerala','CONSUMER'),('Cust_1237','CRAIG MOLINARI','Cochin','Kerala','SMALL BUSINESS'),('Cust_1238','JOY DANIELS','Cochin','Kerala','CORPORATE'),('Cust_1239','JILL FJELD','Cochin','Kerala','HOME OFFICE'),('Cust_124','HENRY GOLDWYN','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1240','GENE MCCLURE','Cochin','Kerala','CONSUMER'),('Cust_1241','RICK BENSLEY','Cochin','Kerala','CONSUMER'),('Cust_1242','THOMAS BRUMLEY','Cochin','Kerala','CONSUMER'),('Cust_1243','DARRIN MARTIN','Cochin','Kerala','SMALL BUSINESS'),('Cust_1244','JULIE KRIZ','Cochin','Kerala','CORPORATE'),('Cust_1245','RUSSELL APPLEGATE','Cochin','Kerala','SMALL BUSINESS'),('Cust_1246','ERIC BARRETO','Cochin','Kerala','SMALL BUSINESS'),('Cust_1247','GENE MCCLURE','Cochin','Kerala','HOME OFFICE'),('Cust_1248','TOBY KNIGHT','Cochin','Kerala','CORPORATE'),('Cust_1249','MARIBETH SCHNELLING','Cochin','Kerala','CORPORATE'),('Cust_125','CHAD CUNNINGHAM','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1250','ARTHUR GAINER','Cochin','Kerala','CONSUMER'),('Cust_1251','THERESA SWINT','Cochin','Kerala','SMALL BUSINESS'),('Cust_1252','HARRY MARIE','Cochin','Kerala','CONSUMER'),('Cust_1253','RACHEL PAYNE','Cochin','Kerala','HOME OFFICE'),('Cust_1254','ELPIDA RITTENBACH','Cochin','Kerala','CONSUMER'),('Cust_1255','RUSSELL APPLEGATE','Cochin','Kerala','HOME OFFICE'),('Cust_1256','ROLAND MURRAY','Cochin','Kerala','HOME OFFICE'),('Cust_1257','ARTHUR GAINER','Cochin','Kerala','CORPORATE'),('Cust_1258','PETER FULLER','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1259','SAM CRAVEN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_126','BETH THOMPSON','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1260','MITCH WILLINGHAM','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1261','JOHN DRYER','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1262','SUSAN GILCREST','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1263','KEN HEIDEL','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1264','PATRICK RYAN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1265','RANDY BRADLEY','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1266','WILLIAM BROWN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1267','RICK HANSEN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1268','TOBY GRACE','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1269','JOSEPH HOLT','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_127','ANDREW GJERTSEN','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1270','MAYA HERMAN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1271','RICK HANSEN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1272','ASHLEY JARBOE','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1273','RANDY BRADLEY','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1274','WILLIAM BROWN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1275','ASHLEY JARBOE','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1276','PAULINE WEBBER','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1277','MATT COLLISTER','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1278','KEAN TAKAHITO','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1279','JULIA DUNBAR','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_128','MICHELLE LONSDALE','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1280','NICK ZANDUSKY','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1281','PETER FULLER','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1282','NEOMA MURRAY','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1283','SUNG CHUNG','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1284','DARRIN VAN HUFF','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1285','BRIAN MOSS','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1286','MAX LUDWIG','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1287','MICHELLE MORAY','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1288','EVA JACOBS','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1289','CRAIG RIDER','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_129','CARI SCHNELLING','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1290','MARIBETH YEDWAB','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1291','CINDY SCHNELLING','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1292','EUGENE MOREN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1293','LIZ PRICE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1294','LIZ PRICE','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1295','MARK VAN HUFF','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1296','STEFANIA PERRINO','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1297','MARK HAMILTON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1298','CHUCK MAGEE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1299','SUNG SHARIARI','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_13','JIM RADFORD','Kolkata','West Bengal','CORPORATE'),('Cust_130','EDWARD HOOKS','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1300','NONA BALK','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1301','TOM STIVERS','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1302','RICHARD EICHHORN','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1303','NEIL FRENCH','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1304','NEIL FRENCH','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1305','NICOLE FJELD','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1306','SUZANNE MCNAIR','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1307','ANDY REITER','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1308','SUZANNE MCNAIR','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1309','SUSAN PISTEK','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_131','BRENDAN DODSON','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1310','NICK CREBASSA','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1311','TOM STIVERS','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1312','ROB BEEGHLY','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1313','ALEKSANDRA GANNAWAY','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1314','ALEKSANDRA GANNAWAY','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1315','ROBERT WALDORF','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1316','BRENDA BOWMAN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1317','CARL WEISS','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1318','JACK O\'BRIANT','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1319','JOEL EATON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_132','HAROLD ENGLE','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1320','JUSTIN ELLISON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1321','JENNIFER JACKSON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1322','MICHAEL OAKMAN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1323','JACK O\'BRIANT','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1324','JACK O\'BRIANT','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1325','KAREN BERN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1326','KRISTEN HASTINGS','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1327','MEG TILLMAN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1328','LIZ PELLETIER','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1329','JONATHAN DOHERTY','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_133','ROY FRENCH','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1330','FRANK GASTINEAU','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1331','JANET LEE','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1332','RICK WILSON','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1333','LYCORIS SAUNDERS','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1334','MAXWELL SCHWARTZ','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1335','LIZ CARLISLE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1336','NEIL KNUDSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1337','DENISE MONTON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1338','LYCORIS SAUNDERS','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1339','KELLY COLLISTER','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_134','HELEN ABELMAN','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1340','DENNIS PARDUE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1341','DENNIS PARDUE','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1342','NEIL KNUDSON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1343','JOHN HUSTON','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1344','MARYBETH SKACH','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1345','RICK WILSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1346','ANTHONY GARVERICK','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1347','LINDSAY CASTELL','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1348','JUSTIN DEGGELLER','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1349','LINDSAY CASTELL','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_135','GUY ARMSTRONG','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1350','LIZ PELLETIER','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1351','CRAIG CARREIRA','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1352','PAUL STEVENSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1353','GREG HANSEN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1354','BILL EPLETT','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1355','JEREMY LONSDALE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1356','IONIA MCGRATH','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1357','IONIA MCGRATH','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1358','EMILY GRADY','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1359','VALERIE TAKAHITO','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_136','JENNIFER BRAXTON','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1360','LUKE SCHMIDT','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1361','KELLY ANDREADA','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1362','JASON KLAMCZYNSKI','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1363','TRACY HOPKINS','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1364','CRAIG LESLIE','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1365','MICHAEL GRACE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1366','SAPHHIRA SHIFLEY','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1367','SAPHHIRA SHIFLEY','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1368','LAUREL BELTRAN','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1369','TRACY BLUMSTEIN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_137','GIULIETTA BAPTIST','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1370','LARRY BLACKS','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1371','HAROLD DAHLEN','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1372','HAROLD DAHLEN','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1373','RICHARD BIERNER','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1374','TIFFANY HOUSE','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1375','ROY COLLINS','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1376','TOBY SWINDELL','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1377','SARAH BROWN','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1378','CHRISTINA ANDERSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1379','ROBERT DILBECK','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_138','JACK LEBRON','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1380','RANDY FERGUSON','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1381','ARIANNE IRVING','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1382','RANDY FERGUSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1383','CYNTHIA ARNTZEN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1384','ANDY GERBODE','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1385','AMY HUNT','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1386','CRAIG MOLINARI','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1387','TRUDY BROWN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1388','AMY HUNT','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1389','PHILIP FOX','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_139','ERICA BERN','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1390','BRIAN DAHLEN','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1391','BETH FRITZLER','Kanyakumari','Tamil Nadu','SMALL BUSINESS'),('Cust_1392','BROSINA HOFFMAN','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1393','AMY HUNT','Kanyakumari','Tamil Nadu','CONSUMER'),('Cust_1394','CYNTHIA ARNTZEN','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1395','JENNIFER FERGUSON','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1396','PAUL PROST','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1397','TOBY CARLISLE','Kanyakumari','Tamil Nadu','HOME OFFICE'),('Cust_1398','ANTHONY WITT','Kanyakumari','Tamil Nadu','CORPORATE'),('Cust_1399','PHILLINA OBER','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_14','CARL LUDWIG','Kolkata','West Bengal','CORPORATE'),('Cust_140','CHRISTOPHER SCHILD','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1400','JIM EPP','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1401','MUHAMMED YEDWAB','Hyderabad','Telangana','CONSUMER'),('Cust_1402','MARIBETH SCHNELLING','Hyderabad','Telangana','CORPORATE'),('Cust_1403','DEANRA ENO','Hyderabad','Telangana','CORPORATE'),('Cust_1404','JAMES GALANG','Hyderabad','Telangana','CONSUMER'),('Cust_1405','KATRINA WILLMAN','Hyderabad','Telangana','CONSUMER'),('Cust_1406','NORA PRICE','Hyderabad','Telangana','HOME OFFICE'),('Cust_1407','LISA DECHERNEY','Hyderabad','Telangana','CORPORATE'),('Cust_1408','LYNN SMITH','Hyderabad','Telangana','CORPORATE'),('Cust_1409','CHRISTINA DEMOSS','Hyderabad','Telangana','HOME OFFICE'),('Cust_141','JOY SMITH','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1410','CHRISTINE ABELMAN','Hyderabad','Telangana','CORPORATE'),('Cust_1411','NORA PRICE','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1412','MARIBETH DONA','Hyderabad','Telangana','HOME OFFICE'),('Cust_1413','PAULINE JOHNSON','Hyderabad','Telangana','CORPORATE'),('Cust_1414','JOCASTA RUPERT','Hyderabad','Telangana','CONSUMER'),('Cust_1415','LAUREL ELLISTON','Hyderabad','Telangana','CORPORATE'),('Cust_1416','GEORGIA ROSENBERG','Hyderabad','Telangana','CONSUMER'),('Cust_1417','ALLEN ARMOLD','Hyderabad','Telangana','HOME OFFICE'),('Cust_1418','ANEMONE RATNER','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1419','KATHERINE HUGHES','Hyderabad','Telangana','CONSUMER'),('Cust_142','EVAN MINNOTTE','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1420','TRACY COLLINS','Hyderabad','Telangana','CONSUMER'),('Cust_1421','LIZ MACKENDRICK','Hyderabad','Telangana','CORPORATE'),('Cust_1422','ALAN HWANG','Hyderabad','Telangana','CORPORATE'),('Cust_1423','ALAN HWANG','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1424','TRACY COLLINS','Hyderabad','Telangana','CORPORATE'),('Cust_1425','RICHARD BIERNER','Hyderabad','Telangana','SMALL BUSINESS'),('Cust_1426','BRUCE STEWART','Hyderabad','Telangana','CORPORATE'),('Cust_1427','ALEKSANDRA GANNAWAY','Hyderabad','Telangana','CORPORATE'),('Cust_1428','BRENDAN SWEED','Hyderabad','Telangana','CONSUMER'),('Cust_1429','LAUREL ELLISTON','Hyderabad','Telangana','HOME OFFICE'),('Cust_143','JENNA CAFFEY','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1430','DEAN PERCER','Hyderabad','Telangana','HOME OFFICE'),('Cust_1431','LISA DECHERNEY','Hyderabad','Telangana','CONSUMER'),('Cust_1432','DEAN PERCER','Hyderabad','Telangana','CONSUMER'),('Cust_1433','AIMEE BIXBY','Hyderabad','Telangana','HOME OFFICE'),('Cust_1434','PHILLIP BREYER','Hyderabad','Telangana','CORPORATE'),('Cust_1435','CRAIG YEDWAB','Trivandrum','Kerala','CONSUMER'),('Cust_1436','DARIO MEDINA','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1437','ED BRAXTON','Trivandrum','Kerala','CONSUMER'),('Cust_1438','CINDY CHAPMAN','Trivandrum','Kerala','CONSUMER'),('Cust_1439','ASHLEY JARBOE','Trivandrum','Kerala','HOME OFFICE'),('Cust_144','HAROLD ENGLE','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1440','BENJAMIN FARHAT','Trivandrum','Kerala','HOME OFFICE'),('Cust_1441','CINDY CHAPMAN','Trivandrum','Kerala','CORPORATE'),('Cust_1442','BRUCE DEGENHARDT','Trivandrum','Kerala','HOME OFFICE'),('Cust_1443','DIANNA VITTORINI','Trivandrum','Kerala','CORPORATE'),('Cust_1444','CINDY STEWART','Trivandrum','Kerala','CORPORATE'),('Cust_1445','ED BRAXTON','Trivandrum','Kerala','HOME OFFICE'),('Cust_1446','QUINCY JONES','Trivandrum','Kerala','HOME OFFICE'),('Cust_1447','QUINCY JONES','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1448','QUINCY JONES','Trivandrum','Kerala','CORPORATE'),('Cust_1449','ROB WILLIAMS','Trivandrum','Kerala','HOME OFFICE'),('Cust_145','HILARY HOLDEN','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1450','BENJAMIN PATTERSON','Trivandrum','Kerala','CORPORATE'),('Cust_1451','ANNA CHUNG','Trivandrum','Kerala','HOME OFFICE'),('Cust_1452','RICARDO BLOCK','Trivandrum','Kerala','CORPORATE'),('Cust_1453','ASHLEY JARBOE','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1454','CRAIG YEDWAB','Trivandrum','Kerala','CORPORATE'),('Cust_1455','CINDY STEWART','Trivandrum','Kerala','CONSUMER'),('Cust_1456','TRUDY BELL','Trivandrum','Kerala','CONSUMER'),('Cust_1457','BRAD THOMAS','Trivandrum','Kerala','HOME OFFICE'),('Cust_1458','BART FOLK','Trivandrum','Kerala','CORPORATE'),('Cust_1459','PAUL LUCAS','Trivandrum','Kerala','CORPORATE'),('Cust_146','GREG GUTHRIE','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1460','DEAN PERCER','Trivandrum','Kerala','HOME OFFICE'),('Cust_1461','ROBERT BARROSO','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1462','BRAD THOMAS','Trivandrum','Kerala','CORPORATE'),('Cust_1463','DAVID KENDRICK','Trivandrum','Kerala','HOME OFFICE'),('Cust_1464','LUKE FOSTER','Trivandrum','Kerala','CORPORATE'),('Cust_1465','MAUREEN GASTINEAU','Trivandrum','Kerala','CONSUMER'),('Cust_1466','ED JACOBS','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1467','DAVE POIRIER','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1468','ALEKSANDRA GANNAWAY','Trivandrum','Kerala','CORPORATE'),('Cust_1469','KEAN THORNTON','Trivandrum','Kerala','CORPORATE'),('Cust_147','JOY SMITH','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1470','ROB LUCAS','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1471','NORA PAIGE','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1472','ERIC BARRETO','Trivandrum','Kerala','CONSUMER'),('Cust_1473','SARA LUXEMBURG','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1474','ADAM HART','Trivandrum','Kerala','CORPORATE'),('Cust_1475','BOBBY ELIAS','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1476','ROLAND FJELD','Trivandrum','Kerala','CORPORATE'),('Cust_1477','BILL SHONELY','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1478','DENNY ORDWAY','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1479','BILL TYLER','Trivandrum','Kerala','CONSUMER'),('Cust_148','DAN REICHENBACH','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1480','ALAN SCHOENBERGER','Trivandrum','Kerala','CORPORATE'),('Cust_1481','CHARLES CRESTANI','Trivandrum','Kerala','CONSUMER'),('Cust_1482','CHRISTY BRITTAIN','Trivandrum','Kerala','CONSUMER'),('Cust_1483','BRADLEY DRUCKER','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1484','BRYAN SPRUELL','Trivandrum','Kerala','HOME OFFICE'),('Cust_1485','TOM PRESCOTT','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1486','ERIC BARRETO','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1487','KARL BROWN','Trivandrum','Kerala','CORPORATE'),('Cust_1488','THOMAS THORNTON','Trivandrum','Kerala','CONSUMER'),('Cust_1489','ANTHONY GARVERICK','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_149','PAUL GONZALEZ','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1490','TAMARA WILLINGHAM','Trivandrum','Kerala','CORPORATE'),('Cust_1491','DAN CAMPBELL','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1492','THEA HENDRICKS','Trivandrum','Kerala','HOME OFFICE'),('Cust_1493','GIULIETTA DORTCH','Trivandrum','Kerala','CORPORATE'),('Cust_1494','MARK HABERLIN','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1495','EVAN HENRY','Trivandrum','Kerala','CORPORATE'),('Cust_1496','GRANT THORNTON','Trivandrum','Kerala','CORPORATE'),('Cust_1497','GIULIETTA DORTCH','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1498','ELLIS BALLARD','Trivandrum','Kerala','CORPORATE'),('Cust_1499','ERIC MURDOCK','Trivandrum','Kerala','HOME OFFICE'),('Cust_15','DON MILLER','Kolkata','West Bengal','HOME OFFICE'),('Cust_150','FILIA MCADAMS','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1500','JILL FJELD','Trivandrum','Kerala','HOME OFFICE'),('Cust_1501','ANNE MCFARLAND','Trivandrum','Kerala','CONSUMER'),('Cust_1502','ASTREA JONES','Trivandrum','Kerala','CORPORATE'),('Cust_1503','PETER BUHLER','Trivandrum','Kerala','CONSUMER'),('Cust_1504','DEAN KATZ','Trivandrum','Kerala','HOME OFFICE'),('Cust_1505','KAREN CARLISLE','Trivandrum','Kerala','CORPORATE'),('Cust_1506','CARLOS MEADOR','Trivandrum','Kerala','CORPORATE'),('Cust_1507','GIULIETTA DORTCH','Trivandrum','Kerala','CONSUMER'),('Cust_1508','KARL BROWN','Trivandrum','Kerala','HOME OFFICE'),('Cust_1509','JENNIFER PATT','Trivandrum','Kerala','HOME OFFICE'),('Cust_151','GREG GUTHRIE','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1510','CYNTHIA VOLTZ','Trivandrum','Kerala','CORPORATE'),('Cust_1511','BARRY POND','Trivandrum','Kerala','CONSUMER'),('Cust_1512','TONY MOLINARI','Trivandrum','Kerala','CORPORATE'),('Cust_1513','JULIA BARNETT','Trivandrum','Kerala','CORPORATE'),('Cust_1514','JEREMY PISTEK','Trivandrum','Kerala','CORPORATE'),('Cust_1515','CYRA REITEN','Trivandrum','Kerala','CONSUMER'),('Cust_1516','DAN CAMPBELL','Trivandrum','Kerala','CORPORATE'),('Cust_1517','BRIAN STUGART','Trivandrum','Kerala','CONSUMER'),('Cust_1518','JULIA BARNETT','Trivandrum','Kerala','HOME OFFICE'),('Cust_1519','YANA SORENSEN','Trivandrum','Kerala','CORPORATE'),('Cust_152','CHUCK MAGEE','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1520','JONI WASSERMAN','Trivandrum','Kerala','CONSUMER'),('Cust_1521','AARON HAWKINS','Trivandrum','Kerala','HOME OFFICE'),('Cust_1522','VICTORIA PISTEKA','Trivandrum','Kerala','CORPORATE'),('Cust_1523','DAVE KIPP','Trivandrum','Kerala','CORPORATE'),('Cust_1524','SHIRLEY JACKSON','Trivandrum','Kerala','CORPORATE'),('Cust_1525','DAVID BREMER','Trivandrum','Kerala','CORPORATE'),('Cust_1526','DEANRA ENO','Trivandrum','Kerala','CORPORATE'),('Cust_1527','ALEKSANDRA GANNAWAY','Trivandrum','Kerala','HOME OFFICE'),('Cust_1528','BRIAN STUGART','Trivandrum','Kerala','CORPORATE'),('Cust_1529','JILL MATTHIAS','Trivandrum','Kerala','CONSUMER'),('Cust_153','FRANK ATKINSON','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1530','TIM TASLIMI','Trivandrum','Kerala','CORPORATE'),('Cust_1531','MUHAMMED LEE','Trivandrum','Kerala','CORPORATE'),('Cust_1532','JULIANA KROHN','Trivandrum','Kerala','CORPORATE'),('Cust_1533','DARRIN SAYRE','Trivandrum','Kerala','CONSUMER'),('Cust_1534','DUANE NOONAN','Trivandrum','Kerala','CORPORATE'),('Cust_1535','PAUL VAN HUGH','Trivandrum','Kerala','CORPORATE'),('Cust_1536','JANET MARTIN','Trivandrum','Kerala','CORPORATE'),('Cust_1537','COREY ROPER','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1538','DARREN BUDD','Trivandrum','Kerala','HOME OFFICE'),('Cust_1539','DARREN BUDD','Trivandrum','Kerala','CONSUMER'),('Cust_154','CARLOS SOLTERO','Coimbatore','Tamil Nadu','CONSUMER'),('Cust_1540','HELEN ANDREADA','Trivandrum','Kerala','CORPORATE'),('Cust_1541','NICOLE BRENNAN','Trivandrum','Kerala','CONSUMER'),('Cust_1542','IVAN LISTON','Trivandrum','Kerala','CONSUMER'),('Cust_1543','BRENDAN MURRY','Trivandrum','Kerala','CORPORATE'),('Cust_1544','AMY COX','Trivandrum','Kerala','CORPORATE'),('Cust_1545','KAREN CARLISLE','Trivandrum','Kerala','HOME OFFICE'),('Cust_1546','TRACY HOPKINS','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1547','DAVE KIPP','Trivandrum','Kerala','CONSUMER'),('Cust_1548','TOM ASHBROOK','Trivandrum','Kerala','HOME OFFICE'),('Cust_1549','NICOLE BRENNAN','Trivandrum','Kerala','HOME OFFICE'),('Cust_155','PHILIP BROWN','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1550','AMY COX','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1551','BARRY WEIRICH','Trivandrum','Kerala','CORPORATE'),('Cust_1552','ALLEN ARMOLD','Trivandrum','Kerala','HOME OFFICE'),('Cust_1553','MARIS LAWARE','Trivandrum','Kerala','HOME OFFICE'),('Cust_1554','MICK BROWN','Trivandrum','Kerala','CONSUMER'),('Cust_1555','CHRIS MCAFEE','Trivandrum','Kerala','CONSUMER'),('Cust_1556','SARA LUXEMBURG','Trivandrum','Kerala','CORPORATE'),('Cust_1557','DEBORAH BRUMFIELD','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_1558','JAY FINE','Trivandrum','Kerala','CONSUMER'),('Cust_1559','BENJAMIN VENIER','Trivandrum','Kerala','SMALL BUSINESS'),('Cust_156','ERICA BERN','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1560','SPEROS GORANITIS','Trivandrum','Kerala','CORPORATE'),('Cust_1561','PETE KRIZ','Trivandrum','Kerala','CORPORATE'),('Cust_1562','IRENE MADDOX','Trivandrum','Kerala','CONSUMER'),('Cust_1563','PATRICK BZOSTEK','Trivandrum','Kerala','CONSUMER'),('Cust_1564','MUHAMMED LEE','Trivandrum','Kerala','CONSUMER'),('Cust_1565','PETE KRIZ','Chennai','Tamil Nadu','CORPORATE'),('Cust_1566','MARK HABERLIN','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1567','EMILY BURNS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1568','DAVE KIPP','Chennai','Tamil Nadu','CONSUMER'),('Cust_1569','DOUG O\'CONNELL','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_157','CARLOS SOLTERO','Coimbatore','Tamil Nadu','SMALL BUSINESS'),('Cust_1570','COREY LOCK','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1571','KAREN CARLISLE','Chennai','Tamil Nadu','CORPORATE'),('Cust_1572','MICK BROWN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1573','DEBORAH BRUMFIELD','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1574','NICOLE BRENNAN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1575','JAY FINE','Chennai','Tamil Nadu','CONSUMER'),('Cust_1576','JULIANA KROHN','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1577','YANA SORENSEN','Chennai','Tamil Nadu','CORPORATE'),('Cust_1578','BRADLEY DRUCKER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1579','ADAM HART','Chennai','Tamil Nadu','CORPORATE'),('Cust_158','JIM SINK','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1580','BENJAMIN VENIER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1581','IVAN LISTON','Chennai','Tamil Nadu','CONSUMER'),('Cust_1582','SARA LUXEMBURG','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1583','TOM ASHBROOK','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1584','JONI WASSERMAN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1585','ERIC MURDOCK','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1586','BRAD THOMAS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1587','VICTORIA PISTEKA','Chennai','Tamil Nadu','CORPORATE'),('Cust_1588','BARRY POND','Chennai','Tamil Nadu','CONSUMER'),('Cust_1589','CHRIS MCAFEE','Chennai','Tamil Nadu','CONSUMER'),('Cust_159','PHILIP BROWN','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1590','KAREN CARLISLE','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1591','BART FOLK','Chennai','Tamil Nadu','CORPORATE'),('Cust_1592','BARRY WEIRICH','Chennai','Tamil Nadu','CORPORATE'),('Cust_1593','MICHAEL STEWART','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1594','DAVE POIRIER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1595','ALEKSANDRA GANNAWAY','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1596','BRYAN SPRUELL','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1597','CHRISTY BRITTAIN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1598','HAROLD DAHLEN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1599','BOBBY TRAFTON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_16','ANNIE CYPRUS','Kolkata','West Bengal','HOME OFFICE'),('Cust_160','LOGAN HAUSHALTER','Coimbatore','Tamil Nadu','CORPORATE'),('Cust_1600','SPEROS GORANITIS','Chennai','Tamil Nadu','CORPORATE'),('Cust_1601','GRANT THORNTON','Chennai','Tamil Nadu','CORPORATE'),('Cust_1602','TOM PRESCOTT','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1603','ALAN SCHOENBERGER','Chennai','Tamil Nadu','CORPORATE'),('Cust_1604','PATRICK BZOSTEK','Chennai','Tamil Nadu','CONSUMER'),('Cust_1605','TAMARA WILLINGHAM','Chennai','Tamil Nadu','CORPORATE'),('Cust_1606','DENNY ORDWAY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1607','ROLAND FJELD','Chennai','Tamil Nadu','CORPORATE'),('Cust_1608','ELIZABETH MOFFITT','Chennai','Tamil Nadu','CONSUMER'),('Cust_1609','DAVID KENDRICK','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_161','NOAH CHILDS','Coimbatore','Tamil Nadu','HOME OFFICE'),('Cust_1610','JULIA BARNETT','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1611','SHIRLEY JACKSON','Chennai','Tamil Nadu','CORPORATE'),('Cust_1612','BRENDAN MURRY','Chennai','Tamil Nadu','CORPORATE'),('Cust_1613','JENNIFER PATT','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1614','JEREMY PISTEK','Chennai','Tamil Nadu','CORPORATE'),('Cust_1615','DAVID BREMER','Chennai','Tamil Nadu','CORPORATE'),('Cust_1616','NORA PAIGE','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1617','BOBBY TRAFTON','Chennai','Tamil Nadu','CORPORATE'),('Cust_1618','ALEJANDRO SAVELY','Chennai','Tamil Nadu','CORPORATE'),('Cust_1619','CHARLES CRESTANI','Chennai','Tamil Nadu','CONSUMER'),('Cust_162','NOAH CHILDS','Cochin','Kerala','HOME OFFICE'),('Cust_1620','MUHAMMED LEE','Chennai','Tamil Nadu','CORPORATE'),('Cust_1621','MAUREEN GASTINEAU','Chennai','Tamil Nadu','CONSUMER'),('Cust_1622','BERENIKE KAMPE','Chennai','Tamil Nadu','CORPORATE'),('Cust_1623','BOBBY ELIAS','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1624','NOEL STAAVOS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1625','DAMALA KOTSONIS','Chennai','Tamil Nadu','CORPORATE'),('Cust_1626','JILL MATTHIAS','Chennai','Tamil Nadu','CONSUMER'),('Cust_1627','TIM TASLIMI','Chennai','Tamil Nadu','CORPORATE'),('Cust_1628','COREY CATLETT','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1629','HAROLD DAHLEN','Chennai','Tamil Nadu','CORPORATE'),('Cust_163','EVAN MINNOTTE','Cochin','Kerala','CORPORATE'),('Cust_1630','DAN CAMPBELL','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1631','MARIS LAWARE','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1632','MARK PACKER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1633','JULIANA KROHN','Chennai','Tamil Nadu','CORPORATE'),('Cust_1634','BILL SHONELY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1635','DEBRA CATINI','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1636','EMILY PHAN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1637','KEITH HERRERA','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1638','TONY MOLINARI','Chennai','Tamil Nadu','CORPORATE'),('Cust_1639','RICK HUTHWAITE','Chennai','Tamil Nadu','CORPORATE'),('Cust_164','GUY ARMSTRONG','Cochin','Kerala','CORPORATE'),('Cust_1640','GEORGE ZREBASSA','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1641','AARON HAWKINS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1642','DAN CAMPBELL','Chennai','Tamil Nadu','CORPORATE'),('Cust_1643','TAMARA WILLINGHAM','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1644','NICOLE BRENNAN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1645','PAUL VAN HUGH','Chennai','Tamil Nadu','CONSUMER'),('Cust_1646','CYRA REITEN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1647','HELEN ANDREADA','Chennai','Tamil Nadu','CORPORATE'),('Cust_1648','CHRIS CORTES','Chennai','Tamil Nadu','CONSUMER'),('Cust_1649','KATHERINE DUCICH','Chennai','Tamil Nadu','CORPORATE'),('Cust_165','CHUCK MAGEE','Cochin','Kerala','CORPORATE'),('Cust_1650','THOMAS THORNTON','Chennai','Tamil Nadu','CONSUMER'),('Cust_1651','IRENE MADDOX','Chennai','Tamil Nadu','CONSUMER'),('Cust_1652','ALLEN ARMOLD','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1653','ERIC BARRETO','Chennai','Tamil Nadu','CONSUMER'),('Cust_1654','RAYMOND FAIR','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1655','TRACY HOPKINS','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1656','NATALIE WEBBER','Chennai','Tamil Nadu','CORPORATE'),('Cust_1657','BRAD THOMAS','Chennai','Tamil Nadu','CORPORATE'),('Cust_1658','KEAN THORNTON','Chennai','Tamil Nadu','CORPORATE'),('Cust_1659','ALYSSA TATE','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_166','GREG GUTHRIE','Cochin','Kerala','SMALL BUSINESS'),('Cust_1660','JULIA BARNETT','Chennai','Tamil Nadu','CORPORATE'),('Cust_1661','ANNE MCFARLAND','Chennai','Tamil Nadu','CONSUMER'),('Cust_1662','THEA HENDRICKS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1663','NATALIE WEBBER','Chennai','Tamil Nadu','CONSUMER'),('Cust_1664','ERIC BARRETO','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1665','ED JACOBS','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1666','DEAN KATZ','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1667','GIULIETTA DORTCH','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1668','MUHAMMED LEE','Chennai','Tamil Nadu','CONSUMER'),('Cust_1669','ART FOSTER','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_167','CARLOS SOLTERO','Cochin','Kerala','SMALL BUSINESS'),('Cust_1670','EUGENE MOREN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1671','CAROL DARLEY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1672','MARIBETH DONA','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1673','FRED HARTON','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1674','ANDREW ALLEN','Chennai','Tamil Nadu','CORPORATE'),('Cust_1675','ART MILLER','Chennai','Tamil Nadu','CORPORATE'),('Cust_1676','SCOTT COHEN','Chennai','Tamil Nadu','CONSUMER'),('Cust_1677','LAUREN LEATHERBURY','Chennai','Tamil Nadu','CORPORATE'),('Cust_1678','GREG MATTHIAS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1679','CYNTHIA DELANEY','Chennai','Tamil Nadu','CORPORATE'),('Cust_168','GREG GUTHRIE','Cochin','Kerala','CORPORATE'),('Cust_1680','ANTHONY RAWLES','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1681','LAUREN LEATHERBURY','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1682','BARRY BLUMSTEIN','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1683','EVA JACOBS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1684','CAROL DARLEY','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1685','DUANE NOONAN','Chennai','Tamil Nadu','CORPORATE'),('Cust_1686','GREG MATTHIAS','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_1687','SANJIT JACOBS','Chennai','Tamil Nadu','CONSUMER'),('Cust_1688','KEN LONSDALE','Chennai','Tamil Nadu','CONSUMER'),('Cust_1689','CHRISTOPHER MARTINEZ','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_169','CARLOS SOLTERO','Cochin','Kerala','CONSUMER'),('Cust_1690','RICARDO BLOCK','Bangalore','Karnataka','CORPORATE'),('Cust_1691','ROGER BARCIO','Bangalore','Karnataka','CORPORATE'),('Cust_1692','SUNG PAK','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1693','TIM BROCKMAN','Bangalore','Karnataka','CONSUMER'),('Cust_1694','VICTORIA PISTEKA','Bangalore','Karnataka','CORPORATE'),('Cust_1695','SUNG CHUNG','Bangalore','Karnataka','HOME OFFICE'),('Cust_1696','RESI POLKING','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1697','ROGER DEMIR','Bangalore','Karnataka','CONSUMER'),('Cust_1698','TAMARA MANNING','Bangalore','Karnataka','CORPORATE'),('Cust_1699','SUE ANN REED','Bangalore','Karnataka','CONSUMER'),('Cust_17','GRANT CARROLL','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_170','CHRISTOPHER SCHILD','Cochin','Kerala','CORPORATE'),('Cust_1700','JOHN MURRAY','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1701','SHAUN CHANCE','Bangalore','Karnataka','CORPORATE'),('Cust_1702','DARREN POWERS','Bangalore','Karnataka','CORPORATE'),('Cust_1703','PENELOPE SEWALL','Bangalore','Karnataka','HOME OFFICE'),('Cust_1704','MIKE PELLETIER','Bangalore','Karnataka','CORPORATE'),('Cust_1705','TOM PRESCOTT','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1706','SHARELLE ROACH','Bangalore','Karnataka','HOME OFFICE'),('Cust_1707','PAULINE WEBBER','Bangalore','Karnataka','CONSUMER'),('Cust_1708','QUINCY JONES','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1709','LINDSAY CASTELL','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_171','JOY SMITH','Cochin','Kerala','CORPORATE'),('Cust_1710','ADAM BELLAVANCE','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1711','KEN DANA','Bangalore','Karnataka','CORPORATE'),('Cust_1712','KEN DANA','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1713','LINDSAY CASTELL','Bangalore','Karnataka','CORPORATE'),('Cust_1714','LAUREL WORKMAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1715','LISA RYAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1716','MAX ENGLE','Bangalore','Karnataka','CORPORATE'),('Cust_1717','HELEN WASSERMAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1718','JULIA DUNBAR','Bangalore','Karnataka','CONSUMER'),('Cust_1719','CARL WEISS','Bangalore','Karnataka','CONSUMER'),('Cust_172','JOY SMITH','Cochin','Kerala','CONSUMER'),('Cust_1720','CHUCK CLARK','Bangalore','Karnataka','CORPORATE'),('Cust_1721','DARREN KOUTRAS','Bangalore','Karnataka','CONSUMER'),('Cust_1722','ROLAND MURRAY','Bangalore','Karnataka','HOME OFFICE'),('Cust_1723','DANIEL BYRD','Bangalore','Karnataka','HOME OFFICE'),('Cust_1724','BOBBY ODEGARD','Bangalore','Karnataka','CORPORATE'),('Cust_1725','CHLORIS KASTENSMIDT','Bangalore','Karnataka','CONSUMER'),('Cust_1726','BOBBY ODEGARD','Bangalore','Karnataka','CONSUMER'),('Cust_1727','ARTHUR GAINER','Bangalore','Karnataka','CONSUMER'),('Cust_1728','LISA HAZARD','Bangalore','Karnataka','HOME OFFICE'),('Cust_1729','MITCH GASTINEAU','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_173','BRIAN MOSS','Cochin','Kerala','CORPORATE'),('Cust_1730','KATHARINE HARMS','Bangalore','Karnataka','CONSUMER'),('Cust_1731','MATTHEW GRINSTEIN','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1732','CATHY PRESCOTT','Bangalore','Karnataka','CORPORATE'),('Cust_1733','LAUREN LEATHERBURY','Bangalore','Karnataka','CORPORATE'),('Cust_1734','LAUREN LEATHERBURY','Bangalore','Karnataka','HOME OFFICE'),('Cust_1735','MITCH GASTINEAU','Bangalore','Karnataka','CORPORATE'),('Cust_1736','QUINCY JONES','Bangalore','Karnataka','CORPORATE'),('Cust_1737','MARIA ETEZADI','Bangalore','Karnataka','HOME OFFICE'),('Cust_1738','CARI MACINTYRE','Bangalore','Karnataka','CORPORATE'),('Cust_1739','SAMPLE COMPANY A','Bangalore','Karnataka','HOME OFFICE'),('Cust_174','LOGAN HAUSHALTER','Cochin','Kerala','CORPORATE'),('Cust_1740','MARIA ZETTNER','Bangalore','Karnataka','CORPORATE'),('Cust_1741','SONIA COOLEY','Bangalore','Karnataka','CORPORATE'),('Cust_1742','SIBELLA PARKS','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1743','HALLIE REDMOND','Bangalore','Karnataka','HOME OFFICE'),('Cust_1744','HAROLD DAHLEN','Bangalore','Karnataka','CORPORATE'),('Cust_1745','HALLIE REDMOND','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1746','BECKY PAK','Bangalore','Karnataka','CORPORATE'),('Cust_1747','HAROLD DAHLEN','Bangalore','Karnataka','CONSUMER'),('Cust_1748','CLYTIE KELTY','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1749','ADAM SHILLINGSBURG','Bangalore','Karnataka','CORPORATE'),('Cust_175','JIM SINK','Cochin','Kerala','CORPORATE'),('Cust_1750','BROOKE GILLINGHAM','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1751','TOM BOECKENHAUER','Bangalore','Karnataka','CORPORATE'),('Cust_1752','ALEX RUSSELL','Bangalore','Karnataka','HOME OFFICE'),('Cust_1753','ALEJANDRO BALLENTINE','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1754','CLAIRE GOOD','Bangalore','Karnataka','HOME OFFICE'),('Cust_1755','TRUDY BELL','Bangalore','Karnataka','CONSUMER'),('Cust_1756','ALYSSA CROUSE','Bangalore','Karnataka','CORPORATE'),('Cust_1757','CASSANDRA BRANDOW','Bangalore','Karnataka','HOME OFFICE'),('Cust_1758','ADRIAN BARTON','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1759','CATHERINE GLOTZBACH','Bangalore','Karnataka','HOME OFFICE'),('Cust_176','JENNIFER BRAXTON','Cochin','Kerala','SMALL BUSINESS'),('Cust_1760','JENNA CAFFEY','Bangalore','Karnataka','CONSUMER'),('Cust_1761','ROSE O\'BRIAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1762','VALERIE TAKAHITO','Bangalore','Karnataka','CONSUMER'),('Cust_1763','RICK WILSON','Bangalore','Karnataka','CONSUMER'),('Cust_1764','FRANK OLSEN','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1765','RICK WILSON','Bangalore','Karnataka','CORPORATE'),('Cust_1766','ERICA HACKNEY','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1767','ALYSSA CROUSE','Bangalore','Karnataka','HOME OFFICE'),('Cust_1768','KEN LONSDALE','Bangalore','Karnataka','CONSUMER'),('Cust_1769','CARI SAYRE','Bangalore','Karnataka','CORPORATE'),('Cust_177','HAROLD ENGLE','Cochin','Kerala','HOME OFFICE'),('Cust_1770','ALICE MCCARTHY','Bangalore','Karnataka','CORPORATE'),('Cust_1771','FRANK MERWIN','Bangalore','Karnataka','CONSUMER'),('Cust_1772','ANNIE THURMAN','Bangalore','Karnataka','CONSUMER'),('Cust_1773','BRUCE MONEY','Bangalore','Karnataka','CORPORATE'),('Cust_1774','KELLY WILLIAMS','Bangalore','Karnataka','CORPORATE'),('Cust_1775','DANIEL LACY','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1776','ANNIE THURMAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1777','GEORGIA ROSENBERG','Bangalore','Karnataka','CONSUMER'),('Cust_1778','CRAIG CARROLL','Bangalore','Karnataka','CORPORATE'),('Cust_1779','CRAIG CARROLL','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_178','HILARY HOLDEN','Cochin','Kerala','CORPORATE'),('Cust_1780','CRAIG LESLIE','Bangalore','Karnataka','CONSUMER'),('Cust_1781','EMILY GRADY','Bangalore','Karnataka','HOME OFFICE'),('Cust_1782','LARRY TRON','Bangalore','Karnataka','HOME OFFICE'),('Cust_1783','BRIAN DECHERNEY','Bangalore','Karnataka','CORPORATE'),('Cust_1784','ANN STEELE','Bangalore','Karnataka','CORPORATE'),('Cust_1785','CARI SAYRE','Bangalore','Karnataka','HOME OFFICE'),('Cust_1786','LARRY TRON','Bangalore','Karnataka','CORPORATE'),('Cust_1787','HAROLD PAWLAN','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1788','FRANK MERWIN','Bangalore','Karnataka','CORPORATE'),('Cust_1789','ANTHONY JACOBS','Bangalore','Karnataka','HOME OFFICE'),('Cust_179','ERICA BERN','Cochin','Kerala','CORPORATE'),('Cust_1790','KATRINA EDELMAN','Bangalore','Karnataka','CORPORATE'),('Cust_1791','GRACE KELLY','Bangalore','Karnataka','CONSUMER'),('Cust_1792','FRANK GASTINEAU','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1793','RUBEN DARTT','Bangalore','Karnataka','CORPORATE'),('Cust_1794','LIZ PELLETIER','Bangalore','Karnataka','CORPORATE'),('Cust_1795','TONY SAYRE','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1796','ROY PHAN','Bangalore','Karnataka','CONSUMER'),('Cust_1797','CLAY CHEATHAM','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1798','YOSEPH CARROLL','Bangalore','Karnataka','CONSUMER'),('Cust_1799','RAYMOND BOOK','Bangalore','Karnataka','CONSUMER'),('Cust_18','ALAN BARNES','Kolkata','West Bengal','CORPORATE'),('Cust_180','HAROLD ENGLE','Cochin','Kerala','CONSUMER'),('Cust_1800','ALAN DOMINGUEZ','Bangalore','Karnataka','CORPORATE'),('Cust_1801','STEPHANIE PHELPS','Bangalore','Karnataka','CONSUMER'),('Cust_1802','ADRIAN HANE','Bangalore','Karnataka','CORPORATE'),('Cust_1803','TONJA TURNELL','Bangalore','Karnataka','CONSUMER'),('Cust_1804','BRENDAN SWEED','Bangalore','Karnataka','CONSUMER'),('Cust_1805','TONY SAYRE','Bangalore','Karnataka','HOME OFFICE'),('Cust_1806','JIM KARLSSON','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1807','ROY PHAN','Bangalore','Karnataka','CORPORATE'),('Cust_1808','STEVEN ROELLE','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1809','CHRISTOPHER CONANT','Bangalore','Karnataka','CONSUMER'),('Cust_181','HELEN ABELMAN','Cochin','Kerala','HOME OFFICE'),('Cust_1810','ANDREW ROBERTS','Bangalore','Karnataka','HOME OFFICE'),('Cust_1811','CYMA KINNEY','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1812','CHRISTINE ABELMAN','Bangalore','Karnataka','CORPORATE'),('Cust_1813','ERICA SMITH','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1814','CHRISTOPHER CONANT','Bangalore','Karnataka','HOME OFFICE'),('Cust_1815','SARAH BROWN','Bangalore','Karnataka','CONSUMER'),('Cust_1816','SHUI TOM','Bangalore','Karnataka','HOME OFFICE'),('Cust_1817','FRANK HAWLEY','Bangalore','Karnataka','HOME OFFICE'),('Cust_1818','AARON BERGMAN','Bangalore','Karnataka','CORPORATE'),('Cust_1819','VICTORIA BRENNAN','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_182','JACK LEBRON','Chennai','Tamil Nadu','CORPORATE'),('Cust_1820','ADRIAN SHAMI','Bangalore','Karnataka','CONSUMER'),('Cust_1821','PHILLINA OBER','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1822','ANDREW ROBERTS','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1823','JEREMY LONSDALE','Bangalore','Karnataka','CORPORATE'),('Cust_1824','SHUI TOM','Bangalore','Karnataka','CONSUMER'),('Cust_1825','ANDY YOTOV','Bangalore','Karnataka','CORPORATE'),('Cust_1826','NICOLE BRENNAN','Bangalore','Karnataka','HOME OFFICE'),('Cust_1827','JESSICA MYRICK','Bangalore','Karnataka','SMALL BUSINESS'),('Cust_1828','NICOLE BRENNAN','Bangalore','Karnataka','CONSUMER'),('Cust_1829','JASON FORTUNE','Bangalore','Karnataka','CORPORATE'),('Cust_183','GIULIETTA BAPTIST','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_1830','HARRY GREENE','Bangalore','Karnataka','CORPORATE'),('Cust_1831','GRANT DONATELLI','Bangalore','Karnataka','CONSUMER'),('Cust_1832','MICK BROWN','Bangalore','Karnataka','CONSUMER'),('Cust_184','JIM SINK','Chennai','Tamil Nadu','CORPORATE'),('Cust_185','JULIE CREIGHTON','Chennai','Tamil Nadu','CORPORATE'),('Cust_186','SANJIT CHAND','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_187','MATT COLLINS','Chennai','Tamil Nadu','CONSUMER'),('Cust_188','JUSTIN KNIGHT','Chennai','Tamil Nadu','CORPORATE'),('Cust_189','ROB HABERLIN','Chennai','Tamil Nadu','CORPORATE'),('Cust_19','JACK GARZA','Kolkata','West Bengal','CORPORATE'),('Cust_190','ROB HABERLIN','Chennai','Tamil Nadu','CONSUMER'),('Cust_191','CHRISTINA VANDERZANDEN','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_192','LENA CACIOPPO','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_193','KIMBERLY CARTER','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_194','GENE HALE','Chennai','Tamil Nadu','CONSUMER'),('Cust_195','SALLY KNUTSON','Chennai','Tamil Nadu','CONSUMER'),('Cust_196','MARINA LICHTENSTEIN','Chennai','Tamil Nadu','CORPORATE'),('Cust_197','MICHELLE ARNETT','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_198','SETH VERNON','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_199','LUKE WEISS','Chennai','Tamil Nadu','CORPORATE'),('Cust_2','BARRY FRENCH','Kolkata','West Bengal','CONSUMER'),('Cust_20','JULIA WEST','Kolkata','West Bengal','CORPORATE'),('Cust_200','ANTHONY JOHNSON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_201','KIMBERLY CARTER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_202','SALLY KNUTSON','Chennai','Tamil Nadu','CORPORATE'),('Cust_203','CHRISTINA DEMOSS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_204','MONICA FEDERLE','Chennai','Tamil Nadu','CORPORATE'),('Cust_205','JOY SMITH','Chennai','Tamil Nadu','CONSUMER'),('Cust_206','SONIA SUNLEY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_207','ANTHONY O\'DONNELL','Chennai','Tamil Nadu','CONSUMER'),('Cust_208','EMILY GRADY','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_209','ALEX AVILA','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_21','EUGENE BARCHAS','Kolkata','West Bengal','CORPORATE'),('Cust_210','BRIAN MOSS','Chennai','Tamil Nadu','CORPORATE'),('Cust_211','ANNA ANDREADI','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_212','BARBARA FISHER','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_213','KELLY WILLIAMS','Chennai','Tamil Nadu','CORPORATE'),('Cust_214','SONIA SUNLEY','Chennai','Tamil Nadu','CORPORATE'),('Cust_215','JOCASTA RUPERT','Chennai','Tamil Nadu','CONSUMER'),('Cust_216','RICK DUSTON','Chennai','Tamil Nadu','CORPORATE'),('Cust_217','ANGELE HOOD','Chennai','Tamil Nadu','CONSUMER'),('Cust_218','DENNIS BOLTON','Chennai','Tamil Nadu','CONSUMER'),('Cust_219','STEWART CARMICHAEL','Chennai','Tamil Nadu','CORPORATE'),('Cust_22','EDWARD HOOKS','Kolkata','West Bengal','CONSUMER'),('Cust_220','ALEX AVILA','Chennai','Tamil Nadu','CORPORATE'),('Cust_221','SARAH FOSTER','Chennai','Tamil Nadu','CORPORATE'),('Cust_222','JIM KARLSSON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_223','LISA DECHERNEY','Chennai','Tamil Nadu','CORPORATE'),('Cust_224','ROY SKARIA','Chennai','Tamil Nadu','CORPORATE'),('Cust_225','DENNIS BOLTON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_226','PETER BUHLER','Chennai','Tamil Nadu','CONSUMER'),('Cust_227','ANTHONY O\'DONNELL','Chennai','Tamil Nadu','CORPORATE'),('Cust_228','DANIEL LACY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_229','GIULIETTA WEIMER','Chennai','Tamil Nadu','CORPORATE'),('Cust_23','BRAD EASON','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_230','MIKE VITTORINI','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_231','LELA DONOVAN','Chennai','Tamil Nadu','CORPORATE'),('Cust_232','SHAHID SHARIARI','Chennai','Tamil Nadu','CORPORATE'),('Cust_233','TRUDY SCHMIDT','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_234','CHRISTOPHER MARTINEZ','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_235','MARC HARRIGAN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_236','LIZ PRICE','Chennai','Tamil Nadu','CONSUMER'),('Cust_237','RALPH KENNEDY','Chennai','Tamil Nadu','CORPORATE'),('Cust_238','ROB DOWD','Chennai','Tamil Nadu','CORPORATE'),('Cust_239','KHLOE MILLER','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_24','NICOLE HANSEN','Kolkata','West Bengal','SMALL BUSINESS'),('Cust_240','SHAHID HOPKINS','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_241','KRISTINA NUNN','Chennai','Tamil Nadu','CONSUMER'),('Cust_242','RICARDO EMERSON','Chennai','Tamil Nadu','CORPORATE'),('Cust_243','PATRICK O\'BRILL','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_244','THOMAS BRUMLEY','Chennai','Tamil Nadu','CONSUMER'),('Cust_245','VICKY FREYMANN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_246','KHLOE MILLER','Chennai','Tamil Nadu','CORPORATE'),('Cust_247','TONY CHAPMAN','Chennai','Tamil Nadu','CONSUMER'),('Cust_248','LIZ PRICE','Chennai','Tamil Nadu','CORPORATE'),('Cust_249','SARAH BERN','Chennai','Tamil Nadu','CORPORATE'),('Cust_25','DOROTHY WARDLE','Kolkata','West Bengal','CORPORATE'),('Cust_250','MARK COUSINS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_251','MARK COUSINS','Chennai','Tamil Nadu','CORPORATE'),('Cust_252','DANIEL BYRD','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_253','JOHN MURRAY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_254','LENA HERNANDEZ','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_255','GREG MAXWELL','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_256','GIULIETTA WEIMER','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_257','JUSTIN HIRSH','Chennai','Tamil Nadu','CONSUMER'),('Cust_258','SHAHID SHARIARI','Chennai','Tamil Nadu','CONSUMER'),('Cust_259','SALLY KNUTSON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_26','AARON BERGMAN','Kolkata','West Bengal','CORPORATE'),('Cust_260','SALLY KNUTSON','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_261','HEATHER JAS','Chennai','Tamil Nadu','CORPORATE'),('Cust_262','PHILISSE OVERCASH','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_263','NEIL KNUDSON','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_264','CATHY ARMSTRONG','Chennai','Tamil Nadu','CONSUMER'),('Cust_265','NEIL KNUDSON','Chennai','Tamil Nadu','CORPORATE'),('Cust_266','CHUCK CLARK','Chennai','Tamil Nadu','CORPORATE'),('Cust_267','KHLOE MILLER','Chennai','Tamil Nadu','CONSUMER'),('Cust_268','BILL EPLETT','Chennai','Tamil Nadu','CORPORATE'),('Cust_269','JOHN GRADY','Chennai','Tamil Nadu','CORPORATE'),('Cust_27','DON JONES','Kolkata','West Bengal','CORPORATE'),('Cust_270','KHLOE MILLER','Delhi','Delhi','HOME OFFICE'),('Cust_271','TONY CHAPMAN','Delhi','Delhi','CONSUMER'),('Cust_272','RALPH KENNEDY','Delhi','Delhi','CORPORATE'),('Cust_273','TRUDY SCHMIDT','Delhi','Delhi','SMALL BUSINESS'),('Cust_274','GENE HALE','Delhi','Delhi','CONSUMER'),('Cust_275','SARAH BERN','Delhi','Delhi','CORPORATE'),('Cust_276','JUSTIN HIRSH','Delhi','Delhi','CONSUMER'),('Cust_277','LIZ PRICE','Delhi','Delhi','CONSUMER'),('Cust_278','GREG MAXWELL','Delhi','Delhi','HOME OFFICE'),('Cust_279','MARC HARRIGAN','Delhi','Delhi','HOME OFFICE'),('Cust_28','BETH THOMPSON','Kolkata','West Bengal','CORPORATE'),('Cust_280','SALLY KNUTSON','Delhi','Delhi','CORPORATE'),('Cust_281','GIULIETTA WEIMER','Delhi','Delhi','CORPORATE'),('Cust_282','KRISTINA NUNN','Delhi','Delhi','CONSUMER'),('Cust_283','CHUCK CLARK','Delhi','Delhi','CORPORATE'),('Cust_284','SALLY KNUTSON','Delhi','Delhi','CONSUMER'),('Cust_285','TANJA NORVELL','Delhi','Delhi','CONSUMER'),('Cust_286','LIZ PRICE','Delhi','Delhi','CORPORATE'),('Cust_287','VICKY FREYMANN','Delhi','Delhi','HOME OFFICE'),('Cust_288','PHILISSE OVERCASH','Delhi','Delhi','SMALL BUSINESS'),('Cust_289','PATRICK O\'BRILL','Delhi','Delhi','HOME OFFICE'),('Cust_29','FRANK PRICE','Kolkata','West Bengal','CORPORATE'),('Cust_290','CATHY ARMSTRONG','Delhi','Delhi','CONSUMER'),('Cust_291','HEATHER JAS','Delhi','Delhi','CORPORATE'),('Cust_292','LENA HERNANDEZ','Delhi','Delhi','HOME OFFICE'),('Cust_293','SHAHID SHARIARI','Delhi','Delhi','CONSUMER'),('Cust_294','KHLOE MILLER','Delhi','Delhi','CONSUMER'),('Cust_295','PAUL MACINTYRE','Delhi','Delhi','CORPORATE'),('Cust_296','MIKE VITTORINI','Delhi','Delhi','SMALL BUSINESS'),('Cust_297','JOHN GRADY','Delhi','Delhi','CORPORATE'),('Cust_298','RICARDO EMERSON','Delhi','Delhi','CORPORATE'),('Cust_299','MATT ABELMAN','Delhi','Delhi','CONSUMER'),('Cust_3','CLAY ROZENDAL','Kolkata','West Bengal','CORPORATE'),('Cust_30','MICHELLE LONSDALE','Kolkata','West Bengal','HOME OFFICE'),('Cust_300','SARAH JORDON','Delhi','Delhi','CONSUMER'),('Cust_301','SALLY MATTHIAS','Delhi','Delhi','CORPORATE'),('Cust_302','SALLY MATTHIAS','Delhi','Delhi','HOME OFFICE'),('Cust_303','THEONE PIPPENGER','Delhi','Delhi','CORPORATE'),('Cust_304','ART FERGUSON','Delhi','Delhi','CORPORATE'),('Cust_305','JACK O\'BRIANT','Delhi','Delhi','HOME OFFICE'),('Cust_306','NATHAN CANO','Delhi','Delhi','CONSUMER'),('Cust_307','MICHAEL GRANLUND','Delhi','Delhi','CORPORATE'),('Cust_308','STEVE CARROLL','Delhi','Delhi','CONSUMER'),('Cust_309','SCOTT WILLIAMSON','Delhi','Delhi','SMALL BUSINESS'),('Cust_31','ANN CHONG','Kolkata','West Bengal','CORPORATE'),('Cust_310','DENNIS BOLTON','Delhi','Delhi','SMALL BUSINESS'),('Cust_311','SEAN WENDT','Delhi','Delhi','CORPORATE'),('Cust_312','JOHN CASTELL','Delhi','Delhi','CONSUMER'),('Cust_313','JACK O\'BRIANT','Delhi','Delhi','SMALL BUSINESS'),('Cust_314','DAVID PHILIPPE','Delhi','Delhi','CONSUMER'),('Cust_315','CHAD SIEVERT','Delhi','Delhi','CORPORATE'),('Cust_316','MATT ABELMAN','Delhi','Delhi','HOME OFFICE'),('Cust_317','SHAUN WEIEN','Delhi','Delhi','HOME OFFICE'),('Cust_318','MAYA HERMAN','Delhi','Delhi','CORPORATE'),('Cust_319','MICHAEL GRANLUND','Delhi','Delhi','HOME OFFICE'),('Cust_32','JOY BELL','Kolkata','West Bengal','HOME OFFICE'),('Cust_320','JACK O\'BRIANT','Delhi','Delhi','CONSUMER'),('Cust_321','IVAN LISTON','Delhi','Delhi','CONSUMER'),('Cust_322','BRAD NORVELL','Delhi','Delhi','CORPORATE'),('Cust_323','KEN HEIDEL','Delhi','Delhi','CORPORATE'),('Cust_324','JOHN CASTELL','Delhi','Delhi','SMALL BUSINESS'),('Cust_325','MIKE KENNEDY','Delhi','Delhi','SMALL BUSINESS'),('Cust_326','CHARLES SHELDON','Delhi','Delhi','CORPORATE'),('Cust_327','MIKE KENNEDY','Delhi','Delhi','CORPORATE'),('Cust_328','MATT ABELMAN','Delhi','Delhi','SMALL BUSINESS'),('Cust_329','BRIAN DERR','Delhi','Delhi','SMALL BUSINESS'),('Cust_33','SKYE NORLING','Kolkata','West Bengal','HOME OFFICE'),('Cust_330','ROLAND BLACK','Delhi','Delhi','SMALL BUSINESS'),('Cust_331','DANA KAYDOS','Delhi','Delhi','CORPORATE'),('Cust_332','DARREN KOUTRAS','Delhi','Delhi','CONSUMER'),('Cust_333','NEIL DUCICH','Delhi','Delhi','HOME OFFICE'),('Cust_334','SEAN WENDT','Chennai','Tamil Nadu','CORPORATE'),('Cust_335','MIKE KENNEDY','Chennai','Tamil Nadu','CORPORATE'),('Cust_336','MATT ABELMAN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_337','SALLY MATTHIAS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_338','STEVE CARROLL','Chennai','Tamil Nadu','CONSUMER'),('Cust_339','JOHN CASTELL','Chennai','Tamil Nadu','CONSUMER'),('Cust_34','BARRY WEIRICH','Kolkata','West Bengal','CORPORATE'),('Cust_340','NEIL DUCICH','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_341','PARHENA NORRIS','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_342','ROLAND BLACK','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_343','KEN HEIDEL','Chennai','Tamil Nadu','CORPORATE'),('Cust_344','SARAH JORDON','Chennai','Tamil Nadu','CONSUMER'),('Cust_345','JOHN CASTELL','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_346','BART WATTERS','Chennai','Tamil Nadu','CORPORATE'),('Cust_347','MARY O\'ROURKE','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_348','NATHAN CANO','Chennai','Tamil Nadu','CONSUMER'),('Cust_349','MATT ABELMAN','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_35','GRANT CARROLL','Kolkata','West Bengal','CORPORATE'),('Cust_350','MICHAEL GRANLUND','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_351','DANA KAYDOS','Chennai','Tamil Nadu','CORPORATE'),('Cust_352','CHAD SIEVERT','Chennai','Tamil Nadu','CORPORATE'),('Cust_353','HUNTER LOPEZ','Chennai','Tamil Nadu','CONSUMER'),('Cust_354','NATHAN MAUTZ','Chennai','Tamil Nadu','CORPORATE'),('Cust_355','SHAUN WEIEN','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_356','NATHAN MAUTZ','Chennai','Tamil Nadu','HOME OFFICE'),('Cust_357','THEONE PIPPENGER','Chennai','Tamil Nadu','CORPORATE'),('Cust_358','SCOTT WILLIAMSON','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_359','MIKE KENNEDY','Chennai','Tamil Nadu','SMALL BUSINESS'),('Cust_36','ADRIAN HANE','Kolkata','West Bengal','CORPORATE'),('Cust_360','MIKE KENNEDY','Cochin','Kerala','CORPORATE'),('Cust_361','MARK COUSINS','Cochin','Kerala','CORPORATE'),('Cust_362','ROLAND BLACK','Cochin','Kerala','SMALL BUSINESS'),('Cust_363','BART WATTERS','Cochin','Kerala','CORPORATE'),('Cust_364','MATT ABELMAN','Cochin','Kerala','CONSUMER'),('Cust_365','PARHENA NORRIS','Cochin','Kerala','HOME OFFICE'),('Cust_366','THEONE PIPPENGER','Cochin','Kerala','CORPORATE'),('Cust_367','SALLY MATTHIAS','Cochin','Kerala','HOME OFFICE'),('Cust_368','DANA KAYDOS','Cochin','Kerala','CORPORATE'),('Cust_369','SEAN WENDT','Cochin','Kerala','CORPORATE'),('Cust_37','ANDREW GJERTSEN','Kolkata','West Bengal','CONSUMER'),('Cust_370','NATHAN MAUTZ','Cochin','Kerala','CORPORATE'),('Cust_371','AARON SMAYLING','Cochin','Kerala','SMALL BUSINESS'),('Cust_372','CHARLES SHELDON','Cochin','Kerala','CORPORATE'),('Cust_373','SHAUN WEIEN','Cochin','Kerala','HOME OFFICE'),('Cust_374','MARY O\'ROURKE','Cochin','Kerala','HOME OFFICE'),('Cust_375','MARK COUSINS','Cochin','Kerala','HOME OFFICE'),('Cust_376','BRAD NORVELL','Cochin','Kerala','CORPORATE'),('Cust_377','CHAD SIEVERT','Cochin','Kerala','CORPORATE'),('Cust_378','BRIAN DERR','Cochin','Kerala','SMALL BUSINESS'),('Cust_379','NEIL DUCICH','Cochin','Kerala','HOME OFFICE'),('Cust_38','RALPH KNIGHT','Kolkata','West Bengal','CONSUMER'),('Cust_380','SARAH JORDON','Cochin','Kerala','CONSUMER'),('Cust_381','MIKE KENNEDY','Cochin','Kerala','SMALL BUSINESS'),('Cust_382','MICHAEL GRANLUND','Cochin','Kerala','HOME OFFICE'),('Cust_383','KEN HEIDEL','Cochin','Kerala','CORPORATE'),('Cust_384','ART FERGUSON','Cochin','Kerala','CORPORATE'),('Cust_385','STEVE CARROLL','Cochin','Kerala','CONSUMER'),('Cust_386','NATHAN MAUTZ','Cochin','Kerala','HOME OFFICE'),('Cust_387','MATT ABELMAN','Cochin','Kerala','HOME OFFICE'),('Cust_388','NATHAN CANO','Cochin','Kerala','CONSUMER'),('Cust_389','DENNIS BOLTON','Cochin','Kerala','SMALL BUSINESS'),('Cust_39','BETH PAIGE','Kolkata','West Bengal','CONSUMER'),('Cust_390','JOEL JENKINS','Cochin','Kerala','CORPORATE'),('Cust_391','MEG O\'CONNEL','Cochin','Kerala','CORPORATE'),('Cust_392','HALLIE REDMOND','Cochin','Kerala','HOME OFFICE'),('Cust_393','LIZ THOMPSON','Cochin','Kerala','CORPORATE'),('Cust_394','ROBERT WALDORF','Cochin','Kerala','HOME OFFICE'),('Cust_395','HELEN ANDREADA','Cochin','Kerala','CORPORATE'),('Cust_396','JULIA DUNBAR','Cochin','Kerala','CONSUMER'),('Cust_397','CHRISTINE SUNDARESAM','Cochin','Kerala','SMALL BUSINESS'),('Cust_398','BRUCE STEWART','Cochin','Kerala','CORPORATE'),('Cust_399','GUY THORNTON','Cochin','Kerala','CORPORATE'),('Cust_4','CARLOS SOLTERO','Kolkata','West Bengal','CONSUMER'),('Cust_40','SYLVIA FOULSTON','Kolkata','West Bengal','CORPORATE'),('Cust_400','MARY ZEWE','Cochin','Kerala','CORPORATE'),('Cust_401','KEN LONSDALE','Cochin','Kerala','CONSUMER'),('Cust_402','MARIA BERTELSON','Cochin','Kerala','HOME OFFICE'),('Cust_403','BRIAN THOMPSON','Cochin','Kerala','HOME OFFICE'),('Cust_404','HALLIE REDMOND','Cochin','Kerala','SMALL BUSINESS'),('Cust_405','JASON GROSS','Cochin','Kerala','SMALL BUSINESS'),('Cust_406','KATRINA BAVINGER','Cochin','Kerala','CONSUMER'),('Cust_407','MARIA BERTELSON','Cochin','Kerala','CORPORATE'),('Cust_408','IVAN GIBSON','Cochin','Kerala','CORPORATE'),('Cust_409','DOUG BICKFORD','Mysore','Karnataka','CORPORATE'),('Cust_41','BETH PAIGE','Mumbai','Maharashtra','CONSUMER'),('Cust_410','LIZ THOMPSON','Mysore','Karnataka','CORPORATE'),('Cust_411','MARIA BERTELSON','Mysore','Karnataka','HOME OFFICE'),('Cust_412','GUY THORNTON','Mysore','Karnataka','CORPORATE'),('Cust_413','BRUCE STEWART','Mysore','Karnataka','CORPORATE'),('Cust_414','BRIAN THOMPSON','Mysore','Karnataka','HOME OFFICE'),('Cust_415','JOSEPH AIRDO','Mysore','Karnataka','CORPORATE'),('Cust_416','CHRISTINA VANDERZANDEN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_417','JOSEPH AIRDO','Mysore','Karnataka','CONSUMER'),('Cust_418','KEN LONSDALE','Mysore','Karnataka','CONSUMER'),('Cust_419','ROBERT WALDORF','Mysore','Karnataka','HOME OFFICE'),('Cust_42','SYLVIA FOULSTON','Mumbai','Maharashtra','CORPORATE'),('Cust_420','KATRINA BAVINGER','Mysore','Karnataka','CONSUMER'),('Cust_421','MEG O\'CONNEL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_422','CHRISTINE SUNDARESAM','Mysore','Karnataka','SMALL BUSINESS'),('Cust_423','LYCORIS SAUNDERS','Mysore','Karnataka','HOME OFFICE'),('Cust_424','LYCORIS SAUNDERS','Mysore','Karnataka','CORPORATE'),('Cust_425','DOROTHY DICKINSON','Mysore','Karnataka','CORPORATE'),('Cust_426','MARY ZEWE','Mysore','Karnataka','CORPORATE'),('Cust_427','JANET MOLINARI','Mysore','Karnataka','CORPORATE'),('Cust_428','JULIE PRESCOTT','Mysore','Karnataka','HOME OFFICE'),('Cust_429','MARIA BERTELSON','Mysore','Karnataka','CORPORATE'),('Cust_43','BRYAN DAVIS','Mumbai','Maharashtra','CORPORATE'),('Cust_430','ANNIE THURMAN','Mysore','Karnataka','HOME OFFICE'),('Cust_431','MEG O\'CONNEL','Mysore','Karnataka','CORPORATE'),('Cust_432','ROB BEEGHLY','Mysore','Karnataka','CONSUMER'),('Cust_433','IVAN GIBSON','Mysore','Karnataka','CORPORATE'),('Cust_434','ANNIE THURMAN','Mysore','Karnataka','CONSUMER'),('Cust_435','BILL EPLETT','Mysore','Karnataka','CORPORATE'),('Cust_436','DOUG O\'CONNELL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_437','CRAIG CARROLL','Mysore','Karnataka','CORPORATE'),('Cust_438','LIZ MACKENDRICK','Mysore','Karnataka','CORPORATE'),('Cust_439','CHRISTINE KARGATIS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_44','JOY BELL','Mumbai','Maharashtra','HOME OFFICE'),('Cust_440','BOBBY ODEGARD','Mysore','Karnataka','CORPORATE'),('Cust_441','CRAIG CARROLL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_442','RUSSELL APPLEGATE','Mysore','Karnataka','HOME OFFICE'),('Cust_443','BILL DONATELLI','Mysore','Karnataka','SMALL BUSINESS'),('Cust_444','BILL DONATELLI','Mysore','Karnataka','CORPORATE'),('Cust_445','DUANE BENOIT','Mysore','Karnataka','HOME OFFICE'),('Cust_446','BOBBY ODEGARD','Mysore','Karnataka','CONSUMER'),('Cust_447','RUSSELL APPLEGATE','Mysore','Karnataka','SMALL BUSINESS'),('Cust_448','JOEL JENKINS','Mysore','Karnataka','CORPORATE'),('Cust_449','BRAD EASON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_45','ALAN BARNES','Mumbai','Maharashtra','CORPORATE'),('Cust_450','JASON GROSS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_451','HAROLD PAWLAN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_452','ADAM BELLAVANCE','Mysore','Karnataka','SMALL BUSINESS'),('Cust_453','CARI SAYRE','Mysore','Karnataka','HOME OFFICE'),('Cust_454','LISA DECHERNEY','Mysore','Karnataka','CORPORATE'),('Cust_455','ROY SKARIA','Mysore','Karnataka','CORPORATE'),('Cust_456','SEAN O\'DONNELL','Mysore','Karnataka','CORPORATE'),('Cust_457','SUSAN VITTORINI','Mysore','Karnataka','CORPORATE'),('Cust_458','SANDRA GLASSCO','Mysore','Karnataka','HOME OFFICE'),('Cust_459','SKYE NORLING','Mysore','Karnataka','HOME OFFICE'),('Cust_46','GRANT CARROLL','Mumbai','Maharashtra','CORPORATE'),('Cust_460','SUSAN VITTORINI','Mysore','Karnataka','HOME OFFICE'),('Cust_461','SHIRLEY SCHMIDT','Mysore','Karnataka','CORPORATE'),('Cust_462','RICK WILSON','Mysore','Karnataka','CORPORATE'),('Cust_463','RICK WILSON','Mysore','Karnataka','CONSUMER'),('Cust_464','PAULINE CHAND','Mysore','Karnataka','CORPORATE'),('Cust_465','JENNIFER HALLADAY','Mysore','Karnataka','HOME OFFICE'),('Cust_466','RITSA HIGHTOWER','Mysore','Karnataka','CORPORATE'),('Cust_467','JONI BLUMSTEIN','Mysore','Karnataka','HOME OFFICE'),('Cust_468','PETE ARMSTRONG','Mysore','Karnataka','CONSUMER'),('Cust_469','PAULINE CHAND','Mysore','Karnataka','SMALL BUSINESS'),('Cust_47','DELFINA LATCHFORD','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_470','ANNA GAYMAN','Mysore','Karnataka','CORPORATE'),('Cust_471','JONI BLUMSTEIN','Mysore','Karnataka','CONSUMER'),('Cust_472','NAT GILPIN','Mysore','Karnataka','CONSUMER'),('Cust_473','ROSE O\'BRIAN','Mysore','Karnataka','HOME OFFICE'),('Cust_474','BECKY CASTELL','Mysore','Karnataka','CONSUMER'),('Cust_475','DANIEL RAGLIN','Mysore','Karnataka','CORPORATE'),('Cust_476','CORINNA MITCHELL','Mysore','Karnataka','CORPORATE'),('Cust_477','EVA JACOBS','Mysore','Karnataka','HOME OFFICE'),('Cust_478','JAS O\'CARROLL','Mysore','Karnataka','CORPORATE'),('Cust_479','JAS O\'CARROLL','Mysore','Karnataka','HOME OFFICE'),('Cust_48','DON JONES','Mumbai','Maharashtra','CORPORATE'),('Cust_480','PAUL PROST','Mysore','Karnataka','CORPORATE'),('Cust_481','PHILIP BROWN','Mysore','Karnataka','HOME OFFICE'),('Cust_482','MICHAEL NGUYEN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_483','PHILIP BROWN','Mysore','Karnataka','CORPORATE'),('Cust_484','LISA DECHERNEY','Mysore','Karnataka','CONSUMER'),('Cust_485','PAUL MACINTYRE','Mysore','Karnataka','CORPORATE'),('Cust_486','TAMARA DAHLEN','Mysore','Karnataka','CORPORATE'),('Cust_487','ERIN CREIGHTON','Mysore','Karnataka','CORPORATE'),('Cust_488','HENRY MACALLISTER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_489','CANDACE MCMAHON','Mysore','Karnataka','CORPORATE'),('Cust_49','DOUG BICKFORD','Mumbai','Maharashtra','CORPORATE'),('Cust_490','TAMARA CHAND','Mysore','Karnataka','CONSUMER'),('Cust_491','DUANE HUFFMAN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_492','EDWARD NAZZAL','Mysore','Karnataka','HOME OFFICE'),('Cust_493','KELLY LAMPKIN','Mysore','Karnataka','CORPORATE'),('Cust_494','ANTHONY WITT','Mysore','Karnataka','CORPORATE'),('Cust_495','TED TREVINO','Mysore','Karnataka','CORPORATE'),('Cust_496','ED LUDWIG','Mysore','Karnataka','CONSUMER'),('Cust_497','JEREMY ELLISON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_498','ALAN HWANG','Mysore','Karnataka','CORPORATE'),('Cust_499','KELLY LAMPKIN','Mysore','Karnataka','HOME OFFICE'),('Cust_5','CARL JACKSON','Kolkata','West Bengal','CORPORATE'),('Cust_50','JAMIE KUNITZ','Mumbai','Maharashtra','CORPORATE'),('Cust_500','EILEEN KIEFER','Mysore','Karnataka','CONSUMER'),('Cust_501','JAMES LANIER','Mysore','Karnataka','CORPORATE'),('Cust_502','EDWARD BECKER','Mysore','Karnataka','CORPORATE'),('Cust_503','GARY ZANDUSKY','Mysore','Karnataka','HOME OFFICE'),('Cust_504','ANN BLUME','Mysore','Karnataka','CORPORATE'),('Cust_505','ERIN SMITH','Mysore','Karnataka','HOME OFFICE'),('Cust_506','ALLEN GOLDEN','Mysore','Karnataka','CONSUMER'),('Cust_507','FRANK CARLISLE','Mysore','Karnataka','SMALL BUSINESS'),('Cust_508','GARY HANSEN','Mysore','Karnataka','CONSUMER'),('Cust_509','NANCY LOMONACO','Mysore','Karnataka','HOME OFFICE'),('Cust_51','ANTHONY JOHNSON','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_510','ANNA HABERLIN','Mysore','Karnataka','CORPORATE'),('Cust_511','ERIN ASHBROOK','Mysore','Karnataka','CONSUMER'),('Cust_512','DARREN BUDD','Mysore','Karnataka','CONSUMER'),('Cust_513','BILL STEWART','Mysore','Karnataka','CORPORATE'),('Cust_514','CHRISTINE PHAN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_515','ALAN HWANG','Mysore','Karnataka','SMALL BUSINESS'),('Cust_516','DARREN BUDD','Mysore','Karnataka','CORPORATE'),('Cust_517','EUGENE HILDEBRAND','Mysore','Karnataka','HOME OFFICE'),('Cust_518','EDWARD BECKER','Mysore','Karnataka','HOME OFFICE'),('Cust_519','MELANIE PAGE','Mysore','Karnataka','CORPORATE'),('Cust_52','RALPH KNIGHT','Mumbai','Maharashtra','CONSUMER'),('Cust_520','JESUS OCAMPO','Mysore','Karnataka','SMALL BUSINESS'),('Cust_521','DARREN POWERS','Mysore','Karnataka','CORPORATE'),('Cust_522','PATRICK BZOSTEK','Mysore','Karnataka','CONSUMER'),('Cust_523','DARREN BUDD','Mysore','Karnataka','HOME OFFICE'),('Cust_524','GRACE KELLY','Mysore','Karnataka','CONSUMER'),('Cust_525','DAN LAWERA','Mysore','Karnataka','CORPORATE'),('Cust_526','GEORGE ASHBROOK','Mysore','Karnataka','SMALL BUSINESS'),('Cust_527','DAVE HALLSTEN','Mysore','Karnataka','HOME OFFICE'),('Cust_528','ARTHUR WIEDIGER','Mysore','Karnataka','CORPORATE'),('Cust_529','DUANE HUFFMAN','Mysore','Karnataka','CONSUMER'),('Cust_53','ALLEN ROSENBLATT','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_530','JIM MITCHUM','Mysore','Karnataka','CONSUMER'),('Cust_531','ANDY YOTOV','Mysore','Karnataka','CORPORATE'),('Cust_532','FRANK HAWLEY','Mysore','Karnataka','HOME OFFICE'),('Cust_533','THERESA COYNE','Mysore','Karnataka','HOME OFFICE'),('Cust_534','IVAN LISTON','Mysore','Karnataka','CONSUMER'),('Cust_535','DAVID SMITH','Mysore','Karnataka','SMALL BUSINESS'),('Cust_536','NARESJ PATEL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_537','RUBEN AUSMAN','Mysore','Karnataka','CORPORATE'),('Cust_538','ROY FRENCH','Mysore','Karnataka','CONSUMER'),('Cust_539','LARRY HUGHES','Mysore','Karnataka','HOME OFFICE'),('Cust_54','BARRY WEIRICH','Mumbai','Maharashtra','CORPORATE'),('Cust_540','MAGDELENE MORSE','Mysore','Karnataka','HOME OFFICE'),('Cust_541','GEORGE ASHBROOK','Mysore','Karnataka','CONSUMER'),('Cust_542','JONATHAN HOWELL','Mysore','Karnataka','CONSUMER'),('Cust_543','LINDA CAZAMIAS','Mysore','Karnataka','CORPORATE'),('Cust_544','NAT CARROLL','Mysore','Karnataka','HOME OFFICE'),('Cust_545','GARY MITCHUM','Mysore','Karnataka','CONSUMER'),('Cust_546','MATT HAGELSTEIN','Mysore','Karnataka','HOME OFFICE'),('Cust_547','ANDY REITER','Mysore','Karnataka','CORPORATE'),('Cust_548','MIKE CAUDLE','Mysore','Karnataka','CORPORATE'),('Cust_549','CYNTHIA ARNTZEN','Mysore','Karnataka','HOME OFFICE'),('Cust_55','CARL JACKSON','Mumbai','Maharashtra','HOME OFFICE'),('Cust_550','EDWARD NAZZAL','Mysore','Karnataka','SMALL BUSINESS'),('Cust_551','CYNTHIA ARNTZEN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_552','NOAH CHILDS','Mysore','Karnataka','HOME OFFICE'),('Cust_553','BRIAN STUGART','Mysore','Karnataka','CONSUMER'),('Cust_554','GEORGE BELL','Mysore','Karnataka','CORPORATE'),('Cust_555','NARESJ PATEL','Mysore','Karnataka','CORPORATE'),('Cust_556','JONI SUNDARESAM','Mysore','Karnataka','HOME OFFICE'),('Cust_557','DAVE HALLSTEN','Mysore','Karnataka','CORPORATE'),('Cust_558','MICHELLE HUTHWAITE','Mysore','Karnataka','HOME OFFICE'),('Cust_559','DAVID PHILIPPE','Mysore','Karnataka','CONSUMER'),('Cust_56','BRENDAN DODSON','Mumbai','Maharashtra','CORPORATE'),('Cust_560','AMY COX','Mysore','Karnataka','CORPORATE'),('Cust_561','CARI MACINTYRE','Mysore','Karnataka','CORPORATE'),('Cust_562','EUDOKIA MARTIN','Mysore','Karnataka','HOME OFFICE'),('Cust_563','FRED HOPKINS','Mysore','Karnataka','HOME OFFICE'),('Cust_564','AMY COX','Mysore','Karnataka','SMALL BUSINESS'),('Cust_565','AIMEE BIXBY','Mysore','Karnataka','HOME OFFICE'),('Cust_566','ANEMONE RATNER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_567','CHRIS SELESNICK','Mysore','Karnataka','HOME OFFICE'),('Cust_568','NOEL STAAVOS','Mysore','Karnataka','HOME OFFICE'),('Cust_569','DEAN BRADEN','Mysore','Karnataka','CORPORATE'),('Cust_57','EDWARD HOOKS','Mumbai','Maharashtra','CONSUMER'),('Cust_570','LENA CREIGHTON','Mysore','Karnataka','CORPORATE'),('Cust_571','MATT COLLISTER','Mysore','Karnataka','HOME OFFICE'),('Cust_572','LENA CREIGHTON','Mysore','Karnataka','HOME OFFICE'),('Cust_573','ERICA SMITH','Mysore','Karnataka','SMALL BUSINESS'),('Cust_574','JANET MARTIN','Mysore','Karnataka','CORPORATE'),('Cust_575','ANDREW ROBERTS','Mysore','Karnataka','SMALL BUSINESS'),('Cust_576','MICHAEL DOMINGUEZ','Mysore','Karnataka','HOME OFFICE'),('Cust_577','THOMAS BOLAND','Mysore','Karnataka','CORPORATE'),('Cust_578','OLVERA TOCH','Mysore','Karnataka','HOME OFFICE'),('Cust_579','LENA RADFORD','Mysore','Karnataka','SMALL BUSINESS'),('Cust_58','MICHELLE LONSDALE','Mumbai','Maharashtra','HOME OFFICE'),('Cust_580','SEAN CHRISTENSEN','Mysore','Karnataka','HOME OFFICE'),('Cust_581','TODD BOYES','Mysore','Karnataka','CONSUMER'),('Cust_582','TODD BOYES','Mysore','Karnataka','SMALL BUSINESS'),('Cust_583','SEAN MILLER','Mysore','Karnataka','SMALL BUSINESS'),('Cust_584','PHILLIP BREYER','Mysore','Karnataka','CORPORATE'),('Cust_585','MICHELLE ELLISON','Mysore','Karnataka','SMALL BUSINESS'),('Cust_586','MICHELLE ELLISON','Mysore','Karnataka','CONSUMER'),('Cust_587','SCOT CORAM','Mysore','Karnataka','CORPORATE'),('Cust_588','NATALIE FRITZLER','Mysore','Karnataka','HOME OFFICE'),('Cust_589','NATHAN GELDER','Mysore','Karnataka','HOME OFFICE'),('Cust_59','HUNTER GLANTZ','Mumbai','Maharashtra','CORPORATE'),('Cust_590','PATRICIA HIRASAKI','Mysore','Karnataka','HOME OFFICE'),('Cust_591','MARIA ZETTNER','Mysore','Karnataka','CORPORATE'),('Cust_592','MATTHEW CLASEN','Mysore','Karnataka','CONSUMER'),('Cust_593','PATRICK O\'DONNELL','Mysore','Karnataka','HOME OFFICE'),('Cust_594','HARRY MARIE','Mysore','Karnataka','CONSUMER'),('Cust_595','VICTORIA WILSON','Mysore','Karnataka','HOME OFFICE'),('Cust_596','SHAHID COLLISTER','Mysore','Karnataka','HOME OFFICE'),('Cust_597','KATRINA BAVINGER','Mysore','Karnataka','HOME OFFICE'),('Cust_598','MICHELLE ELLISON','Mysore','Karnataka','HOME OFFICE'),('Cust_599','THEA HENDRICKS','Patna','Bihar','HOME OFFICE'),('Cust_6','MONICA FEDERLE','Kolkata','West Bengal','CORPORATE'),('Cust_60','EUGENE BARCHAS','Mumbai','Maharashtra','HOME OFFICE'),('Cust_600','COREY CATLETT','Patna','Bihar','HOME OFFICE'),('Cust_601','ED JACOBS','Patna','Bihar','SMALL BUSINESS'),('Cust_602','NOEL STAAVOS','Patna','Bihar','HOME OFFICE'),('Cust_603','KEITH HERRERA','Patna','Bihar','SMALL BUSINESS'),('Cust_604','CARLOS MEADOR','Patna','Bihar','CORPORATE'),('Cust_605','CORINNA MITCHELL','Patna','Bihar','CORPORATE'),('Cust_606','RAYMOND FAIR','Patna','Bihar','SMALL BUSINESS'),('Cust_607','KARL BROWN','Patna','Bihar','HOME OFFICE'),('Cust_608','NATALIE WEBBER','Patna','Bihar','CONSUMER'),('Cust_609','ERIC BARRETO','Patna','Bihar','CONSUMER'),('Cust_61','JIM RADFORD','Mumbai','Maharashtra','CORPORATE'),('Cust_610','HUNTER LOPEZ','Patna','Bihar','CONSUMER'),('Cust_611','BARRY FRANZ','Patna','Bihar','CORPORATE'),('Cust_612','CRAIG YEDWAB','Patna','Bihar','CORPORATE'),('Cust_613','ERIC BARRETO','Patna','Bihar','SMALL BUSINESS'),('Cust_614','CHUCK SACHS','Patna','Bihar','CONSUMER'),('Cust_615','MUHAMMED LEE','Patna','Bihar','CONSUMER'),('Cust_616','KARL BROWN','Patna','Bihar','CORPORATE'),('Cust_617','BOBBY TRAFTON','Patna','Bihar','SMALL BUSINESS'),('Cust_618','DAVID FLASHING','Patna','Bihar','HOME OFFICE'),('Cust_619','RICK DUSTON','Patna','Bihar','CORPORATE'),('Cust_62','CARLOS SOLTERO','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_620','TROY STAEBEL','Patna','Bihar','SMALL BUSINESS'),('Cust_621','NORA PAIGE','Patna','Bihar','SMALL BUSINESS'),('Cust_622','AMY COX','Patna','Bihar','SMALL BUSINESS'),('Cust_623','HAROLD DAHLEN','Patna','Bihar','CORPORATE'),('Cust_624','JAY FINE','Patna','Bihar','CONSUMER'),('Cust_625','DAN CAMPBELL','Patna','Bihar','CORPORATE'),('Cust_626','GEORGE ZREBASSA','Patna','Bihar','HOME OFFICE'),('Cust_627','ELENI MCCRARY','Patna','Bihar','CORPORATE'),('Cust_628','FRANK ATKINSON','Patna','Bihar','CORPORATE'),('Cust_629','ASTREA JONES','Patna','Bihar','CORPORATE'),('Cust_63','GRANT CARROLL','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_630','GIULIETTA DORTCH','Patna','Bihar','CONSUMER'),('Cust_631','CATHY HWANG','Patna','Bihar','HOME OFFICE'),('Cust_632','DAMALA KOTSONIS','Patna','Bihar','CORPORATE'),('Cust_633','DIANNA ARNETT','Patna','Bihar','HOME OFFICE'),('Cust_634','FRED MCMATH','Patna','Bihar','SMALL BUSINESS'),('Cust_635','CHRISTY BRITTAIN','Patna','Bihar','CONSUMER'),('Cust_636','TOM PRESCOTT','Patna','Bihar','SMALL BUSINESS'),('Cust_637','YANA SORENSEN','Patna','Bihar','CORPORATE'),('Cust_638','HAROLD DAHLEN','Patna','Bihar','CONSUMER'),('Cust_639','BRAD THOMAS','Patna','Bihar','CORPORATE'),('Cust_64','SKYE NORLING','Mumbai','Maharashtra','HOME OFFICE'),('Cust_640','CYNTHIA VOLTZ','Patna','Bihar','CORPORATE'),('Cust_641','DEAN PERCER','Patna','Bihar','CONSUMER'),('Cust_642','BEN PETERMAN','Patna','Bihar','CORPORATE'),('Cust_643','TRACY PODDAR','Patna','Bihar','CORPORATE'),('Cust_644','MICHAEL PAIGE','Patna','Bihar','SMALL BUSINESS'),('Cust_645','COREY ROPER','Patna','Bihar','SMALL BUSINESS'),('Cust_646','MAUREEN GASTINEAU','Patna','Bihar','CONSUMER'),('Cust_647','MUHAMMED YEDWAB','Patna','Bihar','CONSUMER'),('Cust_648','ALEX GRAYSON','Patna','Bihar','CONSUMER'),('Cust_649','CHRIS CORTES','Patna','Bihar','CONSUMER'),('Cust_65','MUHAMMED MACINTYRE','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_650','DAN CAMPBELL','Patna','Bihar','SMALL BUSINESS'),('Cust_651','SARA LUXEMBURG','Patna','Bihar','SMALL BUSINESS'),('Cust_652','ERIC MURDOCK','Patna','Bihar','HOME OFFICE'),('Cust_653','PAUL KNUTSON','Patna','Bihar','CORPORATE'),('Cust_654','JANET MARTIN','Patna','Bihar','CORPORATE'),('Cust_655','NICOLE BRENNAN','Patna','Bihar','CONSUMER'),('Cust_656','JENNIFER PATT','Patna','Bihar','HOME OFFICE'),('Cust_657','ELPIDA RITTENBACH','Delhi','Delhi','CONSUMER'),('Cust_658','DAVID WIENER','Delhi','Delhi','CONSUMER'),('Cust_659','PETER MCVEE','Delhi','Delhi','SMALL BUSINESS'),('Cust_66','DOUG BICKFORD','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_660','KAREN CARLISLE','Delhi','Delhi','HOME OFFICE'),('Cust_661','STEFANIA PERRINO','Delhi','Delhi','CORPORATE'),('Cust_662','JAY FINE','Delhi','Delhi','CONSUMER'),('Cust_663','PAUL LUCAS','Delhi','Delhi','CORPORATE'),('Cust_664','GEORGE ZREBASSA','Delhi','Delhi','SMALL BUSINESS'),('Cust_665','GEORGE ZREBASSA','Delhi','Delhi','HOME OFFICE'),('Cust_666','KARL BROWN','Delhi','Delhi','CORPORATE'),('Cust_667','EVAN HENRY','Delhi','Delhi','CORPORATE'),('Cust_668','KEITH HERRERA','Delhi','Delhi','SMALL BUSINESS'),('Cust_669','ALYSSA TATE','Delhi','Delhi','SMALL BUSINESS'),('Cust_67','BETH THOMPSON','Mumbai','Maharashtra','CORPORATE'),('Cust_670','MICHAEL STEWART','Delhi','Delhi','SMALL BUSINESS'),('Cust_671','SHIRLEY JACKSON','Delhi','Delhi','CORPORATE'),('Cust_672','BARRY WEIRICH','Delhi','Delhi','CORPORATE'),('Cust_673','NATALIE WEBBER','Delhi','Delhi','CORPORATE'),('Cust_674','DAMALA KOTSONIS','Delhi','Delhi','CORPORATE'),('Cust_675','KAREN CARLISLE','Delhi','Delhi','CORPORATE'),('Cust_676','NATALIE WEBBER','Delhi','Delhi','CONSUMER'),('Cust_677','KATHERINE MURRAY','Delhi','Delhi','HOME OFFICE'),('Cust_678','HUNTER LOPEZ','Delhi','Delhi','CONSUMER'),('Cust_679','ERIC BARRETO','Delhi','Delhi','SMALL BUSINESS'),('Cust_68','DOROTHY BADDERS','Mumbai','Maharashtra','HOME OFFICE'),('Cust_680','BARRY FRANZ','Delhi','Delhi','CORPORATE'),('Cust_681','FRED MCMATH','Delhi','Delhi','SMALL BUSINESS'),('Cust_682','BERENIKE KAMPE','Delhi','Delhi','CORPORATE'),('Cust_683','DEAN PERCER','Delhi','Delhi','HOME OFFICE'),('Cust_684','MUHAMMED LEE','Delhi','Delhi','CONSUMER'),('Cust_685','NOEL STAAVOS','Delhi','Delhi','HOME OFFICE'),('Cust_686','BOBBY TRAFTON','Delhi','Delhi','SMALL BUSINESS'),('Cust_687','RICK DUSTON','Delhi','Delhi','CORPORATE'),('Cust_688','KARL BROWN','Delhi','Delhi','HOME OFFICE'),('Cust_689','ERICA HERNANDEZ','Delhi','Delhi','SMALL BUSINESS'),('Cust_69','JULIA WEST','Mumbai','Maharashtra','CORPORATE'),('Cust_690','TONY MOLINARI','Delhi','Delhi','CORPORATE'),('Cust_691','ELIZABETH MOFFITT','Delhi','Delhi','CONSUMER'),('Cust_692','HAROLD DAHLEN','Delhi','Delhi','CORPORATE'),('Cust_693','DAVID FLASHING','Delhi','Delhi','HOME OFFICE'),('Cust_694','DAVID FLASHING','Delhi','Delhi','CONSUMER'),('Cust_695','DEANRA ENO','Delhi','Delhi','CORPORATE'),('Cust_696','CHUCK SACHS','Delhi','Delhi','CONSUMER'),('Cust_697','CHRIS CORTES','Delhi','Delhi','CONSUMER'),('Cust_698','RAYMOND FAIR','Delhi','Delhi','SMALL BUSINESS'),('Cust_699','BOBBY TRAFTON','Delhi','Delhi','CORPORATE'),('Cust_7','DOROTHY BADDERS','Kolkata','West Bengal','HOME OFFICE'),('Cust_70','BRAD EASON','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_700','MARK PACKER','Delhi','Delhi','SMALL BUSINESS'),('Cust_701','ANN BLUME','Delhi','Delhi','SMALL BUSINESS'),('Cust_702','ALAN SHONELY','Delhi','Delhi','SMALL BUSINESS'),('Cust_703','NORA PAIGE','Delhi','Delhi','SMALL BUSINESS'),('Cust_704','FRANK ATKINSON','Delhi','Delhi','CORPORATE'),('Cust_705','KATRINA WILLMAN','Delhi','Delhi','CONSUMER'),('Cust_706','JANET MARTIN','Delhi','Delhi','CORPORATE'),('Cust_707','ANTHONY GARVERICK','Delhi','Delhi','SMALL BUSINESS'),('Cust_708','AARON HAWKINS','Delhi','Delhi','HOME OFFICE'),('Cust_709','GIULIETTA DORTCH','Delhi','Delhi','CONSUMER'),('Cust_71','THOMAS SEIO','Mumbai','Maharashtra','HOME OFFICE'),('Cust_710','CARLOS MEADOR','Delhi','Delhi','CORPORATE'),('Cust_711','DAVE POIRIER','Delhi','Delhi','SMALL BUSINESS'),('Cust_712','CHRISTY BRITTAIN','Delhi','Delhi','CONSUMER'),('Cust_713','TROY STAEBEL','Delhi','Delhi','SMALL BUSINESS'),('Cust_714','BRADLEY DRUCKER','Delhi','Delhi','SMALL BUSINESS'),('Cust_715','MARK HABERLIN','Delhi','Delhi','SMALL BUSINESS'),('Cust_716','BRAD THOMAS','Delhi','Delhi','HOME OFFICE'),('Cust_717','BRAD THOMAS','Delhi','Delhi','CORPORATE'),('Cust_718','ELENI MCCRARY','Delhi','Delhi','CORPORATE'),('Cust_719','BRENDAN MURRY','Delhi','Delhi','CORPORATE'),('Cust_72','MONICA FEDERLE','Mumbai','Maharashtra','CORPORATE'),('Cust_720','PAUL KNUTSON','Delhi','Delhi','CORPORATE'),('Cust_721','EMILY BURNS','Delhi','Delhi','HOME OFFICE'),('Cust_722','MAUREEN GASTINEAU','Delhi','Delhi','CONSUMER'),('Cust_723','ALEX GRAYSON','Delhi','Delhi','CONSUMER'),('Cust_724','MICHAEL OAKMAN','Delhi','Delhi','SMALL BUSINESS'),('Cust_725','DEBORAH BRUMFIELD','Delhi','Delhi','SMALL BUSINESS'),('Cust_726','DIANNA ARNETT','Delhi','Delhi','HOME OFFICE'),('Cust_727','AMY COX','Delhi','Delhi','SMALL BUSINESS'),('Cust_728','SARA LUXEMBURG','Delhi','Delhi','SMALL BUSINESS'),('Cust_729','ROBERT BARROSO','Delhi','Delhi','SMALL BUSINESS'),('Cust_73','FRANK PRICE','Mumbai','Maharashtra','CORPORATE'),('Cust_730','DARRIN SAYRE','Delhi','Delhi','CONSUMER'),('Cust_731','DEBORAH BRUMFIELD','Delhi','Delhi','CORPORATE'),('Cust_732','ELENI MCCRARY','Delhi','Delhi','HOME OFFICE'),('Cust_733','MICHAEL KENNEDY','Delhi','Delhi','CORPORATE'),('Cust_734','MARC CRIER','Delhi','Delhi','CORPORATE'),('Cust_735','BOBBY ELIAS','Delhi','Delhi','SMALL BUSINESS'),('Cust_736','JONI WASSERMAN','Delhi','Delhi','CONSUMER'),('Cust_737','KAREN FERGUSON','Delhi','Delhi','HOME OFFICE'),('Cust_738','NICOLE BRENNAN','Delhi','Delhi','CONSUMER'),('Cust_739','GIULIETTA DORTCH','Delhi','Delhi','CORPORATE'),('Cust_74','NICOLE HANSEN','Mumbai','Maharashtra','CORPORATE'),('Cust_740','BRADLEY TALBOTT','Delhi','Delhi','SMALL BUSINESS'),('Cust_741','BRADLEY TALBOTT','Delhi','Delhi','CORPORATE'),('Cust_742','BRIAN STUGART','Delhi','Delhi','CORPORATE'),('Cust_743','JULIA BARNETT','Delhi','Delhi','CORPORATE'),('Cust_744','EMILY PHAN','Delhi','Delhi','CONSUMER'),('Cust_745','LIZ WILLINGHAM','Delhi','Delhi','HOME OFFICE'),('Cust_746','CRAIG YEDWAB','Delhi','Delhi','CORPORATE'),('Cust_747','ANDY REITER','Delhi','Delhi','CORPORATE'),('Cust_748','BEN PETERMAN','Delhi','Delhi','CORPORATE'),('Cust_749','DENISE LEINENBACH','Delhi','Delhi','HOME OFFICE'),('Cust_75','NICOLE HANSEN','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_750','BILL TYLER','Delhi','Delhi','CONSUMER'),('Cust_751','DENISE LEINENBACH','Delhi','Delhi','CORPORATE'),('Cust_752','DEBRA CATINI','Delhi','Delhi','SMALL BUSINESS'),('Cust_753','ANN BLUME','Delhi','Delhi','CORPORATE'),('Cust_754','BECKY MARTIN','Delhi','Delhi','HOME OFFICE'),('Cust_755','ERIC BARRETO','Delhi','Delhi','CONSUMER'),('Cust_756','ASTREA JONES','Delhi','Delhi','CORPORATE'),('Cust_757','COREY CATLETT','Delhi','Delhi','HOME OFFICE'),('Cust_758','BENJAMIN VENIER','Delhi','Delhi','SMALL BUSINESS'),('Cust_759','NORA PAIGE','Delhi','Delhi','CONSUMER'),('Cust_76','CARLOS SOLTERO','Mumbai','Maharashtra','CONSUMER'),('Cust_760','TRACY PODDAR','Delhi','Delhi','CORPORATE'),('Cust_761','BILL SHONELY','Delhi','Delhi','SMALL BUSINESS'),('Cust_762','CRAIG YEDWAB','Delhi','Delhi','CONSUMER'),('Cust_763','PIERRE WENER','Delhi','Delhi','HOME OFFICE'),('Cust_764','DAN CAMPBELL','Delhi','Delhi','CORPORATE'),('Cust_765','MICHAEL PAIGE','Delhi','Delhi','SMALL BUSINESS'),('Cust_766','CATHY HWANG','Delhi','Delhi','HOME OFFICE'),('Cust_767','SYLVIA FOULSTON','Delhi','Delhi','CORPORATE'),('Cust_768','DAN CAMPBELL','Delhi','Delhi','SMALL BUSINESS'),('Cust_769','JULIE KRIZ','Delhi','Delhi','CORPORATE'),('Cust_77','DON MILLER','Mumbai','Maharashtra','HOME OFFICE'),('Cust_770','SYLVIA FOULSTON','Delhi','Delhi','CONSUMER'),('Cust_771','MUHAMMED YEDWAB','Delhi','Delhi','CONSUMER'),('Cust_772','JENNIFER PATT','Delhi','Delhi','HOME OFFICE'),('Cust_773','DAVID KENDRICK','Delhi','Delhi','HOME OFFICE'),('Cust_774','DOUG JACOBS','Delhi','Delhi','HOME OFFICE'),('Cust_775','LUKE FOSTER','Delhi','Delhi','CORPORATE'),('Cust_776','BRIAN STUGART','Delhi','Delhi','CONSUMER'),('Cust_777','SARA LUXEMBURG','Delhi','Delhi','CORPORATE'),('Cust_778','DIANNA WILSON','Delhi','Delhi','SMALL BUSINESS'),('Cust_779','DAVID SMITH','Delhi','Delhi','SMALL BUSINESS'),('Cust_78','BECKY CASTELL','Mumbai','Maharashtra','CONSUMER'),('Cust_780','MICHELLE TRAN','Pune','Maharashtra','CONSUMER'),('Cust_781','DAVE HALLSTEN','Pune','Maharashtra','CORPORATE'),('Cust_782','SANJIT JACOBS','Pune','Maharashtra','CONSUMER'),('Cust_783','BARRY GONZALEZ','Pune','Maharashtra','CONSUMER'),('Cust_784','VIVIAN MATHIS','Pune','Maharashtra','CORPORATE'),('Cust_785','VIVIAN MATHIS','Pune','Maharashtra','HOME OFFICE'),('Cust_786','CAROL ADAMS','Pune','Maharashtra','CORPORATE'),('Cust_787','VIVEK GONZALEZ','Pune','Maharashtra','CONSUMER'),('Cust_788','BRADLEY NGUYEN','Pune','Maharashtra','CONSUMER'),('Cust_789','MATT COLLISTER','Pune','Maharashtra','HOME OFFICE'),('Cust_79','DOROTHY WARDLE','Mumbai','Maharashtra','CORPORATE'),('Cust_790','VIVIAN MATHIS','Pune','Maharashtra','CONSUMER'),('Cust_791','MICHELLE TRAN','Pune','Maharashtra','CORPORATE'),('Cust_792','PETE TAKAHITO','Pune','Maharashtra','CORPORATE'),('Cust_793','RALPH ARNETT','Pune','Maharashtra','CONSUMER'),('Cust_794','JASON KLAMCZYNSKI','Pune','Maharashtra','SMALL BUSINESS'),('Cust_795','MICHELLE TRAN','Pune','Maharashtra','HOME OFFICE'),('Cust_796','GREG TRAN','Pune','Maharashtra','HOME OFFICE'),('Cust_797','GENE MCCLURE','Pune','Maharashtra','HOME OFFICE'),('Cust_798','HELEN WASSERMAN','Pune','Maharashtra','HOME OFFICE'),('Cust_799','HELEN WASSERMAN','Pune','Maharashtra','CORPORATE'),('Cust_8','NEOLA SCHNEIDER','Kolkata','West Bengal','HOME OFFICE'),('Cust_80','ANN CHONG','Mumbai','Maharashtra','CORPORATE'),('Cust_800','ROSS DEVINCENTIS','Pune','Maharashtra','CORPORATE'),('Cust_801','JASON KLAMCZYNSKI','Pune','Maharashtra','HOME OFFICE'),('Cust_802','VALERIE MITCHUM','Pune','Maharashtra','HOME OFFICE'),('Cust_803','DAVE HALLSTEN','Pune','Maharashtra','HOME OFFICE'),('Cust_804','BRADLEY NGUYEN','Pune','Maharashtra','CORPORATE'),('Cust_805','BARRY GONZALEZ','Pune','Maharashtra','SMALL BUSINESS'),('Cust_806','BART PISTOLE','Pune','Maharashtra','CONSUMER'),('Cust_807','CHAD MCGUIRE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_808','SCOTT COHEN','Pune','Maharashtra','CONSUMER'),('Cust_809','GENE MCCLURE','Pune','Maharashtra','CONSUMER'),('Cust_81','CLAY ROZENDAL','Mumbai','Maharashtra','CORPORATE'),('Cust_810','VIVEK SUNDARESAM','Pune','Maharashtra','HOME OFFICE'),('Cust_811','NATALIE DECHERNEY','Pune','Maharashtra','CONSUMER'),('Cust_812','MICHELLE HUTHWAITE','Pune','Maharashtra','HOME OFFICE'),('Cust_813','CYNTHIA DELANEY','Pune','Maharashtra','CORPORATE'),('Cust_814','TOM STIVERS','Pune','Maharashtra','CORPORATE'),('Cust_815','RICK REED','Pune','Maharashtra','CONSUMER'),('Cust_816','GARY MCGARR','Pune','Maharashtra','HOME OFFICE'),('Cust_817','CYNTHIA DELANEY','Pune','Maharashtra','HOME OFFICE'),('Cust_818','TOM STIVERS','Pune','Maharashtra','SMALL BUSINESS'),('Cust_819','BART PISTOLE','Pune','Maharashtra','HOME OFFICE'),('Cust_82','CARLOS DALY','Mumbai','Maharashtra','HOME OFFICE'),('Cust_820','DARREN BUDD','Pune','Maharashtra','CORPORATE'),('Cust_821','LIZ WILLINGHAM','Pune','Maharashtra','HOME OFFICE'),('Cust_822','STEFANIA PERRINO','Pune','Maharashtra','CORPORATE'),('Cust_823','THEA HENDRICKS','Pune','Maharashtra','HOME OFFICE'),('Cust_824','GRANT THORNTON','Pune','Maharashtra','CORPORATE'),('Cust_825','CARLOS MEADOR','Pune','Maharashtra','CONSUMER'),('Cust_826','CARLOS MEADOR','Pune','Maharashtra','CORPORATE'),('Cust_827','DOUG JACOBS','Pune','Maharashtra','HOME OFFICE'),('Cust_828','BECKY MARTIN','Pune','Maharashtra','HOME OFFICE'),('Cust_829','SPEROS GORANITIS','Pune','Maharashtra','CORPORATE'),('Cust_83','CARI SCHNELLING','Mumbai','Maharashtra','HOME OFFICE'),('Cust_830','KATHERINE MURRAY','Pune','Maharashtra','HOME OFFICE'),('Cust_831','MICHAEL PAIGE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_832','ROBERT BARROSO','Pune','Maharashtra','SMALL BUSINESS'),('Cust_833','DEAN PERCER','Pune','Maharashtra','HOME OFFICE'),('Cust_834','ANN BLUME','Pune','Maharashtra','SMALL BUSINESS'),('Cust_835','DAMALA KOTSONIS','Pune','Maharashtra','CORPORATE'),('Cust_836','PAUL KNUTSON','Pune','Maharashtra','CORPORATE'),('Cust_837','GEORGE ZREBASSA','Pune','Maharashtra','HOME OFFICE'),('Cust_838','NOEL STAAVOS','Pune','Maharashtra','HOME OFFICE'),('Cust_839','AARON HAWKINS','Pune','Maharashtra','HOME OFFICE'),('Cust_84','CHAD CUNNINGHAM','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_840','ELLIS BALLARD','Pune','Maharashtra','CORPORATE'),('Cust_841','TOM PRESCOTT','Pune','Maharashtra','SMALL BUSINESS'),('Cust_842','DIANNA ARNETT','Pune','Maharashtra','HOME OFFICE'),('Cust_843','CHUCK SACHS','Pune','Maharashtra','CONSUMER'),('Cust_844','BILL SHONELY','Pune','Maharashtra','SMALL BUSINESS'),('Cust_845','ERIC BARRETO','Pune','Maharashtra','CONSUMER'),('Cust_846','DAVE POIRIER','Pune','Maharashtra','SMALL BUSINESS'),('Cust_847','DAVID FLASHING','Pune','Maharashtra','HOME OFFICE'),('Cust_848','ELIZABETH MOFFITT','Pune','Maharashtra','CONSUMER'),('Cust_849','BEN PETERMAN','Pune','Maharashtra','CORPORATE'),('Cust_85','BRYAN MILLS','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_850','BRAD THOMAS','Pune','Maharashtra','HOME OFFICE'),('Cust_851','YANA SORENSEN','Pune','Maharashtra','CORPORATE'),('Cust_852','JANET MARTIN','Pune','Maharashtra','CORPORATE'),('Cust_853','DEBRA CATINI','Pune','Maharashtra','SMALL BUSINESS'),('Cust_854','DAN CAMPBELL','Pune','Maharashtra','SMALL BUSINESS'),('Cust_855','SYLVIA FOULSTON','Pune','Maharashtra','CORPORATE'),('Cust_856','ALEX GRAYSON','Pune','Maharashtra','CONSUMER'),('Cust_857','BARRY FRANZ','Pune','Maharashtra','CORPORATE'),('Cust_858','ANTHONY GARVERICK','Pune','Maharashtra','SMALL BUSINESS'),('Cust_859','ASTREA JONES','Pune','Maharashtra','CORPORATE'),('Cust_86','ADRIAN HANE','Mumbai','Maharashtra','CORPORATE'),('Cust_860','CATHY HWANG','Pune','Maharashtra','HOME OFFICE'),('Cust_861','DEBORAH BRUMFIELD','Pune','Maharashtra','CORPORATE'),('Cust_862','FRANK ATKINSON','Pune','Maharashtra','CORPORATE'),('Cust_863','JULIE KRIZ','Pune','Maharashtra','CORPORATE'),('Cust_864','ERICA HERNANDEZ','Pune','Maharashtra','SMALL BUSINESS'),('Cust_865','BOBBY ELIAS','Pune','Maharashtra','SMALL BUSINESS'),('Cust_866','JONI WASSERMAN','Pune','Maharashtra','CONSUMER'),('Cust_867','JENNIFER PATT','Pune','Maharashtra','HOME OFFICE'),('Cust_868','DIANNA WILSON','Pune','Maharashtra','SMALL BUSINESS'),('Cust_869','EMILY PHAN','Pune','Maharashtra','CONSUMER'),('Cust_87','RICK REED','Mumbai','Maharashtra','CONSUMER'),('Cust_870','KARL BROWN','Pune','Maharashtra','HOME OFFICE'),('Cust_871','MARIBETH DONA','Pune','Maharashtra','HOME OFFICE'),('Cust_872','EVAN HENRY','Pune','Maharashtra','CORPORATE'),('Cust_873','BILL TYLER','Pune','Maharashtra','CONSUMER'),('Cust_874','DENISE LEINENBACH','Pune','Maharashtra','HOME OFFICE'),('Cust_875','MICHAEL STEWART','Pune','Maharashtra','SMALL BUSINESS'),('Cust_876','CORINNA MITCHELL','Pune','Maharashtra','CORPORATE'),('Cust_877','MICHAEL KENNEDY','Pune','Maharashtra','CORPORATE'),('Cust_878','ALAN SHONELY','Pune','Maharashtra','SMALL BUSINESS'),('Cust_879','SHIRLEY JACKSON','Pune','Maharashtra','CORPORATE'),('Cust_88','HEATHER KIRKLAND','Mumbai','Maharashtra','HOME OFFICE'),('Cust_880','FRED MCMATH','Pune','Maharashtra','SMALL BUSINESS'),('Cust_881','ANDY REITER','Pune','Maharashtra','CORPORATE'),('Cust_882','KARL BROWN','Pune','Maharashtra','CORPORATE'),('Cust_883','MUHAMMED LEE','Pune','Maharashtra','CONSUMER'),('Cust_884','PIERRE WENER','Pune','Maharashtra','HOME OFFICE'),('Cust_885','PAUL LUCAS','Pune','Maharashtra','CORPORATE'),('Cust_886','BENJAMIN VENIER','Pune','Maharashtra','SMALL BUSINESS'),('Cust_887','HAROLD DAHLEN','Pune','Maharashtra','CORPORATE'),('Cust_888','ERIC BARRETO','Pune','Maharashtra','SMALL BUSINESS'),('Cust_889','TROY STAEBEL','Pune','Maharashtra','SMALL BUSINESS'),('Cust_89','FRED WASSERMAN','Mumbai','Maharashtra','HOME OFFICE'),('Cust_890','TRACY PODDAR','Pune','Maharashtra','CORPORATE'),('Cust_891','BOBBY TRAFTON','Pune','Maharashtra','CORPORATE'),('Cust_892','TONY MOLINARI','Pune','Maharashtra','CORPORATE'),('Cust_893','RICK DUSTON','Pune','Maharashtra','CORPORATE'),('Cust_894','BRENDAN MURRY','Pune','Maharashtra','CORPORATE'),('Cust_895','CHRISTY BRITTAIN','Pune','Maharashtra','CONSUMER'),('Cust_896','CRAIG YEDWAB','Pune','Maharashtra','CONSUMER'),('Cust_897','BOBBY TRAFTON','Pune','Maharashtra','SMALL BUSINESS'),('Cust_898','KATRINA WILLMAN','Pune','Maharashtra','CONSUMER'),('Cust_899','GIULIETTA DORTCH','Pune','Maharashtra','CONSUMER'),('Cust_9','CARLOS DALY','Kolkata','West Bengal','HOME OFFICE'),('Cust_90','CLAUDIA MINER','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_900','PETER MCVEE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_901','COREY LOCK','Pune','Maharashtra','HOME OFFICE'),('Cust_902','BRADLEY DRUCKER','Pune','Maharashtra','SMALL BUSINESS'),('Cust_903','DARRIN SAYRE','Pune','Maharashtra','CONSUMER'),('Cust_904','DEANRA ENO','Pune','Maharashtra','CORPORATE'),('Cust_905','BRAD THOMAS','Pune','Maharashtra','CORPORATE'),('Cust_906','MARK PACKER','Pune','Maharashtra','SMALL BUSINESS'),('Cust_907','ELENI MCCRARY','Pune','Maharashtra','CORPORATE'),('Cust_908','BART FOLK','Pune','Maharashtra','CORPORATE'),('Cust_909','DEAN PERCER','Pune','Maharashtra','CONSUMER'),('Cust_91','JACK LEBRON','Mumbai','Maharashtra','CORPORATE'),('Cust_910','SYLVIA FOULSTON','Pune','Maharashtra','HOME OFFICE'),('Cust_911','SARA LUXEMBURG','Pune','Maharashtra','SMALL BUSINESS'),('Cust_912','KEITH HERRERA','Pune','Maharashtra','CORPORATE'),('Cust_913','KEITH HERRERA','Pune','Maharashtra','SMALL BUSINESS'),('Cust_914','CYNTHIA VOLTZ','Pune','Maharashtra','CORPORATE'),('Cust_915','MICHAEL OAKMAN','Pune','Maharashtra','SMALL BUSINESS'),('Cust_916','DAVID KENDRICK','Pune','Maharashtra','HOME OFFICE'),('Cust_917','NICOLE BRENNAN','Pune','Maharashtra','HOME OFFICE'),('Cust_918','BRIAN STUGART','Pune','Maharashtra','CONSUMER'),('Cust_919','KAREN FERGUSON','Pune','Maharashtra','HOME OFFICE'),('Cust_92','JULIA WEST','Mumbai','Maharashtra','HOME OFFICE'),('Cust_920','MARK HABERLIN','Pune','Maharashtra','SMALL BUSINESS'),('Cust_921','GIULIETTA DORTCH','Pune','Maharashtra','CORPORATE'),('Cust_922','DEBORAH BRUMFIELD','Pune','Maharashtra','SMALL BUSINESS'),('Cust_923','MAUREEN GASTINEAU','Pune','Maharashtra','CONSUMER'),('Cust_924','JULIA BARNETT','Pune','Maharashtra','CORPORATE'),('Cust_925','ANNE PRYOR','Pune','Maharashtra','CONSUMER'),('Cust_926','JUSTIN HIRSH','Pune','Maharashtra','CONSUMER'),('Cust_927','DORRIS LOVE','Pune','Maharashtra','HOME OFFICE'),('Cust_928','BILL EPLETT','Pune','Maharashtra','CORPORATE'),('Cust_929','CAROLINE JUMPER','Pune','Maharashtra','CORPORATE'),('Cust_93','EUGENE BARCHAS','Mumbai','Maharashtra','CORPORATE'),('Cust_930','PAMELA STOBB','Pune','Maharashtra','CONSUMER'),('Cust_931','AARON SMAYLING','Pune','Maharashtra','SMALL BUSINESS'),('Cust_932','JASPER CACIOPPO','Pune','Maharashtra','HOME OFFICE'),('Cust_933','ALAN HAINES','Pune','Maharashtra','CONSUMER'),('Cust_934','LOGAN HAUSHALTER','Pune','Maharashtra','CORPORATE'),('Cust_935','LENA CACIOPPO','Pune','Maharashtra','HOME OFFICE'),('Cust_936','DEIRDRE GREER','Pune','Maharashtra','HOME OFFICE'),('Cust_937','JOHN STEVENSON','Pune','Maharashtra','SMALL BUSINESS'),('Cust_938','SHERI GORDON','Pune','Maharashtra','CORPORATE'),('Cust_939','BEN WALLACE','Pune','Maharashtra','HOME OFFICE'),('Cust_94','CARL LUDWIG','Mumbai','Maharashtra','CORPORATE'),('Cust_940','MAX ENGLE','Pune','Maharashtra','CORPORATE'),('Cust_941','FRED CHUNG','Pune','Maharashtra','CORPORATE'),('Cust_942','DENNIS KANE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_943','PHILLIP FLATHMANN','Pune','Maharashtra','SMALL BUSINESS'),('Cust_944','MATHEW REESE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_945','STUART VAN','Pune','Maharashtra','CONSUMER'),('Cust_946','BRENDA BOWMAN','Pune','Maharashtra','SMALL BUSINESS'),('Cust_947','DANIEL LACY','Pune','Maharashtra','SMALL BUSINESS'),('Cust_948','JENNIFER FERGUSON','Pune','Maharashtra','CORPORATE'),('Cust_949','THERESA SWINT','Pune','Maharashtra','CONSUMER'),('Cust_95','JULIA WEST','Mumbai','Maharashtra','SMALL BUSINESS'),('Cust_950','ALAN HAINES','Pune','Maharashtra','HOME OFFICE'),('Cust_951','KATHERINE NOCKTON','Pune','Maharashtra','HOME OFFICE'),('Cust_952','STEWART VISINSKY','Pune','Maharashtra','CORPORATE'),('Cust_953','JEREMY FARRY','Pune','Maharashtra','SMALL BUSINESS'),('Cust_954','CLAY LUDTKE','Pune','Maharashtra','CONSUMER'),('Cust_955','LAUREL ELLISTON','Pune','Maharashtra','CORPORATE'),('Cust_956','KATHERINE NOCKTON','Pune','Maharashtra','CORPORATE'),('Cust_957','THERESA SWINT','Pune','Maharashtra','SMALL BUSINESS'),('Cust_958','JEREMY LONSDALE','Pune','Maharashtra','CORPORATE'),('Cust_959','MITCH WEBBER','Pune','Maharashtra','CORPORATE'),('Cust_96','MIKE PELLETIER','Mumbai','Maharashtra','CORPORATE'),('Cust_960','SHIRLEY SCHMIDT','Pune','Maharashtra','CORPORATE'),('Cust_961','CAROL TRIGGS','Pune','Maharashtra','HOME OFFICE'),('Cust_962','JUSTIN MACKENDRICK','Pune','Maharashtra','CORPORATE'),('Cust_963','JENNIFER FERGUSON','Pune','Maharashtra','HOME OFFICE'),('Cust_964','SARAH BROWN','Pune','Maharashtra','CONSUMER'),('Cust_965','ANNE PRYOR','Pune','Maharashtra','HOME OFFICE'),('Cust_966','TONY SAYRE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_967','KAREN FERGUSON','Pune','Maharashtra','CORPORATE'),('Cust_968','DIONIS LLOYD','Pune','Maharashtra','SMALL BUSINESS'),('Cust_969','CAROL TRIGGS','Pune','Maharashtra','CORPORATE'),('Cust_97','CHARLES MCCROSSIN','Mumbai','Maharashtra','CORPORATE'),('Cust_970','LINDSAY CASTELL','Pune','Maharashtra','SMALL BUSINESS'),('Cust_971','MICHAEL CHEN','Pune','Maharashtra','CONSUMER'),('Cust_972','TONY SAYRE','Pune','Maharashtra','HOME OFFICE'),('Cust_973','THERESA SWINT','Pune','Maharashtra','HOME OFFICE'),('Cust_974','DORRIS LOVE','Pune','Maharashtra','CORPORATE'),('Cust_975','LAUREL ELLISTON','Pune','Maharashtra','HOME OFFICE'),('Cust_976','TOBY CARLISLE','Pune','Maharashtra','HOME OFFICE'),('Cust_977','TED BUTTERFIELD','Pune','Maharashtra','CORPORATE'),('Cust_978','NORA PRICE','Pune','Maharashtra','HOME OFFICE'),('Cust_979','LIZ WILLINGHAM','Pune','Maharashtra','CORPORATE'),('Cust_98','ANNIE CYPRUS','Mumbai','Maharashtra','HOME OFFICE'),('Cust_980','LINDSAY CASTELL','Pune','Maharashtra','CORPORATE'),('Cust_981','ANNE PRYOR','Pune','Maharashtra','CORPORATE'),('Cust_982','NORA PRICE','Pune','Maharashtra','SMALL BUSINESS'),('Cust_983','MUHAMMED YEDWAB','Pune','Maharashtra','CONSUMER'),('Cust_984','BRENDA BOWMAN','Pune','Maharashtra','HOME OFFICE'),('Cust_985','KIMBERLY CARTER','Pune','Maharashtra','SMALL BUSINESS'),('Cust_986','BRIAN THOMPSON','Pune','Maharashtra','HOME OFFICE'),('Cust_987','KIMBERLY CARTER','Pune','Maharashtra','HOME OFFICE'),('Cust_988','SHIRLEY DANIELS','Pune','Maharashtra','CORPORATE'),('Cust_989','ARTHUR GAINER','Pune','Maharashtra','CORPORATE'),('Cust_99','MICHELLE LONSDALE','Mumbai','Maharashtra','CORPORATE'),('Cust_990','TRACY PODDAR','Mysore','Karnataka','CORPORATE'),('Cust_991','STUART CALHOUN','Mysore','Karnataka','CONSUMER'),('Cust_992','ARTHUR PRICHEP','Mysore','Karnataka','HOME OFFICE'),('Cust_993','KEAN NGUYEN','Mysore','Karnataka','CORPORATE'),('Cust_994','JIM KRIZ','Mysore','Karnataka','CONSUMER'),('Cust_995','HAROLD RYAN','Mysore','Karnataka','HOME OFFICE'),('Cust_996','JOHN LUCAS','Mysore','Karnataka','CORPORATE'),('Cust_997','ALEJANDRO GROVE','Mysore','Karnataka','CORPORATE'),('Cust_998','SAM ZELDIN','Mysore','Karnataka','SMALL BUSINESS'),('Cust_999','SALLY HUGHSBY','Mysore','Karnataka','CONSUMER');

INSERT INTO `cust_dimen`(CustomerName, Address, City, PostalCode,Country)
VALUES('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');

INSERT INTO `cust_dimen`(CustomerName, Address, City, PostalCode,Country)
VALUES('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');

DELETE FROM table_name
WHERE condition;

INSERT INTO `table_name`(column1,column2,column3)
VALUES(value1,value2,value3,value4);

DELETE table_name
WHERE condition;

CREATE DATABASE databasename;

DROP DATABASE databasename;

CREATE TABLE table_name(
column1 datatype,
col);
DROP TABLE table_name;


SELECT * FROM market_fact_full;

DESCRIBE market_fact_full;

UPDATE market_fact_full
SET Sales=Sales-50
WHERE Market_fact_id = 1;


select *,
	rank() over (partition by Ship_Mode order by shipments desc) as shipping_rank,
    dense_rank() over (partition by Ship_Mode order by shipments desc) as shipping_dense_rank,
    row_number() over (partition by Ship_Mode order by shipments desc) as shipping_row_number
from shipping_summary;


select *,
RANK() OVER(partition by column_name order by column_name DESC) as shipping_rank,
DENSE_RANK() OVER(PARTITIION by column name order by column name desc) as shipping_dense_rank,
row_number() over(PARTITION BY ship_mode order by column name desc) as shipping_row_number
FROM shipping_summary;


SELECT Market_fact_id, Profit,
	CASE
		WHEN Profit<-500 THEN "Huge Loss"
		WHEN Profit between -50 and 0 THEN "Bearable Loss"
        WHEN Profit BETWEEN 0 AND 500 THEN "Decent Profit"
        WHEN Profit>500 THEN "Great Profit"
	END AS Profit_type
FROM market_fact_full;

DROP TABLE vehicles; 
CREATE TABLE vehicles(
	`vehicleId` INT,
    `year` INT NOT NULL,
    `make` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`vehicleId`));
INSERT into `vehicles`(`vehicleId`,`year`,`make`) VALUES(1,2004,'Tata');
SELECT * FROM vehicles;

TRUNCATE TABLE `vehicles`;

ALTER TABLE vehicles
ADD `model` VARCHAR(100) NOT NULL;

DESCRIBE vehicles;

ALTER TABLE vehicles
ADD `color` VARCHAR(50),
ADD `note` VARCHAR(255);

ALTER TABLE vehicles
MODIFY `note` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
MODIFY `year` SMALLINT NOT NULL,
MODIFY `color` VARCHAR(20) NULL AFTER `make`;

ALTER TABLE `vehicles`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL; 

ALTER TABLE `vehicles`
DROP COLUMN vehicleCondition;

ALTER TABLE `vehicles`
RENAME TO cars;

DESCRIBE `cars`;


CREATE TABLE `Department`(
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100));
    
CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DeptID INT,
	FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
    );
    
create table table_name(
columnname datatype ,
column2 datatype,
column3 datatype,
PRIMARY KEY (`column2`),
FOREIGN KEY (`column1`) REFERENCES table2(`columnnmae`)
);

ALTER TABLE table_name
ADD new_column datatype not null;

ALTER TABLE table_name
ADD new_column datatype not null;

ALTER TABLE `vehicles`
ADD `model` VARCHAR(100) NOT NULL;


ALTER TABLE `vehicles`
ADD `color` VARCHAR(50),
ADD `note` VARCHAR(25);

ALTER TABLE `vehicles`
MODIFY `year` SMALLINT NOT NULL;

ALTER TABLE `vehicles`
MODIFY `year` SMALLINT NOT NULL,
MODIFY `color` VARCHAR(20) NULL AFTER `make`;


ALTER TABLE `vehicles`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicle`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
DROP COLUMN `vehicleCondition`;

ALTER TABLE `vehicles`
RENAME TO `cars`;

ALTER TABLE `vehicles`
DROP COLUMN `columnname`;

ALTER TABLE `vehicles`
RENAME TO `cars`;


ALTER TABLE table_name
ADD `column_new` VARCHAR(100) NOT NULL;

ALTER TABLE table_name
ADD `column_new` VARCHAR(100) NOT NULL,
ADD `column_new2` VARCHAR(100) ;

ALTER TABLE tablename
MODIFY `columnname` VARCHAR(100) NOT NULL;

ALTER TABLE tablename
MODIFY `columnname` VARCHAR(50) NOT NULL;

ALTER TABLE `vehicles`
MODIFY `year` SMALLINT NOT NULL,
MODIFY `color` VARCHAR(20) NULL	AFTER `make`;

ALTER TABLE `vehicles`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
CHANGE COLUMN `note` `vehicleCondition` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
CHANGE COLUMN `old_column name` `new column` datatype;

ALTER TABLE `vehicles`
DROP COLUMN vehicleCondition;

ALTER TABLE `vehicles`
RENAME TO `cars`;

ALTER TABLE `vehicles`
ADD `model` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
ADD `color` VARCHAR(50),
ADD `note` VARCHAR(50);

ALTER TABLE `vehicles`
MODIFY `note` VARCHAR(100) NOT NULL;

ALTER TABLE `vehicles`
MODIFY `year` SMALLINT NOT NULL,
MODIFY `color` VARCHAR(20) NULL AFTER `make`;


CHANGE COLUMN `column name` `vehiclecondition` varchar(100) not null;




KEY `Order_Number_Index`(`Order_Number`);
KEY `Order_Numberidx` (`Order_Number`);
unique KEY ;

WITH cte as(select ) select *
from cte;

select Customer_Name, sum(Order_Quantity)
from market_fact_full m inner join cust_dimen c
on m.Cust_id = c.Cust_id
group by Customer_Name
order by sum(Order_Quantity) desc
limit 1;


SELECT Customer_Name, SUM(Order_Quantity)
FROM market_fact_full as m inner join cust_dimne as c
on m.Cust_id = c.CUst_id
GROUP BY Customer_Name
order by sum(Order_Quantity) desc
limit 1;

SELECT `Customer` AS Type, ContactName,City,Country
FROM Customers
UNION
SELECT 	`Supplier`, ContactName,City,Country
FROM Suppliers;


SELECT City,Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City,Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 LIKE t1;

INSERT INTO t1(id) VALUES(1),(2),(3);

INSERT INTO t2(id) VALUES(2),(3),(4);

SELECT id FROM t1
INTERSECT
SELECT id FROM t2;

SELECT id FROM t1
WHERE id NOT IN (SELECT id FROM t2);


select Customer_Name,
		count(distinct Ord_id) as order_count,
        rank() over(order by count(distinct Ord_id) desc) as order_rank,
        dense_rank() over(order by count(distinct Ord_id) desc) as order_dense_rank,
        row_number() over(order by count(distinct Ord_id) desc) as order_row_number
from market_fact_full m
inner join cust_dimen c
on m.Cust_id = c.Cust_id
group by Customer_Name;

SELECT Customer_Name,
	COUNT(DISTINCT Ord_id) AS order_count,
    RANK() OVER(ORDER BY COUNT(DISTINCT Ord_id) DESC) AS order_rank,
    DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT Ord_id) DESC) AS order_dense_rank,
    ROW_NUMBER() OVER(ORDER BY COUNT(DISTINCT Ord_id) DESC) AS order_row_number
FROM market_fact_full AS M
INNER JOIN cust_dimen AS c
ON m.Cust_id = c.Cust_id
GROUP BY Customer_Name;

SELECT Customer_Name,
	COUNT(DISTINCT Ord_id) AS order_count,
    RANK() OVER w AS order_rank,
    DENSE_RANK() OVER w AS order_dense_rank,
    ROW_NUMBER() OVER w AS order_row_number
FROM market_fact_full AS M
INNER JOIN cust_dimen AS c
ON m.Cust_id = c.Cust_id
GROUP BY Customer_Name
WINDOW w AS (ORDER BY COUNT(DISTINCT Ord_id) DESC);

with daily_shipping_summary as (select Ship_Date,
	sum(Shipping_Cost) as daily_total
from market_fact_full as m
inner join shipping_dimen as s
on m.Ship_id = s.Ship_id
group by Ship_Date)
SELECT *,
	SUM(daily_total) OVER w1 AS running_total,
    SUM(daily_total) OVER w2 AS moving_average
from daily_shipping_summary
WINDOW w1 AS (ORDER BY Ship_Date ROWS UNBOUNDED PRECEDING),
w2 AS (ORDER BY Ship_Date ROWS 6 PRECEDING);


SELECT *,
	SUM(daily_total) OVER w1 as running_total,
    SUM(daily_total) OVER w2 as moving_average
from daily_shipping_summary
window w1 as (order by ship_date ROWS UNBOUNDED PRECEDING),
w2 as (order by ship_date rows 6 preceding);


-- LAG
with cust_order as (select c.Customer_Name,
		m.Ord_id,
		o.Order_Date
from market_fact_full m
left join orders_dimen o
on m.Ord_id = o.Ord_id
left join cust_dimen as c
on m.Cust_id = c.Cust_id
where Customer_Name='RICK WILSON'
group by c.Customer_Name,m.Ord_id,o.Order_Date
),next_date_summary as(
SELECT *,
	LEAD(Order_Date,1,'2015-01-01') OVER (order by Order_Date) as next_order_date
FROM cust_order
)SELECT *,
	datediff(next_order_date,Order_Date)
FROM next_date_summary;



with cust_order as (select c.Customer_Name,
		m.Ord_id,
		o.Order_Date
from market_fact_full m
left join orders_dimen o
on m.Ord_id = o.Ord_id
left join cust_dimen as c
on m.Cust_id = c.Cust_id
where Customer_Name='RICK WILSON'
group by c.Customer_Name,m.Ord_id,o.Order_Date
)
,prev_date_summary as(
	SELECT *,
    LAG(Order_Date,1,'2015-01-01') OVER(order by Order_Date) as prev_order_date
FROM cust_order
)
SELECT *,
	DATEDIFF(Order_Date,prev_order_date) as diff
from prev_date_summary;

select Market_fact_id,Profit,
	CASE
		WHEN Profit<-500 THEN "Huge Loss"
		WHEN Profit between -500 and 0 THEN "Bearable Loss"
		WHEN Profit between 0 and 500 THEN "Decent Profit"
		WHEN Profit >500 THEN "Great Profit"
	END as Profit_type
from market_fact_full;


SELECT Market_fact_id, Profit,
	CASE 	
		WHEN Profit<-500 THEN "Huge Loss"
        WHEN Profit between -500 and 0 THEN "bearable Loss"
        WHEN Profit BETWEEN 0 AND 500 THEN "Decent Profit"
        WHEN Profit>500 THEN "Great Profit"
	END AS Profit_type
FROM market_fact_full;

use market_star_schema;
SELECT Market_fact_id,Profit,
	CASE
		WHEN Profit<-500 THEN "Huge Loss"
        WHEN Profit BETWEEN -500 AND 0 THEN "bearable Loss"
        WHEN Profit BETWEEN 500 AND 0 then "Decent Profit"
        ELSE "Great Profit"
	END AS Profit_Type
FROM market_fact_full;



-- UDF
DELIMITER $$

CREATE FUNCTION profitType(Profit int)
RETURNS VARCHAR(30) deterministic

BEGIN
DECLARE message VARCHAR(30);-- Declare the variable as message
IF Profit<-500 THEN 
	SET message = 'Huge Loss';
ELSEIF Profit BETWEEN -500 and 0 THEN
	SET message = 'Bearable Loss';
ELSEIF Profit BETWEEN 0 and 500 THEN
	SET message='Decent Profit';
ELSE 
	SET message='Great Profit';
END IF;

RETURN message;

END ; $$
DELIMITER ;

select ProfitType(400) as func_output;

create index index_name
on table(column1,column2);

create index index_name
on table(column1);

alter table tablename
add index indexname(column1);

KEY `keyname` (column_name);

UNIQUE KEY `keyname` (column_name);

alter table tablename
drop index indexname;

alter table tablename
add index indexname(column1,column2,column3);

create index indexname
on table(column1,column2,column3);

DELIMITER $$
CREATE PROCEDURE procedure_name(param)
BEGIN
<SQL STATEMENTS>
END $$
DELIMITER ;

CALL procedure_name(argu);

DELIMITER $$
CREATE FUNCTION func_name(param1,param2)
RETURNS datatype [characteristic]

BEGIN
<SQL STATEMENTS>
RETURN expression;
END; $$
DELIMITER ;


lag(exp,offset,default);


FOREIGN KEY (column name) REFERENCES TABLENAME(COLUMNNAME)


CREATE TABLE `Department`(
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

FOREIGN KEY (DeptID) REFERENCES Department(DeptID);

-- alter commands
ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;

ALTER TABLE vehicles
ADD model VARCHAR(30) NOT NULL;

ALTER TABLE vehicles
ADD model VARCHAR(30),
ADD note VARCHAR(255);


ALTER TABLE vehicles
ADD model VARCHAR(30) NOT NULL,
ADD note VARCHAR(25);

ALTER TABLE vehicles
MODIFY note VARCHAR(30) NOT NULL;

ALTER TABLE vehicles
MODIFY year smallint not null,
modify color varchar(20) null after make;

alter table vehicles
change column note vehicleCondition varchar(30) not null;

alter table vehicles
drop column vehicleCondition;

alter table vehicles
rename to cars;


delete from customers
where country = 'Norway';

delete from tablename;

truncate table tablename;


truncate table tablename;

UNIQUE KEY 'Order_Number_Idx' (Order_Number);


use market_star_schema;






