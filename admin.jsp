<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 화면</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
function logout(){
   if(!confirm('로그아웃할까요?')) return;
   
   $.ajax({
      url:'/fairy/logout',
      method:'get',
      cache:false,
      dataType:'json',
      success:function(res){
         alert(res.logout ? '로그아웃 되었습니다.\n다음에 또 만나요~^^':'로그아웃 실패\n관리자에게 문의 바랍니다.');
         if(res.logout) location.href="/fairy/";
      },
      error:function(xhr,status,err){
         alert('에러:'+err);
      }
   });
   
}

</script>
</head>
<body>
   <h2>관리자 화면(테스트용)</h2>
<!-- 일반 사용자 화면 -->
<c:if test="${!sessionScope.isAdmin}">

    <p>[<a href="/admin/list">매출관리</a>]</p>
    
    <p>[<a href="/admin/adbooklist/1" > 상품관리 </a>]
</c:if>

<!-- 관리자 화면 -->
<c:if test="${sessionScope.isAdmin}">
   
    <p>[<a href="/fairy/memlist">회원 목록</a>]</p>
     <div>
            
     [<a href="javascript:logout();">로그아웃</a>]
    </div>   
   
</c:if>
</body>
</html>
