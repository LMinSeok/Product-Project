<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="script/product.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="header.jsp" />
   <div class="project" align="center">
        <img src="${pageContext.request.contextPath}/upload/${pro.img}" alt="상품 이미지">
        <div class="detail-info">
            <div class="info-row">
                <div class="info-label">상 품 명:</div>
                <div class="info-value">${pro.pname}</div>
            </div>
            <div class="info-row">
                <div class="info-label">내 용:</div>
                <div class="info-value">${pro.content}</div>
            </div>
            <div class="info-row">
                <div class="info-label">가 격:</div>
                <div class="info-value">${pro.price}</div>
            </div>
            <div class="info-row">
                <div class="info-label">수 량:</div>
                <div class="info-value">${pro.stock}</div>
            </div>
        </div>
        <div class="button-row">
            <c:choose>
                <c:when test="${empty loginUser}">
                    <!-- 비회원인 경우 -->
                    <input type="button" class="button" value="로그인" onclick="location.href='UserServlet?command=user_login_action'">
                    <input type="button" class="button" value="회원가입" onclick="location.href='UserServlet?command=register_form'">
                </c:when>
                <c:otherwise>
                    <!-- 회원인 경우 -->
                    <c:choose>
                        <c:when test="${loginUser.is_admin eq 'Y'}">
                            <!-- 관리자인 경우 -->
                            <input type="button" class="button" value="상품 수정" onclick="editProduct(${pro.pid})">
                            <input type="button" class="button" value="상품 삭제" onclick="confirmDelete(${pro.pid})">
                        </c:when>
                        <c:otherwise>
                            <!-- 일반 사용자인 경우 -->
                            <input type="button" class="button" value="바로 구매하기">
                            <input type="button" class="button" value="장바구니">
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
            <!-- 공통 버튼 -->
            <input type="button" class="button" value="상품 리스트" onclick="location.href='ProServlet?command=pro_list'">
        </div>
    </div>
</body>
</html>