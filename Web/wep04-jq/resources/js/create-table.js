//해석 발표

//엘리먼트들에 대한 데이터를 테이블 형식으로 화면에 표현하기
// ROW tag data => elem
function makeTable(elem){
	// jQ 객체 table => <table> tag 생성
	var $table = $("<table border=1>");
	
	//컬럼 정의하기
	// 표의 맨위 목차? 만들기 / 1번 반복??
	for(var i =0; i<1;i++){
		// tr tag 생성
		var $tr=$("<tr>");
		// ROW의 자식 Tag의 개수 만큼
		for(var j=0; j<elem.eq(0).children().length;j++){
			// td tag의 자식으로(append) ROW의 자식들의 tagName(이름들)을 넣기
			var $td=$("<td>").append(elem.eq(0).children().eq(j).prop("tagName"));
			// tr tag의 자식으로 위에 만든 td tag를 넣기
			$tr.append($td);
		}
		// table의 자식으로 tr태그 넣기
		$table.append($tr);
	}
	
	//데이터 넣기
	// ROW tag의 개수 만큼 반복
	for(var i =0; i<elem.length;i++){
		var $tr=$("<tr>");
		// [i]번째 ROW의 자식 Tag의 개수 만큼
		for(var j=0; j<elem.eq(i).children().length;j++){
			// td tag의 자식으로(append) [i]번째 ROW의 [j]번째 자식 tag의 text내용을 넣기
			var $td=$("<td>").append(elem.eq(i).children().eq(j).text());
			$tr.append($td);
		}
		$table.append($tr);
	}
	
	//만들어진 테이블 반환
	return $table;
}



