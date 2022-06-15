<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="/css/signup.css">
<script>
/*   function check_id_Async() {
      const form = document.getElementById("signup_form");

      const xhr = new XMLHttpRequest();

      xhr.onreadystatechange = function() {
         console.log(xhr.readyState);

         if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
               const result = xhr.responseText;

               if (result == "OK") {
                  alert(`\${form.id.value} 는 사용가능한 아이디 입니다`);
                  form.checkId.value = form.id.value;
               } else
                  alert(`\${form.id.value} 는 이미 사용중인 아이디 입니다`);
            }
         }
      }
      xhr.open("GET", `checkId?id=\${form.id.value}`, true);

      xhr.send();
   }*/

   document.title = "회원가입";
   
$(function(){   
   //중복검사 에이잭 
      
      $("#checkIdBtn").on("click", function(){
         $.ajax("checkId",{
            method:"GET",
            contentType:"application/json",
            dataType:"text",
            data: {id:$("#id").val()},
            success: result =>{
               console.log(result);
               if (result == "OK") {
            	  var regex_id = /^[a-z]+[a-z0-9]{4,19}$/g;
            	  
            	  if(!regex_id.test($("#id").val())){
            		  alert("아이디의 양식이 잘못되었습니다.");  
            		  return;
                  } 
                  alert($("#id").val() + " 는 사용 가능한 아이디 입니다");
                  $("#id_msg").text("사용가능한 아이디 입니다.");
                  $("#id_msg").css("color","green");
                  $("#checkId").val($("#id").val());
               } else{
                  alert($("#id").val() +  `는 이미 사용중인 아이디 입니다`);
	              $("#id_msg").text("이미 사용중인 아이디 입니다.");
	              $("#id_msg").css("color","red");
               }
            },
            error: function(){
               console.log("실패");
            }
         });
      });

   // 회원가입 서브밋 전 정규식및 양식 확인
      $("#signup").on("click", function() {
         const form = $("#signup_form");
         const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
         var regex_id = /^[a-z]+[a-z0-9]{4,19}$/g;
         var regex_tel = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
         const checkId = $("#checkId").val();
         var regex_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        
         
         if ($("#id").val() == "") {
            $("#id").focus();
            return;
         }

         if(!regex_id.test($("#id").val())){
            $("#id").focus();
            $("#id_msg").text("영문자로 시작하는 영문자 or 숫자 5자 이상");
            $("#id_msg").css("color","red");
            return;
         }
         
         if(checkId != $("#id").val()){
            $("#id").focus();
            $("#id_msg").text("중복검사를 해주세요");
            $("#id_msg").css("color","red");
            return;
         }
         if($("#passwd").val() == ""){
            $("#passwd").focus();
            $("#pw_msg").text("비밀번호를 입력 해 주세요");
            $("#pw_msg").css("color","red");
            return;
         }
         
         if(!regex_pw.test($("#passwd").val())){
            $("#passwd").focus();
            $("#pw_msg").text("특수문자, 문자, 숫자 포함 형태의 8~15자리 이내");
            $("#pw_msg").css("color","red");
            return;
         }
         if($("#passwd").val() != $("#passwd_confirm").val()){
            $("#passwd").focus();
            $("#pwconfirm_msg").text("비밀번호가 서로 일치하지 않습니다.");
            $("#pwconfirm_msg").css("color","red");
            return;
         }
         
         if($("#name").val() == ""){
            $("#name").focus();
            $("#name_msg").text("이름을 입력해주세요");
            $("#name_msg").css("color","red");
            return;
         }
         
         if($("#tel").val() == ""){
        	 $("#tel").focus();
             $("#tel_msg").text("전화번호를 입력해주세요");
             $("#tel_msg").css("color","red");
             return;
          }
         
         if(!regex_tel.test($("#tel").val())){
            $("#tel").focus();
            $("#tel_msg").text("- 을 뺀 숫자만 적어주세요");
            $("#tel_msg").css("color","red");
            return;
         }
         
         if(!regex_email.test($("#email").val())){
        	 $("#email").focus();
             $("#email_msg").text("이메일 양식이 이상합니다.");
             $("#email_msg").css("color","red");
             return;
         }
         
         if($("#email").val() == ""){
             $("#email").focus();
             $("#email_msg").text("이메일을 입력해주세요");
             $("#email_msg").css("color","red");
             return;
          }
         
         
         $("#signup_form").submit();
      });
            
      //입력할 때 양식을 잘 맞추고 있는지 알려주기 위한 기능
      $("#id").on("keyup",function(){
         const regex_id = /^[a-z]+[a-z0-9]{4,19}$/g;
         
         if(regex_id.test($("#id").val())){
            $("#id_msg").text("중복검사를 해주세요.");
            $("#id_msg").css("color","green");
         }
         else if(!regex_id.test($("#id").val())){
            $("#id").focus();
            $("#id_msg").text("영문자로 시작하는 영문자 or 숫자 5자 이상");
            $("#id_msg").css("color","red");
         }
      });
      $("#passwd").on("keyup",function(){
         const regex_pw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
         
         if(regex_pw.test($("#passwd").val())){
            $("#pw_msg").text("사용 가능한 비밀번호 입니다.");
            $("#pw_msg").css("color","green");
         }
         else if(!regex_pw.test($("#passwd").val())){
            $("#passwd").focus();
            $("#pw_msg").text("(특수문자, 문자, 숫자 포함 형태의 8~15자리 이내)");
            $("#pw_msg").css("color","red");
         }
      });
            
      $("#passwd_confirm").on("keyup",function(){
         if($("#passwd_confirm").val() == $("#passwd").val()){
            $("#pwconfirm_msg").text("비밀번호가 서로 일치합니다.");
            $("#pwconfirm_msg").css("color","green");
         }else if($("#passwd_confirm").val() != $("#passwd").val()){
            $("#pwconfirm_msg").text("비밀번호가 서로 일치하지 않습니다.");
            $("#pwconfirm_msg").css("color","red");
         }
      });         
})

</script>
</head>
<body>

   <div id="wrap">
   
   <div class="era">
   <div class="wrap_in">
   		
         <div class="logo">
            <a href="."><img src="/img/logo(blk).png"></a>
         </div>
      <div id="container">
         
         
         <form id="signup_form" method="post">
         
            <div class="join_container">
               <input type="hidden" id="checkId" name="checkId"> <br>
               <div class="form_group">
                  <div class="form_gg">
                     <label>아이디</label> <input type="text" id="id" name="id" class="box_">   
                     <button type="button" id="checkIdBtn" class="cbtn_type cbtn_primary">중복확인</button>
                  </div>
                  <div>
                     <label id="id_msg" class="msg_con"></label>
                  </div>
               </div>
               <div class="form_group">
                  <div class="form_gg">
                     <label>비밀번호</label> <input type="password" id="passwd"name="passwd" class="box_">
                  </div> 
                  <label id="pw_msg"  class="msg_con"></label>
               </div>
               <div class="form_group">
                  <div class="form_gg">
                     <label>비밀번호 확인</label>
                     <input type="password" id="passwd_confirm" name="passwd_confirm" class="box_">
                  </div> 
                  <div>
                     <label id="pwconfirm_msg" class="msg_con"></label>
                  </div>
               </div>
               <div class="form_group">
                  <div class="form_gg">
                     <label>이름</label><input type="text" id="name" name="name" class="box_">
                     <div>
                        <label id="name_msg"></label>
                     </div>
                  </div>
               </div>
               <div class="form_group">
                  <div class="form_gg">
                     <label>전화번호</label><input type="text" id="tel" name="tel" placeholder="- 뺀 숫자만 입력 해 주세요"  class="box_" maxlength="11">
                  </div>
                  <div>
                     <label id="tel_msg"></label>
                  </div>
               </div>
               
               <div class="form_group">
                  <div class="form_gg">
                     <label>이메일</label><input type="text" id="email" name="email" placeholder="qwer@naver.com"  class="box_">
                  </div>
                  <div>
                     <label id="email_msg"></label>
                  </div>
               </div>

               <div class="sign_btn">
                  <button type="button" id="signup" class="btn_type btn_primary">회원가입</button>
               </div>
            </div>
         </form>
         </div>
      </div>
      </div>
   </div>
</body>
</html>