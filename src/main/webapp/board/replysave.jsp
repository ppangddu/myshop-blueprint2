<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean" />
<jsp:setProperty property="*" name="bean" />
<jsp:useBean id="boardManager" class="pack.board.BoardManager" />

<%
  String bpage = request.getParameter("page"); // 페이지는 따로 받는다

  // 기존 데이터 계산
  int num = bean.getNum();
  int gnum = bean.getGnum();
  int onum = bean.getOnum() + 1;
  int nested = bean.getNested() + 1;

  boardManager.updateOnum(gnum, onum); // onum 정렬 처리
  bean.setOnum(onum);
  bean.setNested(nested);
  bean.setBip(request.getRemoteAddr());
  bean.setBdate();
  bean.setNum(boardManager.currentMaxNum() + 1);

  // ⭐ 별점은 nested == 1일 때만 저장
  int rating = 0;
  if (nested == 1) {
    try {
      rating = Integer.parseInt(request.getParameter("rating"));
    } catch (Exception e) {
      rating = 0;
    }
  }
  bean.setRating(rating);

  // 저장
  boardManager.saveReplyData(bean);

  // 원글로 리다이렉트
  response.sendRedirect("boardcontent.jsp?num=" + bean.getGnum() + "&page=" + bpage);
%>
