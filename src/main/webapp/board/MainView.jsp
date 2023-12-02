<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GongCheck</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <link href="/css/navbar_jy.css" rel="stylesheet"/>

    <style>
<%-- 네비게이션 바 --%>
*{
  margin: 0;
  padding: 0;
}
#writebtn {
    margin-top: 10px;
}
.d-flex {
    margin: 0 auto;
    position: relative;
}
#post_img{
    margin-top: 2vh;
    margin-bottom: 10px;
    width: 20rem;
    height: 20rem;
    object-fit: fill;
}


</style>
    <script>
        const myModal = document.getElementById('myModal')
        const myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', () => {
            myInput.focus()
        })



    </script>
</head>

<body>
<%--수정된 nav--%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

        <div class="container">
            <!-- 로고 -->
            <a class="navbar-brand" href="#">GongCheck</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span></button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <!-- 검색 -->
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a type="button" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal">검색</a>
                    </li>
                    <!-- 공지사항 -->
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            공지사항
                        </a>
                    </li>

                    <!-- 랭킹 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            랭킹
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">주간 조회수 Top 10</a></li>
                            <li><a class="dropdown-item" href="#">주간 좋아요 Top 10</a></li>
                        </ul>
                    </li>

                    <!-- 로그인 -->
                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/member/loginform.do"
                           role="button"
                           aria-expanded="false">
                           로그인
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<!-- Modal -->
<%--검색 모달 창--%>
<div class="modal fade" id="exampleModal" tabindex="2" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">검색어를 입력하세요</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
<%--                    드롭다운 입력 칸--%>
                    <div class="input-group mb-lg-0">
                        <select class="form-select"
                                name="searchCategory"
                                style="margin: 0">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" class="form-control" name="searchWord" value="${param.searchWord}" aria-label="검색어를 입력하세요"/>
                    </div>
<%--                    드롭다운 end--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-dark">
                        <a class="link-light"
                           href="${pageContext.request.contextPath}/gck/MainView.do" style="text-decoration: none">
                            검색
                        </a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--검색 모달 end--%>

<%--메인 게시판--%>

<div class="container">
  <%--choose when otherwise 는 java로 치면
  if else 문이랑 비슷한 반복문 성질을 가지고 있다.
  MVC2 패턴을 잘 나타내고 분리된 메서드를 이용해 동적으로 처리하기 위함.--%>
  <c:choose>
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
      <div>
        <div align="center">
          등록된 게시물이 없습니다^^*
        </div>
      </div>
    </c:when>
<%--d-flex align-content-end flex-wrap  style="max-width: 70%;"--%>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
      <div class="d-flex align-content-between flex-wrap" id="gridsys" >
      <c:forEach items="${ boardLists }" var="row" varStatus="loop">
        <div class="thumb_post_img" id="thumb_post_img" >
            <!-- 게시물 번호 -->
<%--              ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}--%>


            <!-- 해당 게시물 링크 -->

            <a href="../gck/PostView.do?postIdx=${ row.postIdx }">

              <%-- imageList 컬렉션과 JSTL 의 앙상블 --%>
              <c:forEach items="${ postImageVOList }" var="posts" varStatus="loop">

                <%-- if문이 없었다면 다중 for 문에 의해 postIdx 마다 모든 게시물이 출력될 것임--%>
                <c:if test="${row.postIdx == posts.postIdx}" var="result">

<%-- 절대경로+ 서버에 저장된 이미지 불러오기 / loop를 계속 수행하는 동안 부모 foreach 문과 나의 Idx 가 일치하는지 확인하고 맞으면 출력 아니면 점프 --%>

                        <img src="${pageContext.request.contextPath}/Uploads/${posts.postTImagePath}" alt="posts${loop.index}" class="shadow p-3 mb-5 bg-body-tertiary rounded" id="post_img"/>


                </c:if>
              </c:forEach>
<%--            </a>--%>

        </div>
      </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<%-- 하단 메뉴(바로가기)--%>

    <div class="pagination justify-content-center" >
        <div class="d-flex">
          ${ map.pagingImg }
        </div>

    </div>



<%--글쓰기 버튼--%>
<div class="d-grid gap-2 d-md-flex justify-content-lg-center" id="writebtn">
<button type="button" class="btn btn-outline-danger" onclick="location.href='../post/PostWrite.jsp';">글쓰기</button>
</div>
<%-- footer --%>
<jsp:include page="../footer_jy.jsp" flush="false"/>

<%-- 검색 버튼 모달 창 스크립트 --%>
<script>

</script>


</body>
</html>
