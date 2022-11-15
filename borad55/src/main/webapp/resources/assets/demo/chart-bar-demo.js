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

let chargeArray = []; // 배열 선언

let SingupDataArray1 = [];
let SingupDataArray2 = [];
let SingupDataArray3 = [];

let SingupDatalabel = [];

let SingupDatakindArray1 = [];
let SingupDatakindArray2 = [];
let SingupDatakindArray3 = [];

$(document).ready(function() {
     $.ajax({
         type:'POST',
         url : 'getUserChargeRecord',
         success : function(data){

            $.each(data.polarArea, function(index, item){
                chargeArray.push(item);
            });
            polarAreaChart();

            $.each(data.SingupData, function(index, item){
                if(item.recentdate == '2022-09'){
                    if(item.signup_data == '검색'){
                        SingupDatakindArray1.push(item.signup_data);
                        SingupDataArray1.push(item.cnt);
                    }
                    if(item.signup_data == '광고'){
                        SingupDatakindArray1.push(item.signup_data);
                        SingupDataArray1.push(item.cnt);
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDatakindArray1.push(item.signup_data);
                        SingupDataArray1.push(item.cnt);
                    }
                    if(item.signup_data == '소개'){
                        SingupDatakindArray1.push(item.signup_data);
                        SingupDataArray1.push(item.cnt);
                    }
                    if(item.signup_data == '카페'){
                        SingupDatakindArray1.push(item.signup_data);
                        SingupDataArray1.push(item.cnt);
                    }
                }
                if(item.recentdate == '2022-10'){
                    if(item.signup_data == '검색'){
                        SingupDatakindArray2.push(item.signup_data);
                        SingupDataArray2.push(item.cnt);
                    }
                    if(item.signup_data == '광고'){
                        SingupDatakindArray2.push(item.signup_data);
                        SingupDataArray2.push(item.cnt);
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDatakindArray2.push(item.signup_data);
                        SingupDataArray2.push(item.cnt);
                    }
                    if(item.signup_data == '소개'){
                        SingupDatakindArray2.push(item.signup_data);
                        SingupDataArray2.push(item.cnt);
                    }
                    if(item.signup_data == '카페'){
                        SingupDatakindArray2.push(item.signup_data);
                        SingupDataArray2.push(item.cnt);
                    }
                }
                if(item.recentdate == '2022-11'){
                    if(item.signup_data == '검색'){
                        SingupDatakindArray3.push(item.signup_data);
                        SingupDataArray3.push(item.cnt);
                    }
                    if(item.signup_data == '광고'){
                        SingupDatakindArray3.push(item.signup_data);
                        SingupDataArray3.push(item.cnt);
                    }
                    if(item.signup_data == '유튜브'){
                        SingupDatakindArray3.push(item.signup_data);
                        SingupDataArray3.push(item.cnt);
                    }
                    if(item.signup_data == '소개'){
                        SingupDatakindArray3.push(item.signup_data);
                        SingupDataArray3.push(item.cnt);
                    }
                    if(item.signup_data == '카페'){
                        SingupDatakindArray3.push(item.signup_data);
                        SingupDataArray3.push(item.cnt);
                    }
                }
            });
            console.log(SingupDataArray3);
            console.log(SingupDatakindArray3);
            console.log(SingupDataArray2);
            console.log(SingupDatakindArray2);
            console.log(SingupDataArray1);
            console.log(SingupDatakindArray1);
            barChart();

         },
         error : function(){
            alert("네트워크 통신오류가 발생하였습니다.\n통계 결과를 불러오지 못했습니다.");
         }
     });

});

function polarAreaChart(){

    var ctx = document.getElementById("myBarChart");

    var data = {
        labels: ["5000원", "10000원", "15000원", "20000원", "25000원", "30000원", "35000원", "40000원", "45000원", "50000원", "100000원"],
        datasets: [{
          label: "명",
          data: chargeArray,
          backgroundColor: COLORS,
        }]
    };

    var config = {
        type: 'polarArea',
        data: data,
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'top',
            }
          }
        },
    };

    var myBarChart = new Chart(ctx,{
                     	type: 'polarArea',
                     	data: data
                     });
}//line chart

function barChart(){

var bardata =
{
    labels: ["최근 한 달", "1개월 전 ~ 2개월 전", "2개월 전 ~ 3개월 전"],
    datasets:
        [{
        	labels: SingupDatakindArray1,
            backgroundColor: 'rgba(255, 99, 132, 1)',
            borderColor: 'rgba(255, 99, 132, 1.5)',
            data: SingupDataArray1
        },
        {
        	labels: SingupDatakindArray2,
            backgroundColor: 'rgba(54, 162, 235, 1)',
            borderColor: 'rgba(54, 162, 235, 1.5)',
            data: SingupDataArray2
        },
        {
        	labels: SingupDatakindArray3,
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
			text: ' 최근 3달간 가입경로',
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

var ctx = document.getElementById("myPieChart");

var barChart = new Chart(ctx,{
	type: 'bar',
	data: bardata,
	options : baroptions
});

}//bar chart