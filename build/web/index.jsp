<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today" value="<%=new java.util.Date()%>" />
<%@ include file = "header.jsp" %>
<%@ include file = "navigasyon.jsp" %>
<div id="home">
    <<%@ include file = "header.jsp" %>

<section class="text-center">
    <form class="form-signin" action="gosteruyeol" method="POST" name="UyeOl" onsubmit="return UyeolKontrol()">
        <a href="ucakbileti">
            <img class="mt-3 mb-5" src="assets/images/logo.png" alt="" width="300" height="50">
        </a>
        <h1 class="h3 mb-3 font-weight-600">Đăng ký</h1>
        <%
            String req = request.getParameter("durum");
            if (req != null) {
                if (req.equals("basarili")) {
                    out.print("<div class='alert alert-success' role='alert'>Đăng ký thành công. Vui lòng đăng nhập.</div>");
                } else {
                    out.print("<div class='alert alert-warning' role='alert'>Email này đã được sử dụng.</div>");
                }
            }
        %>
        <label for="kullanici_ad" class="sr-only">Tên</label>
        <input type="text" id="kullanici_ad" name="kullanici_ad" class="form-control mb-3" placeholder="Tên" required autofocus>
        
        <label for="kullanici_soyad" class="sr-only">Họ</label>
        <input type="text" id="kullanici_soyad" name="kullanici_soyad" class="form-control mb-3" placeholder="Họ" required>
        
        <label for="kullanici_email" class="sr-only">Email</label>
        <input type="email" id="kullanici_email" name="kullanici_email" class="form-control mb-3" placeholder="Email" required>
        
        <label for="kullanici_sifre1" class="sr-only">Mật khẩu</label>
        <input type="password" id="kullanici_sifre1" name="kullanici_sifre1" class="form-control mb-3" placeholder="Mật khẩu" required>
        
        <label for="kullanici_sifre2" class="sr-only">Xác nhận mật khẩu</label>
        <input type="password" id="kullanici_sifre2" name="kullanici_sifre2" class="form-control mb-3" placeholder="Xác nhận mật khẩu" required>        
                            

        <div class="alert alert-warning" role="alert" id="1" style="display:none">Mật khẩu phải có ít nhất 8 ký tự.</div>
        <div class="alert alert-warning" role="alert" id="2" style="display:none">Mật khẩu không khớp.</div>
        <button class="btn btn-lg btn-warning btn-block shadow-none" type="submit">Đăng ký</button>

        <div class="mt-3 mb-3">
            <span>Bạn đã là thành viên ? </span><a href="giris" class="text-decoration-none" style="color: #FF7F00">Đăng nhập</a>
        </div>
    </form>
</section>

<script>
    function UyeolKontrol() {
        var formUyeOl = document.forms["UyeOl"];
        var sifre1 = formUyeOl["kullanici_sifre1"];
        var sifre2 = formUyeOl["kullanici_sifre2"];
        sifre1 = sifre1.value;
        sifre2 = sifre2.value;
        if (sifre1.length < 8) {
            $("#1").css("display", "");
            return false;
        } else {
            $("#1").css("display", "none");
        }
        if (sifre1 === sifre2) {
            return true;
        } else {
            $("#2").css("display", "");
        }
        return false;
    }
</script>

<%@ include file = "footer.jsp" %>


</script>
<section class="pt-5">
    <div class="intro">
        <h1 class="text-center intro_title">Đặt vé với sự an tâm</h1>
        <p class="text-center intro_subtitle">Hủy vé không điều kiện, thay đổi trực tuyến, thẻ đã lưu và nhiều hơn nữa</p>
    </div>
    <div class="">
        <div class="container">
            <div class="card-deck pb-5">
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/safe-ticket.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Hủy Vé Không Điều Kiện</h5>
                            <p class="card-text text-center">Hoàn trả 90% giá vé nếu hủy trước 2 giờ bay.</p>
                        </div>
                </div>
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/magnifier.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Hủy và Thay Đổi Trực Tuyến</h5>
                            <p class="card-text text-center">Tiết kiệm thời gian bằng cách thực hiện hủy hoặc thay đổi trực tuyến.</p>
                        </div>
                </div>
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/kart-saklama-mobil-telefon.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Thẻ Đã Lưu</h5>
                            <p class="card-text text-center">Lưu tất cả thông tin một lần, nhận vé nhanh chóng.</p>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container">
        <div class="intro">
            <h1 class="intro_title">Những Thành Phố Bạn Nên Tham Quan</h1>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/milano.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Milano</h5>
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/berlin.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Berlin</h5>
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/viyana.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Viyana</h5>
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/kiev.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Kiev</h5>
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/prag.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Prag</h5>
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="assets/images/belgrad.webp" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Belgrad</h5>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>
<hr class="test_border">
<section class="container">
    <div class="intro">
        <h1 class="intro_title">Những Địa Điểm Tốt Nhất Cho Kỳ Nghỉ Bãi Biển Ngắn</h1>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/tr.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Thổ Nhĩ Kỳ</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/italya.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Ý</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/tayland.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Thái Lan</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/yunanistan.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Hy Lạp</h5>
                    </div>
            </div>
        </div>
    </div>
</section>

<hr class="test_border">
<section class="container">
    <div class="intro">
        <h1 class="intro_title">Những Địa Điểm Tốt Nhất Cho Kỳ Nghỉ Bãi Biển Ngắn</h1>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/tr.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Thổ Nhĩ Kỳ</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/italya.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Ý</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/tayland.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Thái Lan</h5>
                    </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="assets/images/yunanistan.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Hy Lạp</h5>
                    </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="cta mt-5 mb-5">
        <form action="uyeol" method="post">
            <div class="intro text-center">
                <h1 style="font-size: 26px">Đăng Ký Và Nhận Ưu Đãi</h1>
                <a href="uyeol" style="padding-bottom: 15px; padding-top: 15px;" class="search_button">Đăng Ký Ngay</a>
        </form>
    </div>
</div>
</section>
<section>
    <div class="desc_bg">
        <div class="container">
            <div class="card-deck pt-5 pb-5">
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/1.svg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Đi Đến Mọi Nơi Bạn Muốn</h5>
                            <p class="card-text text-center">Đây là thế giới của bạn và chúng tôi sẽ giúp bạn khám phá. Tìm các mức giá tốt nhất từ hàng triệu lựa chọn đặt vé máy bay để lên kế hoạch cho chuyến đi tuyệt vời nhất của bạn.</p>
                        </div>
                </div>
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/2.svg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Không Có Mớ Hỗn Loạn</h5>
                            <p class="card-text text-center">Không có phí ẩn. Không có chi phí ẩn. Không có lừa đảo. Khi đặt vé với chúng tôi, bạn luôn biết chính xác tiền của mình sẽ đi đâu. Vì vậy, bạn có thể thư giãn ngay cả trước khi chuyến đi bắt đầu.</p>
                        </div>
                </div>
                <div class="card">
                    <img class="intro_card-img-top mx-auto" src="assets/images/3.svg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title text-center">Du Lịch Theo Cách Bạn Muốn</h5>
                            <p class="card-text text-center">Bạn biết mình muốn đi đâu? Xem thời điểm tốt nhất để đặt vé. Lịch trình của bạn linh hoạt? Khám phá tất cả các cơ hội từ những chuyến nghỉ ngắn đến những cuộc phiêu lưu tuyệt vời.</p>
                        </div>
                </div>
            </div>
        </div>
    </div>
</section>  
<%@ include file = "footer.jsp" %>
