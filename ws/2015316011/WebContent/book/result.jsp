<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="table_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
  <div id="topheader">
    <div id="topmenu"><img src="images/midtest1_01.png" width="921" height="27" alt="topmenu" /></div>
    <div id="toplogo"><img src="images/midtest1_05.png" width="151" height="62" alt="toplogo" /></div>
    <div id="topmain"><img src="images/midtest1_08.png" width="425" height="40" alt="topmain" /></div>
  </div>
  <div id="main2">
    <p>도서정보가 다음과 같이 입력되었습니다.</p>
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="book" class="my.model.Book" scope="request"/>
<jsp:setProperty property="*" name="book"/> 
<%
	book.setBookDate(new Date()); //현재 시각 설정
	Connection conn = ConnectionProvider.getConnection();
	BookDao bookDao = new BookDao();
	int count =0;
	try {
		count = bookDao.insert(conn, book);
	} catch (SQLException e) { }
%>
<%= count %>개의 데이터가 DB에 입력되었습니다.!!!!
<c:set var="book" value="<%= book %>"/>
    
    <form action="" method="post" name="form1" class="registerform" id="form1">
      <table width="600" border="0" cellpadding="3" cellspacing="0" class="registerform">
        <tr>
          <th width="172" scope="row">* 도서명</th>
          <td width="416">${book.name}&nbsp;</td>
        </tr>
        <tr>
          <th scope="row">* 도서가격</th>
          <td>${book.price}&nbsp;</td>
        </tr>
        <tr>
          <th scope="row">*출판사</th>
          <td>${book.publisher}&nbsp;</td>
        </tr>
      </table>
    </form>
    <p>&nbsp;</p>
  </div>
  <div id="submenu1">
    <div id="menu1"><img src="images/midtest1_14.png" width="86" height="399" alt="menu1" /></div>
    <div id="menu2"><img src="images/midtest1_15.png" width="125" height="399" alt="menu2" /></div>
 </div>
</div>
</body>
</html>
