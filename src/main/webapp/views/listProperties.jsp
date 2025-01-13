<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Danh sách mặt bằng</title>
</head>
<body>
<h2>Danh sách mặt bằng</h2>
<a href="/property?action=add">
  <button type="button">Thêm mới mặt bằng</button>
</a>
<table border="1">
  <tr>
    <th>Mã mặt bằng</th>
    <th>Diện tích</th>
    <th>Trạng thái</th>
    <th>Tầng</th>
    <th>Loại văn phòng</th>
    <th>Giá cho thuê</th>
    <th>Xóa</th>
  </tr>
  <c:forEach items="${properties}" var="property">
    <tr>
      <td>${property.code}</td>
      <td>${property.area}</td>
      <td>${property.status}</td>
      <td>${property.floor}</td>
      <td>${property.type}</td>
      <td>${property.price}</td>
      <td><a href="/property?action=delete&id=${property.id}">Xóa</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
