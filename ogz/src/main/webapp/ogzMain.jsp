<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘이 가기전에...</title>
   <link href="https://fonts.googleapis.com/css?family=Gaegu&amp;subset=korean" rel="stylesheet">
   <script src="http://code.jquery.com/jquery-latest.js"></script> 
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1eabe17542beb0357c4a00f8b3e1a5b6&libraries=services"></script>

   <script>
      $(document).ready( function() {
         
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 4 // 지도의 확대 레벨
          };  

         // 지도를 생성합니다    
         var map = new daum.maps.Map(mapContainer, mapOption); 
   
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new daum.maps.services.Geocoder();
         
         $.ajax({
            url : '/ogz/showStores.do',
            type : 'POST',
            dataType : "json",
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success:function(data) {
               var output = "";
               $('#print_Store').html('');
                  $.each(data, function(index, store) {
                     
                     // 주소로 좌표를 검색합니다
                     geocoder.addressSearch(store.sAddress, function(result, status) {
               
                         // 정상적으로 검색이 완료됐으면 
                          if (status === daum.maps.services.Status.OK) {
               
                             var coords = new daum.maps.LatLng(result[0].y, result[0].x);
               
                             // 결과값으로 받은 위치를 마커로 표시합니다
                             var marker = new daum.maps.Marker({
                                 map: map,
                                 position: coords
                             });
               
                             // 인포윈도우로 장소에 대한 설명을 표시합니다
                             var infowindow = new daum.maps.InfoWindow({
                                 content: '<div style="width:150px;text-align:center;padding:3px 0;font-size:10px;">'+store.sName + '</div>'
                             });
                             
                             infowindow.open(map, marker);
                           
                             // 마커에 클릭이벤트를 등록합니다
                            daum.maps.event.addListener(marker, 'click', function() {
                                  // 마커 위에 인포윈도우를 표시합니다
                                  
//                                   console.log(typeof(store.sName));
                                  searchStore(store.sId);
                                 
                            });
                             
//                              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
//                              map.setCenter(coords);
                         } 
                     });    
                  });
                  
                  $('#print_Store').html(output);
//                   console.log(output);
               },
               error:function() {
                  alert("새로고침을 눌러주세요.");         
               }
         });
         
         

         // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
         if (navigator.geolocation) {
             
             // GeoLocation을 이용해서 접속 위치를 얻어옵니다
             navigator.geolocation.getCurrentPosition(function(position) {
                 
//                  var lat = position.coords.latitude, // 위도
//                      lon = position.coords.longitude; // 경도
                             
                     //한양대 고정
                    var lat = 37.5548856;
                     lon = 127.047178;
                 
                 var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                     message = '<div style="padding:5px;font-size:10px;">내 주변 할인상품 보기</div>'; // 인포윈도우에 표시될 내용입니다
                 
                 // 마커와 인포윈도우를 표시합니다
                 displayMarker(locPosition, message, map, lat, lon);
                     
               });
             
         } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
             
             var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
                 message = 'geolocation을 사용할수 없어요..'
                 
             displayMarker(locPosition, message, map);
         }
         
         
         $('#go_find').on('click', function() {
            if($('#find_city').val()=="" && $('#find_item').val()=="") {
               alert("검색 카테고리를 입력하세요");
            }
            else {
               $.ajax({
                  url : '/ogz/findItems.do',
                  type : 'POST',
                  dataType : "json",
                  contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                  data : {
                     "sAddress" : $('#find_city').val(),
                     "iName" : $('#find_item').val()
                  },
                  success:function(data) {
                     var output = "";
                     $('#show_items').html('');
            
                     $.each(data, function(index, item) {            
                        output += '<tr>';
                        output += '<td>' + item.iName + '</td>';
                        output += '<td>' + item.salePrice + "/" + item.iPrice+ '</td>';
                        output += '<td>' + item.limitTime + '</td></tr>';
                     });
                     
                        $('#show_items').html(output);
//                         console.log(output);
                     },
                     error:function() {
                        alert("새로고침을 눌러주세요.");         
                     }
               });
               
            }
            
         });
         
      });
      
      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message, map, lat, lon) {

          // 마커를 생성합니다
          var marker = new daum.maps.Marker({  
              map: map, 
              position: locPosition
          }); 
          
          var iwContent = message, // 인포윈도우에 표시할 내용
              iwRemoveable = true;

          // 인포윈도우를 생성합니다
          var infowindow = new daum.maps.InfoWindow({
              content : iwContent,
              removable : iwRemoveable
          });
          
          // 인포윈도우를 마커위에 표시합니다 
          var info = infowindow.open(map, marker);
          
          var flag = 0;
          // 마커에 클릭이벤트를 등록합니다
          var circle = new daum.maps.Circle();
         daum.maps.event.addListener(marker, 'click', function() {
             // 마커 위에 인포윈도우를 표시합니다
             flag = flag+1;
             searchMyPlace(map, lat, lon, flag, circle);
         });
          
          setTimeout(function() {
             // 지도 중심좌표를 접속위치로 변경합니다
             map.setCenter(locPosition);   
         }, 2000);
   
      };
      
      function searchStore(sId) {
         $.ajax({
            url : '/ogz/showItemForStore.do',
            type : 'POST',
            dataType : "json",
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            data : {
               "sId" : sId
            },
            success:function(data) {
               var output = "";
               $('#show_items').html('');
      
               $.each(data, function(index, item) {            
                  output += '<tr>';
                  output += '<td>' + item.iName + '</td>';
                  output += '<td>' + item.salePrice + " / " + item.iPrice+ '</td>';
                  output += '<td>' + item.limitTime + '</td></tr>';
               });
               
                  $('#show_items').html(output);
//                   console.log(output);
               },
               error:function() {
                  alert("새로고침을 눌러주세요.");         
               }
         });
      }
      
      function searchMyPlace(map, lat, lon, flag, circle) {
          $.ajax({
            url : '/ogz/showMyPlace.do',
            type : 'POST',
            dataType : "json",
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            data : {
               "lat" : lat,
               "lng" : lon
            },
            success:function(data) {
               var output = "";
               $('#show_items').html('');
               $('#countStore').html("검색된 편의점 갯수는 " + data.cnt +" 곳이고 검색된 상품 갯수는 " + data.list.length + " 개 입니다.");
               $.each(data.list, function(index, item) {
                  output += '<tr>';
                  output += '<td>' + item.iName + '</td>';
                  output += '<td>' + item.salePrice + " / " + item.iPrice + '</td>';
                  output += '<td>' + item.limitTime + '</td>';
                  output += '<td>' + item.sName + '</td></tr>';

               });
               
               
               
               if(flag%2 == 1) {
                  
                  // 지도에 표시할 원을 생성합니다
                  circle.setOptions({
                      center : new daum.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
                      radius: 500, // 미터 단위의 원의 반지름입니다 
                      strokeWeight: 5, // 선의 두께입니다 
                      strokeColor: '#75B8FA', // 선의 색깔입니다
                      strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                      strokeStyle: 'dashed', // 선의 스타일 입니다
                      fillColor: '#CFE7FF', // 채우기 색깔입니다
                      fillOpacity: 0.3  // 채우기 불투명도 입니다   
                  });
                  
               }
               else {
                  // 지도에 표시할 원을 생성합니다
                  circle.setOptions({
                      radius: 0, // 미터 단위의 원의 반지름입니다 
                      strokeWeight: 0, // 선의 두께입니다 
                      strokeColor: '#75B8FA', // 선의 색깔입니다
                      strokeOpacity: 0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                      strokeStyle: 'dashed', // 선의 스타일 입니다
                      fillColor: '#CFE7FF', // 채우기 색깔입니다
                      fillOpacity: 0  // 채우기 불투명도 입니다   
                  });
               }
               flag = flag+1;
               console.log(flag);
               
               // 지도에 원을 표시합니다 
               circle.setMap(map); 

               
                  $('#show_items').html(output);
//                   console.log(output);
               },
               error:function() {
                  alert("새로고침을 눌러주세요.");         
               }
         });
      }
      
   </script>
   
</head>
<body>

<div id="map" style="width:100%;height:500px;"></div>
<div id="countStore"></div>
<div align="center">
   <br><br>
   <br><br>
   <table border="1" class="type09">
      <thead>
         <tr>
            <th scope="cols">상품명</th>
            <th scope="cols">세일가격/정상가</th>
            <th scope="cols">남은 시간</th>
         </tr>
      </thead>
      
      <tbody id="show_items">
      
      </tbody>
   </table>
</div>
</body>

<style>
table.type09 {
   font-family: "Gaegu", sans-serif;
   width:80%;
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    background: #f3f6f7;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type09 tr:hover{
   background: #f3f6f7;
}
</style>
</html>