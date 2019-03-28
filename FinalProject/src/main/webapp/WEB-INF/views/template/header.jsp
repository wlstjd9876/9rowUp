<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 상단 네비게이션 시작 -->
<!-- Shopping cart Modal -->
<div class="modal fade" id="shoppingcart1" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Shopping Cart</h4>
			</div>
			<div class="modal-body">
				<!-- Items table -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Quantity</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="#">Exception Reins Evocative</a></td>
							<td>2</td>
							<td>$200</td>
						</tr>
						<tr>
							<td><a href="#">Taut Mayoress Alias Appendicitis</a></td>
							<td>1</td>
							<td>$190</td>
						</tr>
						<tr>
							<td><a href="#">Sinter et Molests Perfectionist</a></td>
							<td>4</td>
							<td>$99</td>
						</tr>
						<tr>
							<th></th>
							<th>Total</th>
							<th>$489</th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Continue
					Shopping</button>
				<button type="button" class="btn btn-info">Checkout</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- Model End -->

<!-- Page Wrapper -->
<div class="wrapper">

	<!-- Header Start -->

	<div class="header">
		<div class="container">
			<!-- 현호야 여기봐 -->
			<%-- <div class="header-top">
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<!-- Header top left content contact -->
						<div class="header-contact">
							<!-- Contact number -->
							<span><i class="fa fa-phone red"></i> 888-888-8888</span>
						</div>
					</div>
					<!-- 검색창 -->
					<!-- <div class="col-md-4 col-sm-4">
								// Header top right content search box
								<div class=" header-search">
									<form class="form" role="form">
										<div class="input-group">
										  <input type="text" class="form-control" placeholder="Search...">
										  <span class="input-group-btn">
											<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
										  </span>
										</div>
									</form>
								</div>
							</div> -->
					<div class="col-md-4 col-sm-4">
						<!-- Button Kart -->
						<div class="btn-cart-md">
							<a class="cart-link" href="#"> <!-- Image --> <img
								class="img-responsive"
								src="${pageContext.request.contextPath}/resources/img/K-001.jpg"
								alt="" /> <!-- Heading -->
								<h4>나의 정보</h4> <span>--------</span>
								<div class="clearfix"></div>
							</a>
							<ul class="cart-dropdown" role="menu">
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<!-- Item remove icon -->
										<a href="#"><i class="fa fa-times"></i></a>
										<!-- Image -->
										<img class="img-responsive img-rounded"
											src="${pageContext.request.contextPath}/resources/img/nav-menu/nav1.jpg"
											alt="" />
										<!-- Title for purchase item -->
										<span class="cart-title"><a href="#">Exception
												Reins Evocative</a></span>
										<!-- Cart item price -->
										<span class="cart-price pull-right red">$200/-</span>
										<div class="clearfix"></div>
									</div>
								</li>
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<!-- Item remove icon -->
										<a href="#"><i class="fa fa-times"></i></a>
										<!-- Image -->
										<img class="img-responsive img-rounded"
											src="${pageContext.request.contextPath}/resources/img/nav-menu/nav2.jpg"
											alt="" />
										<!-- Title for purchase item -->
										<span class="cart-title"><a href="#">Taut Mayoress
												Alias Appendicitis</a></span>
										<!-- Cart item price -->
										<span class="cart-price pull-right red">$190/-</span>
										<div class="clearfix"></div>
									</div>
								</li>
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<!-- Item remove icon -->
										<a href="#"><i class="fa fa-times"></i></a>
										<!-- Image -->
										<img class="img-responsive img-rounded"
											src="${pageContext.request.contextPath}/resources/img/nav-menu/nav3.jpg"
											alt="" />
										<!-- Title for purchase item -->
										<span class="cart-title"><a href="#">Sinter et
												Molests Perfectionist</a></span>
										<!-- Cart item price -->
										<span class="cart-price pull-right red">$99/-</span>
										<div class="clearfix"></div>
									</div>
								</li>
								<li>
									<!-- Cart items for shopping list -->
									<div class="cart-item">
										<a class="btn btn-danger" data-toggle="modal"
											href="#shoppingcart1">Checkout</a>
									</div>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div> --%>
			<div class="row">
				<div class="col-md-4 col-sm-5">
					<!-- Link -->
					<a href="index.html"> <!-- Logo area -->
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
											src="${pageContext.request.contextPath}/resources/img/nav-menu/배.jpg"
											class="img-responsive" alt="" /> Help Come True <b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/gowith/gowithList.do">같이, 떠나요</a></li>
											<li><a href="0-base.html">Blank Page</a></li>
										</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/nav-menu/트레인.jpg"
											class="img-responsive" alt="" /> Data Factory <b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a href="${pageContext.request.contextPath}/data/list.do">관광지 정보</a></li>
											<li><a href="0-base.html">Blank Page</a></li>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-single.html">Blog Single</a></li>
											<li><a href="components.html">Components</a></li>
											<li><a href="general.html">General</a></li>
											<li><a href="nutrition-info.html">Nutrition Info</a></li>
											<li><a href="recipe.html">Recipes</a></li>
										</ul></li>
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