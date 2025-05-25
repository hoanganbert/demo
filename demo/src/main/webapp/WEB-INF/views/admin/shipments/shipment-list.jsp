<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý giao hàng</title>
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
        <h2 class="fw-bold">🚚 Danh sách giao hàng</h2>
    </div>

    <!-- Search Bar -->
    <form method="GET" action="/admin/shipments" class="mb-3">
        <div class="input-group">
            <input type="text" name="searchId" placeholder="🔍 Tìm kiếm theo ID..." class="form-control" value="${param.searchId}">
            <button type="submit" class="btn btn-outline-secondary">Tìm</button>
        </div>
    </form>

    <!-- Messages -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <!-- Shipment Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Trạng thái</th>
                    <th>Ngày giao</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${pagination}">
                        <c:forEach var="shipment" items="${shipmentPage.content}">
                            <tr>
                                <td>${shipment.id}</td>
                                <td>${shipment.status}</td>
                                <td><fmt:formatDate value="${shipment.date}" pattern="dd/MM/yyyy" /></td>
                                <td>
                                    <a href="/admin/shipments/edit/${shipment.id}" class="btn btn-sm btn-warning">Sửa</a>
                                    <a href="/admin/shipments/delete/${shipment.id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="shipment" items="${shipments}">
                            <tr>
                                <td>${shipment.id}</td>
                                <td>${shipment.status}</td>
                                <td><fmt:formatDate value="${shipment.date}" pattern="dd/MM/yyyy" /></td>
                                <td>
                                    <a href="/admin/shipments/edit/${shipment.id}" class="btn btn-sm btn-warning">Sửa</a>
                                    <a href="/admin/shipments/delete/${shipment.id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <c:if test="${pagination}">
        <div class="d-flex justify-content-between align-items-center mt-3">
            <!-- Go to Page -->
            <form method="GET" action="/admin/shipments" class="d-flex">
                <input type="number" name="page" min="1" max="${totalPages}" class="form-control me-2" placeholder="Nhập trang...">
                <button type="submit" class="btn btn-primary">Đi đến</button>
            </form>

            <!-- Page Numbers -->
            <ul class="pagination mb-0">
                <c:if test="${currentPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage - 1}">«</a>
                    </li>
                </c:if>

                <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <c:if test="${i < 3 || i == totalPages - 1 || (i >= currentPage - 1 && i <= currentPage + 1)}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i + 1}</a>
                        </li>
                    </c:if>
                    <c:if test="${i == 3 && currentPage > 4}">
                        <li class="page-item disabled"><span class="page-link">...</span></li>
                    </c:if>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage + 1}">»</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </c:if>
</section>

</body>
</html>
