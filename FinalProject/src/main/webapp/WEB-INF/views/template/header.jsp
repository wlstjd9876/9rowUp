<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 네비게이션 시작 -->
<!-- Page Wrapper -->
<div class="wrapper">

	<!-- Header Start -->

	<div class="header">
		<div class="container">
			<!-- 현호야 여기봐 -->
			<div class="header-top">
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<!-- Header top left content contact -->
						<div class="header-contact">
							<!-- Contact number -->
							<span><i class="fa fa-phone red"></i> 010-XXXX-XXXX</span>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<!-- Button Kart -->
						<ul class="nav navbar-nav navbar-right nav-ex">
							<c:if test="${empty user_email}">
								<li><a
									href="${pageContext.request.contextPath}/member/write.do">회원가입</a></li>
								<li><a
									href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
							</c:if>
							<c:if test="${!empty user_email && user_auth !=3}">
						</ul>
						<div class="btn-cart-md">
							<a class="cart-link" href="#"> <!-- Image --> <c:if
									test="${user_gender==1}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/boy.png"
										alt="" />
								</c:if> <c:if test="${user_gender==2}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/girl.png"
										alt="" />
								</c:if> <!-- Heading --> <span>${user_nickname}님 반가워요! <c:if
										test="${!empty user_email && user_auth == 0}">(관리자)</c:if> <c:if
										test="${!empty user_email && user_auth == 1}">(스태프)</c:if></span> <c:if
									test="${0<=user_score && user_score<10}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/bronze.png">
								</c:if> <c:if test="${10<=user_score && user_score<50}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/silver.png">
								</c:if> <c:if test="${50<=user_score && user_score<100}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/gold.png">
								</c:if> <c:if test="${100<=user_score && user_score<250}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/platinum.png">
								</c:if> <c:if test="${250<=user_score}">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/icon/diamond.png">
								</c:if>
								<h4>하단메뉴</h4>
								<div class="clearfix"></div>
							</a>
							<ul class="cart-dropdown" role="menu">
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<!-- Image -->
										<img class="img-responsive img-rounded"
											src="${pageContext.request.contextPath}/resources/img/icon/loupe.png"
											alt="" />
										<!-- Title for purchase item -->
										<span class="cart-title"><a
											href="${pageContext.request.contextPath}/member/detail.do">회원님의
												상세정보</a></span>
										<!-- Cart item price -->
										<div class="clearfix"></div>
									</div>
								</li>
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<!-- Image -->
										<img class="img-responsive img-rounded"
											src="${pageContext.request.contextPath}/resources/img/icon/key.png"
											alt="" />
										<!-- Title for purchase item -->
										<span class="cart-title"> <a
											href="${pageContext.request.contextPath}/member/changePassword.do">비밀번호
												변경</a></span>
										<!-- Cart item price -->
										<div class="clearfix"></div>
									</div>
								</li>
								<!-- Cart items for shopping list -->
								<div class="cart-item">
									<a class="btn btn-danger" data-toggle="modal"
										href="${pageContext.request.contextPath}/member/logout.do">
										로그아웃 </a>
								</div>
								</li>
							</ul>
							</c:if>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!-- 현호야 여기d -->
			<div class="row">
				<div class="col-md-4 col-sm-5">
					<!-- Link -->
					<a href="${pageContext.request.contextPath}/main/main.do"> <!-- Logo area -->
						<div class="logo">
							<!-- <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" /> -->
							<!-- Heading -->
							<h1>Trips Come True</h1>
							<!-- Paragraph -->
							<p>상상 속 여행을 현실로</p>
						</div>
					</a>
				</div>
				<div class="col-md-8 col-sm-7">
					<!-- Navigation -->
					<nav class="navbar navbar-default navbar-right" role="navigation">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">

									<li class="dropdown visible-xs"><a href="#"
										class="dropdown-toggle" data-toggle="dropdown"> Show Me
											The Trip <b class="caret"></b>
									</a>
										<ul class="dropdown-menu">
											<li><a href="menu.html">스태프</a></li>
											<li><a href="menu.html"></a></li>
											<li><a href="menu.html">Special Menu</a></li>
										</ul></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/nav-menu/비행기.jpg"
											class="img-responsive" alt="" /> Show Me The Trip <b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="menu.html">스태프</a></li>
											<li><a href="menu.html"></a></li>
											<li><a href="menu.html">Special Menu</a></li>
										</ul></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/nav-menu/트레인.jpg"
											class="img-responsive" alt="" /> Data Factory <b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a
												href="${pageContext.request.contextPath}/data/location/list.do">관광지
													정보</a></li>
											<li><a
												href="${pageContext.request.contextPath}/data/location.do">은성이
													관광지 연습이요</a></li>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-single.html">Blog Single</a></li>
											<li><a href="components.html">Components</a></li>
											<li><a href="general.html">General</a></li>
											<li><a href="nutrition-info.html">Nutrition Info</a></li>
											<li><a href="recipe.html">Recipes</a></li>
										</ul></li>
									<li><a href="aboutus.html"><img
											src="${pageContext.request.contextPath}/resources/img/nav-menu/트레인.jpg"
											class="img-responsive" alt="" /> Data Factory </a></li>
									<li class="dropdown hidden-xs"><a href="#"
										class="dropdown-toggle" data-toggle="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/nav-menu/자전거.jpg"
											class="img-responsive" alt="" /> My Planner <b class="caret"></b></a>
										<ul class="dropdown-menu dropdown-md">
											<li>
												<div class="row">
													<div class="col-md-4 col-sm-6">
														<!-- Menu Item -->
														<div class="menu-item">
															<!-- Heading -->
															<h3>Vegetarian</h3>
															<!-- Image -->
															<img
																src="${pageContext.request.contextPath}/resources/img/dish/dish1.jpg"
																class="img-responsive" alt="" />
															<!-- Paragraph -->
															<p>Sea nut perspicacity under omni piste natures
																mirror of there with consequent.</p>
															<!-- Button -->
															<a
																href="${pageContext.request.contextPath}/calendar/list.do"
																class="btn btn-danger btn-xs">View Menu</a>
														</div>
													</div>
													<div class="col-md-4 col-sm-6">
														<!-- Menu Item -->
														<div class="menu-item">
															<!-- Heading -->
															<h3>Non-Vegetarian</h3>
															<!-- Image -->
															<img
																src="${pageContext.request.contextPath}/resources/img/dish/dish2.jpg"
																class="img-responsive" alt="" />
															<!-- Paragraph -->
															<p>Sea nut perspicacity under omni piste natures
																mirror as precode consequent.</p>
															<!-- Button -->
															<a href="menu.html" class="btn btn-danger btn-xs">View
																Menu</a>
														</div>
													</div>
													<div class="col-md-4">
														<!-- Menu Item -->
														<div class="menu-item">
															<!-- Heading -->
															<h3>Special Menu</h3>
															<!-- Image -->
															<img
																src="${pageContext.request.contextPath}/resources/img/dish/dish3.jpg"
																class="img-responsive" alt="" />
															<!-- Paragraph -->
															<p>Sea nut perspicacity under omni piste natures
																mirror consequent.</p>
															<!-- Button -->
															<a href="menu.html" class="btn btn-danger btn-xs">View
																Menu</a>
														</div>
													</div>
												</div>
											</li>
										</ul></li>
								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
				</div>
			</div>
		</div>
		<!-- / .container -->
	</div>
</div>

<!-- Header End -->
<!-- 상단 네비게이션 끝 -->
<!-- 상단 라인 시작 -->
<div class="custom-header-line"></div>
<!-- 상단 라인 끝 -->