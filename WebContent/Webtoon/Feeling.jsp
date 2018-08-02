<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title></title>
</head>
<body>
   <div style="text-align:center">
      <br>
      <img src="../Images/feeling.png" width="45%" height="45%">
      <br><br>   
      <form action="Save.jsp" method="post">
      
         <!-- 감정 -->
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox1" value="1">
             <label class="form-check-label" for="inlineCheckbox1">성장</label>
         </div>
         <div class="form-check form-check-inline">
           <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox2" value="2">
           <label class="form-check-label" for="inlineCheckbox2">감동</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox3" value="3">
             <label class="form-check-label" for="inlineCheckbox3">공포</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox4" value="4">
             <label class="form-check-label" for="inlineCheckbox4">스릴러</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox5" value="5">
             <label class="form-check-label" for="inlineCheckbox5">로맨스</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox6" value="6">
             <label class="form-check-label" for="inlineCheckbox6">풋풋함</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox7" value="7">
             <label class="form-check-label" for="inlineCheckbox7">병맛</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox8" value="8">
             <label class="form-check-label" for="inlineCheckbox8">재미</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox9" value="9">
             <label class="form-check-label" for="inlineCheckbox9">역사</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox10" value="10">
             <label class="form-check-label" for="inlineCheckbox10">학원</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox11" value="11">
             <label class="form-check-label" for="inlineCheckbox11">미스테리</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox12" value="12">
             <label class="form-check-label" for="inlineCheckbox12">음식</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox13" value="13">
             <label class="form-check-label" for="inlineCheckbox13">일상</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox14" value="14">
             <label class="form-check-label" for="inlineCheckbox14">SF</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox15" value="15">
             <label class="form-check-label" for="inlineCheckbox15">드라마</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox16" value="16">
             <label class="form-check-label" for="inlineCheckbox16">무빙툰</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox17" value="17">
             <label class="form-check-label" for="inlineCheckbox17">스포츠</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox18" value="18">
             <label class="form-check-label" for="inlineCheckbox18">스릴러</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox19" value="19">
             <label class="form-check-label" for="inlineCheckbox19">복수</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox20" value="20">
             <label class="form-check-label" for="inlineCheckbox20">대학생</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox21" value="21">
             <label class="form-check-label" for="inlineCheckbox21">청춘</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox22" value="22">
             <label class="form-check-label" for="inlineCheckbox22">순정</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox23" value="23">
             <label class="form-check-label" for="inlineCheckbox23">액션</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox24" value="24">
             <label class="form-check-label" for="inlineCheckbox24">우울</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox25" value="25">
             <label class="form-check-label" for="inlineCheckbox25">반전</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox26" value="26">
             <label class="form-check-label" for="inlineCheckbox26">추리</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox27" value="27">
             <label class="form-check-label" for="inlineCheckbox27">몽환</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox28" value="28">
             <label class="form-check-label" for="inlineCheckbox28">오글</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox29" value="29">
             <label class="form-check-label" for="inlineCheckbox29">동물</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox30" value="30">
             <label class="form-check-label" for="inlineCheckbox30">사차원</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox31" value="31">
             <label class="form-check-label" for="inlineCheckbox31">블랙 코미디</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox32" value="32">
             <label class="form-check-label" for="inlineCheckbox32">풍자</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling"type="checkbox" id="inlineCheckbox33" value="33">
             <label class="form-check-label" for="inlineCheckbox33">전쟁</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox34" value="34">
             <label class="form-check-label" for="inlineCheckbox34">괴기</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox35" value="35">
             <label class="form-check-label" for="inlineCheckbox35">개그</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox36" value="36">
             <label class="form-check-label" for="inlineCheckbox36">사이다</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox37" value="37">
             <label class="form-check-label" for="inlineCheckbox37">고구마</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox38" value="38">
             <label class="form-check-label" for="inlineCheckbox38">범죄</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox39" value="39">
             <label class="form-check-label" for="inlineCheckbox39">불쾌</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox40" value="40">
             <label class="form-check-label" for="inlineCheckbox40">실망</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox41" value="41">
             <label class="form-check-label" for="inlineCheckbox41">지루</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox42" value="42">
             <label class="form-check-label" for="inlineCheckbox42">희망</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox43" value="43">
             <label class="form-check-label" for="inlineCheckbox43">호감</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox44" value="44">
             <label class="form-check-label" for="inlineCheckbox44">초조</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox45" value="45">
             <label class="form-check-label" for="inlineCheckbox45">짜증</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox46" value="46">
             <label class="form-check-label" for="inlineCheckbox46">분노</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox47" value="47">
             <label class="form-check-label" for="inlineCheckbox47">절망</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox48" value="48">
             <label class="form-check-label" for="inlineCheckbox48">복수심</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox49" value="49">
             <label class="form-check-label" for="inlineCheckbox49">친숙함</label>
         </div>
         <div class="form-check form-check-inline">
            <input class="form-check-input" name="feeling" type="checkbox" id="inlineCheckbox50" value="50">
             <label class="form-check-label" for="inlineCheckbox50">허탈</label>
         </div>
         
         
         <hr>
         
         <!-- 별점 -->
         <div class="star">
             <span class="star-rating">
               <input type="radio" name="rating" value="1"><i></i>
               <input type="radio" name="rating" value="2"><i></i>
               <input type="radio" name="rating" value="3"><i></i>
               <input type="radio" name="rating" value="4"><i></i>
               <input type="radio" name="rating" value="5"><i></i>
             </span>
           </div>
         <br>
         
         <!-- 제출 -->
         <div>
            <button type="submit" class="btn btn-secondary">확인</button>
         </div>
         <br>
      
      
      </form>         
   </div>

</body>
</html>