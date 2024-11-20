<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "header.jsp" %>
<%@ include file = "navigasyon.jsp" %>
<section class="container" style="margin-bottom: 200px; margin-top: 100px; font-weight: 600;">
    <div class="row">
        <div class="col">                 
            <div class="card shadow-sm border ">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-10">Quản lý đặt chỗ của tôi</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%        
    String req = request.getParameter("durum");
        if (req != null) {
            if (req.equals("basarili")) {
                out.print("<div class=' alert alert-success mt-3' role='alert'>Đặt chỗ của bạn đã được tạo thành công.</div>");
            } else {
                out.print("<div class=' alert alert-warning mt-3' role='alert'>Quá trình đặt chỗ không thành công. Các ghế đã được đặt trước.</div>");
            }
        }
    String re = request.getParameter("guncelleme");
        if (re != null) {
            if (re.equals("basarili")) {
                out.print("<div class=' alert alert-success mt-3' role='alert'>Cập nhật thành công.</div>");
            }
        }
    String r = request.getParameter("iptal");
        if (r != null) {
            if (r.equals("basarisiz")) {
                out.print("<div class=' alert alert-warning mt-3' role='alert'>Hủy đặt chỗ không thành công. Mật khẩu không đúng.</div>");
            } else {
                out.print("<div class=' alert alert-success mt-3' role='alert'>Hủy đặt chỗ thành công.</div>");
            }
        }
    %>
    <c:if test="${empty rezervasyonislem}">
        <div class="mt-5 text-center">
            <i class="far fa-calendar-times text-dark fa-4x mb-3"></i>
            <h2>Không có đặt chỗ</h2>
            <p>Chưa có đặt chỗ nào được thực hiện.</p>
        </div>
    </c:if>
    <c:forEach var="rez" items="${rezervasyonislem}">
        <div class="row mt-2">
            <div class="col-12">
                <div class="card bg-payment-card shadow-sm border" style="border: 1px solid rgba(0,0,0,.125); margin-top: 10px;">
                    <p class="card-header text-center" style="background-color: #F1F2F8">Thông tin đặt chỗ</p>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <h5 class="card-title"><img class="img-fluid" src="<%=request.getContextPath()%>/assets/data/<c:out value="${rez.firma_logo}" />" style="width: 1.5em"> <c:out value="${rez.firma_ad}" /> - <c:out value="${rez.ucak_ad}" /></h5>
                            <p class="card-title">Số PNR: <span class="text-white bg-dark"><c:out value="${rez.pnr_no}" /></span></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Ngày bay: <span class="font-weight-bold"><c:out value="${rez.ucus_tarih}" /></span></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Đi từ: <span class="font-weight-bold"><c:out value="${rez.kalkis_ad}" /></span></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Đến: <span class="font-weight-bold"><c:out value="${rez.varis_ad}" /></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Giờ khởi hành: <span class="font-weight-bold"><c:out value="${rez.ucus_saat}" /></span></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Giờ đến: <span class="font-weight-bold"><c:out value="${rez.varis_saat}" /></span></p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Thời gian bay: <span class="font-weight-bold"><c:out value="${rez.ucus_s}" /> giờ <c:out value="${rez.ucus_d}" /> phút</span></p>
                        </div>
                        <div class="card-text-payment ln-h14 my-3">
                            <p class="f-09em card-text-payment cursor-pointer" data-toggle="modal" data-target="#fly-class-go-<c:out value="${rez.rezervasyon_id}" />">Chi tiết hành khách <i class="fas fa-chevron-right" aria-hidden="true"></i> </p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="card-title mt-2">Quyền hủy <br> Bạn có thể hủy chuyến bay của mình trước 2 giờ trước giờ khởi hành.</p>     
                                <c:choose>
                                    <c:when test= "${rez.durum > 0}">
                                    <a style="color:#FF7F00" data-toggle="modal" href="#exampleModal<c:out value="${rez.rezervasyon_id}" />">Hủy</a>
                                </c:when>
                                <c:otherwise>
                                    <p style="color:#FF7F00">Bạn không có quyền hủy</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="card-title mt-2">Quyền thay đổi <br> Bạn có thể thay đổi thông tin của mình trước 2 giờ trước giờ khởi hành.</p>     
                                <c:choose>
                                    <c:when test= "${rez.durum > 0}">
                                    <a style="color:#FF7F00" data-toggle="modal" href="#exampleModal0<c:out value="${rez.rezervasyon_id}" />">Thay đổi thông tin</a>
                                </c:when>
                                <c:otherwise>
                                    <p style="color:#FF7F00">Bạn không có quyền thay đổi</p>
                                </c:otherwise>
                            </c:choose>
                        </div> 
                    </div>
                </div>

                <div class="modal fade" id="exampleModal<c:out value="${rez.rezervasyon_id}" />" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel<c:out value="${rez.rezervasyon_id}" />" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel<c:out value="${rez.rezervasyon_id}" />">Hủy đặt chỗ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="reziptal" method="post">
                    <input type="hidden" id="rezervasyon_id" name="rezervasyon_id" value="<c:out value="${rez.rezervasyon_id}" />">
                    <p>Hành động này không thể hoàn tác. Bạn có chắc chắn không?</p>
                    <div class="form-group">
                        <label for="sil_sifre" class="col-form-label">Mật khẩu của bạn:</label>
                        <input type="password" class="form-control" id="sil_sifre" name="sil_sifre" required>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                        <button type="submit" class="btn btn-danger">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="exampleModal0<c:out value="${rez.rezervasyon_id}" />" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel0<c:out value="${rez.rezervasyon_id}" />" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel0<c:out value="${rez.rezervasyon_id}" />">Thay đổi thông tin</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="rezervasyonguncelle">
                        <input type="hidden" name="id" value="<c:out value='${rez.rezervasyon_id}' />" />
                        <div class="form-group row">
                            <label for="yolcu_ad<c:out value="${rez.rezervasyon_id}" />" class="col-sm-2 col-form-label">Tên:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="yolcu_ad<c:out value="${rez.rezervasyon_id}" />" name="yolcu_ad<c:out value="${rez.rezervasyon_id}" />" value="<c:out value="${rez.yolcu_ad}" />" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yolcu_soyad<c:out value="${rez.rezervasyon_id}" />" class="col-sm-2 col-form-label">Họ:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="yolcu_soyad<c:out value="${rez.rezervasyon_id}" />" name="yolcu_soyad<c:out value="${rez.rezervasyon_id}" />" value="<c:out value="${rez.yolcu_soyad}" />" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yolcu_tc<c:out value="${rez.rezervasyon_id}" />" class="col-sm-3 col-form-label">Mã số:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" pattern="[0-9]{11}" id="yolcu_tc<c:out value="${rez.rezervasyon_id}" />" name="yolcu_tc<c:out value="${rez.rezervasyon_id}" />" value="<c:out value="${rez.yolcu_tc}" />" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yolcu_tarih<c:out value="${rez.rezervasyon_id}" />" class="col-sm-4 col-form-label">Ngày sinh:</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="yolcu_tarih<c:out value="${rez.rezervasyon_id}" />" name="yolcu_tarih<c:out value="${rez.rezervasyon_id}" />" value="<c:out value="${rez.yolcu_tarih}" />" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yolcu_email<c:out value="${rez.rezervasyon_id}" />" class="col-sm-2 col-form-label">Email:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="yolcu_email<c:out value="${rez.rezervasyon_id}" />" name="yolcu_email<c:out value="${rez.rezervasyon_id}" />" value="<c:out value="${rez.yolcu_email}" />" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="yolcu_tel<c:out value="${rez.rezervasyon_id}" />" class="col-sm-3 col-form-label">Số điện thoại:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="yolcu_tel<c:out value="${rez.rezervasyon_id}" />" name="yolcu_tel<c:out value="${rez.rezervasyon_id}" />" pattern="[0-9]{11}" title="Nhập theo định dạng: 05554443322" value="<c:out value="${rez.yolcu_tel}" />" required>
                            </div>
                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-danger">Cập nhật</button>                         
                        </div>
                    </form>
                </div>
            </div>
        </div>  
        <div class="modal fade" id="fly-class-go-<c:out value="${rez.rezervasyon_id}" />" tabindex="-1" aria-labelledby="fly-class-go-<c:out value="${rez.rezervasyon_id}" />" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="fly-class-go-<c:out value="${rez.rezervasyon_id}" />">Chi tiết hành khách</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Họ và Tên: <c:out value="${rez.yolcu_ad}" /> <c:out value="${rez.yolcu_soyad}" /></p>
                        <p>Số mã định danh: <c:out value="${rez.yolcu_tc}" /></p>
                        <p>Ngày sinh: <c:out value="${rez.yolcu_tarih}" /></p>
                        <p>Giá vé: <c:out value="${rez.yolcu_ucret}" /> ₺</p>
                        <p>Số ghế: <c:out value="${rez.koltuk_no}" /></p>
                        <br><br>
                        <h5 style="color:orange">Thông tin liên hệ</h5>
                        <p>Email: <c:out value="${rez.yolcu_email}" /></p>
                        <p>Số điện thoại: <c:out value="${rez.yolcu_tel}" /></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </c:forEach>
</section>
<%@ include file = "footer.jsp" %>
