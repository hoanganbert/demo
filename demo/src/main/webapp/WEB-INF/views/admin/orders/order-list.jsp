<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
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
    <a href="/logout" class="nav-item logout ms-auto">🔓 Đăng xuất</a>
</div>

<!-- Main Section -->
<section class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">📦 Danh sách đơn hàng</h2>
    </div>

    <!-- Search Bar -->
    <form method="GET" action="/admin/orders" class="mb-3">
        <div class="input-group">
            <input type="text" name="keyword" placeholder="🔍 Tìm kiếm đơn hàng..." class="form-control" value="${keyword}">
            <button type="submit" class="btn btn-outline-secondary">Tìm</button>
        </div>
    </form>

    <!-- Order Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center">

				<thead class="table-dark">
				    <tr>
				        <th>ID</th>
				        <th>Khách hàng</th>
				        <th>Trạng thái</th>
				        <th>Tổng tiền</th>
				        <th>Hành động</th>
				    </tr>
				</thead>
				<tbody>
				    <c:forEach var="order" items="${orders}">
				        <tr>
				            <td>${order.id}</td>
				            <td>${order.customer.name}</td>
				            <td>${order.status}</td>
				            <td><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" /></td>
				            <td>
				                <a href="/admin/orders/view/${order.id}" class="btn btn-sm btn-info">Chi tiết</a>
				            </td>
				        </tr>
				    </c:forEach>
				</tbody>

        </table>
    </div>

<!-- Pagination -->
<c:if test="${page.totalPages > 0}">
    <div class="d-flex justify-content-between align-items-center mt-3">
        <!-- Go to Page Form -->
        <form method="GET" action="/admin/orders" class="d-flex">
            <input type="number" name="page" min="1" max="${page.totalPages}" class="form-control me-2" placeholder="Nhập trang...">
            <input type="hidden" name="keyword" value="${param.keyword}" />
            <button type="submit" class="btn btn-primary">Đi đến</button>
        </form>

        <!-- Page Numbers -->
        <ul class="pagination mb-0">
            <c:if test="${page.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number - 1}&keyword=${param.keyword}">«</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="0" end="${page.totalPages - 1}">
                <c:if test="${i < 3 || i == page.totalPages - 1 || (i >= page.number - 1 && i <= page.number + 1)}">
                    <li class="page-item ${i == page.number ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&keyword=${param.keyword}">${i + 1}</a>
                    </li>
                </c:if>
                <c:if test="${i == 3 && page.number > 4}">
                    <li class="page-item disabled"><span class="page-link">...</span></li>
                </c:if>
            </c:forEach>

            <c:if test="${page.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${page.number + 1}&keyword=${param.keyword}">»</a>
                </li>
            </c:if>
        </ul>
    </div>
</c:if>
</section>

</body>
</html>
