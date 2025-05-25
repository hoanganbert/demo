<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border-radius: 15px;
        }
        .back-link {
            text-decoration: none;
            color: #0d6efd;
            margin-bottom: 15px;
            display: inline-block;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .product-image {
            width: 60px;
            height: auto;
        }
    </style>
</head>
<body>

<div class="container">
    <a href="/admin/orders" class="back-link">← Quay lại danh sách đơn hàng</a>

    <div class="card shadow-sm p-4">
        <h3 class="mb-3">📋 Thông tin đơn hàng #${order.id}</h3>

        <div class="row mb-4">
            <div class="col-md-6">
                <p><strong>👤 Khách hàng:</strong> ${order.user.fullname}</p>
                <p><strong>📧 Email:</strong> ${order.user.email}</p>
                <p><strong>📞 Số điện thoại:</strong> ${order.user.phone}</p>
                <p><strong>🏠 Địa chỉ:</strong> ${order.user.address}</p> <!-- Nếu có địa chỉ -->
            </div>
            <div class="col-md-6">
                <p><strong>💳 Phương thức thanh toán:</strong> ${order.paymentMethod}</p>
                <p><strong>🚚 Trạng thái:</strong> ${order.status}</p>
                <p><strong>💰 Tổng tiền:</strong> <fmt:formatNumber value="${order.total_price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></p>
            </div>
        </div>

        <h5 class="mb-3">📦 Danh sách sản phẩm:</h5>
        <div class="table-responsive">
            <table class="table table-bordered text-center align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="detail" items="${order.orderDetail}">
                        <tr>
                            <td>
                                <img src="${detail.product.image}" alt="${detail.product.name}" class="product-image">
                            </td>
                            <td>${detail.product.name}</td>
                            <td>${detail.quantity}</td>
                            <td><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            <td><fmt:formatNumber value="${detail.quantity * detail.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
