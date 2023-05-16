var doc = respXml.getElementsByTagName("ROW")
var vals = []
for(var i=0; i<doc.length; i++){
    var vals = []
    var id = doc[i].getElementsByTagName("EMPLOYEE_ID")[0].innerHTML
    var name = doc[i].getElementsByTagName("LAST_NAME")[0].innerHTML
    var email = doc[i].getElementsByTagName("EMAIL")[0].innerHTML
    var phone = doc[i].getElementsByTagName("PHONE_NUMBER")[0].innerHTML
    var date = doc[i].getElementsByTagName("HIRE_DATE")[0].innerHTML


    vals = [id, name, email, phone, date]

    document.getElementById("addtr").appendChild(createRow(vals));
}

// js22-dom07.html 에서 사용한 함수
function createRow(vals){
    // tr tag 생성
    var tr = document.createElement("tr")

    // tr tag안에 td tag 생성하고 textContent(<>'textContent'<>)에 vals[i] 넣기
    for(var i=0; i<vals.length; i++){
        // td tag 생성
        var td = document.createElement('td')
        td.textContent = vals[i]
        // tr의 자식으로 td 넣기
        tr.appendChild(td)
        }
    return tr;
}