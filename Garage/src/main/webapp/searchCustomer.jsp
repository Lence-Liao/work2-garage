<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource var="sample" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/mydemo?serverTimezone=Asia/Taipei"
		user="root" password="duncan04" />
	<sql:query dataSource="${sample}" var="result">
   		SELECT * from garage.customers
	</sql:query>

	<table border="1" width="80%">
		<tr>
			<th>客戶編號</th>
			<th>客戶姓名</th>
			<th>日期</th>
			<th>電話</th>
			<th>車牌號碼</th>
			<th>車子品牌</th>
			<th>里程數</th>
		</tr>

		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.客戶編號}" /></td>
				<td><c:out value="${row.客戶姓名}" /></td>
				<td><c:out value="${row.日期}" /></td>
				<td><c:out value="${row.電話}" /></td>
				<td><c:out value="${row.車牌號碼}" /></td>
				<td><c:out value="${row.車子品牌}" /></td>
				<td><c:out value="${row.里程數}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>