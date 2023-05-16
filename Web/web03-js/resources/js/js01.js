function fileFunction(){
    // window 객체에 alert()인데 생략 가능함
    window.alert('외부 js file에서 실행됨!!');

}

// 익명함수 onload => 다 출력되었을 때
window.onload=function(){
    alert('윈도우 로딩 됨!(로딩 후)')
}