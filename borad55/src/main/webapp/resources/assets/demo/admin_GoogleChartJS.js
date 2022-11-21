const COLORS2 = [
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

let chargeArray2 = []; // 배열 선언

function chartJS2Clear(){
    myBarChart2.destroy();
}

function chartJS2() {
     $.ajax({
         type:'POST',
         url : 'getUserChargeRecord',
         success : function(data){

            $.each(data.polarArea, function(index, item){
                chargeArray2.push(item);
            });
            polarAreaChart2();

         },
         error : function(){
            alert("네트워크 통신오류가 발생하였습니다.\n통계 결과를 불러오지 못했습니다.");
         }
     });

};

function polarAreaChart2(){

    var ctx2 = document.getElementById("polarAreaChart2");

    var data2 = {
        labels: ["5000원", "10000원", "15000원", "20000원", "25000원", "30000원", "35000원", "40000원", "45000원", "50000원", "100000원"],
        datasets: [{
          label: "명",
          data: chargeArray2,
          backgroundColor: COLORS2,
        }]
    };

    var polarAreaoptions2 = {
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

    var myBarChart2 = new Chart(ctx2,{
                     	type: 'polarArea',
                     	data: data2,
                        options: polarAreaoptions2
                     });
}// polarAreaChart