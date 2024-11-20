<%@ include file = "header.jsp" %>
<section class="text-center" style="margin-bottom: 13%">
    <form class="form-signin" method="post" action="gostersifremiunuttum">
        <a href="ucakbileti">
            <img class="mt-3 mb-5" src="assets/images/logo.png" alt="" width="300" height="50">
        </a>
        <h1 class="h3 mb-3 font-weight-600">Tìm tài khoản của bạn</h1>
        <p class="lead">Vui lòng nhập địa chỉ email của bạn</p>
        <%
            String req = request.getParameter("durum");
            if (req != null) {
                if (req.equals("basarili")) {
                    out.print("<div class='alert alert-success' role='alert'>Mật khẩu đã được gửi đến địa chỉ email của bạn.</div>");
                } else {
                    out.print("<div class='alert alert-warning' role='alert'>Không tìm thấy tài khoản khớp với email.</div>");
                }
            }
        %>
        <label for="kullanici_email" class="sr-only">Email</label>
        <input type="email" id="kullanici_email" name="kullanici_email" class="form-control mb-3" placeholder="Email" required autofocus>
        <button class="btn btn-lg btn-warning btn-block shadow-none" type="submit">Tìm tài khoản</button>
    </form>
</section>
<%@ include file = "footer.jsp" %>
