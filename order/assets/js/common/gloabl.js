$(document).ready(function () {

   
   // 중국 
   let chinaData = [{
         'img': '../resources/assets/images/global/china/img_01.jpg',
         'tit': '대어만상업광장점',
         'num': 'T. (+86) 0512-5527-0095',
         'address': '江苏省苏州市昆山市杜克大道505号大渔商业广场D09号'
      },
      {
         'img': '../resources/assets/images/global/china/img_02.jpg',
         'tit': '완상청점',
         'num': 'T. (+86) 173-1217-0752',
         'address': '江苏省苏州市吴江区开平路2299号万象汇商城4楼'
      },
      {
         'img': '../resources/assets/images/global/china/img_03.jpg',
         'tit': '지우방점',
         'num': 'T. (+86) 199-8483-9576',
         'address': '江苏省苏州市昆山市昆北路与萧林中路666号 九方购物中心'
      },
      {
         'img': '../resources/assets/images/global/china/img_04.jpg',
         'tit': '소주중심점',
         'num': 'T. (+86) 180-1309-0887',
         'address': '江苏省苏州市苏州工业园区星港街苏州中心北区 4层'
      },
      {
         'img': '../resources/assets/images/global/china/img_05.jpg',
         'tit': '대열춘풍리점',
         'num': 'T. (+86) 189-1493-2023',
         'address': '苏州市相城区元和街道御窑路1999号大悦春风里购物中心 5层'
      },
      {
         'img': '../resources/assets/images/global/china/img_06.jpg',
         'tit': '광동성 부화리 1호점',
         'num': 'T. (+86) 0756-8598832',
         'address': '广东省珠海市香洲区九洲大道西 2023 号中海富华里 2栋 103 /104'
      },
   ]

   for (let i in chinaData) {
      let shop = `
           <div class="shop">
               <div class="shop-img"
                   style="background-image: url('${chinaData[i].img}');"></div>
               <dl class="shop-desc">
                   <dt class="tit">${chinaData[i].tit}</dt>
                   <dd class="num">${chinaData[i].num}</dd>
                   <dd class="address">${chinaData[i].address}</dd>
               </dl>
           </div>
       `
      let itemChaina = $('.item-china');
      itemChaina.append(shop)
   }

   // 베트남 
   let vietnamData = [{
         'img': '../resources/assets/images/global/vietnam/img_01.jpg',
         'tit': '호치민 1호점',
         'num': 'T. (+84) 28-7303-9292',
         'address': '69 phạm ngọc thạch phường 6 quận 3 hồ chí minh'
      },
      {
         'img': '../resources/assets/images/global/vietnam/img_02.jpg',
         'tit': '호치민 2호점',
         'num': 'T. (+84) 28-2250-8801',
         'address': '99 Nguyễn Thị Thập, Tân Phong, Quận 7, Hồ Chí Minh'
      },
   ]

   for (let i in vietnamData) {
      let shop = `
         <div class="shop">
               <div class="shop-img"
                  style="background-image: url('${vietnamData[i].img}');"></div>
               <dl class="shop-desc">
                  <dt class="tit">${vietnamData[i].tit}</dt>
                  <dd class="num">${vietnamData[i].num}</dd>
                  <dd class="address">${vietnamData[i].address}</dd>
               </dl>
         </div>
      `
      let itemVietnamData = $('.item-vietnam');
      itemVietnamData.append(shop)
   }

   // 홍콩 
   let hongkongData = [{
         'img': '../resources/assets/images/global/hongkong/img_01.jpg',
         'tit': '침사추이점',
         'num': 'T. (+852) 2311-0001',
         'address': '2/F The Hart, No.4 Hart Avernue, Tsimshatsui, Kowloon, Hongkong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_02.jpg',
         'tit': '몽콕점',
         'num': 'T. (+852) 2116-0002',
         'address': '15F King Wah centre, 628 Nathan Road, Mong Kok, Kowloon, Hong Kong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_03.jpg',
         'tit': '취난점',
         'num': 'T. (+852) 2157-1131',
         'address': 'Shop N0 G29 on Ground Floor, Citywalk No1 Yeung Uk Road, Tsuen Wan, New Territories'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_04.jpg',
         'tit': '코즈웨이베이점',
         'num': 'T. (+852) 2157-0000',
         'address': '25/F, V Point, 18 Tang Lung Street, Causeway bay, Hong Kong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_05.jpg',
         'tit': '센트럴점',
         'num': 'T. (+852) 2097-2323',
         'address': '5/F 2-8 Wellington Street, Wellington Place, Central, Hong Kong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_06.jpg',
         'tit': '정관오점',
         'num': 'T. (+852) 2712-0002',
         'address': 'Shop 119A, 1/F, Popwalk Ⅱ, 19 Tong Yin street, Tseung Kwan O, Hong Kong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_07.jpg',
         'tit': '통청점',
         'num': 'T. (+852) 2818-2088',
         'address': '7/F, Citygate, 2, Tung Chung'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_08.jpg',
         'tit': '쿼리베이점',
         'num': 'https://deliveroo.hk',
         'address': 'Shop No. LG 045-50, Nos. 1048-1056 King’s Road, Nos. 2-32 Yau Man Street, Quarry Bay, Hong Kong'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_09.jpg',
         'tit': '사이잉푼점',
         'num': 'https://deliveroo.hk',
         'address': 'G/F, 58 High Street, Sai Ying Pun, Hong Kong（Goobne)'
      },
      {
         'img': '../resources/assets/images/global/hongkong/img_10.jpg',
         'tit': '틴문점',
         'num': 'T. (+852) 2972-0001',
         'address': 'Shop 45-46, 1F, North Wing, The Trend Plaza, 2 Tuen Lung Street, Tuen Mun, Hong Kong'
      },
   ]

   for (let i in hongkongData) {
      let shop = `
            <div class="shop">
                  <div class="shop-img"
                     style="background-image: url('${hongkongData[i].img}');"></div>
                  <dl class="shop-desc">
                     <dt class="tit">${hongkongData[i].tit}</dt>
                     <dd class="num">${hongkongData[i].num}</dd>
                     <dd class="address">${hongkongData[i].address}</dd>
                  </dl>
            </div>
         `
      let itemhongkong = $('.item-hongkong');
      itemhongkong.append(shop)
   }

   // 싱가포르 
   let SingaporeData = [{
         'img': '../resources/assets/images/global/singapore/img_01.jpg',
         'tit': '그레이트월드점',
         'num': 'T. (+65) 8879-5898',
         'address': '1 Kim Seng Promenade, Singapore 237994 Great world #01-115 unit'
      },
      {
         'img': '../resources/assets/images/global/singapore/img_02.jpg',
         'tit': '세랑군점',
         'num': '배달 전용 매장',
         'address': '55, Serangoon North Ave 4, S9 Building #01-02/19/20, S(555859)'
      },
   ]

   for (let i in SingaporeData) {
      let shop = `
      <div class="shop">
            <div class="shop-img"
               style="background-image: url('${SingaporeData[i].img}');"></div>
            <dl class="shop-desc">
               <dt class="tit">${SingaporeData[i].tit}</dt>
               <dd class="num">${SingaporeData[i].num}</dd>
               <dd class="address">${SingaporeData[i].address}</dd>
            </dl>
      </div>
   `
      let itemSingapore = $('.item-singapore');
      itemSingapore.append(shop)
   }

   // 인도네시아 
   let IndonesiaData = [{
         'img': '../resources/assets/images/global/indonesia/img_01.jpg',
         'tit': 'PIK점',
         'num': 'T. (+62) 021-2233-9536',
         'address': 'Jalan marina indah raya, ruko crown Golf blok B 15-16 Pantai indah kapuk kamal muara penjaringan Jakarta Utara'
      },
      {
         'img': '../resources/assets/images/global/indonesia/img_02.jpg',
         'tit': '수디르만점',
         'num': 'T. (+62) 021-5011-1178',
         'address': 'UG - 07 ASHTA District 8, SCBD Lot 28.'
      },
      {
         'img': '../resources/assets/images/global/indonesia/img_03.jpg',
         'tit': '발리점',
         'num': 'T. (+62) 811-3809-959',
         'address': 'Jl. Pantai Kuta, Kuta, Kabupaten Badung, Bali 80361, Indonesia'
      },
      {
         'img': '../resources/assets/images/global/indonesia/img_04.jpg',
         'tit': 'MOI점',
         'num': 'T. (+62) 811-128-9537',
         'address': 'No. J-07, Mall of Indonesia, Kelapa Gading, North Jakarta'
      },
   ]

   for (let i in IndonesiaData) {
      let shop = `
         <div class="shop">
               <div class="shop-img"
                  style="background-image: url('${IndonesiaData[i].img}');"></div>
               <dl class="shop-desc">
                  <dt class="tit">${IndonesiaData[i].tit}</dt>
                  <dd class="num">${IndonesiaData[i].num}</dd>
                  <dd class="address">${IndonesiaData[i].address}</dd>
               </dl>
         </div>
      `
      let itemindonesia = $('.item-indonesia');
      itemindonesia.append(shop)
   }


   // 마카오 
   let macauData = [{
         'img': '../resources/assets/images/global/macau/img_01.jpg',
         'tit': '타이파점',
         'num': 'T. (+853) 2883-5999',
         'address': 'Rua De Seng Tou, Supreme Flower City, R/C “J2”, Taipa, Goobne Chicken Macau'
      },
      {
         'img': '../resources/assets/images/global/macau/img_02.jpg',
         'tit': '쾌자기점',
         'num': 'T. (+853) 2825-2890',
         'address': 'AVENIDA MARGINAL DO LAM MAU, S/N LE JADE, RC C E, MACAU'
      },
      {
         'img': '../resources/assets/images/global/macau/img_03.jpg',
         'tit': '리스보아점',
         'num': 'T. (+853) 2882-9355',
         'address': 'No.F25, East of Lisboa Hotel, 2-4 Avenida de Lisboa, Macau'
      },
   ]

   for (let i in macauData) {
      let shop = `
      <div class="shop">
            <div class="shop-img"
               style="background-image: url('${macauData[i].img}');"></div>
            <dl class="shop-desc">
               <dt class="tit">${macauData[i].tit}</dt>
               <dd class="num">${macauData[i].num}</dd>
               <dd class="address">${macauData[i].address}</dd>
            </dl>
      </div>
   `
      let itemmacau = $('.item-macau');
      itemmacau.append(shop)
   }

   // 호주 
   let australiaData = [{
         'img': '../resources/assets/images/global/australia/img_01.jpg',
         'tit': '달링스퀘어점',
         'num': 'T. (+61) 2-8417-6201',
         'address': 'Darling Square Shop, 16e Tumbalong Bvd, Haymarket NSW 2000, Australia'
      },
      {
         'img': '../resources/assets/images/global/australia/img_02.jpg',
         'tit': '제트랜드점',
         'num': 'T. (+61) 2-9188-5169',
         'address': 'Shop T.03, Apex Building, 4-6 Defries Avenue, Zetland NSW 2017, Australia'
      },
   ]

   for (let i in australiaData) {
      let shop = `
         <div class="shop">
               <div class="shop-img"
                  style="background-image: url('${australiaData[i].img}');"></div>
               <dl class="shop-desc">
                  <dt class="tit">${australiaData[i].tit}</dt>
                  <dd class="num">${australiaData[i].num}</dd>
                  <dd class="address">${australiaData[i].address}</dd>
               </dl>
         </div>
      `
      let itemaustralia = $('.item-australia');
      itemaustralia.append(shop)
   }

   // 말레이시아 
   let malaysiaData = [{
         'img': '../resources/assets/images/global/malaysia/img_01.jpg',
         'tit': '마이타운점',
         'num': 'T. (+60) 3-9201-1042',
         'address': 'Lot l3-043A,Level 3,Mytown Shopping centre, Cheras,Federal Territory of Kuala Lumpur'
      },
      {
         'img': '../resources/assets/images/global/malaysia/img_02.jpg',
         'tit': '수방자야점',
         'num': 'T. (+60) 3-5612-1233',
         'address': '34, Jalan SS 15/4d, Ss 15, 47500 Subang Jaya, Selangor'
      },
      {
         'img': '../resources/assets/images/global/malaysia/img_03.jpg',
         'tit': '라부안점',
         'num': 'T. (+60) 1-7311-1834',
         'address': 'Lot 3, Ground Floor, Wisma Lazenda, Jalan Kemajuan, 87008, W.P. Labuan'
      },
      {
         'img': '../resources/assets/images/global/malaysia/img_04.jpg',
         'tit': '반팅점',
         'num': 'T. (+60) 3-3187-9760',
         'address': 'No.29-GF-E4, Jalan Cemerlang 4, Pusat Perdagangan Banting, 42700 Banting, Selangor'
      },
      {
         'img': '../resources/assets/images/global/malaysia/img_05.jpg',
         'tit': '시타몰점',
         'num': 'T. (+60) 1-7621-7487',
         'address': 'G-05, Ground Floor, Citta Mall, Jalan PJU 1A/48, PJU 1A, Ara Damansara, 47301 Petaling Jaya, Selangor'
      },
   ]

   for (let i in malaysiaData) {
      let shop = `
      <div class="shop">
            <div class="shop-img"
               style="background-image: url('${malaysiaData[i].img}');"></div>
            <dl class="shop-desc">
               <dt class="tit">${malaysiaData[i].tit}</dt>
               <dd class="num">${malaysiaData[i].num}</dd>
               <dd class="address">${malaysiaData[i].address}</dd>
            </dl>
      </div>
      `
      let itemmalaysia = $('.item-malaysia');
      itemmalaysia.append(shop)
   }

   // 일본 
   let japanData = [{
         'img': '../resources/assets/images/global/japan/img_01.jpg',
         'tit': '신오쿠보점',
         'num': 'T. (+81) 03-6273-9496',
         'address': '2-32-1 2F, Okubo,shinjuku-ku,Tokyo'
      },
      {
         'img': '../resources/assets/images/global/japan/img_02.jpg',
         'tit': '가부키초점',
         'num': 'T. (+81) 03-6273-9595',
         'address': '2-42-16 1F, Kabukicho, Shinjuku,Tokyo'
      },
      {
         'img': '../resources/assets/images/global/japan/img_03.jpg',
         'tit': '한류백화점점',
         'num': 'T. (+81) 03-6273-9987',
         'address': '1-chōme-7-15 Hyakuninchō, Shinjuku City, Tōkyō-to 169-0073 2F'
      },
      {
         'img': '../resources/assets/images/global/japan/img_04.jpg',
         'tit': '아케보노바시점',
         'num': 'T. (+81) 03-5925-8756',
         'address': '3-8 Kawadacho Shinjuku City Tokyo-to'
      },
      {
         'img': '../resources/assets/images/global/japan/img_06.jpg',
         'tit': '오사카 츠루하시점',
         'num': 'T. (+81) 06-6777-1769',
         'address': '3-chōme-7-16 Tsuruhashi, Ikuno Ward, Osaka, 544-0031'
      },
   ]

   for (let i in japanData) {
      let shop = `
   <div class="shop">
         <div class="shop-img"
            style="background-image: url('${japanData[i].img}');"></div>
         <dl class="shop-desc">
            <dt class="tit">${japanData[i].tit}</dt>
            <dd class="num">${japanData[i].num}</dd>
            <dd class="address">${japanData[i].address}</dd>
         </dl>
   </div>
   `
      let itemjapan = $('.item-japan');
      itemjapan.append(shop)
   }


// 나라선택 구현 
   $('.global__stores-country  .country').click(function () {
      var indexNo = $(this).index();
      var offset = $('.global-store-item-wrapper').offset(); //선택한 태그의 위치를 반환
      $('html,body').animate({scrollTop : offset.top - 200}, 400);
      $(this).addClass('is-active').siblings().removeClass('is-active');
      $('.global-store-item-wrapper .global-store-item').addClass('l-hidden');
      $('.global-store-item-wrapper .global-store-item').eq(indexNo).removeClass('l-hidden');
   })


});