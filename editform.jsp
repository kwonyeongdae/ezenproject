<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
function update() {
    var formdata = new FormData($('#update')[0]); // 수정된 부분

    if (!confirm("수정 할까요?")) return;

    $.ajax({
        url: '/admin/update',
        method: 'post',
        cache: false,
        data: formdata,
        dataType: 'json',
        processData: false, // 데이터를 처리하지 않도록 설정
        contentType: false, // 컨텐츠 타입을 설정하지 않도록 설정
        success: function (res) {
            alert(res.update ? '수정완료' : '수정 실패'); 
            location.href = "/admin/adbooklist/1"; 
        },
        error: function (xhr, status, err) {
            alert('에러:' + err);
        }
    });

    return false;
}
function handleImageSelect(event) {
    var input = event.target;
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#img-preview').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(document).ready(function () {
    $('#img-file').on('change', handleImageSelect);
});



</script>

<style type="text/css">
table {
    width:80%;
    border-collapse: collapse;
    margin-top: 20px;
   
  }
  table th, table td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: center;
  }
  table th {
    background-color: #f7f7f7;
  }



</style>




</head>
<body>
<form  id="update" action="/admin/update" method="post" onsubmit="javascript:update()">
    <input type="hidden" name="bnum" value="${book[0].bnum}">
    <table>
        <tr>
            <th>번호</th>
            <td>${book[0].bnum}</td>
        </tr>
        <tr>
            <th>책명</th>
            <td><input type="text" id="bname" name="bname" value="${book[0].bname}" readonly></td>
        </tr>
        <tr>
            <th>출판사</th>
            <td><input type="text" id="publisher" name="publisher" value="${book[0].publisher}" readonly></td>
        </tr>
        <tr>
            <th>저자</th>
            <td><input type="text" id="author" name="author" value="${book[0].author}" readonly></td>
        </tr>
        <tr>
            <th>가격</th>
            <td><input type="text" id="price" name="price" value="${book[0].price}"></td>
        </tr>
        <tr>
            <th>이미지</th>
            <td>
                <img id="img-preview" src="/img/${book[0].cvrimg}" alt="이미지 미리보기" style="max-width: 200px; max-height: 200px;">
            
            </td>
        </tr>
        
        
    </table>
    <input type="submit" value="수정">
</form>
</body>
</html>