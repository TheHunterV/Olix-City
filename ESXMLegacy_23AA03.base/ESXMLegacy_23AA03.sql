-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table esxlegacy_23aa03.0r_motels: ~6 rows (approximately)
REPLACE INTO `0r_motels` (`id`, `owner`, `mcode`, `apartment`, `name`, `theme`, `garageth`, `rooms`, `caches`, `bills`, `notifys`, `moneylogs`, `feedbacks`, `recentrents`, `saleprice`, `evascore`, `rentprice`, `coords`, `garage`, `discount`, `money`, `revenue`, `floor`, `blip`) VALUES
	(2, NULL, '0resmon', '0', '0Resmon Motels', 'marble', '1', '[{"garage":{"state":0},"Owner":"char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e","StashWeight":20,"InteriorType":"Economy","StashCoord":[-362.5556640625,62.00716781616211,54.43060684204101],"RentPrice":100,"AmountPay":75,"AutoPay":false,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-364.8197937011719,59.11623764038086,54.43060684204101],"PaymentDate":"2023-11-20","RentDate":"2023-11-18","EnterCoord":[-362.228271484375,57.92036056518555,54.45735168457031],"Keys":[],"rCode":"32Ra7I","ownerName":"Gunner Jaxson","Day":2},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-347.0229187011719,59.84858322143555,54.43060302734375],"PaymentDate":"Not Rented Yet","EnterCoord":[-350.6436157226563,58.0296516418457,54.45838928222656],"StashCoord":[-350.1658630371094,62.01705932617187,54.43059158325195],"Keys":[],"rCode":"eL25cP","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-344.9825744628906,59.41196823120117,54.43092346191406],"PaymentDate":"Not Rented Yet","EnterCoord":[-344.0174865722656,57.58146286010742,54.43380355834961],"StashCoord":[-340.8411560058594,58.79134368896484,54.4307975769043],"Keys":[],"rCode":"qooXcd","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-330.52362060546877,58.3834228515625,54.43060302734375],"PaymentDate":"Not Rented Yet","EnterCoord":[-333.2607421875,57.2376708984375,54.42971420288086],"StashCoord":[-332.4536437988281,61.80944442749023,54.43060302734375],"Keys":[],"rCode":"h6dsqM","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-326.8016052246094,55.47049331665039,58.75601959228515],"PaymentDate":"Not Rented Yet","EnterCoord":[-329.4304504394531,52.08930969238281,58.75590515136719],"StashCoord":[-323.09930419921877,51.7213134765625,58.75601959228515],"Keys":[],"rCode":"7sfT1C","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-329.9438781738281,58.36623764038086,58.77128601074219],"PaymentDate":"Not Rented Yet","EnterCoord":[-333.0529479980469,57.14945602416992,58.74612045288086],"StashCoord":[-332.5194396972656,62.21054458618164,58.75315475463867],"Keys":[],"rCode":"Dhy1vn","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-344.9284362792969,59.43688201904297,58.75307846069336],"PaymentDate":"Not Rented Yet","EnterCoord":[-344.1552734375,57.59633255004883,58.7464714050293],"StashCoord":[-340.512939453125,58.75846099853515,58.75],"Keys":[],"rCode":"QgHX8t","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-347.0979919433594,59.64298629760742,58.75307846069336],"PaymentDate":"Not Rented Yet","EnterCoord":[-350.8865051269531,57.69403076171875,58.74643325805664],"StashCoord":[-350.2971801757813,62.67428970336914,58.75154876708984],"Keys":[],"rCode":"nrN8fW","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-364.6502380371094,59.07054138183594,58.75776290893555],"PaymentDate":"Not Rented Yet","EnterCoord":[-362.34954833984377,57.72758865356445,58.74774932861328],"StashCoord":[-362.49163818359377,62.6180305480957,58.75315856933594],"Keys":[],"rCode":"dNPAQM","ownerName":"No Owner","RentPrice":100},{"garage":{"state":0},"InteriorType":"Economy","AutoPay":false,"Owner":"No Owner","StashWeight":20,"DoorHash":-165345653,"Teleport":false,"WardrobeCoord":[-368.8405151367188,56.6843147277832,58.75018310546875],"PaymentDate":"Not Rented Yet","EnterCoord":[-366.6871337890625,53.13175582885742,58.74785614013672],"StashCoord":[-373.1167907714844,53.56340789794922,58.74992370605469],"Keys":[],"rCode":"JB7Ikx","ownerName":"No Owner","RentPrice":100}]', '[]', '[]', '[]', '[]', '[]', '[]', 140000, 5, 1000, '{"x": -369.49450683594, "y": 50.198177337646, "z": 54.429756164551}', '{"x": -369.84078979492, "y": 41.919914245605, "z": 51.020458221436}', 25, 500, 1, 1, 3),
	(3, NULL, 'tyyasx', '0', 'Pinkcage Motels', 'marble', '1', '[{"WardrobeCoord":[302.8941650390625,-206.78231811523438,54.22573471069336],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[306.83837890625,-208.6259307861328,54.22573471069336],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[307.4933776855469,-213.2112274169922,54.21992492675781],"EnterCoord":[307.4933776855469,-213.2112274169922,54.21992492675781],"rCode":"c27LDT","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[306.7842712402344,-197.03672790527345,54.22578430175781],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[310.587646484375,-198.7257843017578,54.22578811645508],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[311.15142822265627,-203.3059844970703,54.219970703125],"rCode":"CFDygm","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[322.26995849609377,-190.28573608398438,54.2255859375],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[320.4989013671875,-194.11221313476563,54.22558975219726],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[315.8019714355469,-194.7015380859375,54.22674942016601],"rCode":"qi4TzM","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[308.55523681640627,-224.228759765625,58.02458953857422],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[310.16558837890627,-220.37669372558595,58.02458953857422],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[314.79931640625,-219.92593383789063,58.04742050170898],"rCode":"L5Bp0F","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[302.8851013183594,-206.86549377441407,58.02334594726562],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[306.8250732421875,-208.54006958007813,58.02334594726562],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[307.40130615234377,-213.31492614746095,58.01510620117187],"rCode":"p44bUV","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[306.7640380859375,-196.96568298339845,58.02369689941406],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[310.6249694824219,-198.73895263671876,58.02369689941406],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[311.1482238769531,-203.3523406982422,58.01515197753906],"rCode":"yffPlr","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[322.3328857421875,-189.89093017578126,58.02392959594726],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[320.5035400390625,-194.1348876953125,58.02393341064453],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[315.8407897949219,-194.63629150390626,58.0151481628418],"rCode":"HMdxqG","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[343.9940185546875,-225.90118408203126,54.22627258300781],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[339.90509033203127,-224.17991638183595,54.22629165649414],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[339.1177062988281,-219.53041076660157,54.219970703125],"rCode":"rXsDbe","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[347.5715026855469,-216.00900268554688,54.22581481933594],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[343.556884765625,-214.2283935546875,54.225830078125],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[342.9592590332031,-209.5381317138672,54.21992492675781],"rCode":"WoXI0h","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[351.9380187988281,-206.36676025390626,54.22626113891601],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[347.380615234375,-204.3704071044922,54.22626876831055],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[346.7794494628906,-199.7992706298828,54.219970703125],"rCode":"rQsMQj","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[328.447021484375,-232.0357208251953,58.02376174926758],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[330.19610595703127,-228.0084228515625,58.02376174926758],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[334.9132995605469,-227.6024627685547,58.01506042480469],"rCode":"cnvXeA","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[343.8187255859375,-225.78343200683595,58.02272033691406],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[339.8282775878906,-224.14524841308595,58.02272415161133],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[339.15240478515627,-219.43344116210938,58.01505661010742],"rCode":"HO014D","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[347.7178955078125,-216.31166076660157,58.0227165222168],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[343.8222351074219,-214.3451385498047,58.02297973632812],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[342.9974060058594,-209.60006713867188,58.01509857177734],"rCode":"cgv6UF","Keys":[], "garage": [{"state": 0}]},{"WardrobeCoord":[351.3081970214844,-206.0116424560547,58.02272033691406],"DoorHash":-1156992775,"ownerName":"No Owner","Teleport":false,"StashCoord":[347.4094543457031,-204.38157653808595,58.02273178100586],"Owner":"No Owner","PaymentDate":"Not Rented Yet",  "AutoPay": false,"InteriorType":"Classic","RentPrice":500, "StashWeight": "40","EnterCoord":[346.7124328613281,-199.80166625976563,58.01510238647461],"rCode":"GI0aKI","Keys":[], "garage": [{"state": 0}]}]\n', '[]', '[]', '[]', '[]', '[]', '[]', 140000, 5, 1000, '{"x": 325.22332763672, "y": -229.93481445313, "z": 54.221172332764}', '{"x": 300.0619, "y": -176.4830, "z": 357.3834}', 25, 500, 1, 1, 23),
	(4, NULL, 'tyyasxsad', '1', 'Banner Apartments', 'marble', '1', '[{"garage":{"state":0},"Lock":false,"Owner":"char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e","StashWeight":20,"DefaultColor":"marble","PaymentDate":"2023-11-20","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AmountPay":300,"AutoPay":false,"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"BucketId":1003,"Day":2,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"EnterCoord":[-234.05825805664066,-834.1322631835938,95.25498962402344],"RentDate":"2023-11-18","ownerName":"Gunner Jaxson","Keys":[],"rCode":"JIkw45","EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"InteriorType":"Double"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"HZJpME","EnterCoord":[-234.9420166015625,-836.3258056640625,95.25498962402344],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"ZOSCCj","EnterCoord":[-227.05271911621098,-836.6587524414063,95.25508880615236],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"DxxbdN","EnterCoord":[-227.91217041015626,-838.8856811523438,95.25508880615236],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","PaymentDate":"Not Rented Yet","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AmountPay":120000,"AutoPay":true,"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"Teleport":true,"Day":1000,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"EnterCoord":[-221.2127227783203,-838.8497924804688,95.25498962402344],"RentDate":"2023-10-22","ownerName":"No Owner","Keys":[],"rCode":"BOX4Wm","EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"InteriorType":"Double"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"z4mXEW","EnterCoord":[-221.78384399414066,-841.1177978515625,95.25498962402344],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"CqxkTS","EnterCoord":[-234.11322021484376,-834.1233520507813,100.76588439941406],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"g9dUul","EnterCoord":[-235.0747833251953,-836.279052734375,100.76587677001952],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"eqCNcV","EnterCoord":[-227.0373992919922,-836.7311401367188,100.76588439941406],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"cH1GVu","EnterCoord":[-228.01303100585936,-838.84716796875,100.76588439941406],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"aXqzE3","EnterCoord":[-221.0712890625,-838.8644409179688,100.76577758789064],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"8eQsmD","EnterCoord":[-221.7706298828125,-841.1199340820313,100.76577758789064],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"2337wl","EnterCoord":[-234.1670379638672,-834.02880859375,95.2550811767578],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"0js1fU","EnterCoord":[-234.97555541992188,-836.3145751953125,95.2550811767578],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"i8Bd5z","EnterCoord":[-227.0304718017578,-836.668701171875,95.25497436523438],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"gp06N8","EnterCoord":[-228.05001831054688,-838.831787109375,95.25498962402344],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"eGpZwI","EnterCoord":[-221.1187286376953,-838.8837890625,95.2551040649414],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"Sp5z7b","EnterCoord":[-221.77642822265626,-841.1168212890625,95.25509643554688],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"IL70I2","EnterCoord":[-234.1606597900391,-834.1395263671875,100.76578521728516],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"muNAjv","EnterCoord":[-234.866943359375,-836.3512573242188,100.76578521728516],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"jooqom","EnterCoord":[-227.1830291748047,-836.6514892578125,100.76587677001952],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"X74ZZQ","EnterCoord":[-228.00729370117188,-838.8528442382813,100.76587677001952],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"VotSHp","EnterCoord":[-221.16709899902345,-838.8076782226563,100.7658920288086],"PaymentDate":"Not Rented Yet"},{"garage":{"state":0},"Lock":true,"Owner":"No Owner","StashWeight":20,"DefaultColor":"marble","InteriorType":"Double","ExitCoord":[-226.2884063720703,-839.8973999023438,105.3926010131836],"RentPrice":200,"AutoPay":false,"Teleport":true,"WardrobeCoord":[-223.10580444335936,-838.1527099609375,108.15139770507813],"StashCoord":[-224.66439819335936,-833.6179809570313,108.15139770507813],"EditMenuCoord":[-225.31480407714845,-843.6209106445313,105.3927001953125],"ownerName":"No Owner","Keys":[],"rCode":"y79sjT","EnterCoord":[-221.8629150390625,-841.0889892578125,100.76588439941406],"PaymentDate":"Not Rented Yet"}]', '[{"Motel":true,"a2":12,"a1":1,"Identifier":"char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e","Floor":1,"Id":3,"Theme":"marble","mCode":"tyyasxsad","Garage":"none"}]', '[]', '[]', '[]', '[]', '[]', 140000, 5, 1000, '{"x": -287.4010925293, "y": -1061.4113769531, "z": 27.205381393433}', '{"x": -308.70608520508, "y": -1091.9794921875, "z": 23.025787353516}', 25, 500, 1, 2, 5),
	(5, NULL, '6ass1', '0', 'The Motor Motel', 'marble', '1', '[{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"1befTJ","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3353271484376,2654.61474609375,38.15029907226562],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"ZsE8Bj","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3218994140626,2650.9775390625,38.14092254638672],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"COwEz4","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1142.3641357421876,2643.5556640625,38.14375686645508],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"VZsV3r","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1141.19287109375,2641.7373046875,38.14374923706055],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"TgROL1","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1136.42431640625,2641.73974609375,38.14370346069336],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"QatDQS","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1132.5374755859376,2641.73974609375,38.1436767578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"ownerName":"No Owner","Day":0,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","RentDate":"","Keys":[],"rCode":"caiZAN","DefaultColor":"standart","EditMenuCoord":[1.0,1.0,1.0],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1125.1875,2641.6962890625,38.14380645751953],"StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"Teleport":true,"InteriorType":"Standard","AmountPay":85,"RentPrice":100,"Lock":true},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"MIhph0","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1121.288330078125,2641.73974609375,38.14384078979492],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"p49WfM","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1114.76513671875,2641.654296875,38.14374923706055],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"HTi85r","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1107.322265625,2641.739501953125,38.14375305175781],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"0IrlV6","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1106.1072998046876,2649.0078125,38.14093017578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"},{"RentPrice":100,"AutoPay":false,"StashWeight":15,"garage":{"state":0},"PaymentDate":"Not Rented Yet","ExitCoord":[-384.4519958496094,152.1614990234375,62.11899948120117],"Owner":"No Owner","Lock":true,"rCode":"iwAxLL","DefaultColor":"standart","StashCoord":[-379.86370849609377,153.00648498535157,62.1189956665039],"WardrobeCoord":[-382.7869873046875,152.9712371826172,62.1189956665039],"EnterCoord":[1106.15185546875,2652.732421875,38.14093017578125],"Teleport":true,"ownerName":"No Owner","Keys":[],"EditMenuCoord":[1.0,1.0,1.0],"InteriorType":"Standard"}]\n', '[]', '[]', '[]', '[]', '[]', '[]', 10000, 5, 1000, '{"x": 1142.3271484375, "y": 2664.2819824219, "z": 38.160869598389}', '0', 25, 500, 1, 1, 4),
	(6, NULL, '77asd1', '0', 'Callisto Apartments', 'marble', '1', '[{"DoorHash":-807362247,"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","Day":0,"PaymentDate":"Not Rented Yet","AmountPay":1350,"RentDate":"","AutoPay":false,"Keys":[],"StashCoord":[436.1139831542969,-8.15689945220947,99.64585876464844],"EnterCoord":[429.7999877929688,-7.50228214263916,99.6457061767578],"garage":{"state":0},"Owner":"No Owner","WardrobeCoord":[433.009033203125,-5.06928730010986,99.64595794677736],"StashWeight":30,"Teleport":false,"rCode":"JaAWc7"},{"Keys":[],"DoorHash":-807362247,"StashCoord":[431.6573486328125,-15.96233177185058,99.64620971679688],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"6MTTpO","Owner":"No Owner","WardrobeCoord":[429.3995971679688,-11.43373107910156,99.6469268798828],"garage":{"state":0},"EnterCoord":[425.9205932617188,-13.96467399597168,99.64554595947266],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[426.8908386230469,-23.90965461730957,99.64582824707033],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"vQyvkq","Owner":"No Owner","WardrobeCoord":[421.926513671875,-24.35721778869629,99.64583587646485],"garage":{"state":0},"EnterCoord":[422.2395324707031,-19.98462677001953,99.6457061767578],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[422.61517333984377,-31.64704322814941,99.64586639404296],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"ToAd8l","Owner":"No Owner","WardrobeCoord":[420.176513671875,-27.414644241333,99.7103271484375],"garage":{"state":0},"EnterCoord":[416.7986145019531,-29.71491622924804,99.64554595947266],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[408.1788940429688,-35.20040130615234,99.64154052734377],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"g1khra","Owner":"No Owner","WardrobeCoord":[408.0046691894531,-30.37723350524902,99.64603424072266],"garage":{"state":0},"EnterCoord":[412.2193603515625,-30.68317985534668,99.64564514160156],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[400.0801696777344,-30.67793083190918,99.64586639404296],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"gwD9V3","Owner":"No Owner","WardrobeCoord":[404.5939636230469,-28.40886116027832,99.64586639404296],"garage":{"state":0},"EnterCoord":[402.2149658203125,-24.99072456359863,99.64554595947266],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[392.2663269042969,-25.96917724609375,99.64596557617188],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"TuEvL7","Owner":"No Owner","WardrobeCoord":[391.6378784179688,-20.90121459960937,99.64596557617188],"garage":{"state":0},"EnterCoord":[395.9710083007813,-21.25547409057617,99.64571380615236],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[391.37646484375,-11.9232702255249,99.64582061767578],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"bsTh3b","Owner":"No Owner","WardrobeCoord":[396.1161193847656,-11.87003326416015,99.64582061767578],"garage":{"state":0},"EnterCoord":[395.9780578613281,-15.68670177459716,99.64568328857422],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[395.7691955566406,-3.96752786636352,99.64591217041016],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"a7fFaR","Owner":"No Owner","WardrobeCoord":[398.1102600097656,-8.35076236724853,99.64591217041016],"garage":{"state":0},"EnterCoord":[401.5545959472656,-6.12365341186523,99.64553833007813],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[400.6028747558594,4.05134487152099,99.64596557617188],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"MZiqHn","Owner":"No Owner","WardrobeCoord":[405.42340087890627,4.23455286026001,99.64600372314452],"garage":{"state":0},"EnterCoord":[405.2298583984375,0.12563355267047,99.6456298828125],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[414.72369384765627,12.814546585083,99.6374053955078],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"jRf6pN","Owner":"No Owner","WardrobeCoord":[415.3813781738281,7.55464649200439,99.64605712890624],"garage":{"state":0},"EnterCoord":[411.1446533203125,8.01425457000732,99.64568328857422],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[423.1173706054688,8.08668994903564,99.64583587646485],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"hxpWmI","Owner":"No Owner","WardrobeCoord":[419.0859680175781,5.5440125465393,99.64583587646485],"garage":{"state":0},"EnterCoord":[420.9850769042969,2.3438229560852,99.6455307006836],"AutoPay":false},{"Keys":[],"DoorHash":-807362247,"StashCoord":[430.7880859375,3.46211767196655,99.64596557617188],"RentPrice":1500,"ownerName":"No Owner","InteriorType":"Deluxe","StashWeight":30,"PaymentDate":"Not Rented Yet","Teleport":false,"rCode":"LyBEc4","Owner":"No Owner","WardrobeCoord":[431.104736328125,-1.42688643932342,99.6459732055664],"garage":{"state":0},"EnterCoord":[426.9307861328125,-1.14523696899414,99.64563751220705],"AutoPay":false}]\n', '[]', '[]', '[]', '[]', '[]', '[]', 10000, 5, 1000, '{"x": 399.0270690918, "y": -18.243541717529, "z": 91.935417175293}', '0', 15, 500, 1, 1, 1),
	(7, NULL, 'badball', '0', 'Bayview Lodge', 'marble', '1', '[{"rCode":"KNqK5I","AutoPay":false,"RentPrice":100,"AmountPay":80,"WardrobeCoord":[-711.9969482421875,5764.67333984375,17.53824424743652],"Day":0,"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"Keys":[],"DoorHash":-1563640173,"ownerName":"No Owner","Owner":"No Owner","RentDate":"","garage":{"state":0},"StashCoord":[-708.6083374023438,5766.0185546875,17.53823852539062],"EnterCoord":[-709.9420776367188,5768.1796875,17.53824043273925],"InteriorType":"Rustic"},{"rCode":"feVOVK","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-707.6421508789063,5763.68603515625,17.53824615478515],"StashCoord":[-704.6753540039063,5764.173828125,17.53824615478515],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-706.0880737304688,5766.78515625,17.51103019714355],"InteriorType":"Rustic"},{"rCode":"C8QvhM","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-703.7176513671875,5761.892578125,17.70548439025879],"StashCoord":[-700.8271484375,5762.27099609375,17.53824806213379],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-702.0496215820313,5764.609375,17.53055763244629],"InteriorType":"Rustic"},{"rCode":"rLhPAc","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-699.9835205078125,5759.666015625,17.53823852539062],"StashCoord":[-696.9047241210938,5760.462890625,17.53824615478515],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-698.1594848632813,5762.958984375,17.51103401184082],"InteriorType":"Rustic"},{"rCode":"h7jhb3","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-696.0758666992188,5757.81396484375,17.45316505432129],"StashCoord":[-692.7881469726563,5758.49365234375,17.8536148071289],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-694.2390747070313,5760.9140625,17.53127479553222],"InteriorType":"Rustic"},{"rCode":"qEhYgh","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-691.9697265625,5755.9970703125,17.5417366027832],"StashCoord":[-689.0672607421875,5756.79345703125,17.54174041748047],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-690.4349365234375,5759.330078125,17.51105690002441],"InteriorType":"Rustic"},{"rCode":"Ybad1t","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-684.0538940429688,5757.1962890625,17.76569557189941],"StashCoord":[-684.7509765625,5760.2509765625,17.53824424743652],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-687.0946655273438,5758.74365234375,17.52380561828613],"InteriorType":"Rustic"},{"rCode":"OxcFBj","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-682.225830078125,5761.12255859375,17.49560928344726],"StashCoord":[-682.8606567382813,5764.13330078125,17.53824615478515],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-684.9961547851563,5762.49853515625,17.53827095031738],"InteriorType":"Rustic"},{"rCode":"Fg1aQS","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-679.9181518554688,5765.0126953125,17.53827285766601],"StashCoord":[-680.96142578125,5768.34765625,18.02703094482422],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-683.2754516601563,5766.51318359375,17.52599143981933],"InteriorType":"Rustic"},{"rCode":"yIrLmS","AutoPay":false,"ownerName":"No Owner","Owner":"No Owner","WardrobeCoord":[-678.7409057617188,5769.0556640625,17.53793334960937],"StashCoord":[-679.2013549804688,5771.978515625,17.53824234008789],"Teleport":false,"PaymentDate":"Not Rented Yet","StashWeight":20,"garage":{"state":0},"Keys":[],"RentPrice":1500,"DoorHash":-1563640173,"EnterCoord":[-681.6415405273438,5770.71484375,17.51762199401855],"InteriorType":"Rustic"}]\n', '[]', '[]', '[]', '[]', '[]', '[]', 10000, 5, 1000, '{"x": -702.56170654297, "y": 5789.5458984375, "z": 17.517681121826}', '0', 15, 500, 1, 1, 5);

-- Dumping data for table esxlegacy_23aa03.addon_account: ~8 rows (approximately)
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_delivery1', 'Delivery', 1),
	('society_delivery2', 'Delivery', 1),
	('society_gotur', 'Götür', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Dumping data for table esxlegacy_23aa03.addon_account_data: ~8 rows (approximately)
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_taxi', 0, NULL),
	(9, 'society_banker', 0, NULL),
	(12, 'bank_savings', 0, 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(13, 'caution', 0, 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(14, 'bank_savings', 0, 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(15, 'caution', 0, 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(16, 'society_delivery1', 0, NULL),
	(17, 'society_delivery2', 0, NULL),
	(18, 'society_gotur', 0, NULL),
	(19, 'bank_savings', 0, 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(20, 'caution', 0, 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e');

-- Dumping data for table esxlegacy_23aa03.addon_inventory: ~5 rows (approximately)
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_gotur', 'Götür', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Dumping data for table esxlegacy_23aa03.addon_inventory_items: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.banking: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.billing: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.cardealer_vehicles: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.datastore: ~9 rows (approximately)
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Dumping data for table esxlegacy_23aa03.datastore_data: ~152 rows (approximately)
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(6, 'property', NULL, '{}'),
	(7, 'property', NULL, '{}'),
	(8, 'property', NULL, '{}'),
	(9, 'property', NULL, '{}'),
	(10, 'property', NULL, '{}'),
	(11, 'property', NULL, '{}'),
	(12, 'property', NULL, '{}'),
	(13, 'property', NULL, '{}'),
	(19, 'property', NULL, '{}'),
	(20, 'property', NULL, '{}'),
	(21, 'property', NULL, '{}'),
	(22, 'property', NULL, '{}'),
	(23, 'property', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(24, 'user_ears', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(25, 'user_glasses', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(26, 'user_helmet', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(27, 'user_mask', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(28, 'property', NULL, '{}'),
	(29, 'property', NULL, '{}'),
	(30, 'property', NULL, '{}'),
	(31, 'property', NULL, '{}'),
	(32, 'property', 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(33, 'user_ears', 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(34, 'user_glasses', 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(35, 'user_helmet', 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(36, 'user_mask', 'c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(37, 'property', NULL, '{}'),
	(38, 'property', NULL, '{}'),
	(39, 'property', NULL, '{}'),
	(40, 'property', NULL, '{}'),
	(41, 'property', NULL, '{}'),
	(42, 'property', NULL, '{}'),
	(43, 'property', NULL, '{}'),
	(44, 'property', NULL, '{}'),
	(45, 'property', NULL, '{}'),
	(46, 'property', NULL, '{}'),
	(47, 'property', NULL, '{}'),
	(48, 'property', NULL, '{}'),
	(49, 'property', NULL, '{}'),
	(50, 'property', NULL, '{}'),
	(51, 'property', NULL, '{}'),
	(52, 'property', NULL, '{}'),
	(53, 'property', NULL, '{}'),
	(54, 'property', NULL, '{}'),
	(55, 'property', NULL, '{}'),
	(56, 'property', NULL, '{}'),
	(57, 'property', NULL, '{}'),
	(58, 'property', NULL, '{}'),
	(59, 'property', NULL, '{}'),
	(60, 'property', NULL, '{}'),
	(61, 'property', NULL, '{}'),
	(62, 'property', NULL, '{}'),
	(63, 'property', NULL, '{}'),
	(64, 'property', NULL, '{}'),
	(65, 'property', NULL, '{}'),
	(66, 'property', NULL, '{}'),
	(67, 'property', NULL, '{}'),
	(68, 'property', NULL, '{}'),
	(69, 'property', NULL, '{}'),
	(70, 'property', NULL, '{}'),
	(71, 'property', NULL, '{}'),
	(72, 'property', NULL, '{}'),
	(73, 'property', NULL, '{}'),
	(74, 'property', NULL, '{}'),
	(75, 'property', NULL, '{}'),
	(76, 'property', NULL, '{}'),
	(77, 'property', NULL, '{}'),
	(78, 'property', NULL, '{}'),
	(79, 'property', NULL, '{}'),
	(80, 'property', NULL, '{}'),
	(81, 'property', NULL, '{}'),
	(82, 'property', NULL, '{}'),
	(83, 'property', NULL, '{}'),
	(84, 'property', NULL, '{}'),
	(85, 'property', NULL, '{}'),
	(86, 'property', NULL, '{}'),
	(87, 'property', NULL, '{}'),
	(88, 'property', NULL, '{}'),
	(89, 'property', NULL, '{}'),
	(90, 'property', NULL, '{}'),
	(91, 'property', NULL, '{}'),
	(92, 'property', NULL, '{}'),
	(93, 'property', NULL, '{}'),
	(94, 'property', NULL, '{}'),
	(95, 'property', NULL, '{}'),
	(96, 'property', NULL, '{}'),
	(97, 'property', NULL, '{}'),
	(98, 'property', NULL, '{}'),
	(99, 'property', NULL, '{}'),
	(100, 'property', NULL, '{}'),
	(101, 'property', NULL, '{}'),
	(102, 'property', NULL, '{}'),
	(103, 'property', NULL, '{}'),
	(104, 'property', NULL, '{}'),
	(105, 'property', NULL, '{}'),
	(106, 'property', NULL, '{}'),
	(107, 'property', NULL, '{}'),
	(108, 'property', NULL, '{}'),
	(109, 'property', NULL, '{}'),
	(110, 'property', NULL, '{}'),
	(111, 'property', NULL, '{}'),
	(112, 'property', NULL, '{}'),
	(113, 'property', NULL, '{}'),
	(114, 'property', NULL, '{}'),
	(115, 'property', NULL, '{}'),
	(116, 'property', NULL, '{}'),
	(117, 'property', NULL, '{}'),
	(118, 'property', NULL, '{}'),
	(119, 'property', NULL, '{}'),
	(120, 'property', NULL, '{}'),
	(121, 'property', NULL, '{}'),
	(122, 'property', NULL, '{}'),
	(123, 'property', NULL, '{}'),
	(124, 'property', NULL, '{}'),
	(125, 'property', NULL, '{}'),
	(126, 'property', NULL, '{}'),
	(127, 'property', NULL, '{}'),
	(128, 'property', NULL, '{}'),
	(129, 'property', NULL, '{}'),
	(130, 'property', NULL, '{}'),
	(131, 'property', NULL, '{}'),
	(132, 'property', NULL, '{}'),
	(133, 'property', NULL, '{}'),
	(134, 'property', NULL, '{}'),
	(135, 'property', NULL, '{}'),
	(136, 'property', NULL, '{}'),
	(137, 'property', NULL, '{}'),
	(138, 'property', NULL, '{}'),
	(139, 'property', NULL, '{}'),
	(140, 'property', NULL, '{}'),
	(141, 'property', NULL, '{}'),
	(142, 'property', NULL, '{}'),
	(143, 'property', NULL, '{}'),
	(144, 'property', NULL, '{}'),
	(145, 'property', NULL, '{}'),
	(146, 'property', NULL, '{}'),
	(147, 'property', 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(148, 'user_ears', 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(149, 'user_glasses', 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(150, 'user_helmet', 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(151, 'user_mask', 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}'),
	(152, 'property', NULL, '{}'),
	(153, 'property', NULL, '{}'),
	(154, 'property', NULL, '{}'),
	(155, 'property', NULL, '{}'),
	(156, 'property', NULL, '{}'),
	(157, 'property', NULL, '{}'),
	(158, 'property', NULL, '{}'),
	(159, 'property', NULL, '{}'),
	(160, 'property', NULL, '{}'),
	(161, 'property', NULL, '{}'),
	(162, 'property', NULL, '{}'),
	(163, 'property', NULL, '{}'),
	(164, 'property', NULL, '{}');

-- Dumping data for table esxlegacy_23aa03.fine_types: ~52 rows (approximately)
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);

-- Dumping data for table esxlegacy_23aa03.gksphone_app_chat: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_bank_transfer: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_blockednumber: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_calls: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_gallery: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_gotur: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_gps: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_group_message: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_insto_accounts: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_insto_instas: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_insto_likes: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_insto_story: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_job_message: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_lapraces: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_mails: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_messages: 0 rows
/*!40000 ALTER TABLE `gksphone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `gksphone_messages` ENABLE KEYS */;

-- Dumping data for table esxlegacy_23aa03.gksphone_messages_group: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_news: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_settings: ~0 rows (approximately)
REPLACE INTO `gksphone_settings` (`id`, `identifier`, `crypto`, `phone_number`, `avatar_url`) VALUES
	(1, 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}', '4331329', NULL),
	(2, 'char2:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{}', '7166625', NULL);

-- Dumping data for table esxlegacy_23aa03.gksphone_tinderacc: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_tindermatch: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_tindermessage: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_twitter_accounts: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_twitter_likes: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_twitter_tweets: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_users_contacts: 0 rows
/*!40000 ALTER TABLE `gksphone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gksphone_users_contacts` ENABLE KEYS */;

-- Dumping data for table esxlegacy_23aa03.gksphone_vehicle_sales: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.gksphone_yellow: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.items: ~81 rows (approximately)
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('accesscard', 'Access Card', 1, 0, 1),
	('alive_chicken', 'Living chicken', 1, 0, 1),
	('ammonium_nitrate', 'Ammonium nitrate', 1, 0, 1),
	('ampul1', 'Ampulemine no 1', 1, 0, 1),
	('ampul2', 'Ampulemine no 2', 1, 0, 1),
	('ampul3', 'Ampulemine no 3', 1, 0, 1),
	('asit', 'Asitinol', 1, 0, 1),
	('azot', 'Azotnzine', 1, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('blowpipe', 'Blowtorch', 2, 0, 1),
	('bonnet', 'HOOD', 1, 0, 1),
	('brake', 'BRAKE', 1, 0, 1),
	('bread', 'Bread', 1, 0, 1),
	('candy', 'Candy', 1, 0, 1),
	('cannabis', 'Cannabis', 3, 0, 1),
	('carokit', 'Body Kit', 3, 0, 1),
	('carotool', 'Tools', 2, 0, 1),
	('citrus_drink', 'Sprunt', 1, 0, 1),
	('clothe', 'Cloth', 1, 0, 1),
	('codeine', 'Codeine', 1, 0, 1),
	('copper', 'Copper', 1, 0, 1),
	('cutted_wood', 'Cut wood', 1, 0, 1),
	('diamond', 'Diamond', 1, 0, 1),
	('door', 'DOOR', 1, 0, 1),
	('drill', 'Drill', 1, 0, 1),
	('drug_ecstasy', 'Ecstasy', 1, 0, 1),
	('drug_lean', 'Lean', 1, 0, 1),
	('drug_lsd', 'LSD', 1, 0, 1),
	('drug_meth', 'Meth', 1, 0, 1),
	('drug_pinkice', 'Pink Ice', 1, 0, 1),
	('engine', 'ENGINE', 1, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('exhaust', 'EXHAUST', 1, 0, 1),
	('fabric', 'Fabric', 1, 0, 1),
	('fish', 'Fish', 1, 0, 1),
	('fixkit', 'Repair Kit', 3, 0, 1),
	('fixtool', 'Repair Tools', 2, 0, 1),
	('gazbottle', 'Gas Bottle', 2, 0, 1),
	('gold', 'Gold', 1, 0, 1),
	('goldbar', 'Gold Bar', 1, 0, 1),
	('goldwatch', 'Gold Watch', 1, 0, 1),
	('hackerDevice', 'Hacker Device', 1, 0, 1),
	('hammerwirecutter', 'Hammer And Wire Cutter', 1, 0, 1),
	('hydrogen', 'Hydrogen', 1, 0, 1),
	('ice', 'Ice', 1, 0, 1),
	('iron', 'Iron', 1, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('muriatic_acid', 'Muriatic Acid', 1, 0, 1),
	('nitro100shot', '100shot Nitro', 2, 0, 1),
	('nitro200shot', '200shot Nitro', 2, 0, 1),
	('nitro50shot', '50shot Nitro', 2, 0, 1),
	('nitrogen', 'Nitrogen', 1, 0, 1),
	('oxygen', 'Oxygen', 1, 0, 1),
	('packaged_chicken', 'Chicken fillet', 1, 0, 1),
	('packaged_plank', 'Packaged wood', 1, 0, 1),
	('paint', 'PAINT', 1, 0, 1),
	('paint_black', 'PAINT BLACK', 1, 0, 1),
	('paint_blue', 'PAINT BLUE', 1, 0, 1),
	('paint_brown', 'PAINT BROWN', 1, 0, 1),
	('paint_green', 'PAINT GREEN', 1, 0, 1),
	('paint_grey', 'PAINT GREY', 1, 0, 1),
	('paint_orange', 'PAINT ORANGE', 1, 0, 1),
	('paint_pink', 'PAINT PINK', 1, 0, 1),
	('paint_purple', 'PAINT PURPLE', 1, 0, 1),
	('paint_red', 'PAINT RED', 1, 0, 1),
	('paint_white', 'PAINT WHITE', 1, 0, 1),
	('paint_yellow', 'PAINT YELLOW', 1, 0, 1),
	('petrol', 'Oil', 1, 0, 1),
	('petrol_raffin', 'Processed oil', 1, 0, 1),
	('phone', 'Phone', 1, 0, 1),
	('pseudoephedrine', 'Pseudoephedrine', 1, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('red_phosphorus', 'Red Phosphorus', 1, 0, 1),
	('seat', 'SEAT', 1, 0, 1),
	('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
	('sodium_hydroxide', 'Sodium hydroxide', 1, 0, 1),
	('stone', 'Stone', 1, 0, 1),
	('sulfuric_acid', 'Sulfuric_Acid', 1, 0, 1),
	('thermite', 'Thermite', 1, 0, 1),
	('transmition', 'TRANSMISSION', 1, 0, 1),
	('trunk', 'TRUNK', 1, 0, 1),
	('vehicle_blueprints', 'Vehicle_blueprints', 1, 0, 1),
	('vehicle_shell', 'Vehicle_shell', 1, 0, 1),
	('washed_stone', 'Washed stone', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('wheel', 'WHEEL', 1, 0, 1),
	('wood', 'Wood', 1, 0, 1),
	('wool', 'Wool', 1, 0, 1);

-- Dumping data for table esxlegacy_23aa03.jobs: ~13 rows (approximately)
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('banker', 'Banker', 0),
	('cardealer', 'Cardealer', 0),
	('delivery1', 'Delivery', 0),
	('delivery2', 'Delivery', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Fueler', 0),
	('gotur', 'Götür', 0),
	('lumberjack', 'Lumberjack', 0),
	('mechanic', 'Mechanic', 0),
	('miner', 'Miner', 0),
	('police', 'LSPD', 0),
	('reporter', 'Reporter', 0),
	('slaughterer', 'Butcher', 0),
	('tailor', 'Tailor', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Unemployed', 0);

-- Dumping data for table esxlegacy_23aa03.job_grades: ~36 rows (approximately)
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(6, 'police', 4, 'boss', 'Captain', 100, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Consultant', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Investment banker', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Broker', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(41, 'delivery1', 0, 'employee', 'Employee', 100, '{}', '{}'),
	(42, 'delivery1', 1, 'boss', 'Boss', 250, '{}', '{}'),
	(43, 'delivery2', 0, 'employee', 'Employee', 100, '{}', '{}'),
	(44, 'delivery2', 1, 'boss', 'Boss', 250, '{}', '{}'),
	(45, 'gotur', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
	(46, 'gotur', 1, 'boss', 'Patron', 0, '{}', '{}');

-- Dumping data for table esxlegacy_23aa03.lds_customs: ~2 rows (approximately)
REPLACE INTO `lds_customs` (`shop`, `inventory`) VALUES
	('Bennys', '[]'),
	('Custom Garage', '[]');

-- Dumping data for table esxlegacy_23aa03.lds_jobs: ~5 rows (approximately)
REPLACE INTO `lds_jobs` (`name`, `accounts`, `inventory`, `garage`) VALUES
	('ambulance', '{"black_money":0,"money":0}', '[]', '[]'),
	('burgershot', '{"black_money":0,"money":0}', '[]', '[]'),
	('coffeebean', '{"black_money":0,"money":0}', '[]', '[]'),
	('mechanic', '{"black_money":0,"money":0}', '[]', '[]'),
	('police', '{"black_money":0,"money":0}', '[]', '[]');

-- Dumping data for table esxlegacy_23aa03.lds_projectcars: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.lds_projectcars_items: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.lds_tuner: ~7 rows (approximately)
REPLACE INTO `lds_tuner` (`id`, `plate`, `mileages`, `vehiclestats`, `defaulthandling`, `vehicleupgrades`, `vehicletires`, `drivetrain`, `advancedflags`, `ecu`, `nodegrade`, `currentengine`) VALUES
	(1, 'COP 866', 0, '{"engine_block":99.89895157456412,"engine_connectingrods":99.25009978714424,"engine_airfilter":99.40159498778096,"transmition_clutch":98.7092491602268,"oem_suspension":100,"engine_crankshaft":99.52449601834407,"engine_valves":100.1275791910555,"engine_gasket":98.7040790266264,"engine_sparkplug":100,"engine_camshaft":100.03000000000002,"oem_gearbox":98.61934311933064,"engine_oil":100,"engine_fuelinjector":99.4002901188031,"engine_flywheel":98.90307528290544,"oem_brakes":99.34368151982662,"engine_pistons":98.87851507487902}', '{"fLowSpeedTractionLossMult":1,"fSuspensionForce":2.5,"fSuspensionRaise":0,"fDriveInertia":1,"fTractionLossMult":1,"fSuspensionReboundDamp":2.5,"fTractionCurveMin":2.29999995231628,"fBrakeForce":0.80000001192092,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionLowerLimit":-0.10000000149011,"fInitialDriveMaxFlatVel":153.0000152587891,"fInitialDriveForce":0.34000000357627,"fAntiRollBarBiasFront":0.54000002145767,"fSuspensionBiasFront":0.5,"fClutchChangeRateScaleUpShift":2.20000004768371,"fRollCentreHeightFront":0.38999998569488,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.06199999898672,"fTractionCurveMax":2.65000009536743,"nInitialDriveGears":6,"fHandBrakeForce":0.51999998092651,"fSuspensionCompDamp":1.29999995231628,"fAntiRollBarForce":0.60000002384185,"fRollCentreHeightRear":0.40000000596046}', '{"ultimate_oil":true,"pro_crankshaft":true,"pro_sparkplug":true,"ultimate_suspension":true,"pro_camshaft":true}', NULL, '0.5', '{"strAdvancedFlags":{"flags":8192,"installed":{"13":"2000"}}}', '{"Default":{"acceleration":1,"gear_ratio":["3.33",1.95,1.39,1.09,0.95,"0.85"],"gear_response":1.06,"topspeed":1.12,"profile":"Default","boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"suspension":{"fSuspensionUpperLimit":1.0,"fAntiRollBarBiasFront":1.0,"fRollCentreHeightFront":1.0,"fSuspensionBiasFront":1.0,"fSuspensionForce":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionRaise":1.0,"fSuspensionCompDamp":1.0,"fAntiRollBarForce":1.0,"fRollCentreHeightRear":1.0},"engineresponse":1.036},"active":{"acceleration":1,"gear_ratio":["3.33",1.95,1.39,1.09,0.95,"0.85"],"gear_response":1.06,"topspeed":1.12,"profile":"Default","boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"suspension":{"fSuspensionUpperLimit":1.0,"fAntiRollBarBiasFront":1.0,"fRollCentreHeightFront":1.0,"fSuspensionBiasFront":1.0,"fSuspensionForce":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionRaise":1.0,"fSuspensionCompDamp":1.0,"fAntiRollBarForce":1.0,"fRollCentreHeightRear":1.0},"engineresponse":1.036}}', 0, NULL),
	(2, 'QDL 095', 11, '{"engine_fuelinjector":100.01,"oem_suspension":100.01,"engine_flywheel":100.01,"engine_valves":100.01,"oem_brakes":100.01,"engine_crankshaft":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_gasket":100.01,"engine_sparkplug":100.01,"engine_airfilter":100.01,"engine_block":100.01,"transmition_clutch":100.01,"engine_oil":99.98336257860065,"engine_pistons":100.01,"engine_connectingrods":99.98796922832728}', '{"fSuspensionRaise":0,"fRollCentreHeightRear":0.5,"fSuspensionUpperLimit":0.10000000149011,"fAntiRollBarForce":0.30000001192092,"fSuspensionBiasFront":0.49000000953674,"fTractionCurveLateral":20.5,"fLowSpeedTractionLossMult":1,"fInitialDriveMaxFlatVel":145,"fTractionCurveMin":1.79999995231628,"fRollCentreHeightFront":0.5,"fAntiRollBarBiasFront":0.56999999284744,"fClutchChangeRateScaleUpShift":1.79999995231628,"fHandBrakeForce":0.80000001192092,"fSuspensionForce":1.89999997615814,"nInitialDriveGears":5,"fBrakeForce":0.80000001192092,"fTractionCurveMax":2.20000004768371,"fSuspensionCompDamp":0.80000007152557,"fDriveInertia":1,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionReboundDamp":1.29999995231628,"fSuspensionLowerLimit":-0.10000000149011,"fInitialDriveForce":0.28000000119209,"fTractionLossMult":1}', '[]', NULL, NULL, NULL, '{"active":{"profile":"Default","gear_response":0.92,"acceleration":1,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"topspeed":1.05,"suspension":{"fSuspensionRaise":1.0,"fRollCentreHeightFront":1.0,"fAntiRollBarBiasFront":1.0,"fRollCentreHeightRear":1.0,"fSuspensionUpperLimit":1.0,"fAntiRollBarForce":1.0,"fSuspensionBiasFront":1.0,"fSuspensionCompDamp":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionForce":1.0,"fSuspensionLowerLimit":1.0},"engineresponse":1,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0]},"Default":{"profile":"Default","gear_response":0.92,"acceleration":1,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"topspeed":1.05,"suspension":{"fSuspensionRaise":1.0,"fRollCentreHeightFront":1.0,"fAntiRollBarBiasFront":1.0,"fRollCentreHeightRear":1.0,"fSuspensionUpperLimit":1.0,"fAntiRollBarForce":1.0,"fSuspensionBiasFront":1.0,"fSuspensionCompDamp":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionForce":1.0,"fSuspensionLowerLimit":1.0},"engineresponse":1,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0]}}', 0, NULL),
	(3, 'RMV 636', 73, '{"engine_block":99.99747427023948,"oem_suspension":100.02000000000001,"engine_camshaft":100.02000000000001,"transmition_clutch":100.02000000000001,"engine_pistons":100.02000000000001,"engine_valves":99.9609395478666,"engine_crankshaft":100.02000000000001,"engine_fuelinjector":100.0012458792329,"engine_airfilter":100.0009753355384,"oem_gearbox":100.02000000000001,"engine_flywheel":99.99291132576765,"engine_sparkplug":99.9880813881755,"engine_connectingrods":99.93963755920531,"oem_brakes":100.0012458792329,"engine_gasket":100.02000000000001,"engine_oil":99.99514382421971}', '{"fAntiRollBarForce":1,"fDriveInertia":1,"fSuspensionLowerLimit":-0.07999999821186,"fInitialDriveMaxFlatVel":152,"fClutchChangeRateScaleUpShift":2.20000004768371,"fRollCentreHeightRear":0.15999999642372,"fTractionCurveMin":2.47000002861022,"fSuspensionRaise":0,"fTractionCurveMax":2.55999994277954,"fSuspensionForce":2.09999990463256,"fSuspensionUpperLimit":0.07999999821186,"fLowSpeedTractionLossMult":1.20000004768371,"fInitialDriveForce":0.33500000834465,"nInitialDriveGears":6,"fBrakeForce":1,"fSuspensionCompDamp":1.5,"fTractionCurveLateral":22.5,"fHandBrakeForce":0.64999997615814,"fAntiRollBarBiasFront":0.60000002384185,"fClutchChangeRateScaleDownShift":3,"fRollCentreHeightFront":0.11999999731779,"fSuspensionReboundDamp":1.89999997615814,"fSuspensionBiasFront":0.47999998927116,"fTractionLossMult":1}', '[]', NULL, NULL, NULL, NULL, 0, NULL),
	(4, 'TMR 152', 74, '{"engine_flywheel":100.05000000000003,"oem_gearbox":100.03587332740429,"engine_gasket":99.99250000000004,"engine_camshaft":100.05000000000003,"engine_airfilter":100.02620043888689,"engine_sparkplug":100.05000000000003,"transmition_clutch":100.05000000000003,"engine_oil":100.02609901115301,"engine_block":100.05000000000003,"engine_pistons":100.00822131492201,"engine_valves":100.05000000000003,"engine_connectingrods":100.05000000000003,"engine_crankshaft":100.05000000000003,"oem_suspension":99.95393394082375,"oem_brakes":100.02625000000004,"engine_fuelinjector":100.0091214984481}', '{"fRollCentreHeightRear":0.25,"fClutchChangeRateScaleUpShift":1.79999995231628,"fSuspensionCompDamp":1.39999997615814,"fInitialDriveForce":0.31000000238418,"fDriveInertia":1,"fInitialDriveMaxFlatVel":143,"fAntiRollBarBiasFront":0.57499998807907,"fHandBrakeForce":0.69999998807907,"fSuspensionUpperLimit":0.12999999523162,"fTractionCurveMax":2.45000004768371,"fBrakeForce":0.5,"fRollCentreHeightFront":0.20999999344348,"fTractionLossMult":0,"fSuspensionLowerLimit":-0.10000000149011,"nInitialDriveGears":6,"fClutchChangeRateScaleDownShift":1.79999995231628,"fLowSpeedTractionLossMult":1.29999995231628,"fTractionCurveMin":1.97500002384185,"fSuspensionRaise":0,"fSuspensionReboundDamp":2.5,"fAntiRollBarForce":0.34999999403953,"fSuspensionBiasFront":0.5,"fTractionCurveLateral":22.5,"fSuspensionForce":2.90000009536743}', '[]', NULL, NULL, '{"strHandlingFlags":{"flags":4096,"installed":{"12":"1000"}}}', '{"Default":{"topspeed":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0,"profile":"Default","acceleration":1.0,"engineresponse":1.0},"active":{"topspeed":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0,"profile":"Default","acceleration":1.0,"engineresponse":1.0}}', 0, NULL),
	(5, 'WZQ 357', 71, '{"engine_block":99.95940761924538,"engine_connectingrods":100.06000000000005,"engine_airfilter":100.06000000000005,"transmition_clutch":100.06000000000005,"oem_suspension":100.01,"engine_crankshaft":100.03906694234624,"engine_valves":100.03093123190108,"engine_flywheel":100.03315408963428,"engine_sparkplug":100.03906694234624,"engine_camshaft":99.98766952618498,"oem_gearbox":99.93875620732811,"engine_oil":100.03124534169165,"engine_fuelinjector":100.03184115052228,"engine_gasket":100.06000000000005,"oem_brakes":100.03234073625004,"engine_pistons":100.06000000000005}', '{"fLowSpeedTractionLossMult":1.20000004768371,"fTractionCurveLateral":22.5,"fSuspensionRaise":0,"fSuspensionBiasFront":0.4699999988079,"fTractionLossMult":1,"fSuspensionReboundDamp":1.89999997615814,"fTractionCurveMin":2.34999990463256,"fBrakeForce":1,"fClutchChangeRateScaleDownShift":3.09999990463256,"fSuspensionLowerLimit":-0.07999999821186,"fInitialDriveMaxFlatVel":159,"fInitialDriveForce":0.33500000834465,"nInitialDriveGears":6,"fAntiRollBarBiasFront":0.60000002384185,"fClutchChangeRateScaleUpShift":3.09999990463256,"fRollCentreHeightFront":0.11999999731779,"fSuspensionForce":2.09999990463256,"fSuspensionUpperLimit":0.07999999821186,"fTractionCurveMax":2.55999994277954,"fDriveInertia":1,"fHandBrakeForce":0.64999997615814,"fSuspensionCompDamp":1.5,"fAntiRollBarForce":1,"fRollCentreHeightRear":0.15999999642372}', '{"elite_suspension":true}', NULL, NULL, NULL, '{"Default":{"topspeed":1.06,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"engineresponse":0.95,"suspension":{"fSuspensionCompDamp":1.0,"fSuspensionBiasFront":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionForce":1.0,"fAntiRollBarForce":1.0,"fSuspensionReboundDamp":1.0,"fRollCentreHeightRear":1.0,"fRollCentreHeightFront":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionRaise":1.0,"fAntiRollBarBiasFront":1.0},"gear_response":1.07,"acceleration":1,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"profile":"Default"},"active":{"topspeed":1.06,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"engineresponse":0.95,"suspension":{"fSuspensionCompDamp":1.0,"fSuspensionBiasFront":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionForce":1.0,"fAntiRollBarForce":1.0,"fSuspensionReboundDamp":1.0,"fRollCentreHeightRear":1.0,"fRollCentreHeightFront":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionRaise":1.0,"fAntiRollBarBiasFront":1.0},"gear_response":1.07,"acceleration":1,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"profile":"Default"}}', 0, NULL),
	(6, 'KWD 677', 44, '{"engine_block":99.91528033950353,"engine_oil":100.04000000000002,"engine_airfilter":99.94436178593327,"transmition_clutch":100.04000000000002,"oem_suspension":100.04000000000002,"engine_crankshaft":99.86824238541603,"engine_valves":100.04000000000002,"engine_gasket":100.04000000000002,"engine_sparkplug":99.93132673001927,"engine_camshaft":99.90975496724903,"oem_gearbox":99.93618505050871,"engine_flywheel":100.04000000000002,"engine_fuelinjector":100.04000000000002,"engine_connectingrods":100.04000000000002,"oem_brakes":100.04000000000002,"engine_pistons":99.94436178593327}', '{"fLowSpeedTractionLossMult":1,"fSuspensionForce":2,"fSuspensionRaise":0,"fDriveInertia":1,"fTractionLossMult":1,"fSuspensionReboundDamp":2,"fTractionCurveMin":2.31999993324279,"fBrakeForce":1,"fClutchChangeRateScaleDownShift":5.19999980926513,"fSuspensionLowerLimit":-0.10000000149011,"fAntiRollBarForce":0.69999998807907,"fSuspensionUpperLimit":0.07999999821186,"fAntiRollBarBiasFront":0.55000001192092,"nInitialDriveGears":6,"fClutchChangeRateScaleUpShift":5.19999980926513,"fRollCentreHeightFront":0.20000000298023,"fInitialDriveForce":0.31999999284744,"fTractionCurveLateral":22.5,"fTractionCurveMax":2.42000007629394,"fSuspensionBiasFront":0.49000000953674,"fHandBrakeForce":0.69999998807907,"fSuspensionCompDamp":1.29999995231628,"fInitialDriveMaxFlatVel":155,"fRollCentreHeightRear":0.20000000298023}', '{"pro_clutch":true,"pro_pistons":true,"pro_valves":true,"pro_suspension":true,"pro_crankshaft":true,"pro_oil":true,"pro_camshaft":true,"pro_fuelinjector":true,"pro_brakes":true,"pro_gasket":true,"pro_block":true,"pro_flywheel":true,"pro_sparkplug":true,"pro_gearbox":true,"pro_connectingrods":true,"pro_airfilter":true}', NULL, '0.5', '{"strAdvancedFlags":{"flags":2097179,"installed":{"0":"1","1":"2","21":"200000","3":"8","4":"10"}}}', '{"Default":{"profile":"Default","topspeed":1.0,"acceleration":1.0,"engineresponse":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0},"active":{"profile":"Default","topspeed":1.0,"acceleration":1.0,"engineresponse":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0}}', 0, NULL),
	(7, 'VPV 179', 114, '{"engine_block":99.90181770585078,"engine_oil":99.69720668917226,"engine_airfilter":99.77836842375648,"transmition_clutch":99.73691796162145,"oem_suspension":99.04442393656452,"engine_crankshaft":98.81603284285203,"engine_valves":98.9997490960745,"engine_gasket":99.54054022896718,"engine_sparkplug":99.56253074268708,"engine_camshaft":99.80198264622321,"oem_gearbox":98.42288783038598,"engine_connectingrods":99.27963490144352,"engine_fuelinjector":99.10611076468492,"engine_flywheel":99.85186937099683,"oem_brakes":98.980006538236,"engine_pistons":99.26981375658761}', '{"fLowSpeedTractionLossMult":1,"fSuspensionForce":2.20000004768371,"fSuspensionRaise":0,"fDriveInertia":1,"fTractionLossMult":1,"fSuspensionReboundDamp":1.29999995231628,"fTractionCurveMin":1.79999995231628,"fBrakeForce":0.80000001192092,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionBiasFront":0.47999998927116,"fInitialDriveForce":0.28000000119209,"fSuspensionUpperLimit":0.05000000074505,"nInitialDriveGears":5,"fAntiRollBarForce":0.40000000596046,"fClutchChangeRateScaleUpShift":1.89999997615814,"fRollCentreHeightFront":0.20000000298023,"fAntiRollBarBiasFront":0.56000000238418,"fSuspensionLowerLimit":-0.10000000149011,"fTractionCurveMax":2.25,"fTractionCurveLateral":22.5,"fHandBrakeForce":0.80000001192092,"fSuspensionCompDamp":0.80000007152557,"fInitialDriveMaxFlatVel":140,"fRollCentreHeightRear":0.20000000298023}', '{"ultimate_oil":true,"ultimate_valves":true,"ultimate_flywheel":true,"ultimate_pistons":true,"ultimate_airfilter":true,"ultimate_gasket":true,"ultimate_gearbox":true,"ultimate_brakes":true,"ultimate_camshaft":true,"ultimate_clutch":true,"ultimate_fuelinjector":true,"ultimate_crankshaft":true,"ultimate_block":true,"ultimate_sparkplug":true,"ultimate_suspension":true,"ultimate_connectingrods":true}', NULL, '0.5', '{"strHandlingFlags":{"flags":536875008,"installed":{"12":"1000","29":"20000000"}},"strAdvancedFlags":{"flags":18,"installed":["2",null,null,"10"]}}', NULL, 0, NULL),
	(8, 'FLY 620', 158, '{"engine_camshaft":97.33062782212505,"oem_gearbox":95.69006791693256,"transmition_clutch":96.72452073663233,"engine_oil":97.24059952449893,"engine_block":93.0426217134634,"engine_connectingrods":97.29649336932917,"engine_flywheel":96.61412707300765,"oem_suspension":97.7946038232273,"engine_sparkplug":99.83263661967676,"engine_valves":93.58518841437604,"engine_fuelinjector":97.20764976039529,"engine_crankshaft":97.74891566075583,"engine_pistons":94.14588051595448,"engine_gasket":95.19792927048852,"engine_airfilter":96.15625094730342,"oem_brakes":99.31324661541963}', '{"fInitialDriveForce":0.27000001072883,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionUpperLimit":0.11999999731779,"fHandBrakeForce":0.80000001192092,"fSuspensionCompDamp":0.80000007152557,"fSuspensionRaise":0,"fAntiRollBarBiasFront":0.57499998807907,"fInitialDriveMaxFlatVel":140,"fAntiRollBarForce":0.40000000596046,"fSuspensionForce":2.20000004768371,"fTractionCurveMin":1.79999995231628,"nInitialDriveGears":4,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.20000000298023,"fDriveInertia":1,"fTractionLossMult":1,"fBrakeForce":0.80000001192092,"fSuspensionLowerLimit":-0.14000000059604,"fTractionCurveMax":2.25,"fSuspensionReboundDamp":1.29999995231628,"fRollCentreHeightRear":0.20000000298023,"fClutchChangeRateScaleUpShift":1.89999997615814,"fLowSpeedTractionLossMult":1.29999995231628,"fSuspensionBiasFront":0.47999998927116}', '{"ultimate_block":true,"racing_sparkplug":false,"racing_crankshaft":false,"ultimate_flywheel":true,"ultimate_oil":true,"ultimate_camshaft":true,"racing_flywheel":false,"racing_camshaft":false,"ultimate_sparkplug":true,"racing_gasket":false,"racing_suspension":false,"racing_valves":false,"ultimate_connectingrods":true,"ultimate_fuelinjector":true,"ultimate_clutch":true,"ultimate_crankshaft":true,"ultimate_brakes":true,"pro_connectingrods":false,"ultimate_suspension":true,"ultimate_pistons":true,"pro_fuelinjector":false,"elite_block":false,"ultimate_valves":true,"ultimate_airfilter":true,"elite_clutch":false,"ultimate_gearbox":true,"ultimate_gasket":true}', NULL, NULL, '{"strHandlingFlags":{"flags":4096,"installed":{"12":"1000"}},"strAdvancedFlags":{"flags":2121746,"installed":{"13":"2000","1":"2","21":"200000","4":"10","14":"4000"}},"strModelFlags":{"flags":5570576,"installed":{"18":"40000","16":"10000","22":"400000","20":"100000","4":"10"}}}', '{"active":{"gear_response":1.04,"engineresponse":1.01099999999999,"suspension":{"fSuspensionForce":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionCompDamp":1.0,"fSuspensionRaise":1.0,"fAntiRollBarBiasFront":1.0,"fSuspensionLowerLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightFront":1.0,"fAntiRollBarForce":1.0},"acceleration":1.01099999999999,"boostpergear":[1.0,1.0,1.0,1.0],"profile":"Default","gear_ratio":[3.33,1.92,1.36,1.05,0.9],"topspeed":1.1},"Default":{"gear_response":1.04,"engineresponse":1.01099999999999,"suspension":{"fSuspensionForce":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionCompDamp":1.0,"fSuspensionRaise":1.0,"fAntiRollBarBiasFront":1.0,"fSuspensionLowerLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightFront":1.0,"fAntiRollBarForce":1.0},"acceleration":1.01099999999999,"boostpergear":[1.0,1.0,1.0,1.0],"profile":"Default","gear_ratio":[3.33,1.92,1.36,1.05,0.9],"topspeed":1.1}}', 0, NULL),
	(9, '32U12P34', 0, NULL, NULL, '{"pro_gasket":true,"pro_gearbox":true,"pro_brakes":true,"pro_suspension":true,"pro_fuelinjector":true,"pro_camshaft":true,"pro_airfilter":true,"pro_crankshaft":true,"pro_connectingrods":true,"pro_flywheel":true,"pro_valves":true,"pro_sparkplug":true,"pro_clutch":true,"pro_block":true,"pro_pistons":true,"pro_oil":true}', NULL, NULL, NULL, '{"Default":{"profile":"Default","gear_response":1.0,"acceleration":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0],"topspeed":1.0,"engineresponse":1.0},"active":{"profile":"Default","gear_response":1.0,"acceleration":1.0,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0],"topspeed":1.0,"engineresponse":1.0}}', 0, NULL),
	(10, 'VJHC91HD', 0, NULL, NULL, '{"ultimate_clutch":true,"ultimate_suspension":true,"ultimate_gearbox":true}', NULL, NULL, '{"strAdvancedFlags":{"flags":335544338,"installed":{"1":"2","4":"10","26":"4000000","28":"10000000"}}}', '{"Default":{"acceleration":1,"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"engineresponse":1.10099999999999,"suspension":{"fSuspensionUpperLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fAntiRollBarBiasFront":1.0,"fSuspensionRaise":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionBiasFront":1.0,"fAntiRollBarForce":1.0,"fRollCentreHeightFront":1.0},"topspeed":1.15,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"profile":"Default","gear_response":0.95},"active":{"acceleration":1,"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"engineresponse":1.10099999999999,"suspension":{"fSuspensionUpperLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fAntiRollBarBiasFront":1.0,"fSuspensionRaise":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionBiasFront":1.0,"fAntiRollBarForce":1.0,"fRollCentreHeightFront":1.0},"topspeed":1.15,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"profile":"Default","gear_response":0.95}}', 0, NULL),
	(11, '17S55802', 0, NULL, NULL, '{"pro_gearbox":false,"pro_airfilter":false,"elite_brakes":true,"ultimate_oil":false,"ultimate_flywheel":false,"ultimate_crankshaft":false,"pro_fuelinjector":false,"elite_flywheel":true,"ultimate_connectingrods":false,"ultimate_valves":false,"elite_connectingrods":true,"elite_airfilter":true,"pro_crankshaft":false,"ultimate_suspension":false,"ultimate_camshaft":false,"pro_clutch":false,"elite_pistons":true,"pro_valves":false,"pro_camshaft":false,"elite_gearbox":true,"elite_fuelinjector":true,"ultimate_gasket":false,"elite_valves":true,"elite_camshaft":true,"ultimate_pistons":false,"elite_sparkplug":true,"pro_block":false,"ultimate_airfilter":false,"elite_clutch":true,"pro_suspension":false,"elite_crankshaft":true,"ultimate_block":false,"pro_pistons":false,"elite_gasket":true,"ultimate_brakes":false,"elite_suspension":true,"pro_flywheel":false,"pro_connectingrods":false,"ultimate_clutch":false,"elite_block":true,"pro_oil":false,"pro_brakes":false,"ultimate_sparkplug":false,"pro_sparkplug":false,"pro_gasket":false,"ultimate_gearbox":false,"elite_oil":true,"ultimate_fuelinjector":false}', NULL, NULL, NULL, '{"active":{"suspension":{"fRollCentreHeightFront":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionBiasFront":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fSuspensionUpperLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionRaise":1.0,"fSuspensionReboundDamp":1.0,"fAntiRollBarForce":1.0,"fAntiRollBarBiasFront":1.0},"gear_response":1,"gear_ratio":["3.33",1.92,1.36,1.05,"0.85"],"acceleration":1.01099999999999,"boostpergear":[1.0],"engineresponse":1.06599999999999,"profile":"Default","topspeed":1.11},"Default":{"suspension":{"fRollCentreHeightFront":1.0,"fSuspensionLowerLimit":1.0,"fSuspensionBiasFront":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fSuspensionUpperLimit":1.0,"fRollCentreHeightRear":1.0,"fSuspensionRaise":1.0,"fSuspensionReboundDamp":1.0,"fAntiRollBarForce":1.0,"fAntiRollBarBiasFront":1.0},"gear_response":1,"gear_ratio":["3.33",1.92,1.36,1.05,"0.85"],"acceleration":1.01099999999999,"boostpergear":[1.0],"engineresponse":1.06599999999999,"profile":"Default","topspeed":1.11}}', 0, NULL),
	(12, '00UD86J2', 0, NULL, NULL, '{"pro_fuelinjector":true,"pro_gasket":true,"pro_gearbox":true,"pro_airfilter":true,"pro_suspension":true,"pro_brakes":true,"pro_flywheel":true,"pro_camshaft":true,"pro_connectingrods":true,"pro_pistons":true,"pro_valves":true,"pro_clutch":true,"pro_block":true,"pro_crankshaft":true,"pro_oil":true,"pro_sparkplug":true}', NULL, NULL, NULL, '{"Default":{"engineresponse":1.07099999999999,"acceleration":1.04599999999999,"suspension":{"fRollCentreHeightFront":1.0,"fSuspensionReboundDamp":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionLowerLimit":1.0,"fAntiRollBarBiasFront":1.0,"fAntiRollBarForce":1.0,"fSuspensionForce":1.0,"fSuspensionBiasFront":1.0,"fSuspensionRaise":1.0},"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"profile":"Default","topspeed":1.15,"gear_response":1},"active":{"engineresponse":1.07099999999999,"acceleration":1.04599999999999,"suspension":{"fRollCentreHeightFront":1.0,"fSuspensionReboundDamp":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionUpperLimit":1.0,"fSuspensionLowerLimit":1.0,"fAntiRollBarBiasFront":1.0,"fAntiRollBarForce":1.0,"fSuspensionForce":1.0,"fSuspensionBiasFront":1.0,"fSuspensionRaise":1.0},"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"profile":"Default","topspeed":1.15,"gear_response":1}}', 0, NULL),
	(13, '1VY8XJF0', 0, NULL, NULL, '{"pro_sparkplug":true,"pro_pistons":true,"pro_gearbox":true,"pro_gasket":true,"pro_flywheel":true,"pro_block":true,"pro_camshaft":true,"pro_fuelinjector":true,"pro_brakes":true,"pro_valves":true,"pro_clutch":true,"pro_crankshaft":true,"pro_oil":true,"pro_suspension":true,"pro_airfilter":true,"pro_connectingrods":true}', NULL, NULL, NULL, '{"Default":{"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0,1.0],"profile":"Default","acceleration":1.0,"engineresponse":1.0,"topspeed":1.0,"gear_response":1.0},"active":{"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0,1.0],"profile":"Default","acceleration":1.0,"engineresponse":1.0,"topspeed":1.0,"gear_response":1.0}}', 0, NULL),
	(14, 'YRZ842PO', 0, NULL, NULL, '{"pro_clutch":false,"racing_fuelinjector":true,"pro_suspension":false,"pro_airfilter":false,"racing_clutch":true,"pro_sparkplug":false,"racing_suspension":true,"pro_block":false,"racing_airfilter":true,"racing_camshaft":true,"racing_pistons":true,"pro_connectingrods":false,"pro_gearbox":false,"racing_gearbox":true,"racing_crankshaft":true,"racing_block":true,"racing_oil":true,"racing_valves":true,"pro_pistons":false,"racing_brakes":true,"racing_gasket":true,"pro_gasket":false,"pro_fuelinjector":false,"pro_oil":false,"racing_flywheel":true,"racing_connectingrods":true,"racing_sparkplug":true,"pro_flywheel":false,"pro_valves":false,"pro_crankshaft":false,"pro_camshaft":false,"pro_brakes":false}', NULL, NULL, NULL, '{"Default":{"gear_response":1,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"topspeed":1.14,"engineresponse":1.10499999999999,"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"acceleration":1.055,"profile":"Default","suspension":{"fSuspensionUpperLimit":1.0,"fAntiRollBarForce":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionForce":1.0,"fRollCentreHeightFront":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionRaise":1.0,"fSuspensionLowerLimit":1.0,"fAntiRollBarBiasFront":1.0}},"active":{"gear_response":1,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"topspeed":1.14,"engineresponse":1.10499999999999,"gear_ratio":[4.0,2.34,1.67,1.31,1.14,1.08,0.9],"acceleration":1.055,"profile":"Default","suspension":{"fSuspensionUpperLimit":1.0,"fAntiRollBarForce":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionForce":1.0,"fRollCentreHeightFront":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightRear":1.0,"fSuspensionCompDamp":1.0,"fSuspensionRaise":1.0,"fSuspensionLowerLimit":1.0,"fAntiRollBarBiasFront":1.0}}}', 0, NULL),
	(15, 'ZAVHQT19', 0, NULL, NULL, '{"elite_suspension":true,"elite_sparkplug":true,"elite_gearbox":true,"elite_brakes":true,"elite_block":true,"elite_camshaft":true,"elite_airfilter":true,"elite_pistons":true,"elite_gasket":true,"elite_crankshaft":true,"elite_valves":true,"elite_oil":true,"elite_clutch":true,"elite_connectingrods":true,"elite_flywheel":true,"elite_fuelinjector":true}', NULL, NULL, NULL, '{"Default":{"engineresponse":1.0,"topspeed":1.0,"profile":"Default","boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0,"acceleration":1.0},"active":{"engineresponse":1.0,"topspeed":1.0,"profile":"Default","boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"gear_response":1.0,"acceleration":1.0}}', 0, NULL);

-- Dumping data for table esxlegacy_23aa03.licenses: ~6 rows (approximately)
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Weapon License'),
	('weed_processing', 'Weed Processing License');

-- Dumping data for table esxlegacy_23aa03.multicharacter_slots: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.owned_vehicles: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.ox_inventory: ~1 rows (approximately)
REPLACE INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
	('char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', 'tyyasxsad_JIkw45', '[{"slot":1,"name":"ecola","count":1},{"metadata":{"registered":"Gunner Jaxson","durability":98.50000000000009,"serial":"471674AJW224566","ammo":1,"components":[]},"slot":2,"name":"WEAPON_PUMPSHOTGUN","count":1},{"slot":3,"name":"ammo-shotgun","count":84},{"slot":4,"name":"patriot_beer","count":5},{"slot":5,"name":"rancho_beer","count":1}]', '2023-11-18 14:30:00');

-- Dumping data for table esxlegacy_23aa03.player_outfits: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.player_outfit_codes: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.rented_vehicles: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.renzu_tuner: ~0 rows (approximately)
REPLACE INTO `renzu_tuner` (`id`, `plate`, `mileages`, `vehiclestats`, `defaulthandling`, `vehicleupgrades`, `vehicletires`, `drivetrain`, `advancedflags`, `ecu`, `nodegrade`, `currentengine`) VALUES
	(1, 'YNC 473', 104, '{"engine_airfilter":99.8308535242081,"engine_connectingrods":100.05000000000003,"engine_sparkplug":100.05000000000003,"oem_brakes":100.05000000000003,"engine_block":100.05000000000003,"engine_crankshaft":100.05000000000003,"engine_valves":100.05000000000003,"engine_flywheel":99.77894119262696,"oem_suspension":99.64866208836439,"engine_oil":100.02639430224898,"engine_fuelinjector":100.05000000000003,"oem_gearbox":99.99695350639525,"engine_camshaft":100.00178473345939,"transmition_clutch":99.6578539978713,"engine_gasket":100.05000000000003,"engine_pistons":99.64546568244698}', '{"fAntiRollBarBiasFront":0.56000000238418,"fTractionCurveLateral":22.5,"fSuspensionLowerLimit":-0.14000000059604,"fDriveInertia":1,"fHandBrakeForce":0.80000001192092,"fSuspensionReboundDamp":1.29999995231628,"fSuspensionCompDamp":0.80000007152557,"fTractionCurveMax":2.25,"fSuspensionBiasFront":0.47999998927116,"fClutchChangeRateScaleUpShift":1.89999997615814,"fBrakeForce":0.80000001192092,"fTractionLossMult":1,"fSuspensionUpperLimit":0.11999999731779,"fLowSpeedTractionLossMult":1,"fAntiRollBarForce":0.40000000596046,"fSuspensionForce":2.20000004768371,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionRaise":0,"nInitialDriveGears":5,"fInitialDriveForce":0.28000000119209,"fInitialDriveMaxFlatVel":140,"fRollCentreHeightRear":0.20000000298023,"fRollCentreHeightFront":0.20000000298023,"fTractionCurveMin":1.79999995231628}', '[]', NULL, NULL, NULL, NULL, 0, NULL),
	(2, 'COP 866', 296, '{"oem_brakes":99.27786463384152,"oem_suspension":99.89423823692207,"engine_camshaft":97.80121636334848,"engine_sparkplug":97.04601874935263,"engine_pistons":99.66193994992497,"engine_airfilter":98.50142310419673,"engine_block":99.44706331134594,"transmition_clutch":98.63096519069977,"engine_valves":98.94130025293154,"oem_gearbox":99.17979589570403,"engine_connectingrods":99.10513737871175,"engine_flywheel":100.0663399525355,"engine_gasket":98.38648993743834,"engine_crankshaft":98.62539017453398,"engine_oil":99.69978524111794,"engine_fuelinjector":100.13000000000005}', '{"fLowSpeedTractionLossMult":1,"fSuspensionCompDamp":1.29999995231628,"fBrakeForce":0.80000001192092,"fSuspensionUpperLimit":0.06199999898672,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionBiasFront":0.5,"fTractionCurveMin":2.29999995231628,"fSuspensionForce":2.5,"fRollCentreHeightFront":0.38999998569488,"nInitialDriveGears":6,"fDriveInertia":1,"fTractionCurveLateral":22.5,"fTractionCurveMax":2.65000009536743,"fClutchChangeRateScaleUpShift":2.20000004768371,"fRollCentreHeightRear":0.40000000596046,"fInitialDriveForce":0.34000000357627,"fAntiRollBarForce":0.60000002384185,"fTractionLossMult":1,"fAntiRollBarBiasFront":0.54000002145767,"fHandBrakeForce":0.51999998092651,"fInitialDriveMaxFlatVel":153.0000152587891,"fSuspensionReboundDamp":2.5,"fSuspensionLowerLimit":-0.10000000149011,"fSuspensionRaise":0}', '{"pro_suspension":true,"racing_oil":false,"elite_block":true}', NULL, '0.5', '{"strAdvancedFlags":{"flags":27,"installed":{"4":"10","3":"8","0":"1","1":"2"}}}', '{"Default":{"engineresponse":1.05099999999999,"gear_response":1,"acceleration":0.99,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"topspeed":1.25,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"suspension":{"fSuspensionUpperLimit":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fAntiRollBarBiasFront":1.0,"fAntiRollBarForce":1.0,"fSuspensionRaise":1.0,"fRollCentreHeightRear":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightFront":1.0,"fSuspensionLowerLimit":1.0},"profile":"Default"},"active":{"engineresponse":1.05099999999999,"gear_response":1,"acceleration":0.99,"gear_ratio":[3.33,1.95,1.39,1.09,0.95,0.9],"topspeed":1.25,"boostpergear":[1.0,1.0,1.0,1.0,1.0,1.0],"suspension":{"fSuspensionUpperLimit":1.0,"fSuspensionReboundDamp":1.0,"fSuspensionCompDamp":1.0,"fSuspensionForce":1.0,"fAntiRollBarBiasFront":1.0,"fAntiRollBarForce":1.0,"fSuspensionRaise":1.0,"fRollCentreHeightRear":1.0,"fSuspensionBiasFront":1.0,"fRollCentreHeightFront":1.0,"fSuspensionLowerLimit":1.0},"profile":"Default"}}', 0, NULL);

-- Dumping data for table esxlegacy_23aa03.saveclothes: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.society_moneywash: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.t1ger_deliveries: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.users: ~2 rows (approximately)
REPLACE INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `name`, `bantime`, `banreason`) VALUES
	('c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{"bank":75000}', 'admin', NULL, 'unemployed', 0, NULL, NULL, NULL, 'Max', 'Payne', '01/02/1980', 'm', 170, '{"pants_2":0,"chain_2":0,"mom":21,"sex":0,"hair_color_1":0,"makeup_3":0,"blemishes_1":0,"cheeks_2":0,"beard_3":0,"makeup_1":0,"eye_color":0,"chin_3":0,"age_1":0,"mask_1":0,"tshirt_2":0,"helmet_2":0,"bags_1":0,"lip_thickness":0,"eyebrows_3":0,"nose_2":0,"glasses_1":0,"complexion_2":0,"bracelets_2":0,"dad":0,"bodyb_2":0,"pants_1":0,"moles_2":0,"ears_1":-1,"bracelets_1":-1,"eyebrows_5":0,"lipstick_4":0,"eyebrows_1":0,"blush_1":0,"shoes_1":0,"blush_2":0,"chest_3":0,"nose_3":0,"mask_2":0,"chest_2":0,"eye_squint":0,"glasses_2":0,"nose_6":0,"lipstick_2":0,"bodyb_4":0,"eyebrows_2":0,"moles_1":0,"decals_1":0,"tshirt_1":0,"hair_color_2":0,"cheeks_1":0,"face_md_weight":50,"skin_md_weight":50,"bproof_1":0,"nose_1":0,"beard_2":0,"watches_1":-1,"ears_2":0,"beard_4":0,"sun_1":0,"helmet_1":-1,"torso_1":0,"lipstick_1":0,"torso_2":0,"shoes_2":0,"blemishes_2":0,"complexion_1":0,"chest_1":0,"bproof_2":0,"watches_2":0,"makeup_4":0,"beard_1":0,"makeup_2":0,"hair_1":0,"chin_4":0,"hair_2":0,"neck_thickness":0,"chain_1":0,"blush_3":0,"jaw_2":0,"bags_2":0,"jaw_1":0,"cheeks_3":0,"arms":0,"bodyb_3":-1,"arms_2":0,"age_2":0,"nose_5":0,"bodyb_1":-1,"lipstick_3":0,"nose_4":0,"eyebrows_6":0,"decals_2":0,"sun_2":0,"chin_2":0,"chin_1":0,"eyebrows_4":0}', '[{"name":"drunk","val":0,"percent":0.0},{"name":"hunger","val":994100,"percent":99.41},{"name":"thirst","val":995575,"percent":99.5575},{"name":"energy","val":994700,"percent":99.47}]', 0, 5, 0, NULL, '2023-10-10 23:42:53', '2023-10-10 23:44:18', NULL, NULL, NULL, NULL, NULL),
	('char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e', '{"money":2042875,"black_money":0,"bank":323718}', 'admin', '[{"count":99,"name":"donut_chc","slot":1},{"count":3,"name":"sandwich","slot":3},{"count":5,"name":"water","slot":4},{"count":1,"name":"phone","slot":5},{"count":1,"name":"doorlockpick","slot":6},{"count":5,"name":"patriot_beer","slot":7},{"count":1,"name":"rancho_beer","slot":8},{"count":1,"metadata":{"roomid":1,"description":"Motel: Banner Apartments Room No: 1","rCode":"JIkw45","mcode":"tyyasxsad"},"name":"motelcard","slot":11},{"count":84,"name":"ammo-shotgun","slot":12},{"count":1,"metadata":{"serial":"471674AJW224566","ammo":1,"registered":"Gunner Jaxson","components":[],"durability":98.50000000000009},"name":"WEAPON_PUMPSHOTGUN","slot":13},{"count":1,"name":"ecola","slot":14},{"count":7,"name":"ice","slot":15},{"count":20,"name":"nitrogen","slot":16},{"count":10,"name":"hydrogen","slot":17},{"count":5,"name":"ampul3","slot":18},{"count":10,"name":"oxygen","slot":19},{"count":1,"metadata":{"durability":100},"name":"drug_lean","slot":20},{"count":8,"name":"citrus_drink","slot":21},{"count":8,"name":"codeine","slot":22},{"count":9,"name":"phatc_bch","slot":23},{"count":2042875,"name":"money","slot":24},{"count":1,"metadata":{"type":"dukes2","description":"a vehicle blueprint in able to build dukes2","model":"dukes2","label":"dukes2 Blueprint"},"name":"vehicle_shell","slot":25}]', 'mechanic', 1, '[]', '{"health":0,"armor":0}', '{"x":0.0,"y":-0.0,"z":0.0}', 'Gunner', 'Jaxson', '14/08/1985', 'm', 170, '{"eyebrows_1":0,"face_md_weight":50,"helmet_1":-1,"jaw_2":0,"makeup_2":0,"torso_1":23,"blemishes_1":0,"ears_1":-1,"eyebrows_4":0,"blemishes_2":0,"makeup_4":0,"shoes_1":70,"bracelets_2":0,"nose_2":0,"jaw_1":0,"complexion_1":0,"bags_2":0,"pants_2":3,"chest_2":0,"makeup_1":0,"chin_2":0,"chin_13":0,"nose_1":0,"beard_4":0,"hair_2":0,"nose_6":0,"dad":0,"hair_color_2":29,"hair_1":3,"glasses_2":0,"tshirt_1":4,"complexion_2":0,"nose_4":0,"bodyb_2":0,"chest_1":0,"decals_1":0,"ears_2":0,"chin_1":0,"bproof_2":0,"eyebrows_2":0,"age_2":0,"sun_1":0,"tshirt_2":2,"sun_2":0,"hair_color_1":61,"blush_3":0,"lipstick_4":0,"shoes_2":2,"helmet_2":0,"age_1":0,"blush_2":0,"bodyb_1":-1,"chest_3":0,"chain_1":22,"lipstick_3":0,"bodyb_3":-1,"mom":21,"beard_1":11,"makeup_3":0,"torso_2":2,"watches_1":-1,"mask_1":0,"chin_3":0,"watches_2":0,"nose_5":0,"eyebrows_6":0,"lip_thickness":0,"cheeks_1":0,"eyebrows_5":0,"sex":0,"eye_squint":0,"lipstick_2":0,"neck_thickness":0,"eye_color":0,"cheeks_2":0,"decals_2":0,"beard_2":10,"chain_2":2,"bags_1":0,"bodyb_4":0,"lipstick_1":0,"moles_2":0,"bracelets_1":-1,"beard_3":0,"blush_1":0,"arms":1,"arms_2":0,"glasses_1":0,"pants_1":28,"moles_1":0,"mask_2":0,"cheeks_3":0,"chin_4":0,"eyebrows_3":0,"skin_md_weight":50,"bproof_1":0,"nose_3":0}', '[{"percent":0.0,"name":"drunk","val":0},{"percent":46.52,"name":"hunger","val":465200},{"percent":46.86,"name":"thirst","val":468600},{"percent":96.36,"name":"energy","val":963600},{"percent":96.36,"name":"poop","val":963600},{"percent":0.0,"name":"stress","val":0},{"percent":96.36,"name":"pee","val":963600},{"percent":96.36,"name":"hygiene","val":963600}]', 0, 4, 0, NULL, '2023-10-10 13:16:00', '2023-11-19 15:04:55', NULL, 1072, NULL, NULL, NULL);

-- Dumping data for table esxlegacy_23aa03.user_licenses: ~0 rows (approximately)
REPLACE INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e'),
	(2, 'weapon', 'char1:c2774b7b149d7f0bfcf8e2efbe5e3c091b7d5d4e');

-- Dumping data for table esxlegacy_23aa03.vehicles: ~240 rows (approximately)
REPLACE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Dumping data for table esxlegacy_23aa03.vehicle_categories: ~11 rows (approximately)
REPLACE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Dumping data for table esxlegacy_23aa03.vehicle_sold: ~0 rows (approximately)

-- Dumping data for table esxlegacy_23aa03.whitelist: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
