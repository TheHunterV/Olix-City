# T1GER CHOP SHOP

## SHOWCASE:
https://youtu.be/-C_GjQQeRM8

## FRAMEWORK:
- [ESX Legacy](https://github.com/esx-framework/esx_core)

## DEPENCENCIES:
- [progressBars (OPTIONAL)](https://gitlab.com/t1ger-scripts/t1ger-requirements/-/tree/main/progressBars)

## INSTALLATION:
1. Drag & drop the folder into your `resources` server folder.
2. Configure config.lua to match & satisfy your needs/requirements.
3. Import `lds_chopshop.sql` into your database
4. Install and ensure the necessary dependencies.
5. Add `start lds_chopshop` to your server config.

### Car List
- Add all the cars you want in Config.ScrapVehicles
- Script will scramble Config.ChopShop.Settings.carListAmount for every Config.ChopShop.Settings.newCarListTimer

### Materials
- Add or remove materials, configure chance, min/max amount etc. 
- Make sure to edit to weight in SQL if u are using weight system, otherwise u will get an error when running the SQL.

### Scrapping Owned Vehicles
- In config enable/disable scrapping owned vehicles

### GCPHONE / PHONE MESSAGES
- By default my script supports GCPhone with phone messages. 
- In utils.lua find this function: JobNotifyMSG
- TriggerServerEvent('gcPhone:sendMessage', phoneNr, msg) - is the event that sends the message.

