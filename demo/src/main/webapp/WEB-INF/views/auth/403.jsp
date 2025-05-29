<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>403 - Truy cập bị từ chối</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 text-center">
    <h1 class="display-4 text-danger">403</h1>
    <p class="lead">Bạn không có quyền truy cập vào trang này.</p>
    <a href="${pageContext.request.contextPath}/auth/login" class="btn btn-primary mt-3">Quay lại trang đăng nhập</a>
</div>

</body>
</html>
