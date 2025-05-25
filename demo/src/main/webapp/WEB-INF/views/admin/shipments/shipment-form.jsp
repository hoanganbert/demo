<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật giao hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>

<!-- Navigation -->
<div class="navigation d-flex flex-wrap align-items-center">
    <a href="/admin/products" class="nav-item">🛍 Quản lý sản phẩm</a>
    <a href="/admin/categories" class="nav-item">📂 Quản lý danh mục</a>
    <a href="/admin/orders" class="nav-item">📦 Quản lý đơn hàng</a>
    <a href="/admin/shipments" class="nav-item">🚚 Quản lý giao hàng</a>
    <a href="/admin/customers" class="nav-item">👥 Quản lý khách hàng</a>
    <a href="/admin/promotions" class="nav-item">🎁 Quản lý khuyến mãi</a>
    <a href="/admin/reports" class="nav-item">📊 Thống kê & Báo cáo</a>
    <a href="/admin/logout" class="nav-item logout ms-auto">🔓 Đăng xuất</a>
</div>

<!-- Main Content -->
<section class="container mt-5">
    <h2 class="mb-4 fw-bold">🚚 Cập nhật thông tin giao hàng</h2>

    <form:form method="POST" modelAttribute="shipment" action="/admin/shipments/save" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label fw-semibold">Mã giao hàng</label>
            <form:input path="id" class="form-control" readonly="true"/>
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Trạng thái</label>
            <form:select path="status" class="form-select">
                <form:option value="PENDING" label="Chờ xử lý" />
                <form:option value="IN_TRANSIT" label="Đang giao" />
                <form:option value="DELIVERED" label="Đã giao" />
                <form:option value="CANCELLED" label="Đã hủy" />
            </form:select>
        </div>

        <div class="mb-3">
            <label class="form-label fw-semibold">Ngày giao hàng</label>
            <form:input path="deliveryDate" type="date" class="form-control"/>
        </div>

        <div class="d-flex justify-content-between">
            <a href="/admin/shipments" class="btn btn-secondary">🔙 Quay lại</a>
            <button type="submit" class="btn btn-primary">💾 Lưu thay đổi</button>
        </div>
    </form:form>
</section>

</body>
</html>
