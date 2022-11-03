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
	<c:set var="Id" value="${param.id}" />
	<c:set var="Name" value="${param.name}" />
	<c:set var="Date" value="${param.date}" />
	<c:set var="Phone" value="${param.phone}" />
	<c:set var="CarNumber" value="${param.carNumber}" />
	<c:set var="Type" value="${param.type}" />
	<c:set var="Mil" value="${param.mil}" />

	<sql:setDataSource var="sample" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/garage" user="root"
		password="duncan04" />
		
	<sql:update dataSource="${sample}">
			insert into garage.customers(客戶編號,客戶姓名,日期,電話,車牌號碼,車子品牌,里程數)
			values(${Id},'${Name}','${Date}','${Phone}','${CarNumber}','${Type}','${Mil}')
	</sql:update>
	
	<sql:query dataSource="${sample}" var="result">
			select*from garage.customers
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