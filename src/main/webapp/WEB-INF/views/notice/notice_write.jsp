<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


	<div class="sub_title">
		<h2>공지사항 작성</h2>
	</div>

	<c:set var="username">
	<sec:authentication property="principal.user.username"/>
	</c:set>

	<div class="container">
	<form name="notice" method="post" action="/notice/notice_write_pro.do">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="username" value="${username}">

	  <div>
		<table class="table">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th>작성자</th>
					<td><input class="form-control" type="text" name="writer" value="관리자" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="form-control" type="text" name="notice_title"></td>
				</tr>
				<tr>
					<th style="padding-bottom:120px">내용</th>
					<td><textarea class="form-control" name="notice_content" style="height: 250px"></textarea></td>
				</tr>
			</thead>
		</table>
	  </div>
	  
	  <div align="center">
	  <button type="button" class="btn btn-light" onClick="send_()">등록</button>&nbsp;&nbsp;
	  <button type="button" class="btn btn-light" onClick="javascript:history.back()">취소</button>
	  </div>
	 </form>
	</div>
	
	<script>
	
	function send_(){
		notice.submit();
	}
	
	</script>

<%@ include file="../include/footer.jsp"%>