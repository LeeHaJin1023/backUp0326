<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.faq.model.vo.*" %>    
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int endPage = pi.getEndPage();
	int startPage = pi.getStartPage();


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        *{margin:0; padding:0;}
        .layout{ position: relative; margin:0 auto; width: 1200px; }
        ul li{list-style: none;}
        #noticeMenu {position:absolute; width:250px; left:0; top:40px; }
        #noticeMenu h2{width:100%; height:100px; background:#9C0E0E; color:#fff; text-align: center; line-height:100px;}
        #noticeMenu ul {border-left:1px solid #ddd; border-right:1px solid #ddd;}
        #noticeMenu ul li{border-bottom:1px solid #ddd; padding:15px; box-sizing: border-box;}
        #noticeMenu ul li a{display:block; text-decoration:none; color:#616060; }
        #noticeMenu ul li a img{display:inline-block; vertical-align: middle; margin-right:15px;}
        #noticeMenu ul li a span{display:inline-block; vertical-align: middle;}


        #faqContent { padding-left:270px; padding-top:40px; height:800px;}
        #faqContent>p { font-size: 30px; font-weight: 800;}
        #faqContent table{ text-align: center; font-weight: 800; margin-bottom: 50px; margin:15px auto;}
        #faqContent table tr td {width: 400px; height: 35px;}
        #faqContent table tr td>input:nth-child(1) {text-align: center;}
        #faqContent table tr td>input:nth-child(2){ width:300px; height: 50px; box-sizing: border-box;}
        #faqContent table tr td #searchBtn {width: 50px; height: 50px; background:#9C0E0E; border:0; cursor:pointer; display: inline-block; vertical-align: bottom;}
        #faqContent table tr td #requestBtn {width: 100px; height: 30px;}
    
    .layout{
    	color:black;
    }
    #faqContent p, #faqContent h1{
    color:black;}
 
    .faqQusetion{
    	text-align:center;
    }
  
    .contentA{
    	display:none;
    	margin-left:200px;
    	height:150px;
    	margin-top:100px;
    	text-align:center;
    }
  
	.contentNo{
		width:8%;
		display:inline-block;
		margin-left:50px;
	
		
	}
	.contentQ{
		display:inline-block;
		margin-left:200px;
		height:40px;
		width:50%;
		text-align:center;
	}
	
	#requestBtn{
		border:none;
		outline:none;
		background:beige;
		border-radius:5px;
	}
	.content{
		float:left; 
		margin-left:150px;
	}
	.content tr th{color:black; border-radius:40px; box-shadow:3px 3px 3px 3px lightgray; font-weight:bold; height:30px;}
	.content tr td{border-bottom:2px solid black;}
	.contentQ:hover{cursor:pointer;}
	.contentType{
	display:inline-block;}
	
	#topContent{
		background:lightgray;
		border-radius:5px;
	}
	#searchBtn{
	width:30px;
	heightL30px;
	}
	 .pagingArea button{
        	border-radius:10px;
        	background:lightred;
        	outline:0;
        	border:0;
        	width:25px;
        	height:25px;
        	padding:5px;
        	color:black;
      
        }
        .pagingArea button:hover{
        cursor:pointer;
        background:lightgray;
        }
        .pagingArea{
        	width:200px;
        	margin-left:600px;
        	height:100px;
        	margin-top:-150px;
        }
   
	
    </style>
    
    
   
    
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br>


<div class="layout">

    <div class="container">
        <div id="noticeMenu">
            <h2>고객센터</h2>
            <ul>
                <li><a href="<%=contextPath%>/qnaList.qa"><img src="<%=contextPath %>/resources/images/req1.png" alt=""><span>1:1문의</span></a></li>
                <li><a href="<%=contextPath%>/faq.fq"><img src="<%=contextPath %>/resources/images/req2.png" alt="">FAQ</a></li>
                <li><a href="<%=contextPath%>/list.no"><img src="<%=contextPath %>/resources/images/req3.png" alt="">공지사항</a></li>
                <li><a href="<%=contextPath%>/lost.lo"><img src="<%=contextPath %>/resources/images/req4.png" alt="">분실물찾기</a></li>
                <li><a href="<%=contextPath%>/bRoom.br"><img src="<%=contextPath %>/resources/images/req5.png" alt="">대관문의</a></li>
            </ul>
        </div>
        <div id="faqContent">
            <p>FAQ.</p>
            <br><hr>
            <table id="topContent">
                <tr>
                    <td rowspan="2">
                        <button type="button" id="searchBtn"><img src="<%=contextPath%>/resources/images/zoom3.png" alt="" width="30px" heightL="30px"></button>
                        <input type="text" placeholder=" 검색어를 입력하십시오"/>
                    </td>
                    <td id="contentPlus"><p>더 궁금한 점이 있다면?</p></td>
                    
                </tr>
                <tr>
                    <td><button type="button" id="requestBtn">1:1문의</button></td>
                </tr>
            </table>
            <div id="contentTable">
            	<table class="content">
            	<thead>
            		<tr>	
            			<th width="100px">번호</th>
            			<th width="100px">분류</th>
            			<th width="700px">제목</th>
            		</tr>
            	
            	</thead>
            	</table>
            	<hr>
            <% if(list.isEmpty()){ %>
            			<div></div>
            		<%} else {%>
            		 	<%for(Faq f : list){ %>
            		 	<div id="contentArea">
            		 		<div class="contentNo"><%=f.getFaqNo()%></div>
            		 		<div class="contentType"><%=f.getType() %></div>
            		 		<div class="contentQ"><%=f.getQuestion() %></div>
            		 		<div class="contentA"><%= f.getAnswer()%></div>
            		 	</div>
            		 	<%} %>
            		 <%} %>
            </div>
        </div>
        <div class="pagingArea" align="center">
			
			<button onclick="location.href='<%=contextPath%>/faq.fq';"> &lt;&lt;</button>	
			
			
			<% if(currentPage == 1){ %>
				<button disabled> &lt;</button>
			<%} else { %>
			<button onclick="location.href='<%=contextPath%>/faq.fq?currentPage=<%=currentPage-1%>';"> &lt; </button>	
			<% } %>
			
			
		
			 <%for(int p=startPage; p<=endPage; p++){ %>
			 	<%if(currentPage == p){ %>
			 		<button disabled><%=p%></button>
			 	<%}else{ %>
			 		<button onclick="location.href='<%=contextPath%>/faq.fq?currentPage=<%=p%>';"><%=p%></button>
			 	<%} %>
			 <%} %>
			
			
			
			<%if(currentPage == maxPage){ %>
				<button disabled> &gt;</button>
			<%} else { %>
				<button onclick="location.href='<%=contextPath%>/faq.fq?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
		
			<button onclick="location.href='<%=contextPath%>/faq.fq?currentPage=<%=maxPage%>';"> &gt;&gt;</button>
		</div>
        <script>
 				$(function(){
 					$(".contentQ").on("click",function(){
 						var p = $(this).next();
 						
 						if(p.css("display") == "none"){
 							
 							$(this).siblings(".contentA").slideUp();
 							
 							p.slideDown();
 						} else{
 							p.slideUp();
 						}
 					});
 				});
 			
 			
 			</script>
   </div>
</div>

		
</body>
</html>