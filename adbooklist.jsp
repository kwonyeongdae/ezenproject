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
<main>
	<h1>도서 목록</h1>
	<table>
	<tr><th>책 이름</th><th>가격</th><th></th><th></th></tr>
	<c:set var = "bnum" value="${0}"></c:set>
	<c:forEach var ="book" items="${pageInfo.list}">
	
		<c:if test="${book.bnum != bnum}">
			<tr>
				<td>${book.bname}</td>
				
				<td>${book.price}</td>
				
				<td>
				
				<a href="/fairy/book/${book.bnum}"><img src="/img/${book.cvrimg}" style="max-width: 100px; max-height: 100px;"></a>
				
				</td>
				<td>
				<button> <a href="/admin/detail/${book.bnum}"> 수정 </a> </button>
				</td>
		
		
		</c:if>
	
		<c:set var = "bnum" value ="${book.bnum}"></c:set>
	</c:forEach>
	
	</table>
	<div id= "search">
		<form id ="searchForm" action="/admin/search" method="post">
			<label>검색</label>
			<select name="category">
				<option value="bname"> 제 목 </option>
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