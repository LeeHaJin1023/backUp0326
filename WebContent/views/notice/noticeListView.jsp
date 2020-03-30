<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.*" %>    
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

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


        #noticeContent { padding-left:270px; padding-top:40px; }
        #noticeContent>p { font-size: 30px; font-weight: 800;}
        #noticeContent table{ text-align: center; font-weight: 800; margin-bottom: 50px; margin:15px auto;}
        #noticeContent table tr td {width: 400px; height: 35px;}
        #noticeContent table tr td>input:nth-child(1) {text-align: center;}
        #noticeContent table tr td>input:nth-child(2){ width:300px; height: 50px; box-sizing: border-box;}
        #noticeContent table tr td #searchBtn {width: 50px; height: 50px; background:#9C0E0E; border:0; cursor:pointer; display: inline-block; vertical-align: bottom;}
        #noticeContent table tr td #requestBtn {width: 100px; height: 30px;}
    
    .layout{
    	color:black;
    }
    #noticeContent p, #noticeContent h1{
    color:black;}
 
	#requestBtn{
		border:none;
		outline:none;
		background:beige;
		border-radius:5px;
	}
	
	.listArea tbody tr td, .listArea thead tr th{
		color:black;
		border-radius:40px;
		box-shadow:3px 3px 3px 3px lightgray;
		font-weight:bold;
		height:30px;
	}
	.listArea{
		margin-top:50px;
		
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
        	display:inline-block;
        	width:200px;
        	margin-left:600px;
        	margin-top:50px;
        	height:100px;
        }
       .noticeList{
       	display:inline-block;
       	margin-left:150px;
       	width:800px;
       	padding:5px;
       }
       .noticeList div{
      	margin:5px;
       	float:left;
       }
	.noticeContentDetail{
		display:none;
		width:300px;
		text-align:center;
		height:300px;
		margin-left:200px !important;
		margin-top:50px !important;
	
	}
	.noticeNo{width:5%;}
	.noticeTitle{width:40%; text-align:center;}
	.noticeType{width:10%; padding-left:25px;}
	.noticeDate{width:10%; text-align:right; padding-left:70px;}
	.noticeList:hover{cursor:pointer;}
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
                <li><a href="<%=contextPath%>/qnaList.qa"><img src="resources/images/req1.png" alt=""><span>1:1문의</span></a></li>
                <li><a href="<%=contextPath%>/faq.fq"><img src="resources/images/req2.png" alt="">FAQ</a></li>
                <li><a href="<%=contextPath%>/list.no"><img src="resources/images/req3.png" alt="">공지사항</a></li>
                <li><a href="<%=contextPath%>/lost.lo"><img src="resources/images/req4.png" alt="">분실물찾기</a></li>
                <li><a href="<%=contextPath%>/bRoom.br"><img src="resources/images/req5.png" alt="">대관문의</a></li>
            </ul>
        </div>
        
        <div id="noticeContent">
        <p>공지사항.</p>
        <br><br><br>
        	<table class="listArea" align="center">
			<thead>
				<tr>	
					<th width="100">번호</th>
					<th width="100">분류</th>
					<th width="400">제목</th>
					<th width="100">등록일</th>
				</tr>
			</thead>
		</table>
			
				<% if(list.isEmpty()){ %>
				<%} else{ %>
					<%for(Notice n:list) {%>
						<div class="noticeList">
							<div class="noticeNo"><%=n.getNoticeNo() %></div>
							<div class="noticeType"><%=n.getNoticeType() %></div>
							<div class="noticeTitle"><%=n.getNoticeTitle() %></div>
							<div class="noticeDate"><%=n.getNoticeDate() %></div>
							<div class="noticeContentDetail"><%=n.getNoticeContent() %></div>
						</div>
						<hr>
					<%} %>
				<%} %>
	
        </div>
        
        <div class="pagingArea" align="center">
			
			<button onclick="location.href='<%=contextPath%>/list.no';"> &lt;&lt;</button>	
			
			
			<% if(currentPage == 1){ %>
				<button disabled> &lt;</button>
			<%} else { %>
			<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage-1%>';"> &lt; </button>	
			<% } %>
			
			
		
			 <%for(int p=startPage; p<=endPage; p++){ %>
			 	<%if(currentPage == p){ %>
			 		<button disabled><%=p%></button>
			 	<%}else{ %>
			 		<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=p%>';"><%=p%></button>
			 	<%} %>
			 <%} %>
			
			
			
			<%if(currentPage == maxPage){ %>
				<button disabled> &gt;</button>
			<%} else { %>
				<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
		
			<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=maxPage%>';"> &gt;&gt;</button>
		</div>
        
        <script>
        	$(function(){
        		$(".noticeTitle").on("click",function(){
        			var p = $(this).parent().children().last();
        			
        			if(p.css("display") == "none"){
        				$(this).siblings(".noticeContentDetail").slideUp();
        				
        				p.slideDown();
        			}else{
        				p.slideUp();
        			}
        		});
        	});
        </script>
        
   </div>
</div>

		
</body>
</html>