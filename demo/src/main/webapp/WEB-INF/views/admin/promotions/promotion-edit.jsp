<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🎁 Chỉnh sửa khuyến mãi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>🎁 Chỉnh sửa chương trình khuyến mãi</h2>
    <form action="/admin/promotions/edit/${promotion.id}" method="post">
        <input type="hidden" name="id" value="${promotion.id}"/>

        <div class="mb-3">
            <label for="name" class="form-label">Tên khuyến mãi</label>
            <input type="text" class="form-control" id="name" name="name" required value="${promotion.name}">
        </div>

        <div class="mb-3">
            <label for="startDate" class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required
                   value="${fn:substring(promotion.startDate, 0, 10)}">
        </div>

        <div class="mb-3">
            <label for="endDate" class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required
                   value="${fn:substring(promotion.endDate, 0, 10)}">
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Trạng thái</label>
            <select class="form-select" id="status" name="status" required>
                <option value="Active" ${promotion.status == 'Active' ? 'selected' : ''}>Active</option>
                <option value="Inactive" ${promotion.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="discountAmount" class="form-label">Số tiền giảm (VNĐ)</label>
            <input type="number" class="form-control" id="discountAmount" name="discountAmount" min="0" value="${promotion.discountAmount}">
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="/admin/promotions" class="btn btn-secondary ms-2">Hủy</a>
    </form>
</div>
</body>
</html>
