// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require activestorage

//= require popper

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
window.onunload = function(){};

$(function () {
  $('#openModal').click(function(){
      $('#modalArea').fadeIn();
  });

  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});


// uketuke1_new
// 備品貸出時のバリデーション
function CheckValidation(){
 var err = false;
 var dt = new Date();
 var y = dt.getFullYear();
 var m = dt.getMonth()+1;
 var d = dt.getDate();
 var h = dt.getHours();
 var min = dt.getMinutes();
 var s = dt.getSeconds();

// ||!(document.getElementById('r_name').value)||!(document.getElementById('tell').value)||!(document.getElementById('r_num').value)

 //必要箇所が入力されているかチェック
 if(!(document.getElementById('g_name').value)||!(document.getElementById('place').value)){　
 	err = true;
 	alert('入力されていない箇所があります');
 }
  if(!(document.getElementById('katudo_naiyo').value)){　
  err = true;
  alert('入力されていない箇所があります');
 }
 if(gon.signstatus=="off"){
   if(!(document.getElementById('r_name').value)||!(document.getElementById('tell').value)||!(document.getElementById('r_num').value)){
    err = true;
    alert('入力されていない箇所があります');
   }
 }
// if(document.getElementById('month').value==m){
// 	if(document.getElementById('day').value<d){
// 		err = true;
// 		alert('日付を確認してください');
// 	}
// }
// if(document.getElementById('month').value>m){
// 	if(document.getElementById('day').value>=d){
// 		err = true;
// 		alert('日付を確認してください');
// 	}
// }
// if(document.getElementById('year').value==y){
// 	if(document.getElementById('month').value==1){
// 		err = true;
// 		alert('日付を確認してください');
// 	}
// }
if(Number(document.getElementById('rental_h').value)>Number(document.getElementById('return_h').value)){
		err = true;
		alert('時間を確認してください');
}
if(document.getElementById('rental_h').value==document.getElementById('return_h').value&&
  document.getElementById('rental_m').value==document.getElementById('return_m').value){
    err = true;
    alert('時間を確認してください');
}
if(document.getElementById('name').value==document.getElementById('equip1').value||
  document.getElementById('name').value==document.getElementById('equip2').value||
  document.getElementById('name').value==document.getElementById('equip3').value||
  document.getElementById('name').value==document.getElementById('equip4').value||
  document.getElementById('name').value==document.getElementById('equip5').value||
  (document.getElementById('equip1').value) && document.getElementById('equip1').value==document.getElementById('equip2').value||
  (document.getElementById('equip1').value) && document.getElementById('equip1').value==document.getElementById('equip3').value||
  (document.getElementById('equip1').value) && document.getElementById('equip1').value==document.getElementById('equip4').value||
  (document.getElementById('equip1').value) && document.getElementById('equip1').value==document.getElementById('equip5').value||
  (document.getElementById('equip2').value) && document.getElementById('equip2').value==document.getElementById('equip3').value||
  (document.getElementById('equip2').value) && document.getElementById('equip2').value==document.getElementById('equip4').value||
  (document.getElementById('equip2').value) && document.getElementById('equip2').value==document.getElementById('equip5').value||
  (document.getElementById('equip3').value) && document.getElementById('equip3').value==document.getElementById('equip4').value||
  (document.getElementById('equip3').value) && document.getElementById('equip3').value==document.getElementById('equip5').value||
  (document.getElementById('equip4').value) && document.getElementById('equip4').value==document.getElementById('equip5').value){
    err = true;
    alert('同じ備品が選択されています');
}

 //エラーを確認
 if(err){
 	return false;
 }else{
 	var name=document.getElementById('name').value
  var equip1=document.getElementById('equip1').value
  var equip2=document.getElementById('equip2').value
  var equip3=document.getElementById('equip3').value
  var equip4=document.getElementById('equip4').value
  var equip5=document.getElementById('equip5').value
 	var r_num=document.getElementById('r_num').value
  var r_num1=document.getElementById('r_num1').value
  var r_num2=document.getElementById('r_num2').value
  var r_num3=document.getElementById('r_num3').value
  var r_num4=document.getElementById('r_num4').value
  var r_num5=document.getElementById('r_num5').value
 	var rental_at=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+document.getElementById('rental_h').value+':'+document.getElementById('rental_m').value
  var return_at=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+document.getElementById('return_h').value+':'+document.getElementById('return_m').value
 	var email=document.getElementById('email').value
  var g_name=document.getElementById('g_name').value
 	var r_name=document.getElementById('r_name').value
 	var tell=document.getElementById('tell').value
  var katudo_naiyo=document.getElementById('katudo_naiyo').value
  var place=document.getElementById('place').value
  
  if(gon.signstatus=="on"){
    if(gon.user_info.logtype=="member"){
      r_name=gon.user_info.macname
      tell=gon.user_info.tell
      email=gon.user_info.name
    }else{
      email="受付での申請"
    }
  }

  var equipment_ids=[name,equip1,equip2,equip3,equip4,equip5]
  var rnum=[r_num,r_num1,r_num2,r_num3,r_num4,r_num5]
  for(n=0;n<=5;n++){
    if(rnum[n]==""){
      delete rnum[n];
      delete equipment_ids[n];
      n-=1;
    }
  }
  // for(n=0;n<gon.equipcount;n++){
  //   if(name==gon.allequip[n].name){
  //     name=gon.allequip[n].id
  //   }
  //   if(equip1==gon.allequip[n].name){
  //     equip1=gon.allequip[n].id
  //   }
  //   if(equip2==gon.allequip[n].name){
  //     equip2=gon.allequip[n].id
  //   }
  //   if(equip3==gon.allequip[n].name){
  //     equip3=gon.allequip[n].id
  //   }
  //   if(equip4==gon.allequip[n].name){
  //     equip4=gon.allequip[n].id
  //   }
  //   if(equip5==gon.allequip[n].name){
  //     equip5=gon.allequip[n].id
  //   }
  // }
  // equipment_ids=[name,equip1,equip2,equip3,equip4,equip5]

  // alert(equipment_ids);
 	$.ajax({
        url: '/uketuke1_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'POST',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          // name: name,
          equipment_ids: equipment_ids,
          // r_num: r_num,
          email: email,
          rnum_ids: rnum,
          rental_at: rental_at,
          return_at: return_at,
          g_name: g_name,
          r_name: r_name,
          tell: tell,
          katudo_naiyo: katudo_naiyo,
          place: place,
          email: email,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()



 }
}

// 備品要望書
function youbousyo(){
  var name=document.getElementById('equip').value
  var r_num=document.getElementById('r_num').value
  var rental_at=document.getElementById('rental_year').value+'/'+document.getElementById('rental_month').value+'/'+document.getElementById('rental_day').value+' '+document.getElementById('rental_h').value+':'+document.getElementById('rental_m').value
  var return_at=document.getElementById('return_year').value+'/'+document.getElementById('return_month').value+'/'+document.getElementById('return_day').value+' '+document.getElementById('return_h').value+':'+document.getElementById('return_m').value
  var no_text=document.getElementById('no_text').value
  var g_name=document.getElementById('g_name').value
  var r_name=document.getElementById('r_name').value
  var tell=document.getElementById('tell').value
  // var kyoka=document.getElementById('kyoka').value
  var kasidasi=""
  var henkyaku=""
        $.ajax({
        url: '/uketuke5_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'POST',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          name: name,
          r_num: r_num,
          rental_at: rental_at,
          return_at: return_at,
          no_text: no_text,
          g_name: g_name,
          r_name: r_name,
          tell: tell,
          // kyoka: kyoka,
          kasidasi: kasidasi,
          henkyaku: henkyaku,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()



 }




// 音楽練習室ーーーーーーーーーーーーーー
function musicroom(){
  var i=1;
  var min=100;
  var max=1;
  var rental;
  var retur;
jQuery('input:checked').each(function() {
        var r = jQuery(this).val();
        var jjmin=r.slice(1);
        var jmin=parseInt(jjmin);
        if(jmin<min){
          rental=r;
          min=jmin;
        }
        var jjmax=r.slice(1);
        var jmax=parseInt(jjmax);
        if(jmax>=max){
          retur=r;
          max=jmax
        }

})


  


 var err = false;
 var dt = new Date();
 var y = dt.getFullYear();
 var m = dt.getMonth()+1;
 var d = dt.getDate();
 var h = dt.getHours();
 var min = dt.getMinutes();
 var s = dt.getSeconds();


 //必要箇所が入力されているかチェック
 if(!(document.getElementById('g_name').value)||!(document.getElementById('katudo_num').value)||!(document.getElementById('katudo_naiyo').value)){　
  err = true;
  alert('入力されていない箇所があります');
 }
 if(gon.signstatus=="off"){
   if(!(document.getElementById('r_name').value)||!(document.getElementById('tell').value)||!(document.getElementById('r_num').value)){
    err = true;
    alert('入力されていない箇所があります');
   }
 }

 if(err){
  return false;
 }else{
  var g_name=document.getElementById('g_name').value
  var r_name=document.getElementById('r_name').value
  var tell=document.getElementById('tell').value
  var email=document.getElementById('email').value
  var katudo_num=document.getElementById('katudo_num').value
  var katudo_naiyo=document.getElementById('katudo_naiyo').value

  var rentalr=rental.slice(0,1);
  if(rentalr=='a'){var room='音楽練習室A'}
  if(rentalr=='b'){var room='音楽練習室B'}
  if(rentalr=='c'){var room='音楽練習室C'}
  if(rentalr=='d'){var room='音楽練習室D'}
  if(rentalr=='e'){var room='音楽練習室E'}
  if(rentalr=='f'){var room='音楽練習室F'}
  if(rentalr=='g'){var room='音楽練習室G'}

  var rentala=rental.slice(1);
  if(rentala==1){var rental_at='09:00'}
  if(rentala==2){var rental_at='09:30'}
  if(rentala==3){var rental_at='10:00'}
  if(rentala==4){var rental_at='10:30'}
  if(rentala==5){var rental_at='11:00'}
  if(rentala==6){var rental_at='11:30'}
  if(rentala==7){var rental_at='12:00'}
  if(rentala==8){var rental_at='12:30'}
  if(rentala==9){var rental_at='13:00'}
  if(rentala==10){var rental_at='13:30'}
  if(rentala==11){var rental_at='14:00'}
  if(rentala==12){var rental_at='14:30'}
  if(rentala==13){var rental_at='15:00'}
  if(rentala==14){var rental_at='15:30'}
  if(rentala==15){var rental_at='16:00'}
  if(rentala==16){var rental_at='16:30'}
  if(rentala==17){var rental_at='17:00'}
  if(rentala==18){var rental_at='17:30'}
  if(rentala==19){var rental_at='18:00'}
  if(rentala==20){var rental_at='18:30'}
  if(rentala==21){var rental_at='19:00'}
  if(rentala==22){var rental_at='19:30'}
  if(rentala==23){var rental_at='20:00'}
  var rental_atat=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+rental_at;

  var returna=retur.slice(1);
  if(returna==1){var return_at='09:30'}
  if(returna==2){var return_at='10:00'}
  if(returna==3){var return_at='10:30'}
  if(returna==4){var return_at='11:00'}
  if(returna==5){var return_at='11:30'}
  if(returna==6){var return_at='12:00'}
  if(returna==7){var return_at='12:30'}
  if(returna==8){var return_at='13:00'}
  if(returna==9){var return_at='13:30'}
  if(returna==10){var return_at='14:00'}
  if(returna==11){var return_at='14:30'}
  if(returna==12){var return_at='15:00'}
  if(returna==13){var return_at='15:30'}
  if(returna==14){var return_at='16:00'}
  if(returna==15){var return_at='16:30'}
  if(returna==16){var return_at='17:00'}
  if(returna==17){var return_at='17:30'}
  if(returna==18){var return_at='18:00'}
  if(returna==19){var return_at='18:30'}
  if(returna==20){var return_at='19:00'}
  if(returna==21){var return_at='19:30'}
  if(returna==22){var return_at='20:00'}
  if(returna==23){var return_at='20:30'}
  var return_atat=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+return_at;

  if(gon.signstatus=="on"){
    if(gon.user_info.logtype=="member"){
      r_name=gon.user_info.macname
      tell=gon.user_info.tell
      email=gon.user_info.name
    }else{
      email="受付での申請"
    }
  }

  $.ajax({
        url: '/uketuke2_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'POST',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          room: room,
          rental_at: rental_atat,
          return_at: return_atat,
          g_name: g_name,
          r_name: r_name,
          tell: tell,
          email: email,
          katudo_naiyo: katudo_naiyo,
          katudo_num: katudo_num,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()




 }
}






// 会議室等ーーーーーーーーーーーーーーーー
function meetingroom(){
  var i=1;
  var min=100;
  var max=1;
  var rental;
  var retur;
jQuery('input:checked').each(function() {
        var r = jQuery(this).val();
        var jjmin=r.slice(1);
        var jmin=parseInt(jjmin);
        if(jmin<min){
          rental=r;
          min=jmin;
        }
        var jjmax=r.slice(1);
        var jmax=parseInt(jjmax);
        if(jmax>=max){
          retur=r;
          max=jmax
        }

})

  


 var err = false;
 var dt = new Date();
 var y = dt.getFullYear();
 var m = dt.getMonth()+1;
 var d = dt.getDate();
 var h = dt.getHours();
 var min = dt.getMinutes();
 var s = dt.getSeconds();


 //必要箇所が入力されているかチェック
 if(!(document.getElementById('g_name').value)||!(document.getElementById('katudo_num').value)||!(document.getElementById('katudo_naiyo').value)){　
  err = true;
  alert('入力されていない箇所があります');
 }
 if(gon.signstatus=="off"){
   if(!(document.getElementById('r_name').value)||!(document.getElementById('tell').value)||!(document.getElementById('r_num').value)){
    err = true;
    alert('入力されていない箇所があります');
   }
 }

 if(err){
  return false;
 }else{
  var g_name=document.getElementById('g_name').value
  var r_name=document.getElementById('r_name').value
  var tell=document.getElementById('tell').value
  var email=document.getElementById('email').value
  var katudo_num=document.getElementById('katudo_num').value
  var katudo_naiyo=document.getElementById('katudo_naiyo').value

  var rentalr=rental.slice(0,1);
  if(rentalr=='a'){var room='会議室１'}
  if(rentalr=='b'){var room='会議室２'}
  if(rentalr=='c'){var room='会議室３'}
  if(rentalr=='d'){var room='和室'}
  if(rentalr=='e'){var room='厨房'}

  var rentala=rental.slice(1);
  if(rentala==1){var rental_at='09:00'}
  if(rentala==2){var rental_at='09:30'}
  if(rentala==3){var rental_at='10:00'}
  if(rentala==4){var rental_at='10:30'}
  if(rentala==5){var rental_at='11:00'}
  if(rentala==6){var rental_at='11:30'}
  if(rentala==7){var rental_at='12:00'}
  if(rentala==8){var rental_at='12:30'}
  if(rentala==9){var rental_at='13:00'}
  if(rentala==10){var rental_at='13:30'}
  if(rentala==11){var rental_at='14:00'}
  if(rentala==12){var rental_at='14:30'}
  if(rentala==13){var rental_at='15:00'}
  if(rentala==14){var rental_at='15:30'}
  if(rentala==15){var rental_at='16:00'}
  if(rentala==16){var rental_at='16:30'}
  if(rentala==17){var rental_at='17:00'}
  if(rentala==18){var rental_at='17:30'}
  if(rentala==19){var rental_at='18:00'}
  if(rentala==20){var rental_at='18:30'}
  if(rentala==21){var rental_at='19:00'}
  if(rentala==22){var rental_at='19:30'}
  if(rentala==23){var rental_at='20:00'}
  var rental_atat=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+rental_at;

  var returna=retur.slice(1);
  if(returna==1){var return_at='09:30'}
  if(returna==2){var return_at='10:00'}
  if(returna==3){var return_at='10:30'}
  if(returna==4){var return_at='11:00'}
  if(returna==5){var return_at='11:30'}
  if(returna==6){var return_at='12:00'}
  if(returna==7){var return_at='12:30'}
  if(returna==8){var return_at='13:00'}
  if(returna==9){var return_at='13:30'}
  if(returna==10){var return_at='14:00'}
  if(returna==11){var return_at='14:30'}
  if(returna==12){var return_at='15:00'}
  if(returna==13){var return_at='15:30'}
  if(returna==14){var return_at='16:00'}
  if(returna==15){var return_at='16:30'}
  if(returna==16){var return_at='17:00'}
  if(returna==17){var return_at='17:30'}
  if(returna==18){var return_at='18:00'}
  if(returna==19){var return_at='18:30'}
  if(returna==20){var return_at='19:00'}
  if(returna==21){var return_at='19:30'}
  if(returna==22){var return_at='20:00'}
  if(returna==23){var return_at='20:30'}
  var return_atat=document.getElementById('year').value+'/'+document.getElementById('month').value+'/'+document.getElementById('day').value+' '+return_at;

  if(gon.signstatus=="on"){
    if(gon.user_info.logtype=="member"){
      r_name=gon.user_info.macname
      tell=gon.user_info.tell
      email=gon.user_info.name
    }else{
      email="受付での申請"
    }
  }

  $.ajax({
        url: '/uketuke3_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'POST',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          room: room,
          rental_at: rental_atat,
          return_at: return_atat,
          g_name: g_name,
          r_name: r_name,
          tell: tell,
          email: email,
          katudo_naiyo: katudo_naiyo,
          katudo_num: katudo_num,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()




 }
}






// その他施設ーーーーーーーーーーーーーーーーーーーー

//備品の許可----------------------------
function bihinkyoka(){
  var err = false;
  if(!(document.getElementById('kyoka').value)||!$('input[name="kasidasi"]:checked').val()){　
    err = true;
    alert('入力されていない箇所があります');
  }
  if(err){
    return false;
  }else{

  var kyoka=document.getElementById('kyoka').value;
  var id=document.getElementById('id').value;
  var no_text=document.getElementById('no_text').value;
  var kasidasi=$('input[name="kasidasi"]:checked').val();
  if(kasidasi=="now"){
    kasidasi=kyoka;
  }else{
    kasidasi="";
  }
  // alert(kasidasi);


        $.ajax({
        url: '/kyokuin2_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'PATCH',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          kyoka: kyoka,
          kasidasi: kasidasi,
          id: id,
          no_text: no_text,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()
 }
}

 // 施設の許可ーーーーーーーーーーーーーーーーー
 function sisetukyoka(){
  var err = false;
  if(!(document.getElementById('kyoka').value)||!$('input[name="kasidasi"]:checked').val()){　
    err = true;
    alert('入力されていない箇所があります');
  }
  if(err){
    return false;
  }else{

  var kyoka=document.getElementById('kyoka').value;
  var id=document.getElementById('id').value;
  var kasidasi=$('input[name="kasidasi"]:checked').val();
  if(kasidasi=="now"){
    kasidasi=kyoka;
  }else{
    kasidasi="";
  }
  // alert(kasidasi);


        $.ajax({
        url: '/kyokuin3_create',  
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'PATCH',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          kyoka: kyoka,
          kasidasi: kasidasi,
          id: id,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()
 }
}






// 備品要望書
function addinfomation(){
  var date=document.getElementById('date').value
  var title=document.getElementById('title').value
  var content=document.getElementById('content').value
  var text=document.getElementById('text').value
  badgelist=[]
  for(i=1;i<10;i++){
    console.log("okok")
    try {
      if(document.getElementById('badgelist'+i).checked){
        badgelist.push(document.getElementById('badgelist'+i).value)
      }
    } catch (error) {
      // console.error(error);
      break;
    }
  }
  badgelist = JSON.stringify(badgelist)
  var account = gon.account
  var classifi = gon.type

  console.log(date)
  console.log(title)
  console.log(content)
  console.log(badgelist)
  console.log(classifi)
  console.log(account)



        $.ajax({
        url: '/gakuyu_info1_create',
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'POST',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          date: date,
          title: title,
          content: content,
          text: text,
          badgelist: badgelist,
          classifi: classifi,
          account: account,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()
 }


 // 備品要望書
function editinfomation(){
  var id=document.getElementById('id').value
  var date=document.getElementById('date').value
  var title=document.getElementById('title').value
  var content=document.getElementById('content').value
  var text=document.getElementById('text').value
  badgelist=[]
  for(i=1;i<10;i++){
    console.log("okok")
    try {
      if(document.getElementById('badgelist'+i).checked){
        badgelist.push(document.getElementById('badgelist'+i).value)
      }
    } catch (error) {
      // console.error(error);
      break;
    }
  }
  badgelist = JSON.stringify(badgelist)
  var account = gon.account
  var classifi = gon.type

  console.log(date)
  console.log(title)
  console.log(content)
  console.log(badgelist)
  console.log(classifi)
  console.log(account)



        $.ajax({
        url: '/gakuyu_info_update.'+id,
// 　　　　　#itimon_ittousコントローラーのupdateアクションへのパス。
        type: 'PATCH',
// 　　　　　# getかpostか選択
        dataType: 'html',
// 　　　　　# htmlやjsonなど形式を選択。
        data: {
          date: date,
          title: title,
          content: content,
          text: text,
          badgelist: badgelist,
          classifi: classifi,
          account: account,
        },
// 　　　　　# 渡したいパラメータを定義。
      });
      $('form').submit()
 }
