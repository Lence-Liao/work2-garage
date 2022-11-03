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
	<c:set var="OrderId" value="${param.orderId }"/>
	<c:set var="Name" value="${param.name }"/>
	<c:set var="Date" value="${param.date }"/>
	<c:set var="Pos" value="${param.pos }"/>
	<c:set var="Tri" value="${param.tri }"/>
	<c:set var="Oil" value="${param.oil }"/>
	<c:set var="Box" value="${param.box }"/>
	<c:set var="Spark" value="${param.spark }"/>
	<c:set var="Tire" value="${param.tire }"/>
	<c:set var="Total" value="${param.total }"/>
	
	<sql:setDataSource var="sample" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/garage" user="root"
		password="duncan04" />
	
	<sql:update dataSource="${sample}">
			update garage.order set 訂單編號=${OrderId},客戶姓名='${Name}',日期='${Date}',四輪定位='${Pos}'
			,三腳架='${Tri}',機油='${Oil}',變速箱='${Box}',火星塞='${Spark}',輪胎='${Tire}',總價='${Total}'
			
	</sql:update>	
	
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