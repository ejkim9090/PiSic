<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Artist Detail</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	text-align: center;
	margin-right: 20px;
}

.main_img_div.rel_album {
	margin: 0px auto;
}

table.intro_table tr>td:nth-child(1) {
	width: 50px;
}

.content_info {
	vertical-align: middle;
}

.content_div0 {
	clear: both;
	margin: 30px 0px;
}

.intro_box {
	font-size: 14px;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}

.album_div {
	padding: 15px 15px;
}

.artist_div {
	padding: 15px 15px;
	display: flex;
}

.grid-4 {
	flex: 0 0 25%;
	max-width: 25%;
}

.div_like {
	display: flex;
	justify-content: space-between;
}

.div_like p {
	line-height: 30px;
	margin: 0;
}

.content-wrapper a {
	color: #6c7293;
}

.playlist_insert_modal_new {
	text-align: center;
}

.rel_album_div {
	padding: 15px 0px;
}

.report_div {
	margin: 0px 15px;
	text-align: center;
}

.recomment_div {
	margin: 0px 15px;
}

.recomment_div textarea {
	width: 100%;
}

.recomment_div textarea, .recomment_div button {
	vertical-align: middle;
}

.recomment_content_div {
	padding: 15px 15px;
}

.sound_recomment_table img {
	width: 30px;
	height: 30px;
	border-radius: 100%;
}

table.sound_recomment_table td {
	white-space: normal !important;
}

table.sound_recomment_table  tr:nth-child(1) {
	text-align: center;
}

table.sound_recomment_table  tr>td:nth-child(1) {
	width: 5%;
}

table.sound_recomment_table  tr>td:nth-child(2) {
	width: 15%;
}

table.sound_recomment_table  tr>td:nth-child(3) {
	width: 50%;
}

table.sound_recomment_table  tr>td:nth-child(4), table.sound_recomment_table  tr>td:nth-child(5)
	{
	width: 10%;
	text-align: center;
}

table.album_table thead tr th:nth-child(2) {
	width: 50%;
}

div.table-responsive {
	width: 100%;
	height: 700px;
	overflow: auto;
}
</style>
<style>
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	margin-right: 20px;
}

table.intro_table tr>td:nth-child(1) {
	width: 50px;
}

table.intro_table a {
	color: #6c7293;
}

.content_info {
	vertical-align: middle;
}

.content_div2 {
	clear: both;
	margin: 30px 0px;
}

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(6), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8) {
	width: 5%;
}

table.sound_list  tr>td:nth-child(6), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8) {
	text-align: center;
}

.intro_box {
	font-size: 14px;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}

table.sound_list a {
	color: #6c7293;
}
</style>

<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	// 더보기 기능
	var content = $(".intro_box");
    var content_txt = content.text();
    var content_html = content.html();
    var content_txt_short = content_txt.substring(0,100)+"...";
    
    if(content_txt.length >= 100){
        content.html(content_txt_short)
        
    }else{
        $(".btn_more").hide()
    }
    
    $(".btn_more").click(toggle_content);
    function toggle_content(){
        if($(this).hasClass('short')){
            // 접기 상태
            $(this).html('더보기');
            content.html(content_txt_short)
            $(this).removeClass('short');
        }else{
            // 더보기 상태
            $(this).html('접기');
            content.html(content_html);
            $(this).addClass('short');

        }
    }
    
    // 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    
    // 선택 재생
    $("#select_play").click(function(){
    	// 체크된 노래 확인 후 , 체크 안되어있다면 input-hidden 지우기
    	$("input[name=s_no]").each(function(){
    		if(!(this.checked)){
    			console.log("히든 지우기");
    			$(this).parent().next("input[name=a_no]").remove();
    		} 
    		console.log(this.checked);
    	});
    	// Post 방식으로 새창 열기
    	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
    	sound_frm.action="<%=request.getContextPath()%>/sound/play";
    	sound_frm.target="SoundPlayer";
    	sound_frm.method="post";
    	sound_frm.submit();
    });
    
    /* modal 플레이 리스트 담기 */
	$("#select_insert").click(function() {
		console.log($('input[name=s_no]:checked').length);
		if($('input[name=s_no]:checked').length == '0'){
			alert("곡을 선택하세요.");
		} else {
			$("#playlist_insert_modal").show();
			$.ajax({
				url: "<%=request.getContextPath()%>/mymusic/playlist.ax",
				type: "post",
				success: function(result) {
					var html = "";
					for(var i = 0; i < result.length; i++){
						var vo = result[i];
						html += '<div class="preview-item border-bottom">';
						html += '<div class="preview-thumbnail">';
						html += '<img src='+vo.l_image+' class="modal_content">';
						html += '</div>';
						html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
						html += '<div class="flex-grow">';
						html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistSelectInsertDo('+vo.l_no+')">'+vo.l_name+'</a></p></div>';
						if(vo.l_private_yn == 'Y'){
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
						} else {
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
						}
					}
					$(".preview-list").nextAll().remove();
					$(".preview-list").append(html);
				},
			}); // ajax 끝
		}
	});
    
	
    // 모달창 끄기 2가지
	$(".playlist_insert_modal_close").click(function() {
		$("#playlist_insert_modal").hide();
	});
	
	playlist_insert_modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("playlist_insert_modal_overlay")) {
			$("#playlist_insert_modal").hide();
		}
	});
	
	// 미니 버튼들 a태그 색상 바꾸기
	$("i.mdi").parent('a').css('color','#8f5fe8');
});

//한곡 재생 - post방식으로 a태그 이용해서 이동
function playOne(a_no,s_no){
	console.log("한곡재생");

	var frm = document.createElement('form');
    var input_s_no = document.createElement('input');
    input_s_no.setAttribute('type', 'hidden');
    input_s_no.setAttribute('name', 's_no');
    input_s_no.setAttribute('value', s_no);
	var input_a_no = document.createElement('input');
    input_a_no.setAttribute('type', 'hidden');
    input_a_no.setAttribute('name', 'a_no');
    input_a_no.setAttribute('value', a_no);
    
    frm.appendChild(input_s_no);
    frm.appendChild(input_a_no);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', '<%=request.getContextPath()%>/sound/play');
    document.body.appendChild(frm);
	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.target="SoundPlayer";
    frm.submit();
};

//노래 좋아요 - ajax
function soundLike(a_no,s_no){
	console.log("좋아요");
	$.ajax({
		url:"<%=request.getContextPath()%>/sound/like",
		type:"post",
		data:{
			a_no:a_no,
			s_no:s_no
			},
		success: function(result){
			if(result == "-2"){
				alert("로그인 후 이용해주세요");
				location.replace("<%=request.getContextPath()%>/member/login");
			} else if(result == "-1"){
				alert("좋아요 취소에 실패했습니다. 다시 시도해주세요.");
			} else if(result == "0"){
				alert("해당 곡을 좋아요를 취소했습니다.");
			} else if(result == "1"){
				alert("해당 곡을 좋아요를 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "2"){
				alert("해당 곡을 좋아요 했습니다.");
			}
			
		},
		error:function(){
			
		}
	}); //ajax 끝
};

// 플레이리스트 한곡 담기 모달창
function playlistInsert(a_no, s_no){
	$("#playlist_insert_modal").show();
	$.ajax({
		url: "<%=request.getContextPath()%>/mymusic/playlist.ax",
		type: "post",
		success: function(result) {
			var html = "";
			for(var i = 0; i < result.length; i++){
				var resultData = result[i];
				html += '<div class="preview-item border-bottom">';
				html += '<div class="preview-thumbnail">';
				html += '<img src='+resultData.l_image+' class="modal_content">';
				html += '</div>';
				html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
				html += '<div class="flex-grow">';
				html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistInsertDo('+a_no +','+ s_no +','+ resultData.l_no +')">'+resultData.l_name+'</a></p></div>';
				if(resultData.l_private_yn == 'Y'){
					html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
				} else {
					html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
				}
			}
			$(".preview-list").nextAll().remove();
			$(".preview-list").append(html);
		},
	}); // ajax 끝
}

// 한곡 담기
function playlistInsertDo(a_no, s_no, l_no){
	$.ajax({
		url: "<%=request.getContextPath()%>/mymusic/insertSound",
		type: "post",
		data:{
			a_no:a_no,
			s_no:s_no,
			l_no:l_no
		},
		success: function(result) {
			if(result == "0"){
				alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "1"){
				alert("해당 곡을 담았습니다.");
			}
		},
		error:function(){
			
		}
	}); // ajax 끝
}
// 선택 담기
function playlistSelectInsertDo(l_no){
	$("input[name=s_no]").each(function(){
		if(!(this.checked)){
			console.log("히든 지우기");
			$(this).parent().next("input[name=a_no]").remove();
		} 
		console.log(this.checked);
	});
	var s_noArray = [];
	var a_noArray = [];
	$('input[name=s_no]:checked').each(function(){ //체크된 리스트 저장
		s_noArray.push($(this).val());
    });
	$('input[name=a_no]').each(function(){
		a_noArray.push($(this).val());
    });
	console.log("s_noArray: "+s_noArray);
	console.log("a_noArray: "+a_noArray);
	var ajaxData = {
			s_no : s_noArray,
			a_no : a_noArray,
			l_no : l_no
	}
	
	$.ajax({
		url: "<%=request.getContextPath()%>/mymusic/insertSound",
		type: "post",
		dataType: "json",
		data: ajaxData,
		traditional:true,
		success: function(result) {
			if(result == "0"){
				alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "1"){
				alert("해당 곡을 담았습니다.");
			}
		},
		error:function(){
			
		}
	});  // ajax 끝
}

// 새 플레이 리스트 만들기
function newPlaylist(){
	location.href = "<%=request.getContextPath()%>/mymusic/insertPlaylist";
};

// 제목, 아티스트, 앨범 클릭시 상세조회 페이지
function selectSoundDetail(a_no, s_no){
	location.href = "<%=request.getContextPath()%>/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
};
function selectArtistDetail(artist_no){
	location.href = "<%=request.getContextPath()%>/sound/artistDetail?artist_no=" + artist_no;
};
function selectAlbumDetail(a_no){
	location.href = "<%=request.getContextPath()%>/sound/albumDetail?a_no=" + a_no;
};
</script>
</head>
<body>
	<jsp:include page="../commonSoundList.jsp" />
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<%-- <jsp:include page="_navbar.jsp" /> --%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">아티스트 정보</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img" src="${artist.artist_profile }" width="300"
								height="300">
						</div>
						<div class="content_info  card">
							<div class="card-body">
								<table class="table intro_table">
									<thead>
										<tr>
											<th colspan="2">${artist.artist_name}</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>국적 :</td>
											<td>${artist.artist_nation }</td>
										</tr>
										<c:if test="${artist.artist_company ne null}">
											<tr>
												<td>소속사 :</td>
												<td>${artist.artist_company }</td>
											</tr>
										</c:if>
										<tr>
											<td>활동 유형 :</td>
											<td>${artist.artist_type }</td>
										</tr>
										<c:if test="${artist.artist_group ne null}">
											<tr>
												<td>그룹명 :</td>
												<td>${artist.artist_group }</td>
											</tr>
										</c:if>
										<c:if test="${artist.artist_member ne null}">
											<tr>
												<td>구성 멤버 :</td>
												<td>${artist.artist_member }</td>
											</tr>
										</c:if>
										<tr>
											<td>좋아요 :</td>
											<td>
												<div class="div_like">
													<p>${sound.cnt_like }</p>
													<a href="javascript:soundLike('${artist.artist_name }')"><i
														class="mdi mdi-heart list_icon like_after"></i></a>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="content_div0 content_div2">
						<div>
							<h3 class="card-title">아티스트 소개</h3>
						</div>
						<hr color="white">
						<blockquote class="blockquote">

							<div class="intro_box">
								<c:choose>
									<c:when test="${artist.artist_member eq null}">
								해당 아티스트의 소개 정보가 등록 되어있지 않습니다.
								</c:when>
									<c:when test="${artist.artist_member ne null}">
								${artist.artist_info1}${artist.artist_info2}
								</c:when>
								</c:choose>

							</div>
						</blockquote>
						<div style="text-align: center">
							<button type="button"
								class="btn btn-outline-light btn-fw btn_more">더보기</button>
						</div>
					</div>
					<div class="content_div0 content_div4">
						<div>
							<h3 class="card-title">참여 앨범</h3>
						</div>
						<hr color="white">
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<c:forEach items="${artistJoinAlbum }" var="album">
								<div class="rel_album_div">
									<div class="main_img_div rel_album">
										<a href="javascript:selectAlbumDetail('${album.a_no }')"><img
											id="main_img" src="${album.a_cover }" width="200"
											height="200"></a>
									</div>
									<div class="content_info">
										<div class="card-body">
											<table class="table album_table">
												<thead>
													<tr>
														<th>앨범명 :</th>
														<th><a
															href="javascript:selectAlbumDetail('${album.a_no }')">${album.a_name}</a></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>가수명 :</td>
														<td><a href="javascript:selectArtistDetail('${album.artist_no }')">${album.artist_name}</a></td>
													</tr>
													<tr>
														<td>발매일 :</td>
														<td>${album.a_date}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="content_div0 content_div4">
						<div>
							<h3 class="card-title">참여 곡</h3>
						</div>
						<div class="select_btns">
							<button type="button" id="select_play"
								class="btn btn-info btn-fw">선택재생</button>
							<button type="button" id="select_insert"
								class="btn btn-info btn-fw">선택담기</button>
						</div>
						<hr color="white">
						<div class="table-responsive">
							<form name="sound_frm">
								<table class="table sound_list">
									<thead>
										<tr>
											<td>
												<div class="form-check form-check-muted m-0">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div>
											</td>

											<td></td>
											<td>노래명</td>
											<td>가수명</td>
											<td>앨범명</td>
											<td>듣기</td>
											<td>좋아요</td>
											<td>담기</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${artistJoinSound}" var="sounds">
											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input sound_checkbox"
															value="${sounds.s_no }" name="s_no">
														</label> <input type="hidden" value="${sounds.a_no }" name="a_no">
														<input type="hidden" value="${sounds.a_no }" name="a_no">
													</div>
												</td>

												<td><img src="${sounds.a_cover }" alt="image" /></td>
												<td><a
													href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
												<td><c:forEach items="${ sounds.singers}" var="singer">
														<a
															href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
												<td><a
													href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
												<td><a
													href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-play list_icon"></i></a></td>
												<td><a
													href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
												</td>
												<td><a
													href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<br>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../_footer.jsp" />
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/chart.js/Chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<!-- End custom js for this page -->
</body>
</html>