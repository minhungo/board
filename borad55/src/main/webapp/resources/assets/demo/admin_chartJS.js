// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

const COLORS = [
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

function getMonth(month){
    month = month >= 10 ? month : '0' + month;
    return month;
}

let now = new Date();
let thisyear = now.getFullYear(); // 년도

let thismonth1 = getMonth(now.getMonth()+1);  // 월
let thismonth2 = getMonth(now.getMonth());  // 전월
let thismonth3 = getMonth(now.getMonth()-1);  // 전전월

let thismonth = thisyear + "-" + thismonth1;
let amonthago = thisyear + "-" + thismonth2;
let twomonthago = thisyear + "-" + thismonth3;

let chargeArray = []; // 배열 선언

let SingupDataArray1 = [0,0,0,0,0]; // 월
let SingupDataArray2 = [0,0,0,0,0]; // 전월
let SingupDataArray3 = [0,0,0,0,0]; // 전전월

let SingupDatalabel = [];

let SingupDatakindArray = ['검색', '광고', '유튜브', '소개', '카페']; // 검색경로
let SingupDatalegendArray1 = ['', '', '', '', '']; // 월
let SingupDatalegendArray2 = ['', '', '', '', '']; // 전월
let SingupDatalegendArray3 = ['', '', '', '', '']; // 전전월

function chartJSClear(){
    barChart.destroy();
    polarAreaChart.destroy();
}

function chartJS() {
     $.ajax({
         type:'POST',
         url : 'getUserChargeRecord',
         success : function(data){

            $.each(data.polarArea, function(index, item){
                chargeArray.push(item);
            });
            polarAreaChart();

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
            barChart();

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