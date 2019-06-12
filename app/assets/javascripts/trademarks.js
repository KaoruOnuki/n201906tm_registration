// edit.html.erb
// 維持期間から満了日を割り出す
$(document).ready(function(){
  var date = "";
  $("#trademark_registration_date").change(function(){
    date = new Date($(this).val());
  }).change();

  var year = "";
  $("#trademark_maintenance_period").change(function(){
    year = parseInt($(this).val());
  }).change();

  $(".expirationDateCalc .form_text").change(function(){
    if(date !== "" && (year === 5 || year === 10)){
      var formatted = `${date.getFullYear()+year}年${date.getMonth()+1}月${date.getDate()}日`;
      $("#expiration_date").text(formatted);
    } else {
      $("#expiration_date").text("登録日と維持期間を入力してください");
    };
  }).change();
});
