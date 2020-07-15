<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "my.dao.PersonDao" %>
<%@ page import = "my.jdbc.util.*" %>
<%@ page import = "java.sql.*" %>   
<%@ page import = "my.model.Person" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn = ConnectionProvider.getConnection();
	PersonDao personDao = new PersonDao();
	int personId = Integer.parseInt(request.getParameter("personId"));
	int count =0;
	Person person = null;
	try {
		person = personDao.select(conn, personId);
	} catch (SQLException e) { }
%>
선택한 사람의 정보 : <br>
<c:set var="person" value="<%= person %>"/>
아이디: ${person.personId} <br>
이름: ${person.name} <br>
주소: ${person.address} <br>
나이: ${person.age} <br>
등록일자: ${person.registerTime} <br>

<a href="<c:url value='selectList.jsp'/>">돌아가기</a>
</body>
</html>




