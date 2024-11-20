<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today" value="<%=new java.util.Date()%>" />
<%@ include file = "header.jsp" %>
<%@ include file = "navigasyon.jsp" %>
<main class="main_search">
    <div class="search">
        <div class="container fill_height">
            <div class="row fill_height">
                <div class="col fill_height">
                    <div class="search_tabs_container">                     
                        <form action="ucussorgulama" name="ucussorgulama" method="post" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start" onsubmit="return Kontrol()">
                            <div class="search_item">
                                <div>Điểm khởi hành</div>
                                <select class="search_input" id="gidis" name="gidis" required>
                                    <c:forEach var="havaalani" items="${havaalaniliste}">
                                        <c:choose>
                                        <c:when test= "${havaalani.havaalani_id == rezervasyon.havaalani_kalkis_id}">
                                            <option value="<c:out value="${havaalani.havaalani_id}" />" selected><c:out value="${havaalani.havaalani_ad}" /> | <c:out value="${havaalani.havaalani_kod}" /> | <c:out value="${havaalani.havaalani_sehir_ad}" /></option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="<c:out value="${havaalani.havaalani_id}" />"><c:out value="${havaalani.havaalani_ad}" /> | <c:out value="${havaalani.havaalani_kod}" /> | <c:out value="${havaalani.havaalani_sehir_ad}" /></option>
                                        </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="search_item">
                                <div>Điểm đến</div>
                                <select class="search_input" id="varis" name="varis" required>
                                    <c:forEach var="havaalani" items="${havaalaniliste}">
                                        <c:choose>
                                        <c:when test= "${havaalani.havaalani_id == rezervasyon.havaalani_varis_id}">
                                            <option value="<c:out value="${havaalani.havaalani_id}" />" selected><c:out value="${havaalani.havaalani_ad}" /> | <c:out value="${havaalani.havaalani_kod}" /> | <c:out value="${havaalani.havaalani_sehir_ad}" /></option>                                                                                 
                                        </c:when>
                                        <c:otherwise>
                                            <option value="<c:out value="${havaalani.havaalani_id}" />"><c:out value="${havaalani.havaalani_ad}" /> | <c:out value="${havaalani.havaalani_kod}" /> | <c:out value="${havaalani.havaalani_sehir_ad}" /></option>
                                        </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="search_item">
                                <div>Ngày khởi hành</div>
                                <input type="date" class="search_input" name="gidis_tarih" id="gidis_tarih" value="<c:out value="${rezervasyon.ucus_tarih}" />" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${today}" />" required>
                            </div>
                            <div class="search_item">
                                <div>Người lớn</div>
                                <select name="yetiskin" id="yetiskin" class="dropdown_item_select search_input" required>
                                    <c:choose>                                                       
                                            <c:when test = "${rezervasyon.yetiskin_sayi==1}">
                                                <option selected>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </c:when>        
                                            <c:when test = "${rezervasyon.yetiskin_sayi==2}">
                                                <option>1</option>
                                                <option selected>2</option>
                                                <option>3</option>
                                            </c:when>         
                                            <c:otherwise>
                                                <option>1</option>
                                                <option>2</option>
                                                <option selected>3</option>
                                            </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <input type="hidden" value="<c:out value="${rezervasyon.yetiskin_sayi}" /> " id="yetiskin_sayi" name="yetiskin_sayi">
                            <input type="hidden" value="<c:out value="${rezervasyon.cocuk_sayi}" /> " id="cocuk_sayi" name="cocuk_sayi">
                            <div class="search_item">
                                <div>Trẻ em</div>
                                <select name="cocuk" id="cocuk" class="dropdown_item_select search_input" required>
                                    <c:choose>                                                       
                                            <c:when test = "${rezervasyon.cocuk_sayi==0}">
                                                <option selected>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </c:when>  
                                            <c:when test = "${rezervasyon.cocuk_sayi==1}">
                                                <option>0</option>
                                                <option selected>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </c:when>   
                                            <c:when test = "${rezervasyon.cocuk_sayi==2}">
                                                <option>0</option>
                                                <option>1</option>
                                                <option selected>2</option>
                                                <option>3</option>
                                            </c:when>         
                                            <c:otherwise>
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option selected>3</option>
                                            </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <button class="search_button">Tìm kiếm chuyến bay mới</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    function Kontrol(){
        var formKontrol=document.forms["ucussorgulama"];
        var gidis= formKontrol["gidis"];
        var varis= formKontrol["varis"];
        gidis=gidis.value;
        varis=varis.value; 
        if(gidis===varis){
            swal({
                title: "Lỗi",
                text: "Điểm khởi hành và điểm đến không thể trùng nhau!",
                icon: "warning",
                button: "OK",
            });
            return false;
        }else {
            return true;
        }
    }
</script>

<section class="container flight pt-2">
    <div class="row">
        <div class="col-md-12 py-1 pt-2 bg-blue-search rounded text-left mb-2 shadow-sm">
            <div class="row d-flex justify-content-between align-items-center">
                <div class="col pt-1" style="font-size: 22px; margin: 10px">
                    <p class="font-weight-bold text-dark mb-0">         
                        <span class="s-ticketnum font-weight-bold"><i class="fas fa-plane-departure" style="color: #FF7F00"></i></span>

                        <c:forEach var="havaalani" items="${havaalaniliste}">
                                <c:choose>
                                        <c:when test= "${havaalani.havaalani_id == rezervasyon.havaalani_kalkis_id}">
                                            <c:out value="${havaalani.havaalani_sehir_ad}" />                                                                                 
                                        </c:when>             
                                </c:choose>
                        </c:forEach> 
                        <span class="s-ticketnum font-weight-bold"><i class="fas fa-long-arrow-alt-right" style="color: #FF7F00"></i></span> 
                        <c:forEach var="havaalani" items="${havaalaniliste}">
                                <c:choose>
                                        <c:when test= "${havaalani.havaalani_id == rezervasyon.havaalani_varis_id}">
                                            <c:out value="${havaalani.havaalani_sehir_ad}" />                                                                                 
                                        </c:when>             
                                </c:choose>
                        </c:forEach>
                    </p>
                </div>
                <div class="col text-right">
                    <span class="text-dark">Ngày: </span>
                    <span class="text-dark font-weight-bold" > <c:out value="${rezervasyon.ucus_tarih}" /></span>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file = "footer.jsp" %>
