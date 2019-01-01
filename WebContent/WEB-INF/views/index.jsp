<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rootPath = request.getContextPath();
	String uri = request.getRequestURI();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Freelancer - Start Bootstrap Theme</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="css/freelancer.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">김현구 포트폴리오</a>
			<button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">포트폴리오</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">늦깎이 개발자</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">연락처</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto" src="img/profile.jpg" alt="" style="width: 200px; height: auto;">
			<h1 class="text-uppercase mb-0">쉽고 적은 코딩으로 많은 사람들을 행복하게 하자!</h1>
			<hr class="star-light">
			<h2 class="font-weight-light mb-0">어렵고 대단한 프로그래머들은 세상에 넘치고 있습니다. 하지만 세상을 바꾸는 것은 아주 작은 아이디어라고 봅니다.</h2>
		</div>
	</header>
	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">포트폴리오</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-1">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fas fa-search-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="img/portfolio/01.jpg" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fas fa-search-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="img/portfolio/02.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section -->
	<section class="bg-primary text-white mb-0" id="about">
		<div class="container">
			<h2 class="text-center text-uppercase text-white">늦깎이 개발자</h2>
			<hr class="star-light mb-5">
			<div class="row">
				<div class="col-lg-4 ml-auto">
					<p class="lead">인사 담장자 분들을 찾아 뵈면서 많은 조언을 들었습니다. 현실적으로 제 나이와 저의 경력으로는 취업하기가 거의 불가능에 가깝다고 들었습니다. 솔직히.. 제가 봐도 그렇습니다. 어쩌다가 사장님은 여기까지 들어 오셔서 이 글을 읽고 계신가요? 이것도 인연일 수 있는데.. 사장님도 이 순간만큼은 그냥 잠시 커피한잔하시며 쉬는 시간이 되셨으면 좋겠습니다. 드라마에서 이런 말을 들어 본 것 같습니다 "인연이라면 언젠간 보게 될꺼야." 사장님과 저도 언젠간 보게 되지 않을까요?</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<p class="lead">아래 아이티 학원을 수료하면서 취업활동을 시작할 때 썻던 이력서입니다. 제가 배운 내용들과 팀 프로젝트 내용의 요약들과 자기소개서 등이 포함되어 있습니다.</p>
				</div>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="https://drive.google.com/file/d/1TnMJWYyef_fPLfLdCspVFnTBQMoeRXbK/view?usp=sharing"> <i class="fas fa-download mr-2"></i>내려받기
				</a>
			</div>
		</div>
	</section>
	<!-- Contact Section -->
	<section id="contact">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">현구의 AWS RDS 오라클DB에 메세지 보내기</h2>
			<p style="text-align:center; font-size:1.2em; color:gray; margin-top:10px;">포트폴리오를 구경하시고 나서 작동 안되는 부분에 대한 제보나 사장님의 진심 어린 조언을 보내 주시면 추첨을 통하여 소정의 상품을 보내 드립니다.</p>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<form name="sentMessage" id="contactForm" novalidate="novalidate">
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>성함</label>
								<input class="form-control" id="name" type="text" placeholder="성함" required="required" data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>이메일 주소</label>
								<input class="form-control" id="email" type="email" placeholder="이메일 주소" required="required" data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>전화번호</label>
								<input class="form-control" id="phone" type="tel" placeholder="전화번호" required="required" data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>하고 싶은 말</label>
								<textarea class="form-control" id="message" rows="5" placeholder="하고 싶은 말" required="required" data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-xl" id="sendMessageButton">보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">사는곳</h4>
					<p class="lead mb-0"><a href="https://www.google.com/maps/place/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EA%B8%88%EC%B2%9C%EA%B5%AC+%EB%8F%85%EC%82%B04%EB%8F%99/data=!4m2!3m1!1s0x357b61d6c5306ea1:0xa9469a02547d3a06?ved=2ahUKEwiA-fn_s8HfAhXMTbwKHVgeBAYQ8gEwAHoECAAQAQ">서울 금천 독산4동</a></p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">사장님과 저의 연결 고리</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" href="https://www.facebook.com/remnanttov"> <i class="fab fa-fw fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" href="#"> <i class="fab fa-fw"><img src="img/icon_git-hub.png" style="width: 20px;"></i>
						</a></li>
						<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" href="https://twitter.com/remnanttov"> <i class="fab fa-fw fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" href="https://www.instagram.com/j1_jayone/"> <i class="fab fa-fw"><img src="img/icon_instagram.png" style="width: 20px;"></i>
						</a></li>
						<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" href="https://www.youtube.com/channel/UCzkHusBnF5aLsVsiPSl9gEQ?view_as=subscriber"> <i class="fab fa-fw"><img src="img/icon_youtube.png" style="width: 20px;"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">
						저는 <a href="http://startbootstrap.com">부트스트랩</a>을 잘 다룹니다. 이런 페이지는 10분만에 뚝딱 만들어 냅니다.
					</h4>
				</div>
			</div>
		</div>
	</footer>
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; HyunGooKim 2018</small>
		</div>
		<!-- 	</div> -->
		<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
		<div class="scroll-to-top d-lg-none position-fixed ">
			<a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"> <i class="fa fa-chevron-up"></i>
			</a>
		</div>
		<!-- Portfolio Modals -->
		<!-- Portfolio Modal 1 -->
		<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
			<div class="portfolio-modal-dialog bg-white">
				<a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#"> <i class="fa fa-3x fa-times"></i>
				</a>
				<div class="container text-center">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<h2 class="text-secondary text-uppercase mb-0">팀 프로젝트) 개인 간 경매 거래 웹 어플리케이션</h2>
							<hr class="star-dark mb-5">
							<img class="img-fluid mb-5" src="img/portfolio/01.jpg" alt="">
							<p class="mb-5">( 맡은 파트 : 디자인, 프론트엔드 전체 + 기초적인 백엔드) 언제 어디서든 쉽고 빠르게 경매에 참여할 수 있는 서비스. 미국의 이베이나, 일본 경매 사이트와 같은 국내 서비스</p>
							<p>국내 도입에 성공하지 못한 이베이 옥션경매의 문제 원인을 찾아 내고, 접근성이 뛰어 난 경매 웹서비스를 개발하려고 노력하였습니다. 사용자 입장에서 생각하여 기술을 구현하고 모바일 환경을 생각한 유연한 인터페이스를 보실 수 있습니다.</p>
							<a class="btn btn-primary btn-lg rounded-pill" href="https://dallae.shop" style="margin-right: 10px;">자세히 보기</a> <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"> <i class="fa fa-close"></i> 닫기
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio Modal 2 -->
		<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
			<div class="portfolio-modal-dialog bg-white">
				<a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#"> <i class="fa fa-3x fa-times"></i>
				</a>
				<div class="container text-center">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<h2 class="text-secondary text-uppercase mb-0">기본기중의 기본기는 뭐니뭐니 해도</h2>
							<hr class="star-dark mb-5">
							<img class="img-fluid mb-5" src="img/portfolio/02.jpg" alt="">
							<p class="mb-5">게시판이 아닐까요? 선배님들이 귀찬아 하시는 게시판 만들기 업무를 돕기 위하여 게시판 만들기 기본기는 늘 갈고 닦고 있습니다.</p>
							<a class="btn btn-primary btn-lg rounded-pill" href="https://dallae.shop/basic-board/board/boardList.do" style="margin-right: 10px;">자세히 보기</a> <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"> <i class="fa fa-close"></i> 닫기
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Plugin JavaScript -->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
		<!-- Contact Form JavaScript -->
		<script src="js/jqBootstrapValidation.js"></script>
		<script src="js/contact_me.js"></script>
		<!-- Custom scripts for this template -->
		<script src="js/freelancer.min.js"></script>
</body>
</html>
