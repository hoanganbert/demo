<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🎁 Thêm mới khuyến mãi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>🎁 Thêm mới chương trình khuyến mãi</h2>
    <form action="/admin/promotions/add" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Tên khuyến mãi</label>
            <input type="text" class="form-control" id="name" name="name" required value="${promotion.name}">
        </div>

        <div class="mb-3">
            <label for="startDate" class="form-label">Ngày bắt đầu</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required value="${promotion.startDate}">
        </div>

        <div class="mb-3">
            <label for="endDate" class="form-label">Ngày kết thúc</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required value="${promotion.endDate}">
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
            <small class="text-muted">Ví dụ: 10000, 100000</small>
        </div>

        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="/admin/promotions" class="btn btn-secondary ms-2">Hủy</a>
    </form>
</div>
</body>
</html>
