<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới mặt bằng</title>
</head>
<body>
<h2>Thêm mới mặt bằng</h2>

<!-- Hiển thị thông báo lỗi -->
<c:if test="${not empty error}">
    <p style="color: red; font-weight: bold;">${error}</p>
</c:if>

<!-- Hướng dẫn nhập dữ liệu -->
<h3>Hướng dẫn nhập dữ liệu:</h3>
<ul>
    <li><strong>Mã mặt bằng:</strong> Nhập theo định dạng VD: <code>MB001</code>, <code>MB002</code></li>
    <li><strong>Diện tích:</strong> Số lớn hơn 20 m².</li>
    <li><strong>Trạng thái:</strong> Chọn một trong các giá trị: <code>Trống</code>, <code>Hạ tầng</code>, <code>Đầy đủ</code>.</li>
    <li><strong>Tầng:</strong> Số nguyên từ 1 đến 15.</li>
    <li><strong>Loại văn phòng:</strong> Chọn một trong các giá trị: <code>Văn phòng chia sẻ</code>, <code>Văn phòng trọn gói</code>.</li>
    <li><strong>Giá cho thuê:</strong> Số lớn hơn 1.000.000 VNĐ.</li>
    <li><strong>Ngày bắt đầu:</strong> Định dạng <code>dd/mm/yyyy</code>.</li>
    <li><strong>Ngày kết thúc:</strong> Phải lớn hơn ngày bắt đầu ít nhất 6 tháng.</li>
</ul>

<form method="post" action="/property">
    <input type="hidden" name="action" value="add">
    <label for="code">Mã mặt bằng:</label>
    <input type="text" id="code" name="code" required placeholder="VD: MB001"><br/>

    <label for="area">Diện tích (m²):</label>
    <input type="number" id="area" name="area" min="20" required><br/>

    <label for="status">Trạng thái:</label>
    <select id="status" name="status" required>
        <option value="Trống">Trống</option>
        <option value="Hạ tầng">Hạ tầng</option>
        <option value="Đầy đủ">Đầy đủ</option>
    </select><br/>

    <label for="floor">Tầng:</label>
    <input type="number" id="floor" name="floor" min="1" max="15" required><br/>

    <label for="type">Loại văn phòng:</label>
    <select id="type" name="type" required>
        <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
        <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
    </select><br/>

    <label for="description">Mô tả chi tiết:</label>
    <textarea id="description" name="description" rows="4"></textarea><br/>

    <label for="price">Giá cho thuê (VNĐ):</label>
    <input type="number" id="price" name="price" min="1000000" required><br/>

    <label for="startDate">Ngày bắt đầu:</label>
    <input type="date" id="startDate" name="startDate" min="${currentDate}" required>
    <small>Lưu ý: Ngày bắt đầu phải từ hôm nay trở đi.</small><br/>

    <label for="endDate">Ngày kết thúc:</label>
    <input type="date" id="endDate" name="endDate" required><br/>


    <button type="submit">Lưu</button>
    <a href="/property">Hủy</a>
</form>
</body>
</html>
