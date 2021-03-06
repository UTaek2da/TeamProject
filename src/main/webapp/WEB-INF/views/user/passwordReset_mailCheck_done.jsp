<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
.cell_padding {
padding : 10px;
}

.table_center {
display : table;
margin-left : auto;
margin-right : auto;
}
</style>

<!-- sub contents start -->
<div class="container-fluid subcontent">
	<div class="container" style="width: 50%">
		<form class="needs-validation" method="post" action="passwordModify_pro.do" novalidate >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="styled__Box-sc-1etb7tu-1 cubPeM">
				<h1>비밀번호 재설정</h1>
				<h2>비밀번호를 변경해 주세요</h2>
				<div class="input-with-label__InputWrap-sc-1p3gkts-0 eVAGdp">
					<label class="bDaqny">
						<p class="label-text">이메일</p> <input type="text" name="username"
						class="form-control kHDHPO" id="username"
						placeholder="이메일 주소 입력"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value="${username}"required>
						<div class="valid-feedback">확인되었습니다</div>
						<div class="invalid-feedback">이메일을 입력해주십시오.</div>
					</label>
				</div>
				
				<div class="input-with-label__InputWrap-sc-1p3gkts-0 kYbOIJ">
					<label class="input-with-label__Label-sc-1p3gkts-1 bDaqny">
						<p class="label-text">새로운 비밀번호</p> <input type="password"
						name="password" placeholder="비밀번호 입력" class="form-control kHDHPO"
						id="password" minlength="8" pattern="[A-Za-z0-9]{8,}" required>
						<div class="valid-feedback">확인되었습니다</div>
						<div class="invalid-feedback">8자 이상의 영어 대소문자, 숫자로만 비밀번호를 입력해주십시오.</div>
					</label>
				</div>
				<input autocomplete="off" type="password" name="passwordConfirm"
					placeholder="비밀번호 확인" class="form-control input__Input-am2s7t-0 kHDHPO" value=""
          id="passwordConfirm" pattern="track51" required>
	          <div class="valid-feedback">입력한 비밀번호와 일치합니다.</div>
	          <div class="invalid-feedback">입력한 비밀번호와 일치하지 않습니다.</div>
				<button color="blue" class="button__Button-sc-153m1au-0 fiEZwu"
					style="margin-top: 32px;">
					<span> 확인 </span>
				</button>
			</div>
		</form>
	</div>
</div>

<script>
	$( document ).ready( function() {
	  $( '.jung-check-all' ).click( function() {
	    $( '.jung-fav' ).prop( 'checked', this.checked );
	  });
	});
	
	$( document ).ready( function() {
		$( '.dong-check-all' ).click( function() {
		  $( '.dong-fav' ).prop( 'checked', this.checked );
		});
	});
</script>

<script>
   (function() {
      'use strict'
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.querySelectorAll('.needs-validation')

      // Loop over them and prevent submission
      Array.prototype.slice.call(forms).forEach(function(form) {
         form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
               event.preventDefault()
               event.stopPropagation()
            }
            form.classList.add('was-validated')
         }, false)
      })
   })
  
    $(function (){
        $('#password').on('change', function(){
            $('#passwordConfirm').attr('pattern', $(this).val());
        });

        function escapeRegExp(string) {
             return string.replace(/[.*+?$^{}()|[\]\\]/g, '\\$&'); // $&은 일치한 문자열 전체를 의미
        }
    });
   
</script>


<!-- sub contents end -->

<%@ include file="../include/footer.jsp"%>

<!-- jquery를 기반으로 로드함 -->
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>

</html>