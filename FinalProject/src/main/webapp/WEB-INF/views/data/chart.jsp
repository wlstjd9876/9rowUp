<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
.hn{font-family: 'Hanna', sans-serif;
	}
</style>
<br>
<div class="col-md-12 col-lg-12" align="center">
<img src="${pageContext.request.contextPath}/resources/img/data/stadistics.png" width="50">
<span class="hn" style="font-size: 37pt;">통계 자료</span>
<img src="${pageContext.request.contextPath}/resources/img/data/search.png" width="50">
<br><br>
</div>


<br><br><br>
<!-- 인기 관광지 - 가로막대 그래프 -->
<div class="col-sm-offset-1 col-md-offset-1 col-lg-offset-1"><br></div>
<div align="center" class="col-md-6 col-lg-6">
<br>
<div><h2 align="center" class="hn">인기 관광지 TOP 10</h2></div>
<br>
<canvas id="attraction" style="align-items center;"></canvas>
<br><br><br><br><br>
</div>

<!-- 즐겨찾기 장소 - 가로막대 그래프 -->
<div align="center" class="col-md-6 col-lg-6">
<br>
<div><h2 align="center" class="hn">즐겨찾기 장소 TOP 10</h2></div>
<br>
<canvas id="favorite"></canvas>
<br><br><br><br><br>
</div>

<!-- 회원들의 여행스타일 - 파이 그래프 -->
<div align="center" class="col-md-6 col-lg-6">
<div><h2 align="center" class="hn">회원들의 여행스타일</h2></div>
<br>
<canvas id="style"></canvas>
<br><br><br><br><br>
</div>

<!-- 동행과 함께하는 여행 타입 - 파이 그래프 -->
<div align="center" class="col-md-6 col-lg-6">
<div><h2 align="center" class="hn">동행과 함께하는 여행 타입</h2></div>
<br>
<canvas id="type"></canvas>
<br><br><br><br><br>
</div>

<!-- 회원들의 여행 시기 - 세로막대 그래프 -->
<div align="center" class="col-md-12 col-lg-12">
<div><h2 align="center" class="hn">회원들의 여행 시기</h2></div>
<br>
<canvas id="month" style="align-items center;"></canvas>
<br><br><br><br><br>
</div>

<br>


<script>
<!-- 인기 관광지 - 가로막대 그래프 -->
var ctx = document.getElementById('attraction').getContext('2d');
var attraction = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

<!-- 즐겨찾기 장소 - 가로막대 그래프 -->
var ctx2 = document.getElementById('favorite').getContext('2d');
var favorite = new Chart(ctx2, {
    type: 'horizontalBar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});


<!-- 회원들의 여행스타일 - 파이 그래프 -->
var ctx3 = document.getElementById('style').getContext('2d');
var style = new Chart(ctx3, {
    type: 'pie',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

<!-- 동행과 함께하는 여행 타입 - 파이 그래프 -->
var ctx4 = document.getElementById('type').getContext('2d');
var type = new Chart(ctx4, {
    type: 'pie',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

<!-- 회원들의 여행 시기 - 세로막대 그래프 -->
var ctx5 = document.getElementById('month').getContext('2d');
var month = new Chart(ctx5, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});


</script>