<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import = "my.dao.PersonDao" %>
<%@ page import = "my.jdbc.util.*" %>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.util.Date" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="person" class="my.model.Person" scope="request"/>
<jsp:setProperty property="*" name="person"/>
<%
	person.setRegisterTime(new Date()); //현재 시각 설정
	Connection conn = ConnectionProvider.getConnection();
	PersonDao personDao = new PersonDao();
	int count =0;
	try {
		count = personDao.insert(conn, person);
	} catch (SQLException e) { }
%>
<%= count %>개의 데이터가 DB에 입력되었습니다.!!!!
<c:set var="person" value="<%= person %>"/>
name = ${person.name} <br>
address= ${person.address} <br>
age=${person.age} <br>
register time = ${person.registerTime} <br>
</body>
</html>












