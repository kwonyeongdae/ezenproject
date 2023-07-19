<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style type="text/css">
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f7f7f7;
  }
  header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
  }
  main {
    padding: 20px;
  }
  .container {
    border: 1px solid #ccc;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    width: 80%;
  }
  ul.tabs {
    margin: 0;
    padding: 0;
    list-style: none;
  }
  ul.tabs li {
    display: inline-block;
    background: #898989;
    color: white;
    padding: 10px 15px;
    cursor: pointer;
  }
  ul.tabs li.current {
    background: #e0e0e0;
    color: #222;
  }
  .tab-content {
    display: none;
    background: #e0e0e0;
    padding: 12px;
  }
  .tab-content.current {
    display: block;
  }
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
  #search {
    margin-top: 20px;
    display: flex;
    align-items: center;
  }
  #search label, #search select, #search input, #search button {
    margin-right: 10px;
  }
  #pagenation {
    margin-top: 20px;
    text-align: center;
  }
  #pagenation a {
    margin: 0 5px;
    padding: 5px 10px;
    border: 1px solid #ccc;
    text-decoration: none;
  }
  #pagenation span {
    margin: 0 5px;
    padding: 5px 10px;
    background-color: #e0e0e0;
    color: #222;
  }
        .floating-wrapper {
       
      position: fixed;
      right: 10px; /* 오른쪽 위치 조정 */
      top: 10px; /* 위쪽 위치 조정 */
      width: 200px; /* 플로팅 요소의 너비 */
      padding: 10px; /* 내부 여백 */
      background-color: #f1f1f1; /* 배경색 */
      border: 1px solid #ddd; /* 테두리 스타일 */
      border-radius: 5px; /* 테두리 둥글게 */
    }

    .floating-wrapper .item {
      margin-bottom: 10px; /* 각 요소 사이의 간격 */
    }

    .floating-wrapper .item img {
   max-width: 50%;
  max-height: 100px; /* 이미지의 최대 높이를 150px로 조정 */
  object-fit: contain; /* 이미지가 비율을 유지하면서 컨테이너에 맞게 조정되도록 함 */
    }
  
  
</style>
<script type="text/javascript">
$(document).ready(function(){
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');
    $(this).addClass('current');
    $("#" + tab_id).addClass('current');
  });
});


$(document).ready(function() {
	  var storedValues = JSON.parse(localStorage.getItem("myValues")) || [];
	  var $cookieValueWrapper = $("#cookieValueWrapper");
	  $cookieValueWrapper.empty();
		
	  console.log(storedValues);
	  
	  for (var i = storedValues.length - 1; i >= 0; i--) {
	    var value = storedValues[i];
	    var $itemWrapper = $("<div>").addClass("item");
	    var $valueElement = $("<div>").text(value.bname);
	    var $imageElement = $("<img>").attr("src", value.image);
	    var $linkElement = $("<a>").attr("href","/fairy/book/"+value.bnum);
	    

	    $linkElement.append($valueElement);
	    $linkElement.append($imageElement);
	    $itemWrapper.append($linkElement);
	    
	    $cookieValueWrapper.append($itemWrapper);
	    
	   // $cookieValueWrapper.append($valueElement);
	//    $cookieValueWrapper.append($imageElement);
	    
	  //  $cookieValueWrapper.append($itemWrapper);
	  }
	});



</script>
</head>
<body>
<main>
	<h3> 책 정보 </h3>
	<div class="container">
		<ul class="tabs">

				<li class="tab-link current" data-tab="tab-1">상품 카테고리</li>

				<li class="tab-link" data-tab="tab-2">문의하기</li>

				<li class="tab-link" data-tab="tab-3">뭐로할까</li>

			</ul>
		<div id="tab-1" class="tab-content current">
			 <a href="/book/listcate/a"> 동물 </a> ||<a href="/book/listcate/b"> 공주 </a>||<a href="/book/listcate/c"> 사물 </a>
		</div>
		<div id="tab-2" class="tab-content">
			<h2> 문의 </h2>
		</div>
		<div id="tab-3" class="tab-content">
			<h2> 이건 뭘로허지</h2>
		
		</div>
	
	</div>
	
	<div class="floating-wrapper" >
	 <div class="title">[최근본 상품]</div>
		 <div id="cookieValueWrapper">
	 
		 </div>
	 </div>

	
	<table>
	<tr><th>책 이름</th><th>가격</th><th></th></tr>
	<c:set var = "bnum" value="${0}"></c:set>
	<c:forEach var ="book" items="${cate}">
		<c:if test="${book.bnum != bnum}">
			<tr>
				<td>${book.bname}</td>
				
				<td>${book.price}</td>
				
				<td>
				
				<a href="/fairy/book/${book.bnum}"><img src="/img/${book.cvrimg}" style="max-width: 100px; max-height: 100px;"></a>
				
				</td>
		
		
		</c:if>
	
		<c:set var = "bnum" value ="${book.bnum}"></c:set>
	</c:forEach>
	
	</table>
	<div id= "search">
		<form id ="searchForm" action="/book/search" method="post">
			<label>검색</label>
			<select name="category">
				<option value="bname"> 제 목 </option>
				<option value="publisher"> 출판사 </option>
				<option value="author"> 저 자 </option>
			
			
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label>검색어</label>
			<input type="text" name="keyword">
			<button type="submit">검색</button>
		
		</form>

	</div>
	<nav id= "pagenation">
		<c:forEach var = "pn" items="${pageInfo.navigatepageNums}">
			<c:choose>
				<c:when test="${pn==pageInfo.pageNum}">
					<span id="pageNum">${pn}</span>
				</c:when>
				<c:otherwise>
				<c:url value="/book/list/page/${pn}" var="pgURL">
				<c:if test="${category!=null}">
					<c:param name="category" value="${category}"/>
					<c:param name="keyword" value="${keyword}"/>
				</c:if>
				
				
				
				</c:url>
				<a href="${pgURL}">${pn}</a>
				<a href="/book/list/page/${pn+1}" style="float:right"> <button> > </button> </a>
				<a href="/book/list/page/${pn-1}" style="float:left"> <button> < </button></a>
				<c:if test="${pn<PageInfo.totalpages }">
				
				</c:if>			
				
				</c:otherwise>
			
			
			</c:choose>
		
		
		
		
		
		
		</c:forEach>
	
	
	
	
	
	
	
	
	</nav>




</main>

</body>
</html>