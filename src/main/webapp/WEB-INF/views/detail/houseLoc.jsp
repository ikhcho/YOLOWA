<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var map = null;
$(document).on('click','#mapBtn',function(){
	var myaddress = '${houseVO.addr}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		naver.maps.Service.geocode({address: myaddress}, function(status, response) {
	    if (status !== naver.maps.Service.Status.OK) {
	    	return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
	    }
	
	    var result = response.result;
	    
	    //map = new naver.maps.Map('map');
	    	    
	    map = new naver.maps.Map('map', {
	    	center: new naver.maps.LatLng(parseDouble(result.items[0].point.x), parseDouble(result.items[0].point.y)),
        	zoom: 10
	    });// 검색된 좌표로 지도 생성 
	    
		// 검색 결과 갯수: result.total
	    // 첫번째 결과 결과 주소: result.items[0].address
	    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
	    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
	    			    
	    //map.setCenter(myaddr); // 검색된 좌표로 지도 이동
	    
	    // 마커 표시
	    var marker = new naver.maps.Marker({
			position: myaddr,
			map: map
		});
	});
});
</script>