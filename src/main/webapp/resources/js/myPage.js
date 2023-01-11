function checkReq(req, id) {
	if(req == 0){
		location.href="requestSeller.go?a_id="+ id;
		return true;
	}else if(req == 1){
		alert('신청 진행 중 입니다.');
		return false;
	}else{
		alert('이미 판매자 등록이 완료 되었습니다.')
		return false;
	}
}
//삭제 확인
function deleteInfo(id) {
	if(confirm('계정을 삭제 하시겠습니까?')){
		location.href="deleteInfo.do?a_id="+id;
		return true;
	}else{
		return false;
	}
}
// 찜 목록 보이기
function showAllFavors(id) {
	
	location.href="showAllFavors.do?a_id="+id;
	
	
}