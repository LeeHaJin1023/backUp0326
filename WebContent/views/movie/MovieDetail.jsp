<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.movie.model.vo.*,
				java.util.*,
				com.kh.menubar.controller.TopMovieDto,
				com.kh.movie.model.service.MovieService,
				com.kh.menubar.controller.NewMoviesDto" %>    
<%
	MovieLHJ m = (MovieLHJ)request.getAttribute("m");

	List<TopMovieDto> tmdPoster = new MovieService().topFiveMovies(0);
	List<NewMoviesDto> nm = new MovieService().newMovies();
	
	List<MovieStillLHJ> ms = (ArrayList<MovieStillLHJ>)request.getAttribute("ms");

	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{color:black; width:1200px;}
	#movieDetail{
		width:300px;
		font-size:30px;
		font-weight:bold;
		display:inline-block;
		float:left;
	}
	#movieDetail{
		
		margin-top:70px;
		margin-left:150px;
		color:black;
	}
	#movieMainDetail{
		width:900px;
		height:500px;
		margin-top:100px;
		margin-left:250px;
	}
	#movieImgMain{
		width:400px;
		height:400px;
	}
	#movieName{
		width:400px;
		height:30px;
		margin-top:-400px;
		margin-left:500px;
		border-radius:15px;
		font-size:20px;
		font-weight:bold;
		vertical-align:middle;
		line-height:1.5em;
		padding:3px;
		text-align:center;
		background:beige;
		
	}
	#movieReporter{
		width:300px;
		height:30px;
		margin-top:30px;
		margin-left:500px;
		border-radius:15px;
		vertical-align:middle; 
		line-height:2em;
		font-weight:bold;
		padding:5px;
		background:beige;
	}
	#movieInfo{
		width:300px;
		height:200px;
		border-radius:15px;
		margin-left:500px;
		margin-top:30px;
		font-weight:bold;
		padding:5px;
		background:beige;
		text-align:center;
	}
	#input{
		margin-left:550px;
		margin-top:30px;
	}
	#movieSyno{
		display:inline-block;
		width:500px;
		height:400px;
		font-size:15px;
		font-weight:bold;
		padding:10px;
		border-radius:10px;
		margin-left:200px;
		background:beige;
		text-align:center;
	}
	#movieStillImg{
		width:600px;
		height:400px;
		border:1px solid black;
		margin-left:500px;
		
	}
	#input button{
		outline:0;
		border:0;
		border-radius:5px;
		background:lightgray;
		width:70px;
		height:30px;
		margin:20px;
		align:center;
		padding:5px;
		color:white;
		font-weight:bold;
	}
	#input button:hover{cursor:pointer; background:gray;}
	.replyArea{
		display:inline-block;
		color:black;
		margin-left:400px;
		width:900px;
		margin-top:80px;
		
	}
	#replyContent{
		width:500px;
		border:none;
		outline:none;
	}
	#addReply{
		width:55px;
		height:80px;
		background:beige;
	}
	
	#star a{ text-decoration: none; color: white; } 
	#star a.on{ color: yellow; }


	
	.line{border-bottom:1px solid black;}
	*{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:150px;overflow:hidden;}
    .slide ul{height:100%;}
    .slide li{height:100%;}
    .slide li:nth-child(1){background:#faa;}
    .slide li:nth-child(2){background:#afa;}
    .slide li:nth-child(3){background:#aaf;}
    .slide li:nth-child(4){background:#faf;}
    
    
    
    /*  */
    
    .mySlides {display: none}
		img {vertical-align: middle;}
		
		/* Slideshow container */
		.slideshow-container {
			diaplay:inline-block;
		  max-width: 100%;
		  position: relative;
		  margin-right:100px;
		  box-sizing:border-box;
		}
		
		
		/* Number text (1/3 etc) */
		.numbertext {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
		}
		
		/* The dots/bullets/indicators */
		.dot {
		  cursor: pointer;
		  height: 15px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: #bbb;
		  border-radius: 50%;
		  display: inline-block;
		  transition: background-color 0.6s ease;
		  
		}
		
		.active, .dot:hover {
		  background-color: #717171;
		}
		
		/* Fading animation */
		.fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}
		
		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .prev, .next,.text {font-size: 11px}
		}
		
		.stillImg{
			display:inline-block;
			float:right;
			width:400px;
			height:500px;
			margin-top:-300;
		}
		.dotArea{
			margin-left:100px;
		}
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:lightgray;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:yellow; text-decoration:none;}
	.replyArea table tr td p{
		color:yellow;
		display:inline-block;
		}
	#Wbtn{display:inline-block; float:right;margin-right:150px; margin-top:-30px; outline:0;}
	#Wbtn:hover{cursor:pointer;}
	.reviewId td{ border-bottom:2px solid black;}
	
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */   
            text-align:center;                       
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
            }
		 #detailView{
        	background:lightcoral;
        	border-radius:10px;
        	width:60px;
        	height:30px;
        	outline:0;
        	border:0;
        	padding:5px;
        }
        #detailView:hover{cursor:pointer;}
        #rTable td:first-child{align:center; padding-left:50px; padding-right:5px;}
		#replyTable tr{border-radius:5px;}
</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<div id="movieDetail">
			<img src="<%=contextPath %>/resources/images/movieChart2.png" width="50px" height="50px" align="center">
			<div id="name1">영화 상세 정보 
				<img src="<%=contextPath %>/resources/images/line.png" width="300px" height="20px" >
			</div>
		</div>
	<br clear="both">
	<form id="movieMainDetail">
	<% if(tmdPoster.size()>= 5){%>
		<div id="movieImgMain">
			<img src="<%=contextPath%>/resources/images/<%=m.getModifyName()%>" width="400px" height="400">
		</div>
	<%} %>	
		<div id="movieName">
			<p><%=m.getTitle() %></p>
		</div>
		<div id="movieReporter">
			<p>예매율 4.3%  98% (실관람평 : 3,654명)</p>
		</div>
		<div id="movieInfo">
			<p>감독 : <%=m.getDirector() %></p>
			<p>배우 : <%=m.getActor() %></p>
			<p>장르 : 드라마, 전쟁, 코미디 / 기본 : <%=m.getAgeLimit() %>세, <%=m.getRuntime() %>분</p>
			<p>개봉 : date넣기</p>
		</div>
		<div id="input">
			<button>예매하기</button>
			<button>찜하기</button>
		</div>
	</form>
	
	<div id="movieSyno">
		<p><%=m.getSynopsis() %></p>
	</div>

	<div class="stillImg">
		<div class="slideshow-container">
		<%if(ms.size() <= 5){ %>
			<% for(int i=0; i<ms.size(); i++ ){ %>
			<div class="mySlides fade">
			  <div class="numbertext"><%= (i+1) %>/ <%=ms.size()%></div>
			  <img src="<%=contextPath %>/resources/images/<%=ms.get(i).getModifyName() %>" style="width:500px; height:400px;">
			</div>
			<%} %>
		<%} else { %>
			<% for(int i=0; i<ms.size(); i++ ){ %>
			<div class="mySlides fade">
			  <div class="numbertext"><%=(i+1) %>/ <%=ms.size()%></div>
			  <img src="<%=contextPath %>/resources/images/<%=ms.get(i).getModifyName() %>" style="width:500px; height:400px;">
			</div>
			<% } for(int i=0; i< 5-ms.size(); i++){ %>
			<div class="mySlides fade">
			  <div class="numbertext"><%=(i+1)%>/ <%=ms.size()%></div>
			  <img src="<%=contextPath %>/resources/images/noImageMain.jpg" style="width:500px; height:400px;">
			</div>
		<%} } %>
		</div>
		<br>
		
		<div class="dotArea" style="text-align:center">
		  <span class="dot" onclick="currentSlide(1)"></span> 
		  <span class="dot" onclick="currentSlide(2)"></span> 
		  <span class="dot" onclick="currentSlide(3)"></span> 
		</div>
	</div>
	
		<!--  댓글 관련 영역 -->
		<div id="movieDetail">
			<img src="<%=contextPath %>/resources/images/movieChart2.png" width="50px" height="50px" align="center">
			<div id="name1">Review
				<img src="<%=contextPath %>/resources/images/line.png" width="300px" height="20px" >
			</div>
		</div>
		<div class="replyArea"> 
		<!-- 댓글 작성하는 table -->
		<table id="replyTable" border="2" align="center"> 
			<tr>
				<th>
				<div>
					<p class="star_rating" onclick="star();">
						<a href="#" class="on">★</a>
						<a href="#" class="on">★</a>
						<a href="#" class="on">★</a>
						<a href="#" class="on">★</a>
						<a href="#" class="on">★</a>
					</p>
				</div>
				</th>
				<td><textarea id="replyContent" rows="3" cols="60" style="resize:none;" placeholder="별점 및 관람평을 작성해주세요"></textarea></td>
				<td><button id="addReply">관람평 작성</button></td>
				
			
			</tr>
		</table>
		
		<br><br>
			
		<div id="replyListArea">
			<table id="replyList" align="center">

			</table>
			
		</div>
		<!-- The Modal -->
	    <div id="myModal" class="modal">
	 
		      Modal content
		      <div class="modal-content">
		        <span class="close">&times;</span>                                                               
		        <h6>신고내용을 선택해주세요.</h6>
		        <br>
		        <table id="rTable">
		        	<tr>
		        		<td>&nbsp;&nbsp;&nbsp;사유 :&nbsp;&nbsp;</td>
		        		<td>
		        			<select name="reviewReport" id="reviewRep">
		        				<option value="1">스포일러</option>
		        				<option value="2">광고성 발언</option>
		        				<option value="3">부적절한 언어행동</option>
		        			</select>
		        		</td>
		        	</tr>
		        </table>
		        <br>
		        <button type="button" id="detailView">입력</button>
		      </div>
		 
	    </div>
		
	</div>
</div>
	<form id="reviewForm" method="post" action="<%=contextPath%>/reviewRe.re">
		<input type="hidden" name="reviewId" value="">
		<input type="hidden" name="reviewContent" value="">
		<input type="hidden" name="reviewRe" value="">
		<input type="hidden" name="reviewNo" value="">
		<input type="hidden" name="movieNo" value="">
	</form>
	
	
	<script>
	
	var count = 0;
	var modal = document.getElementById('myModal');
	var reviewNo;
	var reviewChart;
	var reviewContent;
	var form = document.getElementById("reviewForm");
	var movieNo;
	
	
	$(function(){
		
		selectReplyList();
		
		window.setInterval(selectReplyList , 2000);
	
		
		$("#addReply").click(function(){
			
			$(".star_rating").children().each(function(){
				if($(this).attr("class") == "on"){
					count++;
				}
			});
			console.log(count);
		});
	});
		$("#addReply").click(function(){
			var content = $("#replyContent").val();
			movieNo = <%=m.getMovieNo()%>;
			
			
			$.ajax({
				url:"insertReply.re",
				data:{
					content:content,
					count:count,
					movieNo:movieNo
				},
				type:"post",
				success:function(result){
					if(result == 1){
						selectReplyList();
						$("#replyContent").val("");
					}
				},
				error:function(){
					console.log("댓글작성 실패");
				}
			});
		});

	
		
		function selectReplyList(){
			movieNo = <%=m.getMovieNo()%>;
		
			
			$.ajax({
				url:"rlist.re?movieNo=" + movieNo,
				type:"get",
				success:function(list){
					
					var value ="";
					
					for(var i in list){
						
						value += '<tr class="reviewId">' +
									'<td>' + '<input type="hidden" name="reviewNo" value="'+ list[i].reviewNo + '">' + '</td>' + 
									'<td width="150">' + list[i].id + '</td>' +
									'<td width="100">' + '<img src="<%=contextPath%>/resources/images/star2.png" width="20" height="20">' + list[i].reviewRating + '</td>' +
									'<td width="500">' + list[i].reviewText + '</td>' + 
									'<td width="50"><button type="button" class="test111" style="margin-top:10px;"><img src="<%=contextPath%>/resources/images/bell.png" width="25" height="25"></button></td>' + 
								'</tr>';
						
					}			
					$("#replyList").html(value);
					
				},
				error:function(){
					console.log("댓글 리스트 조회 ajax 통신 실패!!");
				}
			});
		}
	
		
		function star(){
			$( ".star_rating a" ).click(function() {
			     $(this).parents().children("a").removeClass("on");
			     $(this).addClass("on").prevAll("a").addClass("on");
			     return false;
			});
		}
		
		
		var slideIndex = 1;
		  showSlides(slideIndex);
		
		  function plusSlides(n) {
		    showSlides(slideIndex += n);
		  }
		
		  function currentSlide(n) {
		    showSlides(slideIndex = n);
		  }
		
		  function showSlides(n) {
		    var i;
		    var slides = document.getElementsByClassName("mySlides");
		    var dots = document.getElementsByClassName("dot");
		    if (n > slides.length) {slideIndex = 1}    
		    if (n < 1) {slideIndex = slides.length}
		    for (i = 0; i < slides.length; i++) {
		        slides[i].style.display = "none";  
		    }
		    for (i = 0; i < dots.length; i++) {
		        dots[i].className = dots[i].className.replace(" active", "");
		    }
		    slides[slideIndex-1].style.display = "block";  
		    dots[slideIndex-1].className += " active";
		  }
	
		  
 		$(document).on("click", ".test111", function(){
	
			reviewChart = $(this).parent().siblings().eq(1).text();
			reviewContent = $(this).parent().siblings().eq(3).text();
			reviewNo = $(this).parent().siblings().eq(0).children().val();
			
			
			modal.style.display = "block";
		
			
			console.log(reviewChart);
			console.log(reviewContent);
			console.log(reviewNo);
			
			form.reviewId.value = reviewChart;
			form.reviewContent.value = reviewContent;
			form.reviewNo.value = reviewNo;
			form.movieNo.value = movieNo;
		});	
 		
 
		 $("#myModal span").click(function(){
				modal.style.display = "none";
		});
		

	$(function(){
		$("#detailView").click(function(){
			
			reviewRe = $("#reviewRep").val()
			console.log(reviewRe);
			
			form.reviewRe.value = reviewRe;
			form.submit();
			
		});
	});
              


 
			
	
		

	</script>
	
	
	<br><br><br><br><br><br><br><br><br>
	</div>

</body>
</html>