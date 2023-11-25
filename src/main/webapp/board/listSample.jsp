<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>GongCheck</title>
    <style>
      a{
      text-decoration:none;
    }
    </style>
</head>
<body>


<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

<!-- 검색 폼 -->
<form method="get">
  <table border="1" width="90%">
    <tr>
      <td align="center">
        <select name="searchField">
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>
        <input type="text" name="searchWord" />
        <input type="submit" value="검색하기" />
      </td>
    </tr>
  </table>
</form>

<!-- 목록 테이블 -->
<table border="1" width="90%">
  <tr>
    <th width="10%">번호</th>
    <th width="*">제목</th>
    <th width="15%">작성자</th>
    <th width="10%">조회수</th>
    <th width="15%">작성일</th>
    <th width="8%">첨부</th>
  </tr>
  <c:choose>
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
      <tr>
        <td colspan="6" align="center">
          등록된 게시물이 없습니다.
        </td>
      </tr>
    </c:when>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
      <c:forEach items="${ boardLists }" var="row" varStatus="loop">
        <c:set var="i" value="${i+1}" />  <!-- 샘플용 번호 -->
        <tr align="center">
          <!-- 번호 -->
          <td>
              ${ i }
          </td>
          <!-- 제목(링크) -->
          <td align="left">
            <a href="#">${ row.postTitle }</a>
          </td>
          <!-- 작성자 -->
          <td>${ row.memberIdx }</td>
          <!-- 조회수 -->
          <td>${ row.postVisitcount }</td>
          <!-- 작성일 -->
          <td>${ row.postWriteDate }</td>
          <!-- 첨부 파일 -->
          <td>
              <a href="#">[Down]</a>
          </td>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</table>

<!-- 하단 메뉴(바로가기, 글쓰기) -->
<table border="1" width="90%">
  <tr align="center">
    <td>
      1
    </td>
    <td width="100">
      <button type="button" onclick="location.href='#';">글쓰기</button>
    </td>
  </tr>
</table>
</body>
</html>
