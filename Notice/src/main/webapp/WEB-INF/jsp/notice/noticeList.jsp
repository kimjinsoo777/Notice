<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file ="/WEB-INF/jsp/notice/inc/header.jsp" %>
</head>
<script>
function fn_write() {
	
	document.noticeListFrm.action = "<c:url value='/noticeWritePage.do'/>";
	document.noticeListFrm.submit();
}

function fn_detail(bno) {
	document.noticeListFrm.bno.value = bno;
	document.noticeListFrm.action = "<c:url value='/noticeView.do'/>";
	document.noticeListFrm.submit();
}

</script>
<body>
<form name="noticeListFrm" id="noticeListFrm" method = "post">
<input type="hidden" name="bno" value="${noticeVO.bno}" />
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
                    <div class="search_area">
                        <div class="table_count">
                            <p>전체 <b>180</b>개</p>
                            <select>
                                <option>10</option>
                            </select>
                            <span>개씩 보기</span>
                        </div>
                        <div class="table_search">
                            <select class="select2">
                                <option>전체</option>
                            </select>
                            <div class="search_box"><input type="text" placeholder="검색어를 입력하세요."><a href="#LINK"><img src="../../assets/images/ico_search.png" alt="검색하기"></a></div>
                            <button class="btn06 btn_grey2 search_reset">초기화</button>
                        </div>
                    </div>
                    <table class="st03 notice_list">
                        <caption>공지사항 목록을 정렬하였으며 번호, 제목, 첨부파일, 작성자, 작성일자, 조회를 제공합니다.</caption>
                        <colgroup>
                            <col width="5%">
                            <col>
                            <col width="6.43%">
                            <col width="8.125%">
                            <col width="9.375%">
                            <col width="5%">
                        </colgroup>
                        
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>첨부파일</th>
                                <th>작성자</th>
                                <th>작성일자</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                     <!--      <tr class="notice_top">
                                <td><span>공지</span></td>
                                <td><a href="#LINK" onclick="fn_detail('${noticeVO.bno}')">${noticeVO.title}</a></td>
                                <td></td>
                                <td>${noticeVO.user}</td>
                                <td>${noticeVO.regdate}</td>
                                <td>${noticeVO.view}</td>
                            </tr> --> 
                      <c:forEach items="${list}" var="noticeVO">
                           <tr>
                           <td>${noticeVO.rownum}</td>
                           <td><a href="#LINK" onclick="fn_detail('${noticeVO.bno}')">${noticeVO.title}</a></td>
                           <td></td>
                           <td>${noticeVO.user}</td>
                           <td>${noticeVO.regdate}</td>
                           <td>${noticeVO.view}</td>
                       </tr>
                      </c:forEach>
                        </tbody>
                    </table>
                    
                    <div class="page">
                        <div>
                            <a href="#LINK"><img src="${pageContext.request.contextPath}/images/test/images/ago_prev.png" alt="처음으로"></a>
                            <a href="#LINK"><img src="${pageContext.request.contextPath}/images/test/images/prev.png" alt="이전"></a>
                        </div>
                        <div>
                            <a href="#LINK" class="on">1</a>
                            <a href="#LINK">2</a>
                        </div>
                        <div>
                            <a href="#LINK"><img src="${pageContext.request.contextPath}/images/test/images/next.png" alt="다음"></a>
                            <a href="#LINK"><img src="${pageContext.request.contextPath}/images/test/images/ago_next.png" alt="마지막으로"></a>
                        </div>
                        <button class="add" onclick="javascript:fn_write();" type="button">등록</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <!-- e:container -->
        <%@ include file ="/WEB-INF/jsp/notice/inc/footer.jsp" %>
</body>
</html>