function func(date,name,country,genre,director,preview,image,time,actor,no,abc){
		
		
		$('#no').val(no);
		$('#actor').val(actor);
		$('#time').val(time);
		$('#date').val(date);
        $('.name').val(name);
        $('#country').val(country);
        $('#genre').val(genre);
        $('#director').val(director);
        $('#preview').val(preview);
       
        //수정하기 모달에 값을 넘기는 방법 
        
        
        $('#modalbox').modal('show');
		// 그뒤 모달을 띄워줌	
	};


function chkData(){
	
	

	frm2.submit();
}


function updateData(){
	
	
	
	
	frm3.submit();
}
