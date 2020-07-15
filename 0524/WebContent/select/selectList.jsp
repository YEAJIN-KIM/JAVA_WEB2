<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import = "my.dao.PersonDao" %>
<%@ page import = "my.jdbc.util.*" %>
<%@ page import = "java.sql.*" %>  
<%@ page import = "java.util.*" %> 
<%@ page import = "my.model.Person" %> 
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
	List<Person> personList = new ArrayList<Person>();
	try {
		personList = personDao.selectList(conn);
	} catch (SQLException e) { }
%>
모든 학생들의 정보 : <br>
<c:set var="list" value="<%= personList %>"/>
<c:forEach var="person" items="${list}">
${person.name}
<a href="<c:url value='select.jsp?personId=${person.personId}'/>">상세보기</a>
<a href="<c:url value='/update/form.jsp?personId=${person.personId}'/>">수정하기</a>
<a href="<c:url value='/delete/delete.jsp?personId=${person.personId}'/>">삭제하기</a>
<br>===================================<br>
</c:forEach>
<br><br>
<a href="<c:url value='/insert/form.jsp'/>">새로 등록하기</a>
</body>
</html>




