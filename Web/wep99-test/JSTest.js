function answer01(){
    var isNum = document.getElementById("q01_num").value;
    if(isNaN(isNum) || isNum == ""){
        alert("숫자가 아닙니다");
    } else{	
        alert("숫자입니다.");
    }
}

function answer02(){
    var nList = document.getElementById("nameList").innerHTML;
    var inputName = document.getElementsByTagName("input")[1].value;

    var nList2 = nList.split(" ");
    var chkName = 0;
    for(var i=0; i<nList2.length; i++){
        if(nList2[i] == inputName){
            chkName = 1
            break
        }
    }
    if(chkName == 1){
        alert("이름이 있습니다.");
    } else{
        alert("이름이 없습니다.");
    }
}

function answer03(){
    var page = document.getElementsByName("rdo");
    for(var i=0; i<page.length; i++){
        if(page[i].checked){
            
        }
    }
}

function answer04(bool){
    var chks1 = document.getElementsByName("subject")[0].checked;
    var chks2 = document.getElementsByName("subject")[1].checked;
    var chks3 = document.getElementsByName("subject")[2].checked;
    var allchk = document.getElementsByName("all")[0].checked;

    alert(bool)

    chks1 = bool;
    chks2 = bool;
    chks3 = bool;
}