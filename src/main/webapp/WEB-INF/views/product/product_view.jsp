<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ##### cor_view.jsp로 병합 후 삭제 예정 ##### -->

<%@ include file="../include/header.jsp"%>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/resources/css/blog.css" rel="stylesheet">

<main class="container">
	<div class="row mb-2">
		<div class="col-md-6 align-self-center">
			<div class="img_wrap" id="height_img">
				<img src="/upload/${pvo.thumbnail }">
			</div>
		</div>

		<div class="col-md-6 align-self-center" style="position: relative;">
			<div class="gSwvZYY">
				<button type="button" class="btn btn-secondary eBlbuFF"
					data-bs-toggle="modal" data-bs-target="#option">사진모두 보기</button>
			</div>
			<!-- 사진모두보기 모달 시작 -->
			<div class="modal fade" id="option" data-bs-keyboard="false"
				tabindex="-1" aria-labelledby="staticBackdropLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-body">
							<div class="row">
								<div id="carouselExampleControls" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-inner">
										<!-- 썸네일 -->
										<div class="carousel-item active">
											<img src="/upload/${pvo.thumbnail}" style="width: 100%;">
										</div>
										<c:forEach var="i" begin="0" end="3">
											<div class="carousel-item">
												<img
													src="						
      	  <c:choose>
				<c:when test="${i < picListLength}">/upload/${picList[i] }</c:when>
				<c:otherwise>/resources/images/logo_002_opacity.png</c:otherwise>
		  </c:choose>"
													style="width: 100%;">
											</div>
										</c:forEach>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden"></span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden"></span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 사진모두보기 모달 끝 -->

			<div class="row mb-2">
				<!-- 사진 출력 시작 -->
				<c:forEach var="i" begin="0" end="3">
					<div class="col-md-6 py-2 px-2">
						<div class="img_wrap">
							<img
								src='
						<c:choose>
							<c:when test="${i < picListLength}">/upload/${picList[i] }</c:when>
							<c:otherwise>/resources/images/logo_002_opacity.png</c:otherwise>
						</c:choose>
						'
								style="width: 100%">
						</div>
					</div>
				</c:forEach>
				<!-- 사진 출력 끝 -->
			</div>
		</div>
	</div>


	<p id="scrollspyHeading1"></p>
	<div class="row g-5">
		<div class="col-md-8">
			<!-- 스크롤 스파이 navar 시작 -->
			<nav id="navbar-example"
				class="navbar navbar-light bg-light px-3 fixed-top"
				style="top: -80px; transition: all 0.2s; justify-content: center; width: -webkit-fill-available; margin-top: 0;">
				<a class="navbar-brand" href="#">TOP</a>
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link"
						href="#scrollspyHeading1">가격정보</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#scrollspyHeading2">상세정보</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#scrollspyHeading3">옵션</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#scrollspyHeading4">상세설명</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#scrollspyHeading5">이 중개사무소의 다른 방</a></li>
				</ul>
			</nav>
			<!-- 스크롤 스파이 navar 끝 -->
			<h4 class="cBaPiP" style="margin-top: 35px;">가격정보</h4>
			<div class="iOHiXt" style="list-style: none;">
				<li>
					<div class="row"
						style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
						<div class="iehkos col-md-3">월세 / 보증금</div>
						<div class="gEjpOz col-md-9">${pvo.rent }/${pvo.deposit }</div>

					</div>
				</li>
				<li>
					<div class="row"
						style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
						<div class="iehkos col-md-3">관리비</div>
						<div class="gEjpOz col-md-9">
							<div
								style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
								<p>매월 ${pvo.manage }만원</p>
								<p class="gray-700">청소비, 승강기유지비, 기타</p>
							</div>
							<div>
								<p>별도 금액으로 부과되는 항목</p>
								<p class="gray-700">전기료, 수도료, 가스사용료</p>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="row"
						style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
						<div class="iehkos col-md-3">
							<p>한달</p>
							<p>예상 주거비용</p>
						</div>
						<div class="gEjpOz col-md-9">
							<p class="blue-500 bold">${pvo.rent }
								<c:if test="${pvo.type ne 0}">+${pvo.manage }</c:if>
								만원
							</p>
							<p class="gray-700">월세 + 관리비</p>
							<p class="body-3 gray-700">별도 금액으로 부과되는 항목 제외</p>
						</div>
					</div>
				</li>
			</div>

			<p id="scrollspyHeading2"></p>
			<div class="fCMewi">
				<h4 class="styled__Title-sc-16d1qhz-2 cBaPiP">상세정보</h4>
				<div class="iOHiXt" style="list-style: none;">
					<li>
						<div class="row"
							style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
							<div class="iehkos col-md-3">방종류</div>
							<div class="gEjpOz col-md-9">
								<c:if test="${pvo.type eq 1}">오피스텔</c:if>
								<c:if test="${pvo.type eq 0}">원룸</c:if>
							</div>
						</div>
					</li>
					<li>
						<div class="row"
							style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
							<div class="iehkos col-md-3">해당층/건물층</div>
							<div class="gEjpOz col-md-9">
								<p>
									<c:choose>
										<c:when test="${pvo.floor == -1}">반지층</c:when>
										<c:when test="${pvo.floor == 0 }">옥탑</c:when>
										<c:otherwise>${pvo.floor }층</c:otherwise>
									</c:choose>

									/${pvo.totalfloor }층
								</p>
							</div>
						</div>
					</li>
					<li>
						<div class="row"
							style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">


							<div class="iehkos col-md-3">전용/공급면적</div>

							<div class="gEjpOz flex col-md-9">
								<label>${Math.round(pvo.area * 100) / 100.0}m²</label>
								<button width="56" height="28" class="klhTP">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" style="flex: 0 0 auto;">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M15.9516 8.1744C14.9224 7.11154 13.5092 6.5 12 6.5C9.15079 6.5 6.80759 8.66652 6.52795 11.442L5.60355 10.5178L5.53431 10.4599C5.33944 10.3249 5.07001 10.3442 4.89645 10.5178C4.70118 10.713 4.70118 11.0296 4.89645 11.2249L7.01777 13.3462L9.13909 11.2249L9.19694 11.1556C9.33194 10.9608 9.31265 10.6913 9.13909 10.5178L9.06984 10.4599C8.87497 10.3249 8.60555 10.3442 8.43198 10.5178L7.53828 11.4104C7.82708 9.20371 9.71458 7.5 12 7.5C13.2356 7.5 14.3905 7.99976 15.2332 8.87003C15.4538 9.09785 15.6499 9.34827 15.818 9.61696C15.9645 9.85106 16.273 9.92211 16.5071 9.77565C16.7412 9.62919 16.8122 9.32068 16.6658 9.08658C16.4604 8.75834 16.2209 8.45254 15.9516 8.1744ZM14.8787 12.7751L17 10.6538L19.1213 12.7751C19.3166 12.9704 19.3166 13.287 19.1213 13.4822C18.9478 13.6558 18.6783 13.6751 18.4835 13.5401L18.4142 13.4822L17.4898 12.5578C17.2103 15.3334 14.867 17.5 12.0178 17.5C10.5085 17.5 9.09538 16.8885 8.06621 15.8256C7.79688 15.5475 7.55736 15.2417 7.35201 14.9134C7.20555 14.6793 7.27659 14.3708 7.5107 14.2244C7.7448 14.0779 8.05331 14.1489 8.19977 14.383C8.36787 14.6517 8.56401 14.9022 8.78461 15.13C9.62729 16.0002 10.7821 16.5 12.0178 16.5C14.3036 16.5 16.1914 14.7956 16.4797 12.5884L15.5858 13.4822C15.4122 13.6558 15.1428 13.6751 14.9479 13.5401L14.8787 13.4822C14.7051 13.3087 14.6858 13.0392 14.8208 12.8444L14.8787 12.7751Z"
											fill="#222222"></path></svg>
									<span><span>평</span></span>
								</button>
							</div>
						</div>
					</li>
					<li>
						<div class="row"
							style="margin-bottom: 16px; padding-bottom: 16px; border-bottom: 1px solid rgb(245, 245, 245);">
							<div class="iehkos col-md-3">방 수/욕실 수</div>
							<div class="gEjpOz col-md-9">${pvo.room }개/${pvo.shower }개</div>
						</div>
					</li>
				</div>
			</div>

			<div class="fCMewi">
				<p id="scrollspyHeading3"></p>
				<h4 class="styled__Title-sc-16d1qhz-2 cBaPiP">옵션</h4>
				<div class="iOHiXt" style="list-style: none;">
					<c:if test="${pvo.fulloption eq 1 }">
						<p>
							<img src="/resources/images/o_100.png">
						</p>
					</c:if>
					<c:if test="${pvo.fulloption eq 0 }">
						<p>이 방의 옵션은 중개사무소에게 문의 바랍니다.</p>
					</c:if>

				</div>
			</div>
			<div class="fCMewi">
				<p id="scrollspyHeading4"></p>
				<h4 class="cBaPiP">상세설명</h4>
				<div class="iOHiXt" style="list-style: none;">
					<div class="styled__InfoWrap-sc-13shacj-0 jGAWeI">
						<p class="title">${pvo.addr1}${pvo.addr3 }</p>
						<p class="hhaHrn">${pvo.contents }</p>
					</div>
				</div>
			</div>

			<div class="fCMewi">
				<p id="scrollspyHeading5"></p>
				<h4 class="cBaPiP">이 중개사무소의 다른 방</h4>

				<div class="iOHiXt" style="list-style: none;">
					<div class="jcFemG">

						<div class="row">
							<c:forEach var="list" items="${pList }">
								<div class="col-md-4">


									<div class="hObDcQ">

										<div class="styled__ImgWrap-sc-14w4no0-0 hkMQhb">
											<div class="styled__Image-ami2sx-0 gMnRzx"
												onClick="pSend(this)" data-pno="${list.pno}">
												<!-- 중개사의 다른 매물에 대한 이미지 -->
												<input type="image" src="/upload/${list.thumbnail }"
													width="60" height="60" alt="" draggable="false"
													loading="lazy" style="width: 100%; height: 100%;">
												<div class="styled__Cover-ami2sx-1 dZAvTS cover"></div>
											</div>
										</div>
										<!-- 중개사의 다른 매물에 대한 정보 -->

										<div class="bSKZAI">
											<p class="hybbHD">
												<c:if test="${list.type eq 0 }">원룸</c:if>
												<c:if test="${list.type eq 1 }">오피스텔</c:if>
											</p>
											<p class="styled__Price-n321y7-2 bYNMgs">보증금/월세
												${list.deposit }/${list.rent }</p>
											<p class="styled__Desc-n321y7-3 eHtuHa">
												<c:choose>
													<c:when test="${list.floor == -1}">반지층</c:when>
													<c:when test="${list.floor == 0 }">옥탑</c:when>
													<c:otherwise>${list.floor }층</c:otherwise>
												</c:choose>
												, ${Math.round(list.area * 100) / 100.0}m², 관리비
												${list.manage }만
											</p>
											<p class="styled__Desc-n321y7-3 eHtuHa">${list.contents }</p>
											<div class="styled__TagWrap-n321y7-4 guJBBw"></div>
										</div>
									</div>

								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>



			<!-- 비로그인 상태의 정보를 받아옴 -->
			<sec:authorize access="isAnonymous()">
				<c:set var="username" value="" />
			</sec:authorize>
			<!-- 비로그인 상태의 정보를 받아옴 종료 -->

			<!-- 현재 로그인 한 유저의 정보를 받아옴 -->
			<sec:authorize access="isAuthenticated()">
				<c:set var="username">
					<sec:authentication property="principal.user.username" />
				</c:set>
				<c:set var="authorities">
					<sec:authentication property="principal.authorities" />
				</c:set>
				<input type="hidden" id="username1" name="username1"
					value="${username}">
			</sec:authorize>
			<!-- 현재 로그인 한 유저의 정보를 받아옴 종료 -->

			<form name="productForm" action="/product/product_view.do"
				method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}"> <input type="hidden" name="pno"
					value="">
			</form>


		</div>

		<div class="col-md-4" style="margin-top: 80px">
			<div class="position-sticky" style="top: 7rem;">
				<div class="jtcdhj"
					<c:if test="${!empty prevo }">style="border: 2px solid rgba(166, 227, 233, 0.7);"</c:if>>
					<div class="biKwOB">
						<div>
							<div class="dtGkBV">매물번호 ${pvo.pno }</div>
						</div>
						<a href="mailto:${pvo.username }"><svg width="24" height="24"
								viewBox="0 0 24 24" fill="none"
								xmlns="http://www.w3.org/2000/svg" style="flex: 0 0 auto;">
							<path
									d="M10.4627 3C11.015 3 11.4627 3.44772 11.4627 4C11.4627 4.51284 11.0767 4.93551 10.5794 4.99327L10.4627 5H5V19H19V13.6069C19 13.094 19.386 12.6714 19.8834 12.6136L20 12.6069C20.5128 12.6069 20.9355 12.9929 20.9933 13.4903L21 13.6069V19.5C21 20.2797 20.4051 20.9204 19.6445 20.9931L19.5 21H4.5C3.7203 21 3.07955 20.4051 3.00687 19.6445L3 19.5V4.5C3 3.7203 3.59489 3.07955 4.35554 3.00687L4.5 3H10.4627ZM21 3V10C21 10.5523 20.5523 11 20 11C19.4872 11 19.0645 10.614 19.0067 10.1166L19 10V6.414L12.7071 12.7071C12.3166 13.0976 11.6834 13.0976 11.2929 12.7071C10.9324 12.3466 10.9047 11.7794 11.2097 11.3871L11.2929 11.2929L17.584 5H14C13.4872 5 13.0645 4.61396 13.0067 4.11662L13 4C13 3.48716 13.386 3.06449 13.8834 3.00673L14 3H21Z"
									fill="#CCCCCC"></path></svg></a>
					</div>
					<div class="styled__PriceWrap-cvrpi1-5 fzGgeZ">
						<p class="eswqdM">보증금 / 월세 ${pvo.deposit }/${pvo.rent }</p>
						<p class="iVhrbX">매물 조회 수 ${pvo.readcnt }회</p>
					</div>
					<ul class="bIRVVc">
						<li><div class="styled__Item-cvrpi1-9 fYSHvV left">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="building"
									style="flex: 0 0 auto;">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M11.4845 1.12518L11.5941 1.19559L20.5941 7.8423C20.8175 8.00727 20.9607 8.25644 20.993 8.52876L21 8.64671L21.0007 13.4264C21.9338 14.484 22.5 15.8731 22.5 17.3944C22.5 20.7081 19.8137 23.3944 16.5 23.3944C14.7234 23.3944 13.1272 22.6223 12.0286 21.3953L2 21.3944C1.48716 21.3944 1.06449 21.0084 1.00673 20.511L1 20.3944V8.64671C1 8.36902 1.11533 8.10576 1.31519 7.91798L1.40592 7.8423L10.4059 1.19559C10.7237 0.960882 11.1459 0.937411 11.4845 1.12518ZM16.5 12.3944C13.7386 12.3944 11.5 14.633 11.5 17.3944C11.5 20.1558 13.7386 22.3944 16.5 22.3944C19.2614 22.3944 21.5 20.1558 21.5 17.3944C21.5 14.633 19.2614 12.3944 16.5 12.3944ZM16.9919 17.3045C16.9496 17.0713 16.7455 16.8944 16.5 16.8944C16.2239 16.8944 16 17.1183 16 17.3944V20.1944L16.0081 20.2843C16.0504 20.5175 16.2545 20.6944 16.5 20.6944C16.7761 20.6944 17 20.4705 17 20.1944V17.3944L16.9919 17.3045ZM11 2L2 8.64671V20.3944L11.303 20.3948C10.7923 19.5122 10.5 18.4874 10.5 17.3944C10.5 14.0807 13.1863 11.3944 16.5 11.3944C17.8066 11.3944 19.0156 11.812 20.0009 12.5211L20 8.64671L11 2ZM17.2 15.0944C17.2 14.7078 16.8866 14.3944 16.5 14.3944C16.1134 14.3944 15.8 14.7078 15.8 15.0944C15.8 15.481 16.1134 15.7944 16.5 15.7944C16.8866 15.7944 17.2 15.481 17.2 15.0944Z"
										fill="#222222"></path></svg>
								<span><c:if test="${pvo.type eq 1}">오피스텔</c:if> <c:if
										test="${pvo.type eq 0}">원룸</c:if></span>
							</div>
							<div class="styled__Item-cvrpi1-9 fYSHvV">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" style="flex: 0 0 auto;">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M8 2C8.51284 2 8.93551 2.38604 8.99327 2.88338L9 3V14.999L21 15C21.4734 15 21.8699 15.3289 21.9736 15.7707L21.9933 15.8834L22 16V21C22 21.5128 21.614 21.9355 21.1166 21.9933L21 22H3C2.48716 22 2.06449 21.614 2.00673 21.1166L2 21V3C2 2.48716 2.38604 2.06449 2.88338 2.00673L3 2H8ZM8.708 15.998L3.706 21H9V18.875C9 18.5989 9.22386 18.375 9.5 18.375C9.74546 18.375 9.94961 18.5519 9.99194 18.7851L10 18.875V21H12V18.875C12 18.5989 12.2239 18.375 12.5 18.375C12.7455 18.375 12.9496 18.5519 12.9919 18.7851L13 18.875V21H15V18.875C15 18.5989 15.2239 18.375 15.5 18.375C15.7455 18.375 15.9496 18.5519 15.9919 18.7851L16 18.875V21H18V18.875C18 18.5989 18.2239 18.375 18.5 18.375C18.7455 18.375 18.9496 18.5519 18.9919 18.7851L19 18.875V21H21V16L8.708 15.998ZM3 3H8V15.292L3 20.292V15H5.125L5.21488 14.9919C5.44812 14.9496 5.625 14.7455 5.625 14.5C5.625 14.2239 5.40114 14 5.125 14H3V12H5.125L5.21488 11.9919C5.44812 11.9496 5.625 11.7455 5.625 11.5C5.625 11.2239 5.40114 11 5.125 11H3V9H5.125L5.21488 8.99194C5.44812 8.94961 5.625 8.74546 5.625 8.5C5.625 8.22386 5.40114 8 5.125 8H3V6H5.125L5.21488 5.99194C5.44812 5.94961 5.625 5.74546 5.625 5.5C5.625 5.22386 5.40114 5 5.125 5H3V3Z"
										fill="#222222"></path></svg>
								<span>${Math.round(pvo.area * 100) / 100.0}m²</span>
							</div></li>
						<li><div class="styled__Item-cvrpi1-9 fYSHvV left">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" style="flex: 0 0 auto;">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M16 1C16.5128 1 16.9355 1.38604 16.9933 1.88338L17 2V22C17 22.5128 16.614 22.9355 16.1166 22.9933L16 23H1C0.487164 23 0.0644928 22.614 0.00672773 22.1166L0 22V2C0 1.48716 0.38604 1.06449 0.883379 1.00673L1 1H16ZM8 2H1V22H8V2ZM9 2H16V22H9V2ZM19.7843 13.5886L19.8536 13.6464L21.25 15.043L22.6464 13.6464C22.82 13.4729 23.0894 13.4536 23.2843 13.5886L23.3536 13.6464C23.5271 13.82 23.5464 14.0894 23.4114 14.2843L23.3536 14.3536L21.25 16.4571L19.1464 14.3536C18.9512 14.1583 18.9512 13.8417 19.1464 13.6464C19.32 13.4729 19.5894 13.4536 19.7843 13.5886ZM23.3585 9.45146L21.25 7.28272L19.1415 9.45146L19.0846 9.52152C18.9524 9.71827 18.9755 9.98739 19.1515 10.1585L19.2215 10.2154C19.4183 10.3476 19.6874 10.3245 19.8585 10.1485L21.25 8.717L22.6415 10.1485L22.7099 10.2074C22.9029 10.3451 23.1725 10.3296 23.3485 10.1585C23.5465 9.966 23.551 9.64945 23.3585 9.45146Z"
										fill="#222222"></path></svg>
								<span><c:choose>
										<c:when test="${pvo.floor == -1}">반지층</c:when>
										<c:when test="${pvo.floor == 0 }">옥탑</c:when>
										<c:otherwise>${pvo.floor }층</c:otherwise>
									</c:choose></span>
							</div>
							<div class="styled__Item-cvrpi1-9 fYSHvV">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg" style="flex: 0 0 auto;">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M17 2C17.5128 2 17.9355 2.38604 17.9933 2.88338L18 3V11.689C20.5878 12.3551 22.5 14.7042 22.5 17.5C22.5 20.8137 19.8137 23.5 16.5 23.5C14.7 23.5 13.0851 22.7073 11.9853 21.4521L11.6247 21.7406C11.2927 22.0062 10.8336 22.0303 10.4785 21.813L10.3753 21.7406L9 20.64L7.62469 21.7406C7.29268 22.0062 6.83361 22.0303 6.47849 21.813L6.37531 21.7406L5 20.64L3.6247 21.7406C3.22661 22.059 2.65978 22.0239 2.30358 21.6775L2.21913 21.5844C2.10565 21.4425 2.0335 21.2732 2.00917 21.0948L2 20.9597V3C2 2.48716 2.38604 2.06449 2.88338 2.00673L3 2H17ZM11.3902 20.6464C10.8257 19.7316 10.5 18.6538 10.5 17.5C10.5 14.1863 13.1863 11.5 16.5 11.5C16.6684 11.5 16.8351 11.5069 17 11.5205V3H3V20.9597L5 19.3597L7 20.9597L9 19.3597L10.999 20.959L11.3902 20.6464ZM13.5 7C13.7761 7 14 7.22386 14 7.5C14 7.77614 13.7761 8 13.5 8H6.5C6.22386 8 6 7.77614 6 7.5C6 7.22386 6.22386 7 6.5 7H13.5ZM12 10.5C12 10.2239 11.7761 10 11.5 10H6.5C6.22386 10 6 10.2239 6 10.5C6 10.7761 6.22386 11 6.5 11H11.5C11.7761 11 12 10.7761 12 10.5ZM9.5 13C9.77614 13 10 13.2239 10 13.5C10 13.7761 9.77614 14 9.5 14H6.5C6.22386 14 6 13.7761 6 13.5C6 13.2239 6.22386 13 6.5 13H9.5ZM11.5 17.5C11.5 14.7386 13.7386 12.5 16.5 12.5C19.2614 12.5 21.5 14.7386 21.5 17.5C21.5 20.2614 19.2614 22.5 16.5 22.5C13.7386 22.5 11.5 20.2614 11.5 17.5ZM19.0318 15.8244C19.1288 15.5659 19.417 15.4349 19.6756 15.5318C19.9054 15.618 20.0344 15.8553 19.9922 16.0886L19.9682 16.1756L19.4715 17.5H20C20.2761 17.5 20.5 17.7239 20.5 18C20.5 18.2455 20.3231 18.4496 20.0899 18.4919L20 18.5H19.0965L18.4682 20.1756C18.3175 20.5772 17.7792 20.6059 17.5732 20.2616L17.5318 20.1756L16.5 17.424L15.4682 20.1756C15.3175 20.5772 14.7792 20.6059 14.5732 20.2616L14.5318 20.1756L13.9035 18.5H13C12.7239 18.5 12.5 18.2761 12.5 18C12.5 17.7545 12.6769 17.5504 12.9101 17.5081L13 17.5H13.5285L13.0318 16.1756C12.9349 15.917 13.0659 15.6288 13.3244 15.5318C13.5543 15.4456 13.8075 15.5396 13.9291 15.7431L13.9682 15.8244L15 18.575L16.0318 15.8244C16.1825 15.4228 16.7208 15.3941 16.9268 15.7384L16.9682 15.8244L18 18.575L19.0318 15.8244Z"
										fill="#222222"></path></svg>
								<span>${pvo.manage }만원</span>
							</div></li>
						<li class="kRCkkj"><div>
								<p class="title">방/욕실</p>
								<p class="content">${pvo.room }개/${pvo.shower }개</p>
							</div>
							<div>
								<p class="title">위치</p>
								<p class="content">${pvo.addr1 }${pvo.addr2 }${pvo.addr3 }</p>
							</div></li>
					</ul>
					<div class="styled__LessorWrap-cvrpi1-13 jVGbJb">
						<div class="styled__Name-cvrpi1-14 jueGPM">
							<p>${cvo.corname }</p>
							<c:if test="${!empty prevo }">
								&nbsp;<i class="fa-solid fa-crown" style="color: #71c9ce"></i>
							</c:if>
						</div>
					</div>

					<div class="styled__BtnWrap-cvrpi1-15 brpHbd row">
						<c:if test="${corchange }">
							<div class="col-md-4">
						</c:if>
						<c:if test="${!corchange }">
							<sec:authorize access="hasRole('MEMBER')">
								<div class="col-md-12">
							</sec:authorize>
							<sec:authorize access="hasRole('USER')">
								<div class="col-md-10">
							</sec:authorize>
						</c:if>
						<form name="cor_view_read" action="/coroperation/cor_view.do">
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }"> <input type="hidden"
								name="username" value="${cvo.username}">
							<button color="blue" class="fiEZwu3">
								<span><span id="cor_change">연락처보기</span></span>
							</button>
						</form>
					</div>
					<c:if test="${corchange }">
						<div class="col-md-4">
							<form name="product_modify" action="/product/product_modify.do">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }"> <input type="hidden"
									name="username" value="${cvo.username}"> <input
									type="hidden" name="pno" value="${pvo.pno }">
								<button color="blue" class="modify_button1">
									<span><span>매물 수정</span></span>
								</button>
							</form>
						</div>
						<div class="col-md-4">
							<form name="product_delete" action="/product/product_delete.do">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }"> <input type="hidden"
									name="username" value="${cvo.username}"> <input
									type="hidden" name="pno" value="${pvo.pno }">
								<button type="button" color="blue" class="modify_button"
									onClick="delete_check()">
									<span><span>매물 삭제</span></span>
								</button>
							</form>
						</div>
					</c:if>

					<c:if test="${!corchange }">
						<sec:authorize access="hasRole('USER')">
							<div class="col-md-2">
								<a class="text-dark heart"> <img id="heart"
									src="/resources/icon/heart.svg"
									style="filter: invert(41%) sepia(87%) saturate(7008%) hue-rotate(327deg) brightness(91%) contrast(88%); width: 100%; object-fit: cover; vertical-align: -65%;">
								</a>
							</div>
						</sec:authorize>
					</c:if>



				</div>
			</div>
		</div>
	</div>
	</div>
</main>


<%@ include file="../include/footer.jsp"%>

<!-- 스크롤 스파이 navar 관련 script 시작 -->
<script>
	$(function() {
		$('body').css('position', 'relative').attr('data-bs-spy', 'scroll')
				.attr('data-bs-target', '#navbar-example').attr(
						'data-bs-offset', '80');

		var scrollSpy = new bootstrap.ScrollSpy(document.body, {
			target : '#navbar-example'
		});

		$(window).scroll(function() {
			var height = $(document).scrollTop();
			console.log($('#height_img').height());
			if (height >= $('#height_img').height()) {
				$('#navbar-example').css('top', '0px');
			} else {
				$('#navbar-example').css('top', '-80px');
			}
		})

	});
	
	function pSend(ps){
		productForm.pno.value = ps.dataset.pno;
		productForm.submit();
	}
</script>
<!-- 스크롤 스파이 navar 관련 script 끝 -->
<script>
    $(document).ready(function () {
    	
    	if(${!empty corchange}){
    		if(${corchange}){
    		$('#cor_change').text("매물 목록");
    		}
    	}
    	var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        //스프링 시큐리티을 이용한다면 csrf 토큰을 같이 전송하도록 해야 한다
    	
         $(document).ajaxSend(function(e, xhr, options) {
               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            })
	// 좋아요가 있는지 확인한 값을 heartval에 저장
			var heartval = 0;
        
        
        if(${!empty fvo and !empty fvo.heart}){
			heartval = 1;
        }
        
	// heartval이 1이면 좋아요가 이미 되있는것이므로 heart-fill.svg를 출력하는 코드
        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/resources/icon/heart-fill.svg");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/resources/icon/heart.svg");
            $(".heart").prop('name',heartval)
        }

	// 좋아요 버튼을 클릭 시 실행되는 코드
        $(".heart").on("click", function () {
            var that = $(".heart");
	    $.ajax({
	    	url :'/favorite/saveHeart',
	        type :'POST',
	        data : {'pno':${pvo.pno},'username': $("#username1").val() },
	    	success : function(data){
	    		that.prop('name',data);
	        	if(data==1) {
	            	     $('#heart').prop("src","/resources/icon/heart-fill.svg");
	        	} else {
                    	     $('#heart').prop("src","/resources/icon/heart.svg");
	        	}
             	},
             	error : function(data){
             		alert("로그인 이후에 이용해주시기 바랍니다.")
             	}
	    });
        });
    });
</script>

<script>
// 매물 삭제 확인창 Function
function delete_check(){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	     document.product_delete.submit();
	 }else{   //취소
	     return false;
	 }
}
</script>

</body>

</html>