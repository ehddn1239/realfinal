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

function _class(name){
	  return document.getElementsByClassName(name);
	}

	let tabPanes = _class("tab-header")[0].getElementsByTagName("div");

	for(let i=0;i<tabPanes.length;i++){
	  tabPanes[i].addEventListener("click",function(){
	    _class("tab-header")[0].getElementsByClassName("active")[0].classList.remove("active");
	    tabPanes[i].classList.add("active");
	    
	    _class("tab-indicator")[0].style.top = `calc(80px + ${i*50}px)`;
	    
	    _class("tab-content")[0].getElementsByClassName("active")[0].classList.remove("active");
	    _class("tab-content")[0].getElementsByTagName("div")[i].classList.add("active");
	    
	  });
	}
	
