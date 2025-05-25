<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🔍 Tìm kiếm khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navigation {
            background-color: #343a40;
            padding: 15px;
        }
        .navigation .nav-item {
            color: #fff;
            margin-right: 20px;
            text-decoration: none;
        }
        .navigation .nav-item:hover, .navigation .logout:hover {
            text-decoration: underline;
        }
        .navigation .logout {
            color: #ffc107;
        }
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
    </style>
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

<section class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">🔍 Kết quả tìm kiếm khách hàng</h2>
        <a href="/admin/customers" class="btn btn-secondary">← Quay lại danh sách</a>
    </div>

    <!-- Search form lại để dễ tìm kiếm tiếp -->
    <form method="GET" action="/admin/customers/search" class="mb-3 d-flex" style="max-width: 400px;">
        <input type="number" name="id" placeholder="🔍 Tìm kiếm theo ID..." class="form-control me-2" value="${param.id}">
        <button type="submit" class="btn btn-outline-secondary">Tìm</button>
    </form>

    <c:choose>
        <c:when test="${not empty customer}">
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.fullname}</td>
                            <td>${customer.email}</td>
                            <td>${customer.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${customer.locked}">
                                        <span class="badge bg-danger">Đã khóa</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success">Hoạt động</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <form action="/admin/customers/lock/${customer.id}" method="post" 
                                      onsubmit="return confirm('Bạn có chắc muốn thay đổi trạng thái khóa tài khoản này?');" class="d-inline">
                                    <button type="submit" class="btn btn-sm
                                        <c:choose>
                                            <c:when test="${customer.locked}">btn-success">Mở khóa</c:when>
                                            <c:otherwise>btn-danger">Khóa</c:otherwise>
                                        </c:choose>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning">Không tìm thấy khách hàng với ID: ${param.id}</div>
        </c:otherwise>
    </c:choose>
</section>

</body>
</html>
