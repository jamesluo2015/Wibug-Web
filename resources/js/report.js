//通用的js
$(".li-have-a").click(function(){
    window.location.href = ''+$(this).find("a").attr("href")+'';
});


//监听input按键输入
$(".newTag-input ").keydown(function(){
  
});

//编辑tags
$(".editTags_btn").click(function(){
    $(this).parents("td").find(".editTags_div").slideToggle();
});


//点击确认编辑,使得notes不可修改
$(".changeNotesRealBtn").live("click",function(){
    $(this).parents(".note").find("textarea").attr("readonly","readonly");
    $(this).parents(".note").find("textarea").removeClass("note-value-active");
    var reportId=$(this).parents(".report-list-li").find(".show_ReportDetail").attr("data-reportid");
    var note=$(this).parents(".note").find("textarea").val();
    
     $.post("report/updatenotes",{reportId:reportId,note:note},function(data){
                                  var res=data.rs.toString();
                                  var ifOk="ok";
                                   if(res==ifOk){
                                       alert(ok);
                                       //$("#setFansDetail").modal("toggle");
                                   }else{
                                    alert("添加失败");
                                   }
          });
    $(this).parents(".note").find(".pull-right").empty();
});

//点击取消，去掉两个button  reomve-change-btn
$(".reomve-change-btn").live("click",function(){
    $(this).parents(".note").find("textarea").attr("readonly","readonly");
    $(this).parents(".note").find("textarea").removeClass("note-value-active");
    $(this).parents(".note").find(".pull-right").empty();
    window.location.reload ( true );  
});


//点击编辑,使得notes可修改
$(".report-list-note-operation").click(function(){
   
   $(this).parents(".note").find("textarea").removeAttr("readonly");
   $(this).parents(".note").find("textarea").addClass("note-value-active"); 
   $(this).parents(".note").find(".pull-right").empty();
   $(this).parents(".note").find(".pull-right").append("<a href='javascript:void(0);'><span class='glyphicon glyphicon-remove reomve-change-btn'></span></a><a href='javascript:void(0);'><span class='glyphicon glyphicon-ok changeNotesRealBtn'></span></a>");
});


//点击确认分派时发送数据响应
$("#setStaffRealBtn").click(function(){
         var reportId=$("#setStaff-form").find("input[name=reportId]").val();
         var workerId=$("#setStaff-form").find("option:selected").attr("data-staffid");
         var note=$("#setStaff-form").find("textarea").val();
         $.post("report/send",{reportId:reportId,workerId:workerId,note:note},function(data){
                                  var res=data.rs.toString();
                                  var ifOk="ok";
                                   if(res===ifOk){
                                       alert(ok);
                                       
                                }else{
                                    alert("添加失败");
                                }
          });
    $('#setStaffModal').modal('toggle')
});



//点击分派时modal添加一个属性id
$(".setStaffBtn").click(function(){
           $("#setStaffForm").find("form").find("input[name='reportId']").remove();
           $("#setStaffForm").find("form").append("<input type='text' name='reportId' value='"+$(this).siblings("button").attr("data-reportid")+"' style='visibility:hidden'/>");
   });

//report-list的备注
 $(".report_note").click(function(){
     $(this).siblings().collapse("toggle");  
 });

$("button.show_ReportDetail").live("click",function(){
location.href='report/detail?reportId='+$(this).attr("data-reportId")+'';
});


//得到用户数据
var length=$("div.workerInfo img").size();
for(var i=0;i<length;i++){ 
       //var wechatId=$("div.workerInfo img").eq(i).attr("data-userid");
       var num=i;
       (function (arg){     
      $.post("staff/detail",{workerId:$("div.workerInfo img").eq(arg).attr("data-userid")},function(data){
                                   var fansObj=JSON.parse(data['rs']);
                                    $("div.workerInfo img").eq(arg).attr("src",fansObj.imageUrl);
                                    $("div.worker-name").eq(arg).html(fansObj.name);
          });
      
      }(num));
}