<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<% pageContext.setAttribute("newLine", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<%@ include file ="/WEB-INF/jsp/notice/inc/header.jsp" %>
</head>
<script>
function fn_delete(){
	if (!confirm("삭제하시겠습니까?"))
		return;
	
	document.noticeViewfrm.action = "<c:url value='/noticeDelete.do'/>";
	document.noticeViewfrm.submit();	
}

function fn_backToList(){
	
	document.noticeViewfrm.action = "<c:url value='/noticeList.do'/>";
	document.noticeViewfrm.submit();	
}
function fn_modify(){
	document.noticeViewfrm.action = "<c:url value='/noticeUpdatePage.do'/>";
	document.noticeViewfrm.submit();
}
</script>
<body>
<form:form commandName="noticeViewfrm" name="noticeViewfrm" method="post" enctype="multipart/form-data">
<input type="hidden" name="bno" value="${resultVO.bno}" />
   <!-- s:container -->
        <div class="container">
            <div class="inner">
                <ul class="sub_nav">
                    <li>홈</li>
                    <li>알림마당</li>
                    <li>공지사항</li>
                </ul>
                
                <div class="titleBox"> 
                    <h1>공지사항</h1>
                </div>
                
                <div class="category">
                    <a href="#LINK" class="on">공지사항</a>
                    <a href="#LINK">홍보자료</a>
                    <a href="#LINK">FAQ</a>
                </div>
                
                <div class="table_wrap">
                    <table class="st02">
                        <caption>공지사항을 정렬하였으며 제목, 작성자, 조회, 상단고정, 작성일자, 첨부파일, 내용을 제공합니다.</caption>
                        <colgroup>
                            <col width="7.81%">
                            <col>
                            <col width="7.81%">
                            <col width="24%">
                        </colgroup>
                        
                        <tr>
                            <th>제목</th>
                            <td colspan="3" class="bold">${resultVO.title}</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>${resultVO.user}</td>
                            <th>조회</th>
                            <td>${resultVO.view}</td>
                        </tr>
                        <tr>
                            <th>상단고정</th>
                            <td>${resultVO.fixed}</td>
                            <th>작성일자</th>
                            <td>${resultVO.regdate}</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3" class="file_list">
                                <a href="#LINK">협의체 네트워킹 소개.pdf<img src="${pageContext.request.contextPath}/images/test/images/ico_file.png"></a>
                                <a href="#LINK">협의체 네트워킹 소개.pdf<img src="${pageContext.request.contextPath}/images/test/images/ico_file.png"></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="table_text">${resultVO.content}</td>
                        </tr>
                    </table>
                    
                    <div class="tableBtn_area">
                        <div class="leftBtn">
                            <a href="#LINK" class="btn10 btn_grey_line" onclick="fn_backToList()">목록</a>
                        </div>
                        <div class="rightBtn">
                            <button class="btn10 btn_red_line" onclick="fn_delete()">삭제</button>
                            <button class="btn10 btn_black3" onclick="fn_modify()">수정</button>
                        </div>
                    </div>
                    
                    <table class="remote_table">
                        <colgroup>
                            <col width="7.812%">
                            <col>
                        </colgroup>
                        <tr>
                            <th>다음글</th>
                            <td><a href="#LINK">산업부, 2022년 탄소중립 R&amp;D 확대 편성 추진</a></td>
                        </tr>
                        <tr>
                            <th>이전글</th>
                            <td><a href="#LINK">산업부, 2022년 탄소중립 R&amp;D 확대 편성 추진</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        </form:form>
        <!-- e:container -->
        <%@ include file ="/WEB-INF/jsp/notice/inc/footer.jsp" %>
</body>
</html>