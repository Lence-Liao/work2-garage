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
		url="jdbc:mysql://localhost:3306/garage" user="root"
		password="duncan04" />
	
	<sql:query dataSource="${sample}" var="result">
			select*from garage.order
	</sql:query>
	
	<table border="1" width="80%">
		<tr>
			<th>訂單編號</th>
			<th>客戶姓名</th>
			<th>日期</th>
			<th>四輪定位</th>
			<th>三腳架</th>
			<th>機油</th>
			<th>變速箱</th>
			<th>火星塞</th>
			<th>輪胎</th>
			<th>總價</th>
		</tr>

		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.訂單編號}" /></td>
				<td><c:out value="${row.客戶姓名}" /></td>
				<td><c:out value="${row.日期}" /></td>
				<td><c:out value="${row.四輪定位}" /></td>
				<td><c:out value="${row.三腳架}" /></td>
				<td><c:out value="${row.機油}" /></td>
				<td><c:out value="${row.變速箱}" /></td>
				<td><c:out value="${row.火星塞}" /></td>
				<td><c:out value="${row.輪胎}" /></td>
				<td><c:out value="${row.總價}" /></td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>