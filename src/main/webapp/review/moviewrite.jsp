<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>영화등록</title>
  <link rel="stylesheet" type="text/css" href="../css/board.css">
  <script>
    function check(){
      const frm = document.forms["frm"];
      if(frm.title.value.trim() ==""){
        alert("영화 제목을 입력하세요");
        frm.title.focus();
      }else if(frm.genre.value.trim() =="") {
        alert("장르를 입력하세요");
        frm.genre.focus();
      }else if(frm.actorName.value.trim() =="") {
        alert("출연란을 입력하세요");
        frm.actorName.focus();
      } else if(frm.releaseDate.value.trim() =="") {
        alert("개봉일을 입력하세요");
        frm.releaseDate.focus();
      } else if(frm.description.value.trim() ==""){
        alert("내용을 입력하세요");
        frm.description.focus();
      }else if(frm.imageUrl.value.trim() ==""){
        alert("이미지url를 입력하세요");
        frm.imageUrl.focus();
      } else
        frm.submit();
    }
  </script>
</head>
<body>
<form name="frm" method="post" action="moviesave.jsp">
  <!-- 관리자 이름 자동 설정 -->
  <input type="hidden" name="pass" value="adminpass">
  <input type="hidden" name="mail" value="admin@site.com">

  <table border="1">
    <tr>
      <td colspan="2"><h2>*** 글쓰기 ***</h2></td>
    </tr>
    <tr>
      <td align="center">영화제목</td>
      <td><input name="title" size="50"></td>
    </tr>
    <tr>
      <td align="center">장르</td>
      <td><input name="genre" size="50"></td>
    </tr>
    <tr>
      <td align="center">출연</td>
      <td><input name="actorName" size="50"></td>
    </tr>
    <tr>
      <td align="center">개봉일</td>
      <td><input type="text" name="releaseDate" placeholder="YYYY-MM-DD"></td>
    </tr>
    <tr>
      <td align="center">내 용</td>
      <td><textarea name="description" cols="50" rows="10"></textarea></td>
    </tr>
    <tr>
      <td align="center">이미지url</td>
      <td><input type="text" name="imageUrl" size="20"></td>
    </tr>
    <tr>
      <td colspan="2" align="center" height="30">
        <input type="button"
               value="메  인" onClick="location.href='../index.html'">&nbsp;
        <input type="button" value="작  성" onClick="check()">&nbsp;
        <input type="button" value="목  록"
               onClick="location.href='movielist.jsp'"></td>
    </tr>
  </table>
</form>
</body>
</html>