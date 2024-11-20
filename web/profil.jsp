<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "header.jsp" %>
<%@ include file = "navigasyon.jsp" %>
<section class="container" style="margin-bottom: 200px; margin-top: 100px; font-weight: 600;">
    <div class="row">
        <div class="col">                 
            <div class="card shadow-sm border ">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-10">Thông Tin Người Dùng</div>
                        <div class="col-sm-2">
                            <a style="color:#FF7F00" data-toggle="modal" href="#exampleModal">Xóa Tài Khoản</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Tài Khoản</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="hesapsil" method="post">
                        <input type="hidden" id="sifre_id" name="sifre_id" value="<c:out value="${kullanici.kullanici_id}" />">
                            <p>Hành động này không thể hoàn tác. Bạn có chắc không?</p>
                            <div class="form-group">
                                <label for="sil_sifre" class="col-form-label">Mật khẩu của bạn: </label>
                                <input type="password" class="form-control" id="sil_sifre" name="sil_sifre" required>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-danger">Xóa</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
        <%                
        String req = request.getParameter("durum");
            if (req != null) {
                if (req.equals("basarili")) {
                    out.print("<div class=' alert alert-success mt-3' role='alert'>Cập nhật thành công.</div>");
                } else if (req.equals("hatali")) {
                    out.print("<div class=' alert alert-warning mt-3' role='alert'>Cập nhật thất bại. Mật khẩu hiện tại không đúng.</div>");
                } else if (req.equals("uyari")) {
                    out.print("<div class=' alert alert-warning mt-3' role='alert'>Xóa tài khoản thất bại. Mật khẩu không đúng.</div>");
                }  else {
                    out.print("<div class=' alert alert-warning mt-3' role='alert'>Cập nhật thất bại. Email này đã được sử dụng.</div>");
                }
            }
        %>
        <div class="row mt-3">
            <div class="col-sm-6">                 
                <div class="card border">
                    <p class="card-header text-center" style="background-color: #F1F2F8;">Thông Tin Thành Viên</p>
                    <div class="card-body">
                        <form class="text-muted" action="profilguncelle" method="post">
                            <input type="hidden" id="kullanici_id" name="kullanici_id" value="<c:out value="${kullanici.kullanici_id}" />">
                                <div class="form-group row">
                                    <label for="kullanici_ad" class="col-sm-4 col-form-label">Tên</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="kullanici_ad" name="kullanici_ad" value="<c:out value="${kullanici.kullanici_ad}" />" placeholder="Tên" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="kullanici_soyad" class="col-sm-4 col-form-label">Họ</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="kullanici_soyad" name="kullanici_soyad" value="<c:out value="${kullanici.kullanici_soyad}" />" placeholder="Họ" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="kullanici_email" class="col-sm-4 col-form-label">Địa chỉ Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" class="form-control" id="kullanici_email" name="kullanici_email" value="<c:out value="${kullanici.kullanici_email}" />" placeholder="Email" required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-outline-warning">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">                 
                <div class="card border">
                    <p class="card-header text-center" style="background-color: #F1F2F8;">Cập Nhật Mật Khẩu</p>
                    <div class="card-body">
                        <form class="text-muted" id="sifreguncelleme" name="sifreguncelleme" method="POST" action="sifreguncelle" onsubmit="return Kontrol()">
                            <input type="hidden" id="kullanici_id_sifre" name="kullanici_id_sifre" value="<c:out value="${kullanici.kullanici_id}" />">
                                <div class="form-group row">
                                    <label for="kullanici_suan_sifre" class="col-sm-4 col-form-label">Mật Khẩu Hiện Tại</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="kullanici_suan_sifre" name="kullanici_suan_sifre" autocomplete="current-password" placeholder="Mật Khẩu Hiện Tại" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="kullanici_sifre1" class="col-sm-4 col-form-label">Mật Khẩu Mới</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="kullanici_sifre1" name="kullanici_sifre1" autocomplete="new-password" placeholder="Mật Khẩu Mới" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="kullanici_sifre2" class="col-sm-4 col-form-label">Nhập Lại Mật Khẩu Mới</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="kullanici_sifre2" name="kullanici_sifre2" autocomplete="new-password" placeholder="Nhập Lại Mật Khẩu Mới" required>
                                    </div>
                                </div>
                                <div class="alert alert-warning" role="alert" id="1" style="display:none">Mật khẩu phải dài ít nhất 8 ký tự.</div>
                                <div class="alert alert-warning" role="alert" id="2" style="display:none">Mật khẩu không khớp.</div>
                                <button type="submit" class="btn btn-outline-warning">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
</section>
<script>
    function Kontrol() {
        var formUyeOl = document.forms["sifreguncelleme"];
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
