<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style2.css">
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
</head>
<body>

   <div class="container">
      <div class="row">
         <h3>도움 요청!</h3>
         <form method="post" action="index.html" class="login">
            <p>
               <label for="name">글 제목:</label> <input type="text" name="login"
                  id="login">
            </p>

            <p>
               <label for="startdate">시작날:</label> <input type="text"
                  name="password" id="password">
            </p>

            <p>
               <label for="startdate">끝날:</label> <input type="text"
                  name="password" id="password">
            </p>

            <p>
               <label for="startdate">ID:</label> <input type="text"
                  name="password" id="password">
            </p>

         </form>
         <h1>내일정</h1>
      </div>

      <div class="sbox">
      
      </div>
      

   </div>