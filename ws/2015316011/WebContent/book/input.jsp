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
    <p>도서정보를 입력하세요.</p>
    <form id="form1" name="form1" method="post" action="result.jsp">
      <table width="600" border="0" cellpadding="3" cellspacing="0" class="btnstyle">
        <tr>
          <th width="172" scope="row"><strong>* 도서명</strong></th>
          <td width="416"><strong>
            <input type="text" name="name" id="name" />
          </strong></td>
        </tr>
        <tr>
          <th scope="row"><strong>* 도서가격</strong></th>
          <td><strong>
            <input type="text" name="price" id="price" />
          </strong></td>
        </tr>
        <tr>
          <th scope="row"><strong>*출판사</strong></th>
          <td><strong>
            <input type="text" name="publisher" id="publisher" />
          </strong></td>
        </tr>
        <tr>
          <th colspan="2" scope="row"><strong>
            <input type="submit" name="ok" id="ok" value="입력" />
          </strong></th>
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
