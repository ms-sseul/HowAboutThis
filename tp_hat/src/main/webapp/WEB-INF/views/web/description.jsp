<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>description</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/category.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="carousel slide" data-ride="carousel">
	<div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active">
            <div class="carousel-caption d-none d-md-block">
              <h3></h3>
              <p></p>
            </div>
          </div>
     </div>
</div>

<!-- Page Content -->
<div class="container">

	<!-- Title -->
         <h1 class="mt-4">${projectModel.title}</h1>
         <!-- Author -->
         <p class="lead">
            by 
          <a href="#">${projectModel.userId}</a>
          </p>
          <hr>
          <!-- Date/Time -->
          <p>Posted on <fmt:formatDate value="${projectModel.regTime}" pattern="yy/MM/dd HH:mm:ss"></fmt:formatDate></p>
          <hr>
 
   <div class="row">
      <!-- Post Content Column -->
      <div class="col-lg-8">
          <!-- Preview Image -->
          <img class="img-fluid rounded" src="${projectModel.image.image}" alt="">
     </div>
     <!-- Search Widget -->
         <div class="col-md-4">
          <div class="card my-4">
            <div class="card-body">
            	<p>D-${projectModel.restDay}</p>
            	<p class="progress">
            		<a class="progress-bar progress-bar-striped" aria-valuenow="40"
								role="progressbar" aria-valuemin="0" aria-valuemax="100"
								style="width:${projectModel.percent*100}%"></a>
              	</p>
              	<p>펀딩 금액 : <fmt:formatNumber value="${projectModel.currentAmount}"></fmt:formatNumber>원</p>
              	<p>목표 금액 : <fmt:formatNumber value="${projectModel.targetAmount}"></fmt:formatNumber>원</p>
             </div>
             	<!-- <span>19세 이상 가능</span> -->
             <div class="btn-wrap funding">
             	<button class="btn btn-primary" onclick="location.href='rewards?pno='+${projectModel.pno}">펀딩하기</button>
             </div>
          </div>
         </div>
  
     <div class="col-lg-8">
     <hr>   		
		<div>
          <!-- Post Content -->
          <c:forEach items = "${images}" var ="img" varStatus="status">
          	<c:if test = "${status.index!=0}">
   			<img class="img-fluid rounded" src="${img.image}" alt=""><br/>
          	</c:if>
          </c:forEach>
          <p class="lead">
          <!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>-->		
		  ${projectModel.content}
		  </p>
          <!-- <blockquote class="blockquote">
            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer class="blockquote-footer">Someone famous in
              <cite title="Source Title">Source Title</cite>
            </footer>
          </blockquote>

          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>

          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae? Qui, necessitatibus, est!</p> -->
	</div>

          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>

          <!-- Single Comment -->
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <div class="mt-0"> 
               <span>Commenter Name</span>
               <span>
              	 <a href="#">답글</a>
               </span>
              </div>
               <p>내용</p>
              
              <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body">
	              <div class="mt-0"> 
	               <span>Commenter Name</span>
	               <span>
	                 <a href="#">답글</a>
	               </span>
	              </div>
	               <p>내용</p>
	              
	          <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body">
                  <div class="mt-0"> 
	               <span>Commenter Name</span>
	               <span>
	                 <a href="#">답글</a>
	               </span>
	              </div>
	              	<p>내용</p>
                </div>
              </div>
               </div>
             </div>
            </div>
          </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <div class="card my-4">
            <div class="card-body">
            	<h3>${projectModel.userId}</h3>
            	<!-- <p>설명</p> -->
             </div>
          </div>
         </div>
         
       </div> <!-- .row -->

</div> <!-- .container -->
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

  </body>

</html>