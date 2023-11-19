var Motels = []
var SecilenMotelMCode = null
var mlolist = []
var Lang = []
var OpenRoomCreateScreen = false 
var aktifKutu = ""; 
var roomCoord = null
var roomCoord2 = null
var SecilenMotelRoomID = 0 
var SecilenMotelRoomOwner = "No Owner"
var seciliInterior = "";
var Tarz = 'withdraw'
var ThisApartment = false 
var RoomTypes = []
var InMenu = 'dashboard'
var elevatorMenuIn = false
var SliderPage = 0
var corridorCurrent = false
var garageCurrent = false
var clickedKutu = null
var a1 = 0
var a2 = 0
var odaInterior = "memati"
var YumurcakData = false 
var MaxType = 0
var StashPrice = 0
var maxGelir = 0
var LastGarage = false
var seci = null
var OpenedMotel = 0
var mak = false
var amamak = false
var garageSelected = false 
var apartmentSelected = false 
var UrkGarage = null
var allmotal = []
var LatestTheme = null
var LastCorridor = null
var SecilenRenk = null
var OdaSecmeMenusu = false
var SelectedRoom = 0
var SeciliOda = null
var Price = []
var SelectedRoomType = null
var SeciliMenu = null
var SecilenRenkPrice = 0
var Discount = false
var SelectedFeedbackRoom = null
var StashWeight = 0
var DiscountValue = 0
var PlayerOwnerRoom = false
var WeightRoom = 0
var IsApartment = false
var SystemMetadata = false
var StartPoint = 0
var OpenedKeyMenu = true
var PlayerRooms = []
var OdaOrjinalFiyat = 0
var Indirimli = 0
var KiralanacakOda = 0
var KiralanacakFiyat = 0
var KiralanacakGun = 1
var KalanGun = 0
var OriginalKalan = 0
var OdeyecenKardes = 0
var OdaFiat = 0
var OdaIndirimli = 0
var OdaOrjFiyat = 0
var EklenenGun = 0
var EklenecekOda = 0
var Uzatabilir = false
var Bills = []
var Xloc = false
var DifferentEvery = false 
var corridors = []
var OdeyecekBaba = 0

window.addEventListener('message', function (event) {
    let e = event.data;
    switch (e.type) {
        case "OpenAdminMotel":
            if(OpenRoomCreateScreen == false){
                $('#MotelAdminMenu').fadeIn(350);
                Motels = event.data.Motels
                Mlos = event.data.Mlos
                corridors = event.data.corridors
                Lang = event.data.Lang
                LoadAdminMotels(event.data.Motels)
            }
            break; 
        case "OpenCreateMotelScreen":
            $('#overlayBey').fadeIn(350);
            $('.CreateMotelScreen').fadeIn(500);
            break
        case "SelectedMotelDataLoad":
            Lang = event.data.lang
            $('.MotelTabloListe').hide();
            $('.MotelTabloListe2').fadeIn(35+0);
            floorCount = event.data.data.floor
            LoadSelectedMotel(event.data.data);
            LoadSelectedMotelRooms(event.data.data.rooms)
            break;
        case "SendPlayers":
            DifferentEvery = event.data.bufarkli;
            $('.ChoseOwnerScreen').fadeIn(350);
            LoadAllPlayers(event.data.p);
            break;
        case "FullCoord":
            $('.NewEditMenu').fadeIn(350);
            $('#roomEnterCoord').val(event.data.coord);
            break;
        case "FullCoord2":
            $('.NewEditMenu').fadeIn(350);
            $('#roomGirisCoord').val(event.data.coord);
            break;
        case "OpenRoomEditor":
            $('.roomeditpage').fadeIn(350);
            LoadSelectedMotelRoom(event.data.data);
            LoadSelectedMotelRoomType(event.data.roomtype, event.data.data)
            LoadSelectedRoomBills(event.data.faturalar)
            break;
        case "cDraw":
            $('.memc').fadeIn(350);
            $('#tex').html(event.data.text)
            break;
        case "SetValue":
            $('.memc').hide();
            $('.NewEditMenu').fadeIn(350);
            $('#doorHashBaba').val(event.data.value)
            break;
        case "FullCoord3":
            $('.NewEditMenu').fadeIn(350);
            $('#StashCoord').val(event.data.coord)
            break;
        case "FullCoord4":
            $('.NewEditMenu').fadeIn(350);
            $('#WardrobeCoord').val(event.data.coord)
            break;
        case "OpenReception":
            $('#ReceptionContainer').fadeIn(350);
            $('#BuyRoomScreen').hide();
            $('#menurece').fadeIn(350);
            $('#recepsiyonmain').fadeIn(350);
            MotelData = event.data.MotelData;
            SecilenMotelMCode = MotelData.mcode
            LoadStars(event.data.stars);
            LoadMotelFeedBacks(MotelData.feedbacks)
            Price.copy = event.data.copy,
            Price.change = event.data.change
            SystemMetadata = event.data.metadata
            RoomTypes = event.data.roomTypes;
            OpenedMotel = event.data.id
            StashPrice = event.data.stashprice;
            PlayerRooms = event.data.PlayerRooms;
            Bills = event.data.Bills;
            PlayerOwnerRoom = event.data.PlayerMotel;
            Lang = event.data.Lang;
            $('#ReceptionText').html(Lang["ReceptionText"]);
            $('#ReceptionTextMain').html(Lang["ReceptionTextMain"]);
            $('#MyRoomString').html(Lang["MyRoomString"]);
            $('#MotelManagement').html(Lang["MotelManagement"]);
            $('#FeedbackString').html(Lang["FeedbackString"]);
            $('#ReceptionMenuString').html(Lang["ReceptionMenuString"]);
            $('#BuyMotelRoomString').html(Lang["BuyMotelRoomString"])
            $('#filledroomsstring').html(Lang["filledroomsstring"]);
            $('#emptyroomsstring').html(Lang["emptyroomsstring"])
            $('#ThePriceString').html(Lang["ThePriceString"])
            $('#mymotelroomsstring').html(Lang["mymotelroomsstring"]);
            $('#daystring').html(Lang["daystring"])
            $('#createfeedbackstring').html(Lang["createfeedbackstring"]);
            $('#selectroomstring').html(Lang["selectroomstring"]);
            $('#ratestring').html(Lang["ratestring"])
            $('#mybills').html(Lang["mybills"]);
            $('#youropiniom').html(Lang["youropinion"]);
            $('#limitedstring').html(Lang["limited"]);
            $('#createfeedbackstring2').html(Lang["createfeedbackstring"]);
            $('#doyouwant').html(Lang["doyouwant"]);
            $('#buybusiness').html(Lang["BuyBusiness"]);
            $('.paymentPartText').html(Lang["paymentPartText"]);
            $('#seks').html(Lang["desc"]);
            $('#month1').html(Lang["Month"])
            $('#month2').html(Lang["Month"])
            $('#month3').html(Lang["Month"]);
            $('#lifetime').html(Lang["lifetime"]);
            $('#discountlu').html(Lang["Discountlu"])

            LoadNotifys(MotelData.notifys);
            DiscountValue = MotelData.discount;
            if(DiscountValue > 0){
                Discount = true
                $('.Coupon').show();
                $('#DiscountText').html(Lang["DiscountText"]);
                $('#DiscountValue').html(MotelData.discount);
            } else {
                Discount = false
                $('.Coupon').hide();
            }
            MaxType = RoomTypes.length;
            $.post('http://0r_motels/Cal', JSON.stringify({}))
            $('#MotelNameMain').html(MotelData.name);
            $('#MotelFiyat').html(MotelData.saleprice);
            if(MotelData.owner !== undefined){
                $('.buyMotelContainer').hide();
            } else {
                $('.buyMotelContainer').show();
            }
            if(event.data.Admin === false){
                $('.motelAdmin').hide();
            } else {
                $('.motelAdmin').show()
            }
            if(event.data.PlayerMotel !== true){
                $('.myRooms5').hide();
            } else {
                $('.myRooms5').show();
            }
            LoadFirstPage();
            break;
        case "CloseReception":
            $('#ReceptionContainer').fadeOut(250);
            break;
        case "OpenBossMenu":
            $('#BossMenuContainer').fadeIn(350);
            maxGelir = event.data.maxgelir
            YumurcakData = true
            OpenBossMenu(event.data.data, event.data.AllMotels, event.data.colors)
            break;
        case "OpenHeimer":
            OdaSecmeMenusu = true
            $('.odaList').html("");
            $('#BuyRoomScreen').fadeIn(350);
            LoadOdalar(event.data.tab, event.data.Dolu, event.data.Bos, event.data.Desc, event.data.room)
            break;
        case "RentRoom":
            OdaSecmeMenusu = false
            $('#ReceptionContainer').fadeOut(350);
            $('#BuyRoomScreen').hide();
            $('#recepsiyonmain').show();
            SeciliOda = null
            $('#gunDeger').val(parseInt(1))
            break;
        case "LeaveMotelRoomUpdate":
            $.post('http://0r_motels/Cal', JSON.stringify({}))
            PlayerRooms = event.data.PlayerRooms;
            LoadPlayerRooms();
            break;
        case "LeaveMotelRoomUpdate2":
            $.post('http://0r_motels/Cal', JSON.stringify({}))
            PlayerRooms = event.data.PlayerRooms;
            LoadPlayerRooms();
            CloseAll()
            break;
        case "UzatScreen":
            $('#overlayBey').fadeIn(350);
            $('.RoomUzatPage').fadeIn(350);
            $("#PayUzat").addClass("karat").prop("disabled", true);
            KalanGun = event.data.gun;
            OriginalKalan = event.data.gun;
            OdaFiat = event.data.price;
            EklenecekOda = event.data.roomid;
            OdaOrjinalFiyat = event.data.price2
            if(Discount){
                OdaOrjinalFiyat = calculateDiscountedPrice(OdaFiat, DiscountValue);
            }
            $('#EklenenGunV').html("");
            $('#kalanGun').html(event.data.gun);
            $('#faturaDa').html(event.data.paymentdate);
            $('#odeyecek').html(event.data.price)
            break;
        case "UpdateOdalar":
            $('#overlayBey').fadeOut(350);
            $('.RoomUzatPage').fadeOut(350);
            PlayerRooms = event.data.PlayerRooms
            LoadPlayerRooms()
            break;
        case "LoadInvoices":
            Bills = event.data.bills;
            PlayerRooms = event.data.rooms;
            LoadPlayerRooms();
            LoadPlayerBills();
            $('#overlayBey').fadeOut(350);
            $('.RoomUzatPage2').fadeOut(350);
            AddedDay = 1
            KalanDay = 0
            RoomRentPriceDay = 0
            break;
        case "showNotifyV":
            showNotifyV(event.data.data);
            break;
        case "mykeys":
            Lang = event.data.lang;
            $('.PlayerMotelRoomList').fadeIn(350);
            LoadPlayerKeys(event.data.data)
            break;
        case "LoadSelectedKeyRoom":
            $('#player-secili-anahtar').html("");
            Lang = event.data.lang
            $('#playeranahtarlar').hide();
            $('#player-secili-anahtar').fadeIn(250);
            let Start = `
            <div id="BackKeyList" class="roomb">
                <h3>${Lang["BACKKEYSLIST"]}</h3>
                <h5>${Lang["SELECTEDROOM"]} ${event.data.room}</h5>
            </div>
            <div id="GiveKey" mcode="${event.data.mcode}" room="${event.data.room}" class="roomb">
                <h3>${Lang["GIVEKEY"]}</h3>
                <h5>${Lang["Room"]} ${event.data.room} - ${event.data.motelname}</h5>
            </div>`

            $('#player-secili-anahtar').html(Start);

            let hang = '';
            for (let index = 0; index < event.data.data.length; index++) {
                const element = event.data.data[index];
                hang = `
                <div style='background: transparent;' class="roomb">
                    <div id="RemoveKey" rCode="${element.rcode}" name="${element.pname}" mCode="${element.mcode}" cid="${element.keyowner}" style="width: 34%; background: #993434;" class="roombv2">
                        <h3 style="padding-top: 2vh;"><i class="fa-regular fa-xmark"></i></h3>
                    </div>
                    <div style="left: -1vh;" class="roombv2">
                        <h3 style="padding-top: 2vh;">${element.pname}</h3>
                    </div>
                </div>`
                $('#player-secili-anahtar').append(hang);
            }
            break;
        case "GarageContainer":
            $('.GarageContainer').fadeIn(350);
            SecilenMotelMCode = event.data.data.mcode
            Lang = event.data.lang
            LoadGarage(event.data.rooms, event.data.data.name)
            break;
        case "CloseB":
            $('#overlayBey').fadeOut(350);
            $('#RoomStashWeightBox').fadeOut(350);
            break;
        case "UpdateFeedbacks":
            $('.CreateFeedBackContainer').hide();
            $('.OlusturmaKisim').fadeIn(350);
            $('#feedbek').val("");
            LoadFeedbackStars();
            SelectedFeedbackRoom = null
            LoadMotelFeedBacks(event.data.data)
            break;
        case "setReception":
            $('.NewEditMenu').fadeIn(350);
            $('#recepivediksiyon').val(event.data.coord)
            break;
        case "setGarage":
            $('.NewEditMenu').fadeIn(350);
            $('#HotelGarage').val(event.data.coord)
            break;
        case "requestJoin":
            Lang = event.data.lang
            requestJoin(event.data.data)
            break;
        case "answerRequest":
            hideDiv();
            break;
        case "EditedRoom":
            $('.ChooseColorRoom').fadeIn(350);
            LatestTheme = event.data.theme
            Lang = event.data.lang
            LoadColors(event.data.colors);
            $('#EditRoomThemeString').html(Lang["EditRoomThemeString"]);
            $('#ChooseColor').html(Lang["ChooseColor"])
            break;
        case "Necip":
            $('.ChooseColorRoom').fadeOut(350);
            break;
        case "LoadElevator":
            Lang = event.data.lang
            SecilenMotelMCode = event.data.mcode
            if(event.data.garage){
                LoadElevatorGarage(event.data.floor, event.data.bankx, event.data.garage, event.data.thisIsApartment)
            } 
            else {
                LoadElevator(event.data.floor, event.data.cenk, event.data.bankx)
            }
            break;
        default: break;
    }
});

LoadGarage = function(array, name){
    $('.GarageList').html("");
    $('#notelname').html(name)
    let cam = '';
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        if (element.garage.state == 1){
            cam = `
            <div class="GarageList-Item">
                <center>
                    <img src="https://docs.fivem.net/vehicles/${element.garage.modelx}.webp">
                </center>                
                <div style="top: 1.3vh;" class="ayirbu"></div>
                <h5 style="margin-top: 1.9vh;">${Lang["Room"]} ${element.RoomId}</h5>
            </div>`
        } else {
            cam = `
            <div id="PutVehicle" room="${element.RoomId}" class="GarageList-Item">
                <h3><i class="fa-duotone fa-empty-set"></i></h3>
                <div class="ayirbu"></div>
                <h5 style="margin-top: -0.4vh;">${Lang["Room"]} ${element.RoomId}</h5>
            </div>`
        }
        $('.GarageList').append(cam);
    }
};

$(document).on('click', '#PutVehicle', function(){
    $('.GarageContainer').fadeOut(350);
    hangiAralikta(parseInt($(this).attr("room")));
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    $.post('http://0r_motels/PutVehicleGarage', JSON.stringify({
        mcode: SecilenMotelMCode,
        between: a1,
        between2: a2,
        room: $(this).attr("room")
    }));
});



OpenBossMenu = function(data, ax, rina){
    $('#LoadMotelName').html(data.name);
    $('#kasapara').html(data.money);
    $('#hahname').val(data.name);
    $('#indiri').val(data.discount);
    $('#motelodax').html(data.rooms.length);
    $('#managementpanel').html(Lang["ManagementMenu"]);
    $('#DASHBOARD').html(Lang["DASHBOARD"]);
    $('#roomsstring').html(Lang["roomsstring"]);
    $('#financestring').html(Lang["financestring"]);
    $('#billingstring').html(Lang["billingstring"]);
    $('#settingsstring').html(Lang["settingsstring"]);
    $('#ReceptionTe').html(Lang["ReceptionText"]);
    $('#signout').html(Lang["signout"]);
    $('#assetsstring').html(Lang["assetsstring"]);
    $('#totalmoneystring').html(Lang["totalmoneystring"]);
    $('#staticsstring').html(Lang["staticsstring"]);
    $('#ownerstring').html(Lang["ownerstring"])
    $('#revenuestring').html(Lang["revenuestring"]);
    $('#rentedroomstring').html(Lang["rentedroomstring"]);
    $('#invoicestext').html(Lang["invoicestext"]);
    $('#LastRoomRenters').html(Lang["LastRoomRenters"]);
    $('#feeedbacksx').html(Lang["feedbacksx"]);
    $('#AllRoomsString').html(Lang["AllRoomsString"]);
    $('#GarageThemeColor').html(Lang["GarageThemeColor"])
    $('#VacateAllRooms').html(Lang["VacateAllRooms"]);
    $('#finance2').html(Lang["financestring"]);
    $('#totalmoney2').html(Lang["totalmoneystring"]);
    $('#depositstring').html(Lang["depositstring"]);
    $('#TotalRooms').html(Lang["TotalRooms"])
    $('#withstring').html(Lang["withstring"]);
    $('#safetext').html(Lang["safetext"]);
    $('#billin3').html(Lang["billingstring"]);
    $('#confirmtext').html(Lang["confirmtext"])
    $('#InvoiceID').html(Lang["InvoiceID"]);
    $('#settingsstring2').html(Lang["settingsstring"]);
    $('#motelnamestring').html(Lang["MOTELNAME"]);
    $('#allroompricestring').html(Lang["allroompricestring"]);
    $('#corridorstring').html(Lang["corridorstring"]);
    $('#discorcvalue').html(Lang["discountext"]);
    $('#bilgilen').html(Lang["bilgilen"]);
    $('#savestring').html(Lang["savestring"]);
    $('#TransferMotel').html(Lang["TransferMotel"]);
    $('#GarageThemeString').html(Lang["GarageThemeString"]);
    $('#paymentdatestring').html(Lang["paymentdatestring"]);
    $('#gueststring').html(Lang["gueststring"]);
    $('#amountstring').html(Lang["amountstring"]);
    $('#statestring').html(Lang["statestring"])
    $('#gozdenkacan').html(data.money);
    $('#almah').html(data.ownerName);
    allmotal = ax
    LastCorridor = data.theme
    LastGarage = data.garageth
    LoadCircles(data)
    LoadRentedList(data.recentrents);
    LoadMoneyLog(data.moneylogs);
    LoadFaadbacks(data.feedbacks);
    LoadMotelBills(data.bills)
    LoadMotelOdalar(data.rooms);
    LoadFuudback(data.feedbacks);
    LoadLeaderBord();
    LoadCorridorColors(rina);
    LoadGarageColors();
    if(data.apartment === 0){
        $('#coridorayar').hide();
    } else {
        $('#coridorayar').show();
    }
    if(!data.garage){
        $('#garageayar').hide();
    } else {
        $('#garageayar').show();
    }
}

$(document).on('click', '#yatirBaba', function(){
    var input = $('#yatirV').val()
    if ((input !== '') || (parseInt(input) > 0)){
        $.post('http://0r_motels/DepositMotelCase', JSON.stringify({
            mcode: SecilenMotelMCode,
            money: input,
            type: Tarz
        }))
        $('#yatirV').val("")
    }
});



LoadMoneyLog = function(array){
    let cim = '';
    array.reverse()
    $('.FinanceHistory').html("");
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        if(element.type == 'deposit'){
            cim = `
            <div class="FinanceHistory-Item">
                <div class="George">
                    <h6><i class="fa-solid fa-arrow-trend-down"></i> ${Lang["Deposit"]}</h6>
                </div>
                <div style="float: right; margin-right: 1vh;" class="George">
                    <div class="odenx basar">
                        <p>+$${element.money}</p>
                    </div>
                </div>
            </div>`
        } else {
            cim = `
            <div class="FinanceHistory-Item">
                <div class="George">
                    <h6><i class="fa-solid fa-arrow-trend-down"></i> ${Lang["Withdraw"]}</h6>
                </div>
                <div style="float: right; margin-right: 1vh;" class="George">
                    <div class="odenx error">
                        <p>-$${element.money}</p>
                    </div>
                </div>
            </div>`
        }
        $('.FinanceHistory').append(cim);
    }
}

LoadFuudback = function(array){
    $('#abluka').html("");
    let asd = '';
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        var photoOwner = './pimg/' + IdentifierConverter(element.Writer)
        asd = `
        <div class="ListOfVV">
            <img src="${photoOwner}">
            <h6>${element.WriterName}</h6>
            <h2>${Lang["Star"]}: ${element.StartPoint}</h2>
            <center>
                <text>${element.Text}</text>
            </center>
        </div>`
        $('#abluka').append(asd);
    }
}

LoadMotelBills = function(array){
    let cema = '';
    $('#Fatura-Tablo').html("");
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        if(element.Status == 0){
            cema = `
            <div class="FaturaID">
                <div class="BillingXX">
                    <h6>${index+1}</h6>
                </div>
                <div class="BillingXX">
                    <h6>${element.PayDate}</h6>
                </div>
                <div class="BillingXX">
                    <h6>${element.Payer}</h6>
                </div>
                <div class="BillingXX">
                    <h6>$${element.Amount}</h6>
                </div>
                <div class="BillingXX">
                    <div class="NewOdeme NewOdeme-Error">
                        <h4>${Lang["Unpaid"]}</h4>
                    </div>
                </div>
            </div>`
        } else {
            cema = `
            <div class="FaturaID">
                <div class="BillingXX">
                    <h6>${index+1}</h6>
                </div>
                <div class="BillingXX">
                    <h6>${element.PayDate}</h6>
                </div>
                <div class="BillingXX">
                    <h6>${element.Payer}</h6>
                </div>
                <div class="BillingXX">
                    <h6>$${element.Amount}</h6>
                </div>
                <div class="BillingXX">
                    <div class="NewOdeme NewOdeme-Suc">
                        <h4>${Lang["Paid"]}</h4>
                    </div>
                </div>
            </div>`
        }
        $('#Fatura-Tablo').append(cema);
    }
}

LoadCorridorColors = function(data){
    let cem = '';
    $('#corridorColors').html("");
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if (element.name == LastCorridor) {
            cem = `
            <div class="fotox SelecTV">
                <img src="rooms/${element.name}_corridor.png">
                <div class="overlay2">
                    <p>${element.name}</p>
                </div>
            </div>`
        } else {
            cem = `
            <div id="orospuogluadez" data-fex="${element.name}" class="fotox">
                <img src="rooms/${element.name}_corridor.png">
                <div class="overlay2">
                    <p>${element.name}</p>
                </div>
            </div>`
        }
        $('#corridorColors').append(cem);
    }
}

LoadGarageColors = function(){
    let cem = '';
    $('#garageThemes').html("");
    for (let index = 1; index < 14; index++) {
        if (index == LastGarage) {
            cem = `
            <div class="fotox SelecTV">
                <img src="rooms/${index}_garage.png">
                <div class="overlay2">
                    <p>${Lang["Garage"]} ${index}</p>
                </div>
            </div>`
        } else {
            cem = `
            <div id="necmettinErbakan" data-fex="${index}" class="fotox">
                <img src="rooms/${index}_garage.png">
                <div class="overlay2">
                    <p>${Lang["Garage"]} ${index}</p>
                </div>
            </div>`
        }
        $('#garageThemes').append(cem);
    }
}

$(document).on('click', '#orospuogluadez', function() {
    var siblings = $(this).siblings();
    $(this).removeClass('SelectTV');
    siblings.removeClass('SelectTV');
    $(this).addClass('SelectTV');
    SecilenRenk = $(this).attr("data-fex")
    $.post('http://0r_motels/UpdateMotelCorridorColor', JSON.stringify({
        color : SecilenRenk,
        mcode: SecilenMotelMCode,
        default: LastCorridor
    }))
});

$(document).on('click', '#necmettinErbakan', function() {
    var siblings = $(this).siblings();
    $(this).removeClass('SelectTV');
    siblings.removeClass('SelectTV');
    $(this).addClass('SelectTV');
    SecilenRenk = $(this).attr("data-fex")
    $.post('http://0r_motels/UpdateMotelGarageColor', JSON.stringify({
        color : SecilenRenk,
        mcode: SecilenMotelMCode,
    }))
});

LoadMotelOdalar = function(array){
    let axx = '';
    $('.allroomstab').html("")
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        if (element.Owner !== Lang["NoOwner"]){
            axx = `<div class="rooms-item">
            <svg class="roomparx" xmlns="http://www.w3.org/2000/svg" width="236" height="178" viewBox="0 0 236 178" fill="none">
                <rect x="1.82737" y="1.82737" width="232.185" height="174.489" rx="8.20844" fill="#D9D9D9" fill-opacity="0.04" stroke="#434343" stroke-width="2.34527"/>
            </svg>
            <div class="had">
                <h6 class="hadh1">${Lang["Room"]} ${index+1}</h6>
            </div>
            <div class="icerika">
                <div class="stateroom fulx">
                    <h6 class="state-text">${Lang["Full"]}</h6>
                </div>
                <button id="editRoom" data="${index+1}"  dogrumu="dogru" class="editRoom"><svg class="savg" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                    <path d="M14.4965 3.81132L11.3265 0.642126C11.2212 0.536714 11.096 0.453095 10.9583 0.396045C10.8206 0.338995 10.673 0.309631 10.524 0.309631C10.3749 0.309631 10.2273 0.338995 10.0896 0.396045C9.95189 0.453095 9.82677 0.536714 9.72138 0.642126L0.974884 9.38862C0.86904 9.49363 0.785125 9.61862 0.728015 9.75634C0.670906 9.89406 0.641741 10.0418 0.642218 10.1909V13.3608C0.642218 13.6618 0.761787 13.9504 0.974621 14.1632C1.18745 14.3761 1.47612 14.4957 1.77711 14.4957H13.6935C13.844 14.4957 13.9883 14.4359 14.0948 14.3295C14.2012 14.223 14.261 14.0787 14.261 13.9282C14.261 13.7777 14.2012 13.6334 14.0948 13.527C13.9883 13.4205 13.844 13.3608 13.6935 13.3608H6.55219L14.4965 5.41649C14.6019 5.3111 14.6855 5.18598 14.7425 5.04827C14.7996 4.91056 14.8289 4.76296 14.8289 4.61391C14.8289 4.46485 14.7996 4.31725 14.7425 4.17954C14.6855 4.04183 14.6019 3.91671 14.4965 3.81132ZM11.9912 6.3166L8.82198 3.1467L10.5243 1.44436L13.6935 4.61426L11.9912 6.3166Z" fill="#A0A0A0"/>
                  </svg> ${Lang["EditRoomString"]}</button>
            </div>
        </div>`
        } else {
            axx = `
            <div class="rooms-item">
                <svg class="roomparx" xmlns="http://www.w3.org/2000/svg" width="236" height="178" viewBox="0 0 236 178" fill="none">
                    <rect x="1.82737" y="1.82737" width="232.185" height="174.489" rx="8.20844" fill="#D9D9D9" fill-opacity="0.04" stroke="#434343" stroke-width="2.34527"/>
                </svg>
                <div class="had">
                    <h6 class="hadh1">${Lang["Room"]} ${index+1}</h6>
                </div>
                <div class="icerika">
                    <div class="stateroom emptyy">
                        <h6 class="state-text">${Lang["Empty"]}</h6>
                    </div>
                    <button id="editRoom" data="${index+1}" dogrumu="dogru" class="editRoom"><svg class="savg" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                        <path d="M14.4965 3.81132L11.3265 0.642126C11.2212 0.536714 11.096 0.453095 10.9583 0.396045C10.8206 0.338995 10.673 0.309631 10.524 0.309631C10.3749 0.309631 10.2273 0.338995 10.0896 0.396045C9.95189 0.453095 9.82677 0.536714 9.72138 0.642126L0.974884 9.38862C0.86904 9.49363 0.785125 9.61862 0.728015 9.75634C0.670906 9.89406 0.641741 10.0418 0.642218 10.1909V13.3608C0.642218 13.6618 0.761787 13.9504 0.974621 14.1632C1.18745 14.3761 1.47612 14.4957 1.77711 14.4957H13.6935C13.844 14.4957 13.9883 14.4359 14.0948 14.3295C14.2012 14.223 14.261 14.0787 14.261 13.9282C14.261 13.7777 14.2012 13.6334 14.0948 13.527C13.9883 13.4205 13.844 13.3608 13.6935 13.3608H6.55219L14.4965 5.41649C14.6019 5.3111 14.6855 5.18598 14.7425 5.04827C14.7996 4.91056 14.8289 4.76296 14.8289 4.61391C14.8289 4.46485 14.7996 4.31725 14.7425 4.17954C14.6855 4.04183 14.6019 3.91671 14.4965 3.81132ZM11.9912 6.3166L8.82198 3.1467L10.5243 1.44436L13.6935 4.61426L11.9912 6.3166Z" fill="#A0A0A0"/>
                        </svg> ${Lang["EditRoomString"]}</button>
                </div>
            </div>`
        }
        $('.allroomstab').append(axx)
    }
}

LoadRentedList = function(array){
    let htam = '';
    array.reverse()
    $('#renteler').html("");
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        var photoOwner = './pimg/' + IdentifierConverter(element.Cid)
        htam = `
        <div id="OpenDetailedRentBill" room="${element.Room}" phone="${element.Phone}" name="${element.PlayerName}" photo="${photoOwner}" typ="${element.RoomTyp}" date="${element.Date}" para="${element.Price}" class="listv-item">
            <img src="${photoOwner}" class="mulkiyet">
            <h5>${element.PlayerName}</h5>
            <p>${element.RoomTyp}</p>
            <div class="cenan">
                <span class="iconx"><svg class="mem1" xmlns="http://www.w3.org/2000/svg" width="12" height="15" viewBox="0 0 12 15" fill="none">
                    <path d="M11.8405 3.97773L8.02227 0.159546C7.97158 0.108909 7.91141 0.0687556 7.84519 0.0413803C7.77898 0.014005 7.70801 -5.61741e-05 7.63636 1.68654e-07H1.09091C0.801582 1.68654e-07 0.524105 0.114935 0.31952 0.31952C0.114935 0.524105 0 0.801582 0 1.09091V13.0909C0 13.3802 0.114935 13.6577 0.31952 13.8623C0.524105 14.0669 0.801582 14.1818 1.09091 14.1818H10.9091C11.1984 14.1818 11.4759 14.0669 11.6805 13.8623C11.8851 13.6577 12 13.3802 12 13.0909V4.36364C12.0001 4.29199 11.986 4.22102 11.9586 4.15481C11.9312 4.08859 11.8911 4.02842 11.8405 3.97773ZM7.63636 4.36364V1.36364L10.6364 4.36364H7.63636Z" fill="#676767"/>
                </svg></span>
            </div>
        </div>`
        $('#renteler').append(htam);
    }
};

LoadFaadbacks = function(array){
    let ceam = '';
    $('#faadbacks').html("");
    for (let index = 0; index < array.length; index++) {
        const element = array[index];
        var photoOwner = './pimg/' + IdentifierConverter(element.Writer)
        ceam = `
        <div class="listv-itemm">
            <img src="${photoOwner}" class="mulkiyet">
            <h5>${element.WriterName}</h5>
            <p>${element.Type}</p>
            <div id="feedbackDelete" xaas="${index+1}" style="top: 1.4vh; color: #fff;" class="cenan">
                <i class="fa-duotone fa-trash"></i>
            </div>
            <div class="belmaIncke"></div>
            <h6>${element.Text}</h6>
        </div>`
        $('#faadbacks').append(ceam);
    }
}

$(document).on('click', '#feedbackDelete', function(){
    $.post('http://0r_motels/DeleteFeedback', JSON.stringify({
        mcode: SecilenMotelMCode,
        id: $(this).attr("xaas")
    }))
});

$(document).on('click', '#OpenDetailedRentBill', function(){
    $('#overlayBey').fadeIn(350);
    $('.bilkibox').fadeIn(350);
    $('#haski').html($(this).attr("name"));
    $('#haski7').html($(this).attr("phone"));
    $('#haski6').attr("src", $(this).attr("photo"));
    $('#haski2').html($(this).attr("date"));
    $('#haski3').html($(this).attr("para"));
    $('#haski4').html($(this).attr("typ"));
    $('#haski5').html($(this).attr("room"));
});

$(document).on('click', '#necmettinErbakan2', function(){
    $('#overlayBey').fadeOut(350);
    $('.bilkibox').fadeOut(350);
});

LoadCircles = function(data){
    // var billCount = data.billgs.length;
    var photoOwner = './pimg/' + IdentifierConverter(data.owner)
    var yeniDashOffset = hesaplaDashOffset(data.revenue, maxGelir, 32);
    var yeniDashOffset2 = hesaplaDashOffset(data.fullRoomSayi, data.odaSayi, 32);
    var yeniDashOffset3 = hesaplaDashOffset(data.bills.length, 300, 32);
    $("#gelirb").html("$"+data.revenue);
    $("#gelirbv").html(data.fullRoomSayi);
    $("#yumurcak").attr("src", photoOwner);
    $('#invoicesCount').html(data.bills.length)
    $("#vgelir").css("stroke-dashoffset", yeniDashOffset + "px");  
    $("#keperpekmez").css("stroke-dashoffset", yeniDashOffset3 + "px");  
    $("#rentedCount").css("stroke-dashoffset", yeniDashOffset2 + "px");
}

function hesaplaDashOffset(gercekDeger, maxDeger, maxDashOffset) {
    var tersOran = 1 - (gercekDeger / maxDeger);
    var pikselDegeri = tersOran * maxDashOffset;
    var yolUzunlugu = 564.5731811523438
    return pikselDegeri + yolUzunlugu;
}

$(document).on('click', '#signBaba', function(){
    $('#BossMenuContainer').fadeOut(350);
    $.post('http://0r_motels/CloseUI', JSON.stringify({}))
});

$(document).on('click', '.resetOwnerButton', function(){
    $.post('http://0r_motels/KickAllRooms', JSON.stringify({
        mcode: SecilenMotelMCode
    }))
});

function hangiAralikta(sayi) {
    if (sayi < 1 || sayi > 1000) {
      return "Lütfen 1 ile 1000 arasında bir sayı girin.";
    }
  
    const aralikNo = Math.ceil(sayi / 12);
  
    const aralikBaslangic = (aralikNo - 1) * 12 + 1;
    const aralikBitis = aralikNo * 12;

    a1 = aralikBaslangic
    a2 = aralikBitis
}

LoadColors = function(data) {
    let cem = '';
    $('.Rog').html("");
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if (element.name == LatestTheme) {
            cem = `
            <div class="SelectT Rog-Item">
                <img src="rooms/${element.name}_double.png">
                <div class="hover-text">${element.name} - $${element.price}</div>
            </div>`
        } else {
            cem = `
            <div data-fex5="${element.price}" data-fex="${element.name}" class="Rog-Item">
                <img src="rooms/${element.name}_double.png">
                <div class="hover-text">${element.name} - $${element.price}</div>
            </div>`
        }
        $('.Rog').append(cem);
    }
    
    $('.Rog-Item').click(function() {
        var siblings = $(this).siblings();
        $(this).removeClass('SelectT');
        siblings.removeClass('SelectT');
        $(this).addClass('SelectT');
        SecilenRenk = $(this).attr("data-fex")
        SecilenRenkPrice = $(this).attr("data-fex5")
        $.post('http://0r_motels/LoadRoomTheme', JSON.stringify({
            color : SecilenRenk,
            price: SecilenRenkPrice,
            default: LatestTheme
        }))
    });
}

$(document).on('click', '#depomiyav', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    $('#witmiyav').removeClass('typeselected')
    $('#witmiyav').addClass('typenonselected')
    Tarz = 'deposit'
    $('#depomiyav').addClass('typeselected')
    $('#depomiyav').removeClass('typenonselected')
});

$(document).on('click', '#witmiyav', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    $('#depomiyav').removeClass('typeselected')
    $('#depomiyav').addClass('typenonselected')
    Tarz = 'withdraw'
    $('#witmiyav').addClass('typeselected')
    $('#witmiyav').removeClass('typenonselected')
});


LoadMotelFeedBacks = function(data){
    let cem = '';
    if (data !== undefined) {
        data.reverse()
        $('#feedbacklisx').html("");
        for (let index = 0; index < data.length; index++) {
            const element = data[index];
            let Identifier = element.Writer 
            Identifier = IdentifierConverter(Identifier)
            cem = `
            <div class="feedback-item">
                <div class="Haxor">
                    <img class="Haxorimg" src="pimg/${Identifier}">
                    <h4>${element.WriterName}</h4>
                    <h5>${element.Type}</h5>
                </div>    
                <div id="${element.StartPoint}-ceksin-${index}" class="starTv"></div>
                <p>${element.Text}</p>
                <span class="dateTarih">${element.Date}</span>
            </div>`
            $('#feedbacklisx').append(cem);
            LoadMotelFeedBacksStars(element.StartPoint, index)
        }
    }
}

LoadMotelFeedBacksStars = function(starLORD, index1){
    let cax = '';
    $('#'+starLORD+'-ceksin-'+index1).html("");
    for (let index = 0; index < starLORD; index++) {
        cax = `<h5><i class="fa-solid fa-star"></i></h5>`
        $('#'+starLORD+'-ceksin-'+index1).append(cax);
    }
}


$(document).on('click', '#GiveKey', function(){
    $('.PlayerMotelRoomList').fadeOut(300);
    $.post('http://0r_motels/GiveMotelCardKey', JSON.stringify({
        room: $(this).attr("room"),
        mcode: $(this).attr("mcode")
    }))
});

$(document).on('click', '#RemoveKey', function(){
    $.post('http://0r_motels/RemoveKeyByCid', JSON.stringify({
        mcode: $(this).attr("mCode"),
        rcode: $(this).attr("rCode"),
        cid: $(this).attr("cid"),
        name: $(this).attr("name")
    }))
});

$(document).on('click', '#TamGaz', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    KalanGun = KalanGun + 1
    EklenenGun = EklenenGun + 1
    $('#kalanGun').html(KalanGun);

    $('#EklenenGunV').html("(+" + EklenenGun + " DAY)");

    OdaFiat = OdaOrjinalFiyat*EklenenGun;

    $('#odeyecek').html(Math.round(OdaFiat));
    updateButtonStatus();
});

LoadPlayerKeys = function(data){
    let macit = '';
    $('#playeranahtarlar').html("")
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if(element.owner){
            macit = `
            <div id="LoadKeyRoom" mcode="${element.mcode}" rcode="${element.rcode}" roomid="${element.room}" class="roomb">
                <h3>${element.motelname}</h3>
                <h5>${Lang["Room"]} ${element.room} <i class="fa-solid fa-crown"></i></h5>
            </div>`
        } else {
            macit = `
            <div class="roomb">
                <h3>${element.motelname}</h3>
                <h5>${Lang["Room"]} ${element.room}</h5>
            </div>`
        }
        $('#playeranahtarlar').append(macit);
    }
};

$(document).on('click', '#BackKeyList', function(){
    $('#player-secili-anahtar').hide();
    $('#playeranahtarlar').fadeIn(300);
});

$(document).on('click', '#LoadKeyRoom', function(){ 
   $.post('http://0r_motels/LoadSelectedKeyRoom', JSON.stringify({
        mcode: $(this).attr("mcode"),
        rcode:  $(this).attr("rcode"),
        roomid: $(this).attr("roomid")
   }))
});

LoadPlayerBills = function(){
    let fam = '';
    $('.listeleFaturalar').html("");
    Bills.reverse();
    for (let index = 0; index < Bills.length; index++) {
        const element = Bills[index];
        if(element.Status === 1){
            fam = `
            <div class="fatura">
                <div class="faturaNo">
                    <h4>${index+1}</h4>
                </div>
                <div class="faturaDate">
                    <h4>${element.PayDate}</h4>
                </div>
                <div class="faturaRoom">
                    <h4>ROOM ${element.RoomId}</h4>
                </div>
                <div class="faturaOdendi">
                    <button class="odeme kasar">$ ${element.Amount}</button>
                </div>
            </div>`
        } else if (element.Status == 3){
            fam = `
            <div class="fatura">
                <div class="faturaNo">
                    <h4>${index+1}</h4>
                </div>
                <div class="faturaDate">
                    <h4>${element.PayDate}</h4>
                </div>
                <div class="faturaRoom">
                    <h4>ROOM ${element.RoomId}</h4>
                </div>
                <div class="faturaOdendi">
                    <button data-rent="${element.RentPrice}" data-room="${element.RoomId}" data-pay="${element.PayDate}" data-bill="${index+1}" data-amount="${element.Amount}" class="odeme kasarxV">${Lang["annulment"]}</button>
                </div>
            </div>`
        } else {
            fam = `
            <div class="fatura">
                <div class="faturaNo">
                    <h4>${index+1}</h4>
                </div>
                <div class="faturaDate">
                    <h4>${element.PayDate}</h4>
                </div>
                <div class="faturaRoom">
                    <h4>ROOM ${element.RoomId}</h4>
                </div>
                <div class="faturaOdendi">
                    <button id="RoomPayInvoiceScreen" data-rent="${element.RentPrice}" data-room="${element.RoomId}" data-pay="${element.PayDate}" data-bill="${index+1}" data-amount="${element.Amount}" class="odeme kasarx">$ ${element.Amount}</button>
                </div>
            </div>`
        }
        $('.listeleFaturalar').append(fam);
    }
};

var KalanDay = 0
var AddedDay = 1
var RoomRentPriceDay = 0
var OrjinalRent = 0
var AmountRes = 0
var BillIDV = 0
var RoomIDV = 0

$(document).on('click', '#Xapa5', function(){
    $('#overlayBey').fadeOut(350);
    $('.RoomUzatPage2').fadeOut(350);
    AddedDay = 1
    KalanDay = 0
    RoomRentPriceDay = 0
});

$(document).on('click', '#RoomPayInvoiceScreen', function(){
    $('#overlayBey').fadeIn(350);
    $('.RoomUzatPage2').fadeIn(350);
    $("#PayInvoice").css("cursor", "pointer")
    $('#dayremaining').html(Lang["dayremaining"]);
    $('#InvoiceDateString').html(Lang["InvoiceDateString"])

    var PayButton = $(this)
    var Amount = PayButton.attr("data-amount");
    var PayDate = PayButton.attr("data-pay");
    var RoomID = PayButton.attr("data-room");
    var BillID = PayButton.attr("data-bill");

    BillIDV = BillID
    RoomIDV = RoomID
    AmountRes = Amount
    RoomRentPriceDay = PayButton.attr("data-rent");

    if(Discount){
        OrjinalRent = calculateDiscountedPrice(RoomRentPriceDay, DiscountValue);
    }
    
    $('#EklenenGunVV').html("");
    $('#kalanGunV').html(KalanDay);
    $('#faturaDaV').html(PayDate);
    $('#odeyecekV').html(Amount)

    OdeyecekBaba = Math.round(Amount);
});

$(document).on('click', '#ArttirOdaV', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    KalanDay = KalanDay + 1
    AddedDay = AddedDay + 1
    $('#kalanGunV').html(KalanDay);

    $('#EklenenGunV').html("(+" + AddedDay + " DAY)");

    RoomRentPriceDay = parseInt(AmountRes) + parseInt(OrjinalRent*AddedDay);

    $('#odeyecekV').html(Math.round(RoomRentPriceDay));
    OdeyecekBaba = Math.round(RoomRentPriceDay)
});

$(document).on('click', '#EksiltOda', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    if(KalanDay > 0){
        KalanDay = KalanDay - 1
        AddedDay = AddedDay - 1
        $('#kalanGunV').html(KalanDay);
    };
    
    $('#EklenenGunV').html("(+" + AddedDay + " DAY)");

    RoomRentPriceDay = parseInt(AmountRes) + parseInt(OrjinalRent*AddedDay);

    $('#odeyecekV').html(Math.round(RoomRentPriceDay));
    OdeyecekBaba = Math.round(RoomRentPriceDay)
});

$(document).on('click', '#PayInvoice', function(){
    if(AddedDay == 0){
        AddedDay = 1
    }
    $.post('http://0r_motels/PayInvoice', JSON.stringify({
        amount: OdeyecekBaba,
        eklenecekler: AddedDay,
        billid: BillIDV,
        mcode: SecilenMotelMCode,
        roomid: RoomIDV
    }))
});

$(document).on('click', '#EksiGaz', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    if(OriginalKalan < KalanGun){
        KalanGun = KalanGun - 1
        EklenenGun = EklenenGun - 1
        $('#kalanGun').html(KalanGun);
    };
    
    $('#EklenenGunV').html("(+" + EklenenGun + " DAY)");

    OdaFiat = OdaOrjinalFiyat*EklenenGun;

    $('#odeyecek').html(Math.round(OdaFiat));
    updateButtonStatus();
});

function updateButtonStatus() {
    var $button = $("#PayUzat");
    if (EklenenGun === 0) {
        Uzatabilir = false
        $('#odeyecek').html(parseInt(OdaFiat))
        $button.addClass("karat").prop("disabled", true);
        $button.css("cursor", "default");
    } else {
        Uzatabilir = true
        $button.removeClass("karat").prop("disabled", false);
        $button.css("cursor", "pointer");
    }
}

$(document).on('click', '#PayUzat', function(){
    if(Uzatabilir == true){
        $.post('http://0r_motels/UzatOdaZaman', JSON.stringify({
            eklenecek: EklenenGun,
            price: OdaFiat,
            mcode: SecilenMotelMCode,
            roomid: EklenecekOda
        }))
    }
    EklenenGun = 0
    OdaFiat = 0
});

$(document).on('click', '#Xapa', function(){
    $('#overlayBey').fadeOut(350);
    $('.RoomUzatPage').fadeOut(350);
    EklenenGun = 0
    OdaFiat = 0
});

LoadPlayerRooms = function(){
    $('.roomlistbox').html("");
    let camcihalil = '';
    for (let index = 0; index < PlayerRooms.length; index++) {
        const element = PlayerRooms[index];
        let autoPayChecked = element.AutoPay === true ? "checked" : "";
        if(SystemMetadata){
            camcihalil = `
            <div class="newRoomBox">
            <img src="rooms/${element.Img}" class="bayresim">
                <h4>${Lang["Room"]} ${element.RoomId}</h4>
                <h5>${Lang["AMOUNTBEPAID"]} <font color="#ebebeb">$${element.AmountPay}</font></h5>
                <h5>${Lang["RentPrice"]} <font color="#ebebeb">$${element.RentPrice}</font></h5>
                <h5>${Lang["DUEDATE"]} <font color="#ebebeb">${element.PaymentDate}</font></h5>
                <div class="DoNotOcluk">
                    <h6>${Lang["AutoPay"]}</h6>
                    <label id="satt" class="switch">
                        <input data-id="${element.RoomId}" type="checkbox" ${autoPayChecked}>
                        <span class="slider round"></span>
                    </label>
                </div>
                <div class="ButonlarV">
                    <button id="KeyCopy" data-id="${element.RoomId}" rcode="${element.rCode}" roomid="${element.RoomId}" class="Anax"><i class="fa-light fa-key"></i></button>
                    <button id="WeightStash" selectedroom="${element.RoomId}" weight="${element.StashWeight}" data-id="${element.RoomId}" rcode="${element.rCode}" class="Anax"><i class="fa-light fa-weight-hanging"></i></button>
                    <button id="UzatKira" data-id="${element.RoomId}" class="Anax"><i class="fa-regular fa-timer"></i></button>
                    <button id="OdaIptal" data-id="${element.RoomId}" class="Anax"><i class="fa-solid fa-right-from-bracket"></i></button>
                </div>
            </div>`
        } else {
            camcihalil = `
            <div class="newRoomBox">
                <img src="rooms/${element.Img}" class="bayresim">
                <h4>${Lang["Room"]} ${element.RoomId}</h4>
                <h5>${Lang["AMOUNTBEPAID"]} <font color="#ebebeb">$${element.AmountPay}</font></h5>
                <h5>${Lang["RentPrice"]} <font color="#ebebeb">$${element.RentPrice}</font></h5>
                <h5>${Lang["DUEDATE"]} <font color="#ebebeb">${element.PaymentDate}</font></h5>
                <div class="DoNotOcluk">
                    <h6>${Lang["AutoPay"]}</h6>
                    <label id="satt" class="switch">
                        <input data-id="${element.RoomId}" type="checkbox" ${autoPayChecked}>
                        <span class="slider round"></span>
                    </label>
                </div>
                <div class="ButonlarV">
                    <button id="WeightStash" selectedroom="${element.RoomId}" weight="${element.StashWeight}" data-id="${element.RoomId}" rcode="${element.rCode}" class="Anax"><i class="fa-light fa-weight-hanging"></i></button>
                    <button id="UzatKira" data-id="${element.RoomId}" class="Anax"><i class="fa-regular fa-timer"></i></button>
                    <button id="OdaIptal" data-id="${element.RoomId}" class="Anax"><i class="fa-solid fa-right-from-bracket"></i></button>
                </div>
            </div>`
        }
        $('.roomlistbox').append(camcihalil);
    }
}

$(document).on('click', '#WeightStash', function(){
    StashWeight = $(this).attr("weight")
    SelectedRoom = $(this).attr("selectedroom")
    $('#RoomStashWeightBox').fadeIn(350);
    $('#roomstashvalue').html(Lang["roomstashvalue"])
    $('#overlayBey').fadeIn(350);
    $('#Annen').val($(this).attr("weight"));
});

$(document).ready(function() {
    $("#Annen").on("input", function() {
        var inputValue = $(this).val();
        OdeyecenKardes = parseInt(inputValue*StashPrice)
        $("#Odeyecek").text(OdeyecenKardes);
    });
});

$(document).on('click', '#Yukselt', function(){
    var WeightRoom = $('#Annen').val()
    $.post('http://0r_motels/UpdateStashWeight', JSON.stringify({
        mcode: SecilenMotelMCode,
        weightnew: WeightRoom,
        para: OdeyecenKardes,
        roomId: SelectedRoom,
        stashWeight: StashWeight,
    }))
});

$(document).on('click', '#CloseWeight', function(){
    $('#RoomStashWeightBox').fadeOut(350);
    $('#overlayBey').fadeOut(350);
    StashWeight = 0
});

ToggleKeyMenu = function(){
    let cea =  ``
    OpenedKeyMenu = !OpenedKeyMenu
    if(!OpenedKeyMenu){
        cea = `<div class="RoomPlus">
            <div id="ChangeRoomKey" roomid="${$(this).attr("roomid")}" mcode="${$(this).attr("mcode")}" rcode="${$(this).attr("rcode")}" class="Banmit">
                <h5>${Lang["ChangeKey"]} $${Price.change}</h5>
            </div>
            <div id="CopyRoomKey" roomid="${$(this).attr("roomid")}" mcode="${$(this).attr("mcode")}" rcode="${$(this).attr("rcode")}"class="Banmit">
                <h5>${Lang["CopyKey"]} $${Price.copy}</h5>
            </div>
        </div>`
        $('#roomb').html(cea);
    } else {
        $('#roomb').html("");
    }
};

CloseKeyMenu = function(){
    ToggleKeyMenu()
    $('#roomb').html("");
};

$(document).on('click', '#KeyCopy', ToggleKeyMenu)


$(document).on('click', '#ChangeRoomKey', function(){
    $.post('http://0r_motels/ChangeRoomKey', JSON.stringify({
        mcode: SecilenMotelMCode,
        room: $(this).attr("roomid"),
        rcode: $(this).attr("rcode")
    }))
    ToggleKeyMenu()
});

$(document).on('click', '#CopyRoomKey', function(){
    $.post('http://0r_motels/CopyRoomKey', JSON.stringify({
        mcode: SecilenMotelMCode,
        room: $(this).attr("roomid"),
        rcode: $(this).attr("rcode")
    }))
    ToggleKeyMenu()
});

$(document).on('change', '#satt input[type="checkbox"]', function() {
    $.post('http://0r_motels/ChangeRoomPaymenType', JSON.stringify({
        autopay: ($(this).prop('checked')),
        roomid: $(this).attr("data-id"),
        mcode: SecilenMotelMCode
    }))
});


$(document).on('click', '#UzatKira', function(){
    var RoomId = $(this).attr("data-id");
    $.post('http://0r_motels/RoomRentUzat', JSON.stringify({
        roomid: RoomId,
        mcode: SecilenMotelMCode,
    }))
});

$(document).on('click', '#OdaIptal', function(){
    var RoomId = $(this).attr("data-id");
    $.post('http://0r_motels/LeaveMotelRoom', JSON.stringify({
        roomid: RoomId,
        mcode: SecilenMotelMCode,
    }))
});

LoadStars = function(score) {
    let starsHtml = '';
    score = Math.round(score)
    for (let index = 0; index < 5; index++) {
        if (score >= index + 1) {
            starsHtml += `<h5><i class="fa-solid fa-star"></i></h5>`;
        } else {
            starsHtml += `<h5><i class="far fa-star"></i></h5>`;
        }
    }
    
    $('.Yildizlar').html(starsHtml);
}

LoadLeaderBord = function(){
    $('#moheller').html("");
    let ceam = '';
    
    allmotal.sort((a, b) => b.Cukur - a.Cukur);
    for (let index = 0; index < allmotal.length; index++) {
        const element = allmotal[index];        
        // En yüksek puanlı oteli kırmızı renkte göster
        const otelAdi = (index === 0) ? `${element.name} <i class="fa-sharp fa-regular fa-trophy-star"></i>` : element.name;
        
        ceam = `
        <div class="ListOfV">
            <h2>${otelAdi}</h2>
        </div>`
        $('#moheller').append(ceam);
    }
};

$(document).on('click', '#coridorayar', function(){
    if (!mak){
        mak = true
        $('#makbus').hide();
        $('#cin5').hide();
        $('#cin').fadeIn(350);
    } else {
        mak = false
        $('#cin').hide();
        $('#cin5').hide();
        $('#makbus').fadeIn(350)
    }
});

$(document).on('click', '#garageayar', function(){
    if (!amamak){
        amamak = true
        $('#makbus').hide();
        $('#cin').hide();
        $('#cin5').fadeIn(350);
    } else {
        amamak = false
        $('#cin5').hide();
        $('#cin').hide();
        $('#makbus').fadeIn(350)
    }
});

$(document).on('click', '#transferownership', function(){
    $.post('http://0r_motels/TranferMotelOwnership', JSON.stringify({
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '.recepbuton', function(){
    $('#myrooms').hide();
    $('#feedbacks').hide();
    if(Discount){
        $('.Coupon').show();
    }
    $('#recepsiyonmain').fadeIn(350);
});

function LoadFeedbackStars() {
    StartPoint = 0
    $('.YildizlarClub').html("");
    for (let index = 0; index < 5; index++) {
        let camx = $('<h5><i class="fa-solid fa-star"></i></h5>');
        camx.on('click', function() {
            if (!$(this).find('i').hasClass('active')) {
                $(this).find('i').addClass('active');
                StartPoint++;
            }
        });
        $('.YildizlarClub').append(camx);
    }
}

$(document).on('click', '#faadback', function(){
    if ((StartPoint >= 1) || (SelectedFeedbackRoom !== null)){
        $.post('http://0r_motels/CreateFeedback', JSON.stringify({
            feedbackstars: StartPoint,
            mcode: SecilenMotelMCode,
            roomtype: SelectedRoomType,
            feedbackroom: SelectedFeedbackRoom,
            text: $('#feedbek').val()
        }))
    }
});

LoadFeedBackRooms = function(){
    let asad = '';
    $('.CreateFeedBackRoomList').html("");
    for (let index = 0; index < PlayerRooms.length; index++) {
        const element = PlayerRooms[index];
        asad = 
        `<div id="SecRoda" txp="${element.InteriorType}" class="CreateFeedBackRoomList-Item">
            <h5>${Lang["Room"]} ${element.RoomId}</h5>
            <h6>${element.InteriorType}</h6>
        </div>`
        $('.CreateFeedBackRoomList').append(asad);
    }
};

$(document).on('click', '#SecRoda', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    if(SelectedFeedbackRoom !== null){
        SelectedFeedbackRoom = $(this).removeClass('SelectRoom')
    }

    SelectedFeedbackRoom = $(this)
    SelectedRoomType = SelectedFeedbackRoom.attr("txp")
    SelectedFeedbackRoom.addClass('SelectRoom')
});

$(document).on('click', '.feedbackV', function(){
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    $('#myrooms').hide();
    $('#recepsiyonmain').hide();
    $('.CreateFeedBackContainer').hide();
    LoadFeedBackRooms()
    LoadFeedbackStars()
    $('.OlusturmaKisim').show();
    $('.Coupon').hide();
    if(PlayerOwnerRoom == false){
        $('.FeedBackOlustur').hide();
    } else {
        $('.FeedBackOlustur').show();
    }
    $('#feedbacks').fadeIn(350);
});

$(document).on('click', '.myRooms5', function(){
    $('#recepsiyonmain').hide();
    $('.Coupon').hide();
    $('#feedbacks').hide();
    LoadPlayerRooms();
    LoadPlayerBills();
    $('#myrooms').fadeIn(350);
});

$(document).on('click', '.FeedBackOlustur', function(){
    $('.OlusturmaKisim').hide();
    $('.CreateFeedBackContainer').fadeIn(350);
});

$(document).on('click', '#BuyMotelRoom', function(){
    if(SeciliOda !== null){
        $.post('http://0r_motels/RentMotelRoom', JSON.stringify({
            roomid: KiralanacakOda,
            mcode: SecilenMotelMCode,
            price: KiralanacakFiyat,
            day: KiralanacakGun
        }))
    }
});

document.onkeyup = function(data){
    if (data.which == 27){
        if(OdaSecmeMenusu == false){
            OpenRoomCreateScreen = false
            EklenenGun = 0
            $('#MotelAdminMenu').fadeOut(350);
            $('#Moteller').html("");
            $('#overlayBey').fadeOut(350);
            $('.CreateMotelScreen').fadeOut(500);
            $('.resimSlaytCizgileri').html("");
            $('.roomeditpage').fadeOut(350);
            $('#RoomStashWeightBox').fadeOut(350);
            $('#BossMenuContainer').fadeOut(350);
            $('.NewEditMenu').fadeOut(350);
            elevatorMenuIn = false
            $('#ElevatorMenu').fadeOut(200);
            $('.NewEditMenu').fadeOut(350);
            $('#myrooms').hide();
            $('#feedbacks').hide();
            $('#ReceptionContainer').fadeOut(350);
            $('.ChooseColorRoom').fadeOut(350);
            $('#NewMotelScreen').fadeOut(350);
            $('.GarageContainer').fadeOut(350);
            $('#player-secili-anahtar').hide();
            $('#playeranahtarlar').fadeIn(300);
            CloseKeyMenu()
            $('.ChoseOwnerScreen').fadeOut(350);
            $('#overlayBey').fadeOut(250);
            $('.RoomUzatPage').fadeOut(250);
            $('.PlayerMotelRoomList').fadeOut(350);
            $.post('http://0r_motels/CloseUI', JSON.stringify({}))
        } else {
            OdaSecmeMenusu = false
            parseInt($('#gunDeger').val(1));
            $('#BuyRoomScreen').hide();
            $('#menurece').show();
            $('.GunDay').hide();
            $('.indirimliOda').hide();
            $('.odalist').html("");
            if(Discount){
                $('.Coupon').show();
            } 
            $('#recepsiyonmain').fadeIn(350);
        }
    }
}

CloseAll = function(){
    if(OdaSecmeMenusu == false){
        OpenRoomCreateScreen = false
        EklenenGun = 0
        $('#MotelAdminMenu').fadeOut(350);
        $('#Moteller').html("");
        $('#overlayBey').fadeOut(350);
        $('.CreateMotelScreen').fadeOut(500);
        $('.resimSlaytCizgileri').html("");
        $('.roomeditpage').fadeOut(350);
        $('.NewEditMenu').fadeOut(350);
        $('#myrooms').hide();
        $('#feedbacks').hide();
        $('#ReceptionContainer').fadeOut(350);
        $('#player-secili-anahtar').hide();
        $('#playeranahtarlar').fadeIn(300);
        CloseKeyMenu()
        $('.ChoseOwnerScreen').fadeOut(350);
        $('#overlayBey').fadeOut(250);
        $('.RoomUzatPage').fadeOut(250);
        $('.PlayerMotelRoomList').fadeOut(350);
        $.post('http://0r_motels/CloseUI', JSON.stringify({}))
    } else {
        OdaSecmeMenusu = false
        parseInt($('#gunDeger').val(1));
        $('#BuyRoomScreen').hide();
        $('#menurece').show();
        $('.GunDay').hide();
        $('.indirimliOda').hide();
        $('.odalist').html("");
        if(Discount){
            $('.Coupon').show();
        } 
        $('#recepsiyonmain').fadeIn(350);
    }
}

LoadOdalar = function(data, dolu, bos, description, room){
    let camci = '';
    OdaSecmeMenusu = true
    $('.odalistx').html("");
    $('.filledroomsmiktar').html(dolu);
    $('#seciliOdaNo').html(Lang["NoRoomSelected"])
    $('.odaTypeString').html(room)
    $('.filledroomsmiktar2').html(bos);
    if(!Discount){
        $('.indirimliOda').hide();
    }
    $('#RoomDescriptionV2').html(description)
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if(element.Owner === Lang["NoOwner"]){
            camci = `
            <div id="SecOda" price="${element.RentPrice}" data-id="${element.OdaNo}" class="roompart empty">
                <p>${element.OdaNo}</p>
            </div>`
        } else {
            camci = `
            <div class="roompart full">
                <p>${element.OdaNo}</p>
            </div>`
        }
        $('.odalistx').append(camci)
    }
}

function calculateDiscountedPrice(originalPrice, discountPercentage) {
    if (discountPercentage < 0 || discountPercentage > 100) {
        throw new Error("Invalid discount percentage");
    }

    const discountAmount = (originalPrice * discountPercentage) / 100;
    const discountedPrice = originalPrice - discountAmount;

    return discountedPrice;
}

$(document).on('click', '.motelAdmin', function(){
    $('#ReceptionContainer').fadeOut(350);
    $.post('http://0r_motels/OpenBossMenu', JSON.stringify({
        id: OpenedMotel
    }))
});

$(document).on('click', '#GunArttir', function() {
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    var GunDeger = parseInt($('#gunDeger').val());
    if (!isNaN(GunDeger)) {
        if (GunDeger < 9999) { // Maksimum sınırlama
            GunDeger = GunDeger + 1;
            $('#gunDeger').val(GunDeger);
            
            if (Discount) {
                $('#MotelOdaPrice').html(`<del>${OdaOrjinalFiyat * GunDeger}</del>`);
                $('#indirimlipara').html(Indirimli * GunDeger);
                KiralanacakFiyat = Indirimli * GunDeger;
            } else {
                $('#MotelOdaPrice').html(OdaOrjinalFiyat * GunDeger);
                KiralanacakFiyat = OdaOrjinalFiyat * GunDeger;
            }
        }
    }
    KiralanacakGun = GunDeger
});


$(document).on('click', '#GunAzalt', function() {
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    var GunDeger = parseInt($('#gunDeger').val());
    if (!isNaN(GunDeger) && GunDeger > 1) { // Minimum değer kontrolü
        GunDeger = GunDeger - 1;
        $('#gunDeger').val(GunDeger);
    }
    if(Discount){
        $('#MotelOdaPrice').html(`<del>${OdaOrjinalFiyat*GunDeger}</del>`);
        $('#indirimlipara').html(Indirimli*GunDeger)
        KiralanacakFiyat = Indirimli*GunDeger
    } else {
        $('#MotelOdaPrice').html(OdaOrjinalFiyat*GunDeger)
        KiralanacakFiyat = OdaOrjinalFiyat*GunDeger
    }
    KiralanacakGun = GunDeger
});

$(document).ready(function() {
    $('#gunDeger').on('input', function() {
        var GunDeger = parseInt($(this).val());
        
        if (isNaN(GunDeger) || GunDeger < 1) { // Sayı değil veya 0'dan küçükse
            $(this).val(0); // 0 olarak ayarla
        } else if (GunDeger > 9999) { // 9999'dan büyükse
            $(this).val(9999); // 9999 olarak ayarla
        }
        
        if (Discount) {
            $('#MotelOdaPrice').html(`<del>${OdaOrjinalFiyat * GunDeger}</del>`);
            $('#indirimlipara').html(Indirimli * GunDeger);
            KiralanacakFiyat = Indirimli * GunDeger;
        } else {
            $('#MotelOdaPrice').html(OdaOrjinalFiyat * GunDeger);
            KiralanacakFiyat = OdaOrjinalFiyat * GunDeger;
        }    
        KiralanacakGun = GunDeger
    });
});


ApplyRandomDay = function(day) {
    $.post('http://0r_motels/Cal', JSON.stringify({}));
    
    if (day >= 1000) {
        $('#gunDeger').val('∞'); // Sonsuzluk işareti
    } else {
        $('#gunDeger').val(day);
    }
    
    if (Discount) {
        $('#MotelOdaPrice').html(`<del>${OdaOrjinalFiyat * day}</del>`);
        $('#indirimlipara').html(Indirimli * day);
        KiralanacakFiyat = Indirimli * day;
    } else {
        $('#MotelOdaPrice').html(OdaOrjinalFiyat * day);
        KiralanacakFiyat = OdaOrjinalFiyat * day;
    }
    KiralanacakGun = day
};


$(document).on('click', '#LifeTime', function(){
    ApplyRandomDay(1000)
});

$(document).on('click', '#1Month', function(){
    ApplyRandomDay(30)
});

$(document).on('click', '#3Month', function(){
    ApplyRandomDay(90)
});

$(document).on('click', '#6Month', function(){
    ApplyRandomDay(180)
});

$(document).ready(function() {
    $('#gunDeger').on('input', function() {
        var GunDeger = parseInt($(this).val());

        // Tüm önceki sınıfları kaldır
        $('#1Month, #3Month, #6Month', '#LifeTime').removeClass('LifeTimeSelected');

        if (GunDeger === 30) {
            $('#1Month').addClass('LifeTimeSelected');
        } else if (GunDeger === 90) {
            $('#3Month').addClass('LifeTimeSelected');
        } else if (GunDeger === 180) {
            $('#6Month').addClass('LifeTimeSelected');
        }
        
        // Diğer şartlar için gereken işlemleri burada yapabilirsiniz
        ApplyRandomDay(GunDeger)
    });
});



$(document).on('click', '#SecOda', function(){
    var clickedKutu = $(this);
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    if (SeciliOda !== null){
        $("[data-id='" + SeciliOda + "']").removeClass("full");
    }
    
    clickedKutu.addClass("full");
    SeciliOda = clickedKutu.data("id");
    if(Discount){
        $('.indirimliOda').fadeIn(350);
        OdaOrjinalFiyat = Math.round(clickedKutu.attr("price"))
        Indirimli = Math.round(calculateDiscountedPrice(Math.round(clickedKutu.attr("price")), DiscountValue))
        $('#MotelOdaPrice').html(`<del>${Math.round(clickedKutu.attr("price"))}</del>`);
        $('.GunDay').fadeIn(350);
        $('#indirimlipara').html(Math.round(calculateDiscountedPrice(Math.round(clickedKutu.attr("price")), DiscountValue)))
        KiralanacakFiyat = Math.round(calculateDiscountedPrice(Math.round(clickedKutu.attr("price")), DiscountValue))
    } else {
        $('.indirimliOda').hide();
        $('.GunDay').fadeIn(350);
        OdaOrjinalFiyat = Math.round(clickedKutu.attr("price"))
        KiralanacakFiyat = Math.round(clickedKutu.attr("price"))
        $('#MotelOdaPrice').html(Math.round(clickedKutu.attr("price")))
    }
    $('#seciliOdaNo').html(Lang["Room"] + ' ' + clickedKutu.attr("data-id"));
    KiralanacakOda = clickedKutu.attr("data-id")
});

LoadFirstPage = function(){
    var SliderData = RoomTypes[SliderPage];
    if(SliderData.RoomLabel !== undefined){
        $('.resimSlaytCizgileri').html("");
        $('#RoomTitle').html(SliderData.RoomLabel);
        $('#tanitimText').html(SliderData.DetailDescription);
        SeciliMenu = $('.recepbuton')
        $('#RoomSliderImage').attr('src', 'rooms/'+SliderData.Image);
        for (let index = 0; index < MaxType; index++) {
            let cam = `<div id="${index}oda" idx="${index}" class="sliderx"></div>`
            $('.resimSlaytCizgileri').append(cam);
        }
        seci = $('#'+SliderPage+'oda')
        seci.addClass('selectedcizgi');
        var ClickRoom = $('#ButonKisim')
        ClickRoom.html("");
        if(RoomTypes[SliderPage].OdaSayi == undefined){
            Macit = `
            <div id="kafur" class="rentARoom">
                <p>${Lang["RoomsAreFull"]}</p>
            </div>`
        } else {
            Macit = `
            <div id="BakOdalara" data-id="${RoomTypes[SliderPage].RoomLabel}" class="rentARoom">
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="10" viewBox="0 0 15 10" fill="none">
                <path d="M14.652 4.73274C14.631 4.68534 14.1229 3.55802 12.9931 2.42829C11.4878 0.922989 9.58657 0.127441 7.49391 0.127441C5.40125 0.127441 3.49997 0.922989 1.99467 2.42829C0.864946 3.55802 0.35438 4.68714 0.335781 4.73274C0.308491 4.79412 0.29439 4.86055 0.29439 4.92772C0.29439 4.9949 0.308491 5.06133 0.335781 5.12271C0.35678 5.17011 0.864946 6.29684 1.99467 7.42656C3.49997 8.93126 5.40125 9.72681 7.49391 9.72681C9.58657 9.72681 11.4878 8.93126 12.9931 7.42656C14.1229 6.29684 14.631 5.17011 14.652 5.12271C14.6793 5.06133 14.6934 4.9949 14.6934 4.92772C14.6934 4.86055 14.6793 4.79412 14.652 4.73274ZM7.49391 7.32697C7.01927 7.32697 6.55528 7.18622 6.16063 6.92252C5.76598 6.65882 5.45838 6.28402 5.27675 5.84551C5.09511 5.40699 5.04758 4.92446 5.14018 4.45894C5.23278 3.99342 5.46134 3.5658 5.79697 3.23018C6.13259 2.89456 6.5602 2.66599 7.02572 2.5734C7.49125 2.4808 7.97378 2.52832 8.41229 2.70996C8.8508 2.8916 9.22561 3.19919 9.48931 3.59384C9.75301 3.9885 9.89375 4.45248 9.89375 4.92713C9.89375 5.5636 9.64091 6.17401 9.19086 6.62407C8.7408 7.07413 8.13039 7.32697 7.49391 7.32697Z" fill="#B6B6B6"/>
                </svg> ${Lang["ClickViewRooms"]}</p>
            </div>`
        };
        ClickRoom.html(Macit)
    } else {

    }
}

$(document).on('click', '#BakOdalara', function(){
    var RoomID = $(this).attr("data-id");
    $('#recepsiyonmain').hide();
    $('.Coupon').hide();
    $('#MotelOdaPrice').html(0);
    $('#menurece').hide();
    $.post('http://0r_motels/LoadSelectedRoomTypeRooms', JSON.stringify({
        room: RoomID,
        motelid: OpenedMotel
    }))
});

$(document).on('click', '#CloseWeight', function(){
    $('#')
});

$(document).on('click', '#BuyMotel', function(){
    $.post('http://0r_motels/BuyBusinessMotel', JSON.stringify({
        id: OpenedMotel
    }))
});

$(document).on('click', '#KaydirSag', function(){
    if (SliderPage + 1 < MaxType) {  // SliderPage 0'dan küçük olmalı
        seci.removeClass('selectedcizgi')
        SliderPage = SliderPage + 1;
        seci = $('#'+(SliderPage) + 'oda')
        seci.addClass('selectedcizgi')
        var SliderData = RoomTypes[SliderPage];
        $('#RoomTitle').html(SliderData.RoomLabel);
        $('#tanitimText').html(SliderData.DetailDescription);
        $('#RoomSliderImage').attr('src', 'rooms/' + SliderData.Image);
        let Macit = '';
        var ClickRoom = $('#ButonKisim')
        ClickRoom.html("");
        if(RoomTypes[SliderPage].OdaSayi === undefined){
            Macit = `
            <div class="rentARoom">
            <p>
                ${Lang["RoomsAreFull"]}</p>
            </div>`
        } else {
            Macit = `
            <div id="BakOdalara" data-id="${RoomTypes[SliderPage].RoomLabel}" class="rentARoom">
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="10" viewBox="0 0 15 10" fill="none">
                <path d="M14.652 4.73274C14.631 4.68534 14.1229 3.55802 12.9931 2.42829C11.4878 0.922989 9.58657 0.127441 7.49391 0.127441C5.40125 0.127441 3.49997 0.922989 1.99467 2.42829C0.864946 3.55802 0.35438 4.68714 0.335781 4.73274C0.308491 4.79412 0.29439 4.86055 0.29439 4.92772C0.29439 4.9949 0.308491 5.06133 0.335781 5.12271C0.35678 5.17011 0.864946 6.29684 1.99467 7.42656C3.49997 8.93126 5.40125 9.72681 7.49391 9.72681C9.58657 9.72681 11.4878 8.93126 12.9931 7.42656C14.1229 6.29684 14.631 5.17011 14.652 5.12271C14.6793 5.06133 14.6934 4.9949 14.6934 4.92772C14.6934 4.86055 14.6793 4.79412 14.652 4.73274ZM7.49391 7.32697C7.01927 7.32697 6.55528 7.18622 6.16063 6.92252C5.76598 6.65882 5.45838 6.28402 5.27675 5.84551C5.09511 5.40699 5.04758 4.92446 5.14018 4.45894C5.23278 3.99342 5.46134 3.5658 5.79697 3.23018C6.13259 2.89456 6.5602 2.66599 7.02572 2.5734C7.49125 2.4808 7.97378 2.52832 8.41229 2.70996C8.8508 2.8916 9.22561 3.19919 9.48931 3.59384C9.75301 3.9885 9.89375 4.45248 9.89375 4.92713C9.89375 5.5636 9.64091 6.17401 9.19086 6.62407C8.7408 7.07413 8.13039 7.32697 7.49391 7.32697Z" fill="#B6B6B6"/>
                </svg> ${Lang["ClickViewRooms"]}</p>
            </div>`
        }
        ClickRoom.html(Macit)
    }
});

$(document).on('click', '#KaydirSol', function(){
    if (SliderPage > 0) {  // SliderPage 0'dan büyük olmalı
        SliderPage = SliderPage - 1;
        seci.removeClass('selectedcizgi')
        seci = $('#'+(SliderPage) + 'oda')
        seci.addClass('selectedcizgi')
        var SliderData = RoomTypes[SliderPage];
        $('#RoomTitle').html(SliderData.RoomLabel);
        $('#tanitimText').html(SliderData.DetailDescription);
        $('#RoomSliderImage').attr('src', 'rooms/' + SliderData.Image);
        var ClickRoom = $('#ButonKisim')
        ClickRoom.html("");
        if(RoomTypes[SliderPage].OdaSayi === undefined){
            Macit = `
            <div class="rentARoom">
            <p>
               ${Lang["RoomsAreFull"]}</p>
            </div>`
        } else {
            Macit = `
            <div id="BakOdalara" data-id="${RoomTypes[SliderPage].RoomLabel}" class="rentARoom">
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="10" viewBox="0 0 15 10" fill="none">
                <path d="M14.652 4.73274C14.631 4.68534 14.1229 3.55802 12.9931 2.42829C11.4878 0.922989 9.58657 0.127441 7.49391 0.127441C5.40125 0.127441 3.49997 0.922989 1.99467 2.42829C0.864946 3.55802 0.35438 4.68714 0.335781 4.73274C0.308491 4.79412 0.29439 4.86055 0.29439 4.92772C0.29439 4.9949 0.308491 5.06133 0.335781 5.12271C0.35678 5.17011 0.864946 6.29684 1.99467 7.42656C3.49997 8.93126 5.40125 9.72681 7.49391 9.72681C9.58657 9.72681 11.4878 8.93126 12.9931 7.42656C14.1229 6.29684 14.631 5.17011 14.652 5.12271C14.6793 5.06133 14.6934 4.9949 14.6934 4.92772C14.6934 4.86055 14.6793 4.79412 14.652 4.73274ZM7.49391 7.32697C7.01927 7.32697 6.55528 7.18622 6.16063 6.92252C5.76598 6.65882 5.45838 6.28402 5.27675 5.84551C5.09511 5.40699 5.04758 4.92446 5.14018 4.45894C5.23278 3.99342 5.46134 3.5658 5.79697 3.23018C6.13259 2.89456 6.5602 2.66599 7.02572 2.5734C7.49125 2.4808 7.97378 2.52832 8.41229 2.70996C8.8508 2.8916 9.22561 3.19919 9.48931 3.59384C9.75301 3.9885 9.89375 4.45248 9.89375 4.92713C9.89375 5.5636 9.64091 6.17401 9.19086 6.62407C8.7408 7.07413 8.13039 7.32697 7.49391 7.32697Z" fill="#B6B6B6"/>
                </svg> ${Lang["ClickViewRooms"]}</p>
            </div>`
        }
        ClickRoom.html(Macit)
    }
});


function formatNumberWithDots(number) {
    var formattedNumber = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return formattedNumber;
}

LoadSelectedMotelRoom = function(data){
    SecilenMotelRoomOwner = data.ownerName
    $('#roomallah').html(data.ownerName);
    $('#roomdate').html(data.PaymentDate);
    $('#odafo').val(data.RentPrice)
    if(data.Teleport){
        $('#textBaba').show()
        $('.odaListesi').show();
    } else {
        $('#textBaba').hide()
        $('.odaListesi').hide();
    }
};

LoadSelectedMotelRoomType = function(data, benim){
    let cam = '';
    $('.odaListesi').html("");
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if(element.RoomLabel === benim.InteriorType){
            cam =  `
            <div id="takili" data-id="${element.RoomLabel}" class="odalarCaylaar secilirex">
                <img class="banner" src="rooms/${element.Image}">
                <div class="overlay">
                    <p>${element.RoomLabel}</p>
                </div>
            </div>`
        } else {
            cam =  `
            <div id="takili" data-id="${element.RoomLabel}" class="odalarCaylaar">
                <img class="banner" src="rooms/${element.Image}">
                <div class="overlay">
                    <p>${element.RoomLabel}</p>
                </div>
            </div>`
        }
        $('.odaListesi').append(cam);
    }
}

LoadNotifys = function(data){
    let cem = '';
    data.reverse();
    $('.NotificationBox-List').html("");
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        cem = `
        <div class="NotificationBox-Item">
            <h5>${element.title}</h5>
            <div class="s4"></div>
            <h4>${element.description}</h4>
            <h6>${element.date}</h6>
        </div>`
        $('.NotificationBox-List').append(cem);
    }
};

LoadSelectedRoomBills = function(bills){
    let cax = '';
    // $('.billlist').html("");
    for (let index = 0; index < bills.length; index++) {
        const element = bills[index];
        if(element.Status == 1){
            cax = `
            <div class="fatura-item">
                <div class="orxa">
                    <h5><svg xmlns="http://www.w3.org/2000/svg" width="17" height="16" viewBox="0 0 17 16" fill="none">
                        <path d="M16.0683 10.8127V14.6796C16.0684 14.8072 16.0307 14.9319 15.9599 15.0379C15.889 15.144 15.7884 15.2267 15.6705 15.2755C15.5527 15.3243 15.423 15.3371 15.298 15.3122C15.1729 15.2873 15.058 15.2258 14.9679 15.1356L13.6741 13.841C12.0508 15.2355 10.2164 15.9686 8.33451 15.9686C4.88491 15.9686 2.80967 13.9328 2.72267 13.8466C2.60163 13.7259 2.53351 13.562 2.53328 13.3911C2.53305 13.2201 2.60074 13.0561 2.72146 12.9351C2.84218 12.814 3.00603 12.7459 3.17698 12.7457C3.34793 12.7455 3.51196 12.8131 3.633 12.9339C3.662 12.9621 5.44722 14.6796 8.33451 14.6796C10.2011 14.6796 11.7116 13.8055 12.7589 12.9266L11.101 11.2687C11.0107 11.1785 10.9493 11.0637 10.9243 10.9386C10.8994 10.8135 10.9122 10.6838 10.961 10.566C11.0098 10.4482 11.0925 10.3475 11.1986 10.2767C11.3047 10.2059 11.4294 10.1681 11.5569 10.1682H15.4238C15.5948 10.1682 15.7587 10.2361 15.8795 10.357C16.0004 10.4779 16.0683 10.6418 16.0683 10.8127ZM5.70743 5.90336C5.75628 5.78561 5.76912 5.65602 5.74431 5.53097C5.7195 5.40593 5.65817 5.29105 5.56806 5.20087L3.91013 3.54294C4.95742 2.66402 6.46792 1.78994 8.33451 1.78994C11.2307 1.78994 13.0175 3.51716 13.036 3.53649C13.1572 3.65721 13.3213 3.72486 13.4923 3.72456C13.6633 3.72426 13.8272 3.65603 13.948 3.53488C14.0687 3.41374 14.1363 3.2496 14.136 3.07858C14.1357 2.90755 14.0675 2.74366 13.9463 2.62294C13.8593 2.53674 11.7841 0.500977 8.33451 0.500977C6.45262 0.500977 4.61826 1.23408 2.99496 2.62858L1.70116 1.33397C1.61103 1.24374 1.49615 1.18227 1.37106 1.15736C1.24598 1.13245 1.11632 1.14522 0.99849 1.19404C0.880663 1.24286 0.779972 1.32554 0.709162 1.43162C0.638352 1.5377 0.600608 1.6624 0.600708 1.78994V5.65684C0.600708 5.82777 0.668609 5.9917 0.789473 6.11256C0.910337 6.23343 1.07426 6.30133 1.24519 6.30133H5.11209C5.23956 6.3013 5.36415 6.26348 5.47012 6.19264C5.57609 6.1218 5.65868 6.02113 5.70743 5.90336Z" fill="#A7A7A7"/>
                    </svg> Pay Bill</h5>
                </div>

                <div class="orxa">
                    <h5>${element.Payer}</h5>
                </div>

                <div style="float: right;" class="orxa">
                    <div class="odenx basar">
                        <p>+$${element.Amount}</p>
                    </div>
                </div>
            </div>`
        } else if (element.Status == 3) {
            cax = `
            <div class="fatura-item">
                <div class="orxa">
                    <h5><svg xmlns="http://www.w3.org/2000/svg" width="17" height="16" viewBox="0 0 17 16" fill="none">
                        <path d="M16.0683 10.8127V14.6796C16.0684 14.8072 16.0307 14.9319 15.9599 15.0379C15.889 15.144 15.7884 15.2267 15.6705 15.2755C15.5527 15.3243 15.423 15.3371 15.298 15.3122C15.1729 15.2873 15.058 15.2258 14.9679 15.1356L13.6741 13.841C12.0508 15.2355 10.2164 15.9686 8.33451 15.9686C4.88491 15.9686 2.80967 13.9328 2.72267 13.8466C2.60163 13.7259 2.53351 13.562 2.53328 13.3911C2.53305 13.2201 2.60074 13.0561 2.72146 12.9351C2.84218 12.814 3.00603 12.7459 3.17698 12.7457C3.34793 12.7455 3.51196 12.8131 3.633 12.9339C3.662 12.9621 5.44722 14.6796 8.33451 14.6796C10.2011 14.6796 11.7116 13.8055 12.7589 12.9266L11.101 11.2687C11.0107 11.1785 10.9493 11.0637 10.9243 10.9386C10.8994 10.8135 10.9122 10.6838 10.961 10.566C11.0098 10.4482 11.0925 10.3475 11.1986 10.2767C11.3047 10.2059 11.4294 10.1681 11.5569 10.1682H15.4238C15.5948 10.1682 15.7587 10.2361 15.8795 10.357C16.0004 10.4779 16.0683 10.6418 16.0683 10.8127ZM5.70743 5.90336C5.75628 5.78561 5.76912 5.65602 5.74431 5.53097C5.7195 5.40593 5.65817 5.29105 5.56806 5.20087L3.91013 3.54294C4.95742 2.66402 6.46792 1.78994 8.33451 1.78994C11.2307 1.78994 13.0175 3.51716 13.036 3.53649C13.1572 3.65721 13.3213 3.72486 13.4923 3.72456C13.6633 3.72426 13.8272 3.65603 13.948 3.53488C14.0687 3.41374 14.1363 3.2496 14.136 3.07858C14.1357 2.90755 14.0675 2.74366 13.9463 2.62294C13.8593 2.53674 11.7841 0.500977 8.33451 0.500977C6.45262 0.500977 4.61826 1.23408 2.99496 2.62858L1.70116 1.33397C1.61103 1.24374 1.49615 1.18227 1.37106 1.15736C1.24598 1.13245 1.11632 1.14522 0.99849 1.19404C0.880663 1.24286 0.779972 1.32554 0.709162 1.43162C0.638352 1.5377 0.600608 1.6624 0.600708 1.78994V5.65684C0.600708 5.82777 0.668609 5.9917 0.789473 6.11256C0.910337 6.23343 1.07426 6.30133 1.24519 6.30133H5.11209C5.23956 6.3013 5.36415 6.26348 5.47012 6.19264C5.57609 6.1218 5.65868 6.02113 5.70743 5.90336Z" fill="#A7A7A7"/>
                    </svg> Pay Bill</h5>
                </div>

                <div class="orxa">
                    <h5>${element.Payer}</h5>
                </div>

                <div style="float: right;" class="orxa">
                    <div class="odenx errorbes">
                        <p>-$${element.Amount}</p>
                    </div>
                </div>
            </div>`
        } else {
            cax = `
            <div class="fatura-item">
                <div class="orxa">
                    <h5><svg xmlns="http://www.w3.org/2000/svg" width="17" height="16" viewBox="0 0 17 16" fill="none">
                        <path d="M16.0683 10.8127V14.6796C16.0684 14.8072 16.0307 14.9319 15.9599 15.0379C15.889 15.144 15.7884 15.2267 15.6705 15.2755C15.5527 15.3243 15.423 15.3371 15.298 15.3122C15.1729 15.2873 15.058 15.2258 14.9679 15.1356L13.6741 13.841C12.0508 15.2355 10.2164 15.9686 8.33451 15.9686C4.88491 15.9686 2.80967 13.9328 2.72267 13.8466C2.60163 13.7259 2.53351 13.562 2.53328 13.3911C2.53305 13.2201 2.60074 13.0561 2.72146 12.9351C2.84218 12.814 3.00603 12.7459 3.17698 12.7457C3.34793 12.7455 3.51196 12.8131 3.633 12.9339C3.662 12.9621 5.44722 14.6796 8.33451 14.6796C10.2011 14.6796 11.7116 13.8055 12.7589 12.9266L11.101 11.2687C11.0107 11.1785 10.9493 11.0637 10.9243 10.9386C10.8994 10.8135 10.9122 10.6838 10.961 10.566C11.0098 10.4482 11.0925 10.3475 11.1986 10.2767C11.3047 10.2059 11.4294 10.1681 11.5569 10.1682H15.4238C15.5948 10.1682 15.7587 10.2361 15.8795 10.357C16.0004 10.4779 16.0683 10.6418 16.0683 10.8127ZM5.70743 5.90336C5.75628 5.78561 5.76912 5.65602 5.74431 5.53097C5.7195 5.40593 5.65817 5.29105 5.56806 5.20087L3.91013 3.54294C4.95742 2.66402 6.46792 1.78994 8.33451 1.78994C11.2307 1.78994 13.0175 3.51716 13.036 3.53649C13.1572 3.65721 13.3213 3.72486 13.4923 3.72456C13.6633 3.72426 13.8272 3.65603 13.948 3.53488C14.0687 3.41374 14.1363 3.2496 14.136 3.07858C14.1357 2.90755 14.0675 2.74366 13.9463 2.62294C13.8593 2.53674 11.7841 0.500977 8.33451 0.500977C6.45262 0.500977 4.61826 1.23408 2.99496 2.62858L1.70116 1.33397C1.61103 1.24374 1.49615 1.18227 1.37106 1.15736C1.24598 1.13245 1.11632 1.14522 0.99849 1.19404C0.880663 1.24286 0.779972 1.32554 0.709162 1.43162C0.638352 1.5377 0.600608 1.6624 0.600708 1.78994V5.65684C0.600708 5.82777 0.668609 5.9917 0.789473 6.11256C0.910337 6.23343 1.07426 6.30133 1.24519 6.30133H5.11209C5.23956 6.3013 5.36415 6.26348 5.47012 6.19264C5.57609 6.1218 5.65868 6.02113 5.70743 5.90336Z" fill="#A7A7A7"/>
                    </svg> Pay Bill</h5>
                </div>

                <div class="orxa">
                    <h5>${element.Payer}</h5>
                </div>

                <div style="float: right;" class="orxa">
                    <div class="odenx error">
                        <p>-$${element.Amount}</p>
                    </div>
                </div>
            </div>`
        }
        $('.billlist').append(cax);
    }
}

$(document).on('click', '.odalarCaylaar', function(){
    var clickedKutu = $(this);
    
    // Eski seçili öğenin secilirex sınıfını kaldır
    $('.odalarCaylaar.secilirex').removeClass('secilirex');
    
    clickedKutu.addClass('secilirex');
    seciliInterior = clickedKutu.data('id');

    $.post('http://0r_motels/LoadRoomInterior', JSON.stringify({
        mcode: SecilenMotelMCode,
        roomid: SecilenMotelRoomID,
        int: seciliInterior
    }));
});

function requestJoin(data) {
    let container = $('.AreYouRead');
    $('#LangAccept').html(Lang["LangAccept"]);
    $('#LangReject').html(Lang["LangReject"]);
    $('#TextFormat').html(data.text);
    container.css("right", "-500px");
    container.animate({ "right": "1vh" }, 550);
}

function hideDiv() {
    $('.AreYouRead').animate({ "right": "-500px" }, 550);
}

$(document).on('click', '#bossmenubut', function(){
    var clickedKutu = $(this);
    $.post('http://0r_motels/Cal', JSON.stringify({}))
    if (InMenu !== null){
        $("[data-id='" + InMenu + "']").removeClass("selecteditem");
        $('#'+InMenu).hide();
    }
    
    clickedKutu.addClass("selecteditem");
    var yok = $('#'+clickedKutu.attr("data-id"))
    yok.fadeIn(350);
    InMenu = clickedKutu.data("id");
});

$(document).on('click', '#MenuBut', function() {
    var clickedKutu = $(this);
    CloseKeyMenu();
    $.post('http://0r_motels/Cal', JSON.stringify({}));

    if (SeciliMenu !== null) {
        $("[data-id='" + SeciliMenu + "']").removeClass("selected");
    }

    clickedKutu.addClass("selected");
    SeciliMenu = clickedKutu.data("id");
});

$(document).on('click', '#roomDoorHash', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/OpenRoomMLOEditor', JSON.stringify({}))
});

$(document).on('click', '#EditorRoomEnter', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/EnterRoomCoord2', JSON.stringify({}))
});

$(document).on('click', '#EnterStashCoord', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/EnterStashCoord', JSON.stringify({}))
});

$(document).on('click', '#WardrobeCoordEnter', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/WardrobeCoordEnter', JSON.stringify({}))
});


LoadAllPlayers = function(data) {
    $('.Oyuncular').html("");
    if(!DifferentEvery){
        $('.Oyuncular').html(`
        <div id="SecPlayer" idx="nosahip" class="Oyuncular-Item">
            <center>
                <img style="margin-top: 1vh;" class="Res" src="pimg/avatar.png">
            </center>
            <h4>${Lang["NoOwner"]}</h4>
        </div>`);
    }

    let cem = '';
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if(!DifferentEvery){
            cem = `
            <div id="SecPlayer" resim="${element.img}" idx="${element.source}" class="Oyuncular-Item">
                <center>
                    <img class="Res" src="${element.img}">
                </center>
                <h4>${element.name}</h4>
                <h5>ID: ${element.source}</h5>
            </div>`;
        } else {
            cem = `
            <div id="GiveKeyPlayer" mcode="${element.mcode}" name="${element.name}" room="${element.room}" idx="${element.source}" class="Oyuncular-Item">
                <center>
                    <img class="Res" src="${element.img}">
                </center>
                <h4>${element.name}</h4>
                <h5>ID: ${element.source}</h5>
            </div>`;
        }
    }
    $('.Oyuncular').append(cem);

    $('#oyuncuad').on('input', function() {
        const searchValue = $(this).val().toLowerCase();
        const rows = $('.Oyuncular-Item');

        rows.each(function() {
            const identifier = $(this).find('h4').text().toLowerCase();

            if (identifier.includes(searchValue)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
};

$(document).on('click', '#GiveKeyPlayer', function(){
    $.post('http://0r_motels/GivePlayerKeyCard', JSON.stringify({
        mcode: $(this).attr("mcode"),
        room: $(this).attr("room"),
        name: $(this).attr("name"),
        source: $(this).attr("idx")
    }))
});

function IdentifierConverter(ident){
    const identifier = ident
    var dosyaAdi = 'avatar.png'
    if(ident){
      dosyaAdi = identifier.replace(/:/g, "_") + ".png";
    }
    return dosyaAdi
}

LoadSelectedMotel = function(data){
    $('#Left1').hide();
    $('#Left2').show();
    SecilenMotelMCode = data.mcode
    var photoOwner = './pimg/' + IdentifierConverter(data.owner)

    let cemalTurk = `
    <div class="angut">
        <h5>${Lang["MOTELNAME"]}</h5>
        <input id="NameMotel" type="text" class="anpute" value="${data.name}" placeholder="${Lang["EnteraMotelName"]}">
    </div>
    <div style="width: 46.5%;" class="angut">
        <h5>${Lang["MONEY"]}</h5>
        <h6>$</h6><input id="MoneyMotel" style="top: 2.2vh; padding-left: 1vh;" type="number" class="anpute" value="${data.money}" placeholder="${Lang["Enteramoney"]}">
    </div>
    <div style="width: 46.5%;" class="angut">
        <h5>${Lang["DISCOUNTVALUE"]}</h5>
        <h6>%</h6><input id="DiscountMotel" style="top: 2.2vh; padding-left: 1vh;" type="number" class="anpute" value="${data.discount}" placeholder="${Lang["Enteravalue"]}">
    </div>
    <div class="Cennet">
        <img src="${photoOwner}" class="orospununfoto">
        <h5>${data.ownerName}</h5>
        <h6>${Lang["MOTELOWNER"]}</h6>
        <button id="MotelOwnerChange" mcode="${data.mcode}" class="haksizlikButonChange"><i class="fa-solid fa-user-pen"></i></button>
    </div>
    <div style="width: 46.5%; margin-left: 2.1vh;top: -0.7%;" class="angut">
        <h5>${Lang["SalePrice"]}</h5>
        <h6>$</h6><input id="SaleMotel" style="top: 2.2vh; padding-left: 1vh;" type="number" class="anpute" value="${data.saleprice}" placeholder="${Lang["Enteramoney"]}">
    </div>
    <button id="hersey" class="SaveHersey">${Lang["SAVECHANGES"]}</button>
    <div class="roomuuur">
        <div class="room-item"></div>
    </div>`
    $('.MotelTabloListe2').html(cemalTurk);
}

LoadSelectedMotelRooms = function(data){
    let cem = '';
    if(floorCount >= 2){
        $('.roomuuur').html(`
        <div id="ekleYeniKat" class="room-item">
            <h5>${Lang["AddFloor"]}</h5>
            <h6 style="color: #5bbf32;"></h6>
        </div>`);
    } else {
        $('.roomuuur').html(``);
    }
    for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if(element.Owner === Lang["NoOwner"]){
            cem = `
            <div id="editRoom" data="${index+1}" class="room-item">
                <h5>${Lang["Room"]} ${index+1}</h5>
                <h6 style="color: #5bbf32;">${Lang["Empty"]}</h6>
            </div>`
        } else {
            cem = `
            <div id="editRoom" data="${index+1}" class="room-item">
                <h5>${Lang["Room"]} ${index+1}</h5>
                <h6>${Lang["Full"]}</h6>
            </div>`
        }
        $('.roomuuur').append(cem);
    }
}

$(document).ready(function () {
    if(elevatorMenuIn){
        $(document).click(function () {
            $("#ElevatorMenu").fadeOut();
            $.post('http://0r_motels/CloseUI', JSON.stringify({}))
            elevatorMenuIn = false
        });
    }
});


function LoadElevatorGarage(floorCount, cenk, bankx, apartment) {
    elevatorMenuIn = true;
    let elevatorMenu = $('#ElevatorMenu');
    elevatorMenu.html('');
    elevatorMenu.fadeIn(250);

    for (let floor = 1; floor <= floorCount; floor++) {
        let firstRoom = ((floor - 1) * 12) + 1;
        let lastRoom = firstRoom + 11;
        let roomsText = `${Lang["Garage"]} ${firstRoom}-${lastRoom}`;
        let floorText = `${floor * 2 - 1}-${floor * 2}`;
        let cam = `
            <div id="GirKatGarage" kat="${floor}" hayk="${firstRoom}" mayk="${lastRoom}" class="ElevatorHaxball">
                <h1>${floorText}</h1>
                <h3>${roomsText}</h3>
            </div>`;
        elevatorMenu.append(cam);
    }

    if (cenk) {
        elevatorMenu.append(`
        <div id="LeaveCo" class="ElevatorHaxball">
            <h1>${Lang["LeaveApartment"]}</h1>
            <h3>${Lang["GoOutside"]}</h3>
        </div>`);
    }

    if(bankx){
        elevatorMenu.append(`
        <div id="LeaveCoV" class="ElevatorHaxball">
            <h1>${Lang["LeaveGarage"]}</h1>
            <h3>${Lang["GoOutside"]}</h3>
        </div>`);
    }

    if(apartment){
        elevatorMenu.append(`
        <div id="OpenApartment" class="ElevatorHaxball">
            <h1>${Lang["EnterApartment"]}</h1>
            <h3>${Lang["EnterApartment"]}</h3>
        </div>`);
    }
}

$(document).on('click', '#OpenApartment', function(){
    $('#ElevatorMenu').fadeOut(350);
    $.post('http://0r_motels/SetV', JSON.stringify({}))
});


function LoadElevator(floorCount, cenk, bankx) {
    elevatorMenuIn = true;
    let elevatorMenu = $('#ElevatorMenu');
    elevatorMenu.html('');
    elevatorMenu.fadeIn(250);

    for (let floor = 1; floor <= floorCount; floor++) {
        let firstRoom = ((floor - 1) * 12) + 1;
        let lastRoom = firstRoom + 11;
        let roomsText = `${Lang["Room"]} ${firstRoom}-${lastRoom}`;
        let floorText = `${floor * 2 - 1}-${floor * 2}`;

        let cam = `
            <div id="GirKat" kat="${floor}" hayk="${firstRoom}" mayk="${lastRoom}" class="ElevatorHaxball">
                <h1>${floorText}</h1>
                <h3>${roomsText}</h3>
            </div>`;
        elevatorMenu.append(cam);
    }

    if (cenk) {
        elevatorMenu.append(`
        <div id="LeaveCo" class="ElevatorHaxball">
            <h1>${Lang["LeaveApartment"]}</h1>
            <h3>${Lang["GoOutside"]}</h3>
        </div>`);
    }

    if(bankx){
        elevatorMenu.append(`
        <div id="EnterGarage" hayk="1" mayk="12" class="ElevatorHaxball">
            <h1>${Lang["Garage"]}</h1>
            <h3>${Lang["EnterGarage"]}</h3>
        </div>`);
    }
}


$(document).on('click', '#GirKat', function(){
    $('#ElevatorMenu').fadeOut(200);
    elevatorMenuIn = false
    $.post('http://0r_motels/SetPlayerKat', JSON.stringify({
        asd: $(this).attr("kat"),
        between: $(this).attr("hayk"),
        between2: $(this).attr("mayk"),
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '#GirKatGarage', function(){
    $('#ElevatorMenu').fadeOut(200);
    elevatorMenuIn = false
    $.post('http://0r_motels/SetPlayerGarage', JSON.stringify({
        asd: $(this).attr("kat"),
        between: $(this).attr("hayk"),
        between2: $(this).attr("mayk"),
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '#EnterGarage', function(){
    $('#ElevatorMenu').fadeOut(200);
    elevatorMenuIn = false
    $.post('http://0r_motels/EnterGarage', JSON.stringify({
        asd: $(this).attr("kat"),
        between: $(this).attr("hayk"),
        between2: $(this).attr("mayk"),
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '#LeaveCo', function(){
    elevatorMenuIn = false
    $('#ElevatorMenu').fadeOut(200);
    $.post('http://0r_motels/LeaveCorridor', JSON.stringify({}))
});

$(document).on('click', '#LeaveCoV', function(){
    elevatorMenuIn = false
    $('#ElevatorMenu').fadeOut(200);
    $.post('http://0r_motels/CloseUI', JSON.stringify({}))
    $.post('http://0r_motels/LeaveGarage', JSON.stringify({}))
});

$(document).on('click', '#ekleYeniKat', function(){
    $.post('http://0r_motels/AddNewFloor', JSON.stringify({
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '#editRoom', function(){
    $('#MotelAdminMenu').hide();
    if($(this).attr("dogrumu") == 'dogru'){
        YumurcakData = true
        $('#DeleteRoom').hide();
        $('.tyu').css("width", "96%");
    } else {
        $('#DeleteRoom').show();
        $('.tyu').css("width", "265px");
        YumurcakData = false
    }

    SecilenMotelRoomID = $(this).attr("data")
    $.post('http://0r_motels/LoadSelectedMotelRoomData', JSON.stringify({
        id: $(this).attr("data"),
        mcode: SecilenMotelMCode
    }))
});

LoadAdminMotels = function(data){
    let htmll = '';
    $('#Moteller').html("")
    for (let index = 0; index < data.length; index++) {
        var name = Lang["NoOwner"]
        const element = data[index];
        if(element.ownerName !== undefined){
            name = element.ownerName
        }
        htmll = `
        <div id="EditMotel" mcode="${element.mcode}" class="Motel-Item">
            <h3>${element.name}</h3>
            <div class="Motel-Item-Box">
                <div class="Motel-Item-BoxPart">
                    <h5>${Lang["Owner"]}</h5>
                </div>
                <div style="width: 70%;" class="Motel-Item-BoxPart">
                    <h6>${name}</6>
                </div>
            </div>
            <div class="Motel-Item-Box">
                <div class="Motel-Item-BoxPart">
                    <h5>${Lang["Money"]}</h5>
                </div>
                <div style="width: 70%;" class="Motel-Item-BoxPart">
                    <h6>$${formatNumberWithDots(element.money)}</6>
                </div>
            </div>
            <div class="Motel-Item-Box">
                <div class="Motel-Item-BoxPart">
                    <h5>${Lang["Rooms"]}</h5>
                </div>
                <div style="width: 70%;" class="Motel-Item-BoxPart">
                    <h6>${element.fullRoomSayi}/${element.odaSayi}</6>
                </div>
            </div>
        </div>
        `
        $('#Moteller').append(htmll);
    }
}

LoadTeleportRooms = function(){
    let emir = '';
    $('#TeleportMlos').html("");
    for (let index = 0; index < Mlos.length; index++) {
        const element = Mlos[index];
        emir =
        `<div id="yumgoz5" data-id="${element.RoomLabel}" class="BigBoy-Part">
            <img src="rooms/${element.Image}">
            <div class="overlay22">
                <p>${element.RoomLabel}</p>
            </div>
        </div>`
        $('#TeleportMlos').append(emir);
    }
};

$(document).on('click', '.resma', function(){
    var clickedKutu = $(this);
    
    if (aktifKutu !== null){
        $("[data-id='" + aktifKutu + "']").removeClass("selectres");
    }
    
    clickedKutu.addClass("selectres");
    aktifKutu = clickedKutu.data("id");
});



AddMotelButton = function(){
    $('#MotelAdminMenu').fadeOut(350);
    $('.NewEditMenu').fadeIn(350);
    $('#enterinfo').html(Lang["EnterInfo"]);
    $('#TeleportString').html(Lang["TeleportString"])
    $('#EnterRoomCoord2').html(Lang["EnterCoordString"]);
    $('#EnterCoordString').html(Lang["EnterCoordString"])
    $('#degisken').html(Lang["CreateMotel"]);
    $('#Adezorospusu').html(Lang["Adezorospusu"]);
    $('#StashCoordText').html(Lang["StashCoordText"]);
    $('#WardrobeCoordString').html(Lang["WardrobeCoordString"])
    $('#StashWeight2').html(Lang["StashWeightString"]);
    $('#StashWeightString').html(Lang["StashWeightString"])
    $('#motelpricetext').html(Lang["motelpricetext"]);
    $('#TypeText').html(Lang["TypeText"])
    $('#receptioncoords').html(Lang["receptioncoords"]);
    $('#blipnames').html(Lang["blipnames"]);
    $('#GarageString').html(Lang["GarageString"]);
    $('#RoomPriceString').html(Lang["RoomPriceString"]);
    $('#DoorHash').html(Lang["DoorHash"]);
    $('#Price2').html(Lang["RoomPriceString"]);
    $('#ApartmentString').html(Lang["ApartmentString"]);
    $('#TypeTextString').html(Lang["TypeText"])
    $('#GarageCoordsString').html(Lang["GarageCoordsString"]);
    $('#TypeText').html(Lang["TypeText"])
    $('#MloString').html(Lang["MloString"])
    $('#discountext').html(Lang["discountext"]);
    $('#CreateMotelRoom').html(Lang["CreateMotelRoom"])
    $('#yudum').html(Lang["CreateMotel"]);
    $('#CreateRoomCC').hide();
    $('#CreateRoomCCV').hide();
    $('#moxelname').val("");
    $('#moxelprice').val("");
    $('#discountvaluxe').val("");
    $('#recepivediksiyon').val("");
    $('#HotelGarage').val("");
    $('#GarageTheme').hide();
    $('#CorridorTheme').hide();
    $('#CreateBabalarSozunuTutar').show();
    LoadData();
    LoadDataGarage();
}


$(document).on('click', '#yumgoz', function(){
    var clickedElement = $(this);
    $('#yumgoz').removeClass('BigSe');
    corridorCurrent = clickedElement.attr("color")
    clickedElement.addClass('BigSe');
});

$(document).on('click', '#yumgoz2', function(){
    var clickedElement = $(this);
    $('#yumgoz2').removeClass('BigSe');
    garageCurrent = clickedElement.attr("color")
    clickedElement.addClass('BigSe');
});

$(document).on('click', '#yumgoz5', function(){
    var clickedElement = $(this);
    odaInterior = clickedElement.attr("data-id");
    $('#egerIstersen').val(odaInterior)
    $('.BigSe').removeClass('BigSe');
    clickedElement.addClass('BigSe');
});


function LoadData() {
    let ceam = '';
    $('#CorridorTheme').html("");
    for (let index = 0; index < corridors.Colors.length; index++) {
        const element = corridors.Colors[index];
        ceam = `
        <div id="yumgoz" color="${element.name}" class="BigBoy-Part">
            <img src="rooms/${element.name}_corridor.png">
            <div class="overlay22">
                <p>${element.name}</p>
            </div>
        </div>`
        $('#CorridorTheme').append(ceam);
    }
}

function LoadDataGarage() {
    let ceam = '';
    $('#GarageTheme').html("");
    for (let index = 1; index < 12; index++) {
        ceam = `
        <div id="yumgoz2" color="${index}" class="BigBoy-Part">
            <img src="rooms/${index}_garage.png">
            <div class="overlay22">
                <p>${Lang["Garage"]}</p>
            </div>
        </div>`
        $('#GarageTheme').append(ceam);
    }
}



$(document).on('click', '#CreateNewHotel', function(){
    var setMotelName = $('#HotelName').val();
    var setMotelPrice = $('#HotelPrice').val();
    var setReceptionCoords = $('#HotelReception').val();
    var setGarageCoords = $('#HotelGarage').val();
    var DataMotel = {motelname: setMotelName, motelprice: setMotelPrice, recoord: setReceptionCoords, garage: setGarageCoords, apartment: IsApartment}
    if (setMotelName !== ""  && setMotelPrice !== ""  && setReceptionCoords.startsWith("vector3") && setGarageCoords !== ""){
        $.post('http://0r_motels/CreateHotel', JSON.stringify(DataMotel));
        $('#NewMotelScreen').fadeOut(350);
    } else {
        showNotifyV({
            title: Lang["Error"],
            type: 'error',
            text: Lang["MustFieldNotBlank"]
        })
    }
});

$(document).on('click', '#HotelReceptionCopy', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/SetReceptionCoords', JSON.stringify({}))
});

$(document).on('click', '#HotelGarageCopy', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/SetGarageCoords', JSON.stringify({}))
});

SelectMotel = function(){
    $.post('http://0r_motels/LoadSelectedMotel', JSON.stringify({
        mcode: $(this).attr("mcode")
    }))
}

MotelOwnerChange = function(){
    $('#MotelAdminMenu').fadeOut(350);
    $.post('http://0r_motels/AllPlayers', JSON.stringify({
        mcode: $(this).attr("mcode")
    }))
}

SelectNewOwner = function(){
    $('.ChoseOwnerScreen').fadeOut(350);
    $.post('http://0r_motels/LoadNewAdmin', JSON.stringify({
        source: $(this).attr("idx"),
        img: $(this).attr("resim"),
        mcode: SecilenMotelMCode
    }))
}

BackListeler = function(){
    $('#Left2').hide();
    $('#Left1').show();
    $('.MotelTabloListe2').hide();
    $('.MotelTabloListe').fadeIn(350);
}

UpdateMotelData = function(){
    $.post('http://0r_motels/UpdateAllData', JSON.stringify({
        name: $('#NameMotel').val(),
        money: $('#MoneyMotel').val(),
        discount: $('#DiscountMotel').val(),
        saleprice: $('#SaleMotel').val(),
        mcode: SecilenMotelMCode
    }))
}

UpdateMotelDataV = function(){
    $.post('http://0r_motels/UpdateAllData', JSON.stringify({
        name: $('#hahname').val(),
        money: $('#odaprice').val(),
        discount: $('#indiri').val(),
        mcode: SecilenMotelMCode,
        yumurcak: YumurcakData
    }))
}

$(document).on('click', '#jemati', UpdateMotelDataV)

AddMotelRoom = function(){
    $('#MotelAdminMenu').fadeOut(350);
    $('.NewEditMenu').fadeIn(350);
    $('#degisken').html(Lang["CreateRoom"])
    $('#CreateBabalarSozunuTutar').hide();
    $('#CreateRoomCC').show();
    $('#CreateMotelRoom').html(Lang["CreateMotelRoom"])
    $('#CreateMotelRoomV').html(Lang["CreateMotelRoom"]);
    $('#enterinfo').html(Lang["EnterInfo"]);
    $('#TeleportString').html(Lang["TeleportString"])
    $('#EnterRoomCoord2').html(Lang["EnterCoordString"]);
    $('#EnterCoordString').html(Lang["EnterCoordString"]);
    $('#EditRoomThemeString').html(Lang["EditRoomThemeString"])
    $('#degisken').html(Lang["CreateMotel"]);
    $('#Adezorospusu').html(Lang["Adezorospusu"]);
    $('#StashCoordText').html(Lang["StashCoordText"]);
    $('#WardrobeCoordString').html(Lang["WardrobeCoordString"])
    $('#StashWeight2').html(Lang["StashWeightString"]);
    $('#StashWeightString').html(Lang["StashWeightString"])
    $('#motelpricetext').html(Lang["motelpricetext"]);
    $('#TypeText').html(Lang["TypeText"])
    $('#receptioncoords').html(Lang["receptioncoords"]);
    $('#GarageString').html(Lang["GarageString"]);
    $('#RoomPriceString').html(Lang["RoomPriceString"]);
    $('#DoorHash').html(Lang["DoorHash"]);
    $('#Price2').html(Lang["RoomPriceString"]);
    $('#ApartmentString').html(Lang["ApartmentString"]);
    $('#TypeTextString').html(Lang["TypeText"])
    $('#GarageCoordsString').html(Lang["GarageCoordsString"]);
    $('#TypeText').html(Lang["TypeText"])
    $('#MloString').html(Lang["MloString"])
    $('#discountext').html(Lang["discountext"]);
    $('#CreateMotelRoom').html(Lang["CreateMotelRoom"])
    $('#yudum').html(Lang["CreateMotel"]);
    OpenRoomCreateScreen = true
    LoadTeleportRooms();
}

DeleteMotel = function(){
    $('.MotelTabloListe2').hide();
    $('.MotelTabloListe').fadeIn(350);
    $('#Left2').hide();
    $('#Left1').show();
    $.post('http://0r_motels/DeleteMotel', JSON.stringify({
        mcode: SecilenMotelMCode
    }))
}

$(document).on('click', '#SetPlayerMotel', function(){
    $('#MotelAdminMenu').fadeOut(350);
    $.post('http://0r_motels/SetPlayerCoord', JSON.stringify({
        mcode: SecilenMotelMCode
    }))
});

$(document).on('click', '#backroomlist', function(){
    $('.roomeditpage').hide();
    if(!YumurcakData){
        $('#MotelAdminMenu').fadeIn(350);
    }
});

$(document).on('click', '#UpdateRoomPrice', function(){
    $('.roomeditpage').hide()
    $.post('http://0r_motels/UpdateMotelRoomPrice', JSON.stringify({
        mcode: SecilenMotelMCode,
        roomid: SecilenMotelRoomID,
        price: $('#odafo').val(),
        yumurcak: YumurcakData
    }))
});

$(document).on('click', '#kickMotelRoom', function(){
    if(SecilenMotelRoomOwner !== 'No Owner'){
        $('.roomeditpage').fadeOut(350);
        $.post('http://0r_motels/KickMotelRoom', JSON.stringify({
            mcode: SecilenMotelMCode,
            roomid: SecilenMotelRoomID,
            yumurcak: YumurcakData
        }))
    } else {
        $.post('http://0r_motels/JsNotify', JSON.stringify({
            type: "error",
            title: Lang["Invalid"],
            text: Lang["NotRentedNothing"],
            time: 3
        }));
    }
});

$(document).on('click', '#DeleteRoom', function(){
    $('.roomeditpage').hide()
    $.post('http://0r_motels/DeleteMotelRoom', JSON.stringify({
        mcode: SecilenMotelMCode,
        roomid: SecilenMotelRoomID,
    }))
});

$(document).on('click', '#CrexMotel', function(){
    var inputText1 = $("#moxelname").val();
    var inputText2 = $("#moxelprice").val();
    var inputText3 = $("#discountvaluxe").val();
    var inputText5 = $("#recepivediksiyon").val();
    var inputText6 = $("#blipid").val();
    if (inputText5.startsWith("vector3") && inputText2 !== "" && inputText6 !== "" && inputText3 !== "" && inputText1 !== "") {
        $('.NewEditMenu').fadeOut(350);
        $.post('http://0r_motels/CreateMotelNew', JSON.stringify({
            motelname: inputText1,
            motelprice: inputText2,
            discount: inputText3,
            garage: garageSelected,
            apartment: apartmentSelected,
            apartmentTheme: corridorCurrent,
            garageTheme: garageCurrent,
            blipid: inputText6
        }));
        OpenRoomCreateScreen = false
    } else {
        $.post('http://0r_motels/JsNotify', JSON.stringify({
            type: "error",
            title: Lang["Invalid"],
            text: Lang["MustFieldNotBlank"],
            time: 3
        }));
    }
});


$(document).on('click', '#createRoom', function(){
    var inputText1 = $("#roomEnterCoord").val();
    var inputText2 = $("#roomFiyat").val();
    var inputText3 = $("#roomWeight").val();

    if (inputText1.startsWith("vector3") && odaInterior && inputText2 !== "") {
        $('.NewEditMenu').fadeOut(350);
        $.post('http://0r_motels/CreateMotelRoom', JSON.stringify({
            price: inputText2,
            enterCoord: inputText1,
            roomtype: odaInterior,
            weightnew: inputText3,
            type: "Teleport",
            mcode: SecilenMotelMCode
        }));
        OpenRoomCreateScreen = false
    } else {
        $.post('http://0r_motels/JsNotify', JSON.stringify({
            type: "error",
            title: Lang["Invalid"],
            text: Lang["MustFieldNotBlank"],
            time: 3
        }));
    }
});

$(document).on('change', '#IsApartmentV input[type="checkbox"]', function() {
    IsApartment = $(this).prop('checked')
});

$(document).on('change', '#thisApartment input[type="checkbox"]', function() {
    apartmentSelected = $(this).prop('checked')
    if(apartmentSelected){
        $('#CorridorTheme').fadeIn(350);
        $('#CorridorTheme').css("display", "flex")
    } else {
        $('#CorridorTheme').fadeOut(350);
    }
});

$(document).on('change', '#thisGarage input[type="checkbox"]', function() {
    garageSelected = $(this).prop('checked')
    if(garageSelected){
        $('#GarageTheme').fadeIn(350);
        $('#GarageCoordK').fadeIn(350);
        $('#GarageTheme').css("display", "flex")
    } else {
        $('#GarageCoordK').fadeOut(250);
        $('#GarageTheme').fadeOut(350);
    }
});

$(document).on('click', '#CreateRoomPart', function(){
    var inputText1 = $("#StashCoord").val();
    var inputText2 = $("#doorHashBaba").val();
    var inputText3 = $("#roomGirisCoord").val();
    var inputText4 = $("#WardrobeCoord").val();
    var inputText5 = $('#RoomType').val();
    var inputText6 = $('#RoomStashWeight').val();
    var inputText7 = $('#odaFiat').val();

    if (inputText1.startsWith("vector3") && inputText3.startsWith("vector3") && inputText4.startsWith("vector3") && inputText2 !== "" && inputText7 !== "" && inputText5 !== "" && inputText6 !== "") {
        $('.NewEditMenu').fadeOut(350);
        $.post('http://0r_motels/CreateMotelRoomTeleport', JSON.stringify({
            doorHash: inputText2,
            stashCoord: inputText1,
            enterCoord: inputText3,
            wardrobeCoord: inputText4,
            roomPrice: inputText7,
            roomtip: inputText5,
            weight: inputText6,
            mcode: SecilenMotelMCode
        }));
        OpenRoomCreateScreen = false
    } else {
        $.post('http://0r_motels/JsNotify', JSON.stringify({
            type: "error",
            title: Lang["Invalid"],
            text: Lang["MustFieldNotBlank"],
            time: 3
        }));
    }
});

$(document).on('click', '#enterRoomCoord', function(){
    $('.NewEditMenu').fadeOut(350);
    $.post('http://0r_motels/EnterRoomCoord', JSON.stringify({}))
});

$(document).on('click', '#mlo', function(){
    $('#ipl').removeClass("RektorSec")
    $('#mlo').addClass("RektorSec");

    $('#Mematiler').hide()
    $('#entelMaganda').fadeIn(250);
});

$(document).on('click', '#ipl', function(){
    $('#mlo').removeClass("RektorSec")
    $('#ipl').addClass("RektorSec");

    $('#entelMaganda').hide();
    $('#Mematiler').fadeIn(250);
});

$(document).on('click', '#mot', function(){
    if(Xloc == false){
        Xloc = true
        $(".NotificationBox").fadeIn(100);
    } else {
        Xloc = false
        $(".NotificationBox").fadeOut(100);
    }
});

$(document).on('click', '#addMotelRoom', AddMotelRoom)
$(document).on('click', '#DeleteMotel', DeleteMotel)
$(document).on('click', '#hersey', UpdateMotelData)
$(document).on('click', '#SecPlayer', SelectNewOwner)
$(document).on('click', '#backListeler', BackListeler)
$(document).on('click', '#EditMotel', SelectMotel)
$(document).on('click', '#addMotelButton', AddMotelButton)
$(document).on('click', '#MotelOwnerChange', MotelOwnerChange)

var notifyCount = 0;

showNotifyV = function(data) {
    notifyCount++;

    var color = '#fff';
    var type = 'info';
    var time = 3;
    var icon = 'circle-info'

    if(data.type == 'error'){
        color = '#FE4E4E';
        title = data.type;
        icon = 'circle-exclamation'
    } else if (data.type == 'success'){
        color = '#8CE75B';
        icon = 'circle-check'
        title = data.type
    } else if (data.type == 'info'){
        color = '#42D3E7';
        icon = 'circle-info'
        title = data.type
    }

    if (data.color){
        color = data.color  
    };

    if(data.time){
        time = data.time
    }

    let notify = `
    <div id="notify-${notifyCount}" class="NotifyContainer w3-animate-right">
        <div class="NotifyContent">
            <h3>
                <i class="fa-light fa-${icon}" style="color: ${color};"></i>
            </h3>
            <h4>${data.title}</h4>
            <p>${data.text}</p>
        </div>
    </div>`;

    $(".NotifyPart").append(notify);
    $(`#notify-${notifyCount}`).css("right", "-300px");
    $(`#notify-${notifyCount}`).animate({ "right": "0" }, 350);



    const notifyElement = $(`#notify-${notifyCount}`);
    const timeoutId = setTimeout(function() {
        notifyElement.animate({ "right": "-300px" }, 350, function() {
            $(this).remove();
        });
    }, 1000 * time);

    notifyElement.find(".closeButton").on("click", function() {
        clearTimeout(timeoutId);
        notifyElement.animate({ "right": "-300px" }, 350, function() {
            $(this).remove();
        });
    });

    const notifyContainers = $(".NotifyContainer");
    $(".NotifyPart").empty(); // Önce tüm bildirimleri temizle

    for (let i = notifyContainers.length - 1; i >= 0; i--) {
        $(".NotifyPart").append(notifyContainers[i]);
    }
}