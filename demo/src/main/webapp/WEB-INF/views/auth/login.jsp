<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập Admin</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-light">

<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card p-4 shadow">
                <h2 class="text-center mb-4">Admin and Staff Login</h2>

                <form action="${pageContext.request.contextPath}/auth/process-login" method="post">
                    <div class="mb-3">
                        <input type="text" name="username" class="form-control" placeholder="Username" required />
                    </div>
                    <div class="mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password" required autocomplete="off" />
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                </form>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger mt-3">Tài khoản hoặc mật khẩu không đúng!</div>
                </c:if>

                <c:if test="${param.logout != null}">
                    <div class="alert alert-success mt-3">Đăng xuất thành công.</div>
                </c:if>

            </div>
        </div>
    </div>
</section>

</body>
</html>
