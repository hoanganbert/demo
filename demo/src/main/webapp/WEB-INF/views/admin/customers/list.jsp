<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>👥 Quản lý khách hàng</title>
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

<!-- Main Section -->
<section class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">👥 Danh sách khách hàng</h2>
    </div>

    <!-- Search Bar -->
    <form method="GET" action="/admin/customers/search" class="mb-3 d-flex" style="max-width: 400px;">
        <input type="number" name="id" placeholder="🔍 Tìm kiếm theo ID..." class="form-control me-2" value="${param.id}">
        <button type="submit" class="btn btn-outline-secondary">Tìm</button>
    </form>

    <c:if test="${not empty message}">
        <div class="alert alert-warning">${message}</div>
    </c:if>

    <!-- Customers Table -->
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
            <c:forEach var="customer" items="${pageCustomers.content}">
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
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <div class="d-flex justify-content-between align-items-center mt-3">
        <!-- Go to Page Form -->
        <form method="GET" action="/admin/customers" class="d-flex" style="max-width: 180px;">
            <input type="number" name="page" min="1" max="${pageCustomers.totalPages}" class="form-control me-2" placeholder="Nhập trang...">
            <button type="submit" class="btn btn-primary">Đi đến</button>
        </form>

        <!-- Page Numbers -->
        <ul class="pagination mb-0">
            <c:if test="${pageCustomers.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pageCustomers.number - 1}">«</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="0" end="${pageCustomers.totalPages - 1}">
                <c:if test="${i < 3 || i == pageCustomers.totalPages - 1 || (i >= pageCustomers.number - 1 && i <= pageCustomers.number + 1)}">
                    <li class="page-item ${i == pageCustomers.number ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}">${i + 1}</a>
                    </li>
                </c:if>
                <c:if test="${i == 3 && pageCustomers.number > 4}">
                    <li class="page-item disabled"><span class="page-link">...</span></li>
                </c:if>
            </c:forEach>

            <c:if test="${pageCustomers.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${pageCustomers.number + 1}">»</a>
                </li>
            </c:if>
        </ul>
    </div>
</section>

</body>
</html>
