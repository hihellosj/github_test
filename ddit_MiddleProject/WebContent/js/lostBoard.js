/**
 * 
 */

$.listPageServer = function(cpage) {

	vtype = $('#stype option:selected').val();
	vword = $('#sword').val();

	$.ajax({
		url: `${mypath}/boardList.do`,
		type: 'post',
		data: {
			"page": cpage,
			"stype": vtype,
			"sword": vword
		},
		success: function(res) {

			code = `<div class="container mt-3">
			            <div id="accordion">`;

			$.each(res.datas, function(i, v) {
				content = v.content; 	//엔터가 포함되어 있다. \r\n
				content = content.replace(/\n/g, "<br>");

				code += `
					<div class="card">
				      <div class="card-header">
				        <a class="btn action title" name="list" idx=${v.num} data-bs-toggle="collapse" href="#collapse${v.num}">
				                 ${v.subject}
				        </a>
				      </div>
				      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
				        <div class="card-body">
				            <div class="p12">
				               <p class="p1">
				                             작성자:<span class="wr">${v.writer}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                          이메일:<span class="ma">${v.mail}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                          조회수:<span class="hi">${v.hit}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                          날짜 :<span class="wd">${v.wdate}</span>         
				               </p>
				               <p class ="p2">
				               
				               <input idx="${v.num}" type="button"  value="수정" name="modify"  class="action">
				               <input idx="${v.num}" type="button"  value="삭제" name="delete"  class="action">
				               </p>
				            </div>
				            <p class="p3">
				                            ${content} <br>
				            </p>
				            <p class="p4">
				            <textarea rows="" cols="60"></textarea>
				            <input idx="${v.num}" type="button"  value="등록" name="reply"  class="action">
				            </p>
				            
				        </div>
				      </div>
				    </div>
					`

			})//$.each 반복문
			code += `</div>
			          </div>`

			//게시판 리스트 출력
			$('#result').html(code);



			//페이지 출력
			pager = pageList(res.sp, res.ep, res.tp);
			$('#pagelist').html(pager);

		},//success

		error: function(xhr) {
			alert("상태 : " + xhr.status)
		},
		dataType: 'json'

	})

}