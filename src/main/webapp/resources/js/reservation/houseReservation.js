function setTotalPrice(){
	$('#totalPrice').text(0);
	$('.price').each(function(index){
		if($('.selectRoom').eq(index).is(":checked")){
			$('#totalPrice').text(
				parseInt($('#totalPrice').text()) + parseInt($('.price').eq(index).val())		
			)
		}
	});
}

$(function(){
		
		$('.selectRoom').each(function(index) {
			$(this).click(function() {
								
				if($('.selectRoom').eq(index).is(":checked")){
					var roomNo = $('.selectRoom').eq(index).val();
					var day = $('.day').eq(index).val();
					var resDate = $('.datepicker').val();
					$.ajax({
						url : '/Yolowa/menu/ableRoomDay.do',
						type : 'post',
						data : {
							'resDate' : resDate,
							'roomNo' : roomNo,
							'day' : day
						},
						contentType : 'application/x-www-form-urlencoded; charset=utf-8',
						async: false,
						success : function(data){
							if(data!=''){
								alert(data);
								$('.day').eq(index).val('1');
							}
						}
					});
					var add;
					if(parseInt($('.peopleNumber').eq(index).val()) <= parseInt($('.min').eq(index).text())) add = 0;
					else add = parseInt($('.peopleNumber').eq(index).val()) - parseInt($('.min').eq(index).text());
					
					$('.price').eq(index).val(
						(parseInt($('.priceInfo').eq(index).text()) * parseInt($('.day').eq(index).val())) + (add * parseInt($('.overPrice').eq(index).text()))
					);
					
					setTotalPrice();
				} else {
					$('.price').eq(index).val(0);
					setTotalPrice();
				}
			});
		});
	
		$('.day').each(function(index) {
			$(this).change(function() {
				if($('.selectRoom').eq(index).is(":checked")){
					
					var roomNo = $('.selectRoom').eq(index).val();
					var day = $('.day').eq(index).val();
					var resDate = $('.datepicker').val();
					$.ajax({
						url : '/Yolowa/menu/ableRoomDay.do',
						type : 'post',
						data : {
							'resDate' : resDate,
							'roomNo' : roomNo,
							'day' : day
						},
						contentType : 'application/x-www-form-urlencoded; charset=utf-8',
						async: false,
						success : function(data){
							if(data!=''){
								alert(data);
								$('.day').eq(index).val('1');
							}
						}
					});
					var add;
					if(parseInt($('.peopleNumber').eq(index).val()) <= parseInt($('.min').eq(index).text())) add = 0;
					else add = parseInt($('.peopleNumber').eq(index).val()) - parseInt($('.min').eq(index).text());
					
					$('.price').eq(index).val(
						(parseInt($('.priceInfo').eq(index).text()) * parseInt($('.day').eq(index).val())) + (add * parseInt($('.overPrice').eq(index).text()))
					);
					
					setTotalPrice();
					
					
				}
			});
		});

		$('.peopleNumber').each(function(index) {
			$(this).change(function() {
				if($('.selectRoom').eq(index).is(":checked")){
					var add;
					if(parseInt($('.peopleNumber').eq(index).val()) <= parseInt($('.min').eq(index).text())) add = 0;
					else add = parseInt($('.peopleNumber').eq(index).val()) - parseInt($('.min').eq(index).text());
					
					$('.price').eq(index).val(
						(parseInt($('.priceInfo').eq(index).text()) * parseInt($('.day').eq(index).val()))  + (add * parseInt($('.overPrice').eq(index).text()))
					);
					
					setTotalPrice();
				}
			});
		});
		
	});