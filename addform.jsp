<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
function add(){
	var formdata = $('#addform').serialize();
	$.ajax({
		url:'/book/add',
		method:'post',
		data:formdata,
		dataType:'json',
		cache:false,
		success:function(res) {
			alert(res.added ? '도서정보 저장 성공':'도서정보 저장 실패');
			if(res.added) location.href='/book/list/page/3';
		},
		error:function(xhr,status,err) {
			alert('에러:' + err);
		}
	});
	return false;
}
</script>
<title>아동 도서 목록 추가</title>
</head>
<body>
<h1>아동 도서 목록 추가</h1>
<form id="addform" action="/book/add" method="post" onsubmit="return add();">
    <div>
        <label for="title">도서명</label>
        <input type="text" id="bname" name="bname">
    </div>
    <div>
        <label for="price">가격</label>
        <input type="text" id="price" name="price">
    </div>
    <div>
        <label for="img">이미지</label>
        <input type="file" id="img" name="img">
    </div>

    <div>
        <button type="submit">추가</button>
        <button type="reset">취소</button>
    </div>
</form>
</body>
</html>