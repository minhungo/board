// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

const COLORS = [ // 컬러 배열
    'rgba(77,201,246,0.4)',
    'rgba(246,112,25,0.4)',
    'rgba(245,55,148,0.4)',
    'rgba(83,123,196,0.4)',
    'rgba(172,194,54,0.4)',
    'rgba(22,106,143,0.4)',
    'rgba(0,169,80,0.4)',
    'rgba(88,89,91,0.4)',
    'rgba(133,73,186,0.4)',
    'rgba(220,53,69,0.4)',
    'rgba(255,193,7,0.4)'
];

function getMonth(month){ // 월 계산 후 0 붙임
    month = month >= 10 ? month : '0' + month;
    return month;
}

let now = new Date();
let thisyear = now.getFullYear(); // 년도

let thismonth1 = getMonth(now.getMonth()+1);  // 금월
let thismonth2 = getMonth(now.getMonth());  // 전월
let thismonth3 = getMonth(now.getMonth()-1);  // 전전월

let thismonth = thisyear + "-" + thismonth1; // 올해 금월
let amonthago = thisyear + "-" + thismonth2; // 올해 전월
let twomonthago = thisyear + "-" + thismonth3; // 올해 전전월

let chargeArray = []; // 충전통계용 배열 선언

let SingupDataArray1 = [0,0,0,0,0]; // 금월
let SingupDataArray2 = [0,0,0,0,0]; // 전월
let SingupDataArray3 = [0,0,0,0,0]; // 전전월

let SingupDatakindArray = ['검색', '광고', '유튜브', '소개', '카페']; // 검색경로 배열
let SingupDatalegendArray1 = ['', '', '', '', '']; // 금월
let SingupDatalegendArray2 = ['', '', '', '', '']; // 전월
let SingupDatalegendArray3 = ['', '', '', '', '']; // 전전월

let ratioArray = []; // 비율계산용 배열 선언
let BoardCntArray = []; // 게시글수파악용 배열 선언
let ReplyCntArray = []; // 댓글수파악용 배열 선언

function calRatio(a, b){ // 비율계산 후 반올림
    return Math.round((a/b)*100);
}

function chartJSClear(){ // chartJS 에서 차트 지우기
    barChart.destroy();
    polarAreaChart.destroy();
}

function chartJS() {
     $.ajax({
         type:'POST',
         url : 'getUserChargeRecord',
         success : function(data){

            let ratio = data.getRatio;
            ratioArray.push(ratio.cntsignup);
            ratioArray.push(ratio.cntboth);
            ratioArray.push(ratio.cntboard);
            ratioArray.push(ratio.cntreply);

            console.log(ratioArray);

            if(data.getBoardCount != ''){
                $.each(data.getBoardCount, function(index, item){
                    BoardCntArray.push(item.cnt);
                });
            }else{
                for(let i=0;i<8;i++){
                    BoardCntArray.push(0);
                }
            }
            console.log(BoardCntArray);

            if(data.getReplyCount != ''){
                $.each(data.getReplyCount, function(index, item){
                    ReplyCntArray.push(item.cnt);
                });
            }else{
                for(let i=0;i<8;i++){
                    ReplyCntArray.push(0);
                }
            }
            console.log(ReplyCntArray);
            highChartActivity(); // 하이차트 2개 그리기

            $.each(data.polarArea, function(index, item){
                chargeArray.push(item);
            });
            polarAreaChart(); // chartJS polarArea

            $.each(data.SingupData, function(index, item){
                if(item.recentdate == twomonthago){
                    if(item.signup_data == '검색'){
                        SingupDataArray1.splice(0,1,(item.cnt));
                        SingupDatalegendArray1.splice(0,1,"2개월 전");
                    }
                    if(item.signup_data == '광고'){
                        SingupDataArray1.splice(1,1,item.cnt);
                        SingupDatalegendArray1.splice(1,1,"2개월 전");
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDataArray1.splice(2,1,item.cnt);
                        SingupDatalegendArray1.splice(2,1,"2개월 전");
                    }
                    if(item.signup_data == '소개'){
                        SingupDataArray1.splice(3,1,item.cnt);
                        SingupDatalegendArray1.splice(3,1,"2개월 전");
                    }
                    if(item.signup_data == '카페'){
                        SingupDataArray1.splice(4,1,item.cnt);
                        SingupDatalegendArray1.splice(4,1,"2개월 전");
                    }
                }
                if(item.recentdate == amonthago){
                    if(item.signup_data == '검색'){
                        SingupDataArray2.splice(0,1,item.cnt);
                        SingupDatalegendArray2.splice(0,1,"1개월 전");
                    }
                    if(item.signup_data == '광고'){
                        SingupDataArray2.splice(1,1,item.cnt);
                        SingupDatalegendArray2.splice(1,1,"1개월 전");
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDataArray2.splice(2,1,item.cnt);
                        SingupDatalegendArray2.splice(2,1,"1개월 전");
                    }
                    if(item.signup_data == '소개'){
                        SingupDataArray2.splice(3,1,item.cnt);
                        SingupDatalegendArray2.splice(3,1,"1개월 전");
                    }
                    if(item.signup_data == '카페'){
                        SingupDataArray2.splice(4,1,item.cnt);
                        SingupDatalegendArray2.splice(4,1,"1개월 전");
                    }
                }
                if(item.recentdate == thismonth){
                    if(item.signup_data == '검색'){
                        SingupDataArray3.splice(0,1,item.cnt);
                        SingupDatalegendArray3.splice(0,1,"최근 한 달");
                    }
                    if(item.signup_data == '광고'){
                        SingupDataArray3.splice(1,1,item.cnt);
                        SingupDatalegendArray3.splice(1,1,"최근 한 달");
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDataArray3.splice(2,1,item.cnt);
                        SingupDatalegendArray3.splice(2,1,"최근 한 달");
                    }
                    if(item.signup_data == '소개'){
                        SingupDataArray3.splice(3,1,item.cnt);
                        SingupDatalegendArray3.splice(3,1,"최근 한 달");
                    }
                    if(item.signup_data == '카페'){
                        SingupDataArray3.splice(4,1,item.cnt);
                        SingupDatalegendArray3.splice(4,1,"최근 한 달");
                    }
                }
            });
            barChart(); // chartJS barChart

         },
         error : function(){
            alert("네트워크 통신오류가 발생하였습니다.\n통계 결과를 불러오지 못했습니다.");
         }
     });

};

function polarAreaChart(){

    var ctx = document.getElementById("polarAreaChart");

    var data = {
        labels: ["5000원", "10000원", "15000원", "20000원", "25000원", "30000원", "35000원", "40000원", "45000원", "50000원", "100000원"],
        datasets: [{
          label: "명",
          data: chargeArray,
          backgroundColor: COLORS,
        }]
    };

    var polarAreaoptions = {
    		responsive: true,
    		legend : {
    			display: true
    		},
    		title: {
    			display: true,
    			text: '사이트 이용자 코인 충전 통계',
    			fontSize: 17,
    			fontColor: 'rgba(46, 49, 49, 1)'
    		},
    		animation: false,
    };

    var polarAreaChart = new Chart(ctx,{
                     	type: 'polarArea',
                     	data: data,
                        options: polarAreaoptions
                     });
}// polarAreaChart

function barChart(){

    var bardata =
    {
        labels: SingupDatakindArray,
        datasets:
            [{
                labels: SingupDatalegendArray1,
                backgroundColor: 'rgba(255, 99, 132, 1)',
                borderColor: 'rgba(255, 99, 132, 1.5)',
                data: SingupDataArray1
            },
            {
                labels: SingupDatalegendArray2,
                backgroundColor: 'rgba(54, 162, 235, 1)',
                borderColor: 'rgba(54, 162, 235, 1.5)',
                data: SingupDataArray2
            },
            {
                labels: SingupDatalegendArray3,
                backgroundColor: 'rgba(255, 206, 86, 1)',
                borderColor: 'rgba(255, 206, 86, 1.5)',
                data: SingupDataArray3
            }]
    };

    var baroptions = {
            responsive: true,
            legend : {
                display: false
            },
            title: {
                display: true,
                text: ' 최근 한 달부터 2개월 전까지 가입경로 통계',
                fontSize: 17,
                fontColor: 'rgba(46, 49, 49, 1)'
            },
            animation: false,
            tooltips: {
                    displayColors: false, // 툴팁 바 컬러 표시 여부
                    titleFontColor: '#fff', // 툴팁 폰트 관련
                    titleAlign: 'center', // 툴팁 폰트 관련
                    callbacks: {
                      label: function(tooltipItem, data) {
                             var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                             var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
                             return label + ' : '+item;
                        }
                   }
            }
    };

    var ctx = document.getElementById("BarChart");

    var barChart = new Chart(ctx,{
        type: 'bar',
        data: bardata,
        options : baroptions
    });

}//bar chart

function renderIcons() {

let icon1 = "/resources/img/reply.svg";
let icon2 = "/resources/img/board.svg";
let icon3 = "/resources/img/both.svg";

  // both icon
  if (!this.series[0].icon) {
    this.series[0].icon = this.renderer.image(icon3, -10, -15, 30, 30)
      .add(this.series[2].group);
  }
  this.series[0].icon.translate(
    this.chartWidth / 2 - 10,
    this.plotHeight / 2 - this.series[0].points[0].shapeArgs.innerR -
      (this.series[0].points[0].shapeArgs.r - this.series[0].points[0].shapeArgs.innerR) / 2
  );

  // board icon
  if (!this.series[1].icon) {
    this.series[1].icon = this.renderer.image(icon2, -10, -15, 30, 30)
      .add(this.series[2].group);
  }
  this.series[1].icon.translate(
    this.chartWidth / 2 - 10,
    this.plotHeight / 2 - this.series[1].points[0].shapeArgs.innerR -
      (this.series[1].points[0].shapeArgs.r - this.series[1].points[0].shapeArgs.innerR) / 2
  );

  // reply icon
  if (!this.series[2].icon) {
    this.series[2].icon = this.renderer.image(icon1, -10, -15, 30, 30)
      .add(this.series[2].group);
  }

  this.series[2].icon.translate(
    this.chartWidth / 2 - 10,
    this.plotHeight / 2 - this.series[2].points[0].shapeArgs.innerR -
      (this.series[2].points[0].shapeArgs.r - this.series[2].points[0].shapeArgs.innerR) / 2
  );
}

function highChartActivity(){

    // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
    var chart1 = new Highcharts.chart('container', {
      chart: {
        renderTo: 'container',
        type: 'line'
      },
      title: {
        text: 'lineChart',
        style: {
          fontSize: '16px'
        }
      },
      xAxis: {
        categories: ['7일 전', '6일 전', '5일 전', '4일 전', '3일 전', '2일 전', '1일 전', 'D']
      },
      yAxis: {
        title: {
          text: '갯수'
        }
      },
      plotOptions: {
        line: {
          dataLabels: {
            enabled: true
          },
          enableMouseTracking: false
        }
      },
      series: [{
        name: '글',
        data: BoardCntArray
      }, {
        name: '댓글',
        data: ReplyCntArray
      }]
    });

    var chart2 = new Highcharts.chart('container2', {

      chart: {
        renderTo: 'container2',
        type: 'solidgauge',
        height: '66.7%',
        events: {
          render: renderIcons,
        }
      },

      title: {
        text: 'RatioChart',
        style: {
          fontSize: '16px'
        }
      },

      tooltip: {
        borderWidth: 0,
        backgroundColor: 'none',
        shadow: false,
        style: {
          fontSize: '16px'
        },
        valueSuffix: '%',
        pointFormat: '{series.name}<br><span style="font-size:2em; color: {point.color}; font-weight: bold">{point.y}</span>',
        positioner: function (labelWidth) {
          return {
            x: (this.chart.chartWidth - labelWidth) / 2,
            y: (this.chart.plotHeight / 2) + 15
          };
        }
      },

      pane: {
        startAngle: 0,
        endAngle: 360,
        background: [{ // Track for Move
          outerRadius: '112%',
          innerRadius: '88%',
          backgroundColor: Highcharts.color(Highcharts.getOptions().colors[0])
            .setOpacity(0.3)
            .get(),
          borderWidth: 0
        }, { // Track for Exercise
          outerRadius: '87%',
          innerRadius: '63%',
          backgroundColor: Highcharts.color(Highcharts.getOptions().colors[7])
            .setOpacity(0.3)
            .get(),
          borderWidth: 0
        }, { // Track for Stand
          outerRadius: '62%',
          innerRadius: '38%',
          backgroundColor: Highcharts.color(Highcharts.getOptions().colors[2])
            .setOpacity(0.3)
            .get(),
          borderWidth: 0
        }]
      },

      yAxis: {
        min: 0,
        max: 100,
        lineWidth: 0,
        tickPositions: []
      },

      plotOptions: {
        solidgauge: {
          dataLabels: {
            enabled: false
          },
          linecap: 'round',
          stickyTracking: false,
          rounded: true
        }
      },

      series: [{
        name: '글, 댓글',
        data: [{
          color: Highcharts.getOptions().colors[0],
          radius: '112%',
          innerRadius: '88%',
          y: calRatio(ratioArray[1], ratioArray[0]) // data
        }]
      }, {
        name: '글',
        data: [{
          color: Highcharts.getOptions().colors[7],
          radius: '87%',
          innerRadius: '63%',
          y: calRatio(ratioArray[2], ratioArray[0]) // data
        }]
      }, {
        name: '댓글',
        data: [{
          color: Highcharts.getOptions().colors[2],
          radius: '62%',
          innerRadius: '38%',
          y: calRatio(ratioArray[3], ratioArray[0]) // data
        }]
      }]
    });
}; // highChartActivity end