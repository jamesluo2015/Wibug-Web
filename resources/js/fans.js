//多个fans改变分组的按钮
$(".changeFanGroup-li").click(function() {
    var groupId = $(this).attr("data-groupId");
    var choosedStaff = $(".fan-choose-input:checked");
    var userId = "";
    for (var i = 0; i < choosedStaff.length; i++) {
        userId += choosedStaff.eq(i).parents("li").find("div.worker-name").attr("data-fanId") + ";";
    }

    $.post("fans/changegroup", {groupId: groupId, userIdList: userId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //alert("添加成功");
        } else {
            //alert("添加失败");
        }
       // window.location.reload(true);
    });

});

//fan改变分组的按钮
$(".changeFanGroup-select").change(function() {
    var groupId = $(this).children('option:selected').attr("data-groupId");
    var userId = $(this).parents("li").find("div.worker-name").attr("data-fanId") + ";";

    $.post("fans/changegroup", {groupId: groupId, fansIdList: userId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //alert("添加成功");
        } else {
           // alert("添加失败");
        }
        //window.location.reload(true);
    });
});


//全选按钮的监听
$("#selectAll").click(function(){
    if($("#selectAll").attr("checked")=="checked"){
    $("input.input-style").attr("checked","checked");
    $(".fan-list-addTo").attr("data-toggle","dropdown");
   
  }else{
    $("input.input-style").removeAttr("checked");
     $(".fan-list-addTo").removeAttr("data-toggle");
    
  }
});

//一般的checked按钮的监听
$(".fan-choose-input").click(function(){
     if($(this).attr("checked")=="checked"){
     $(".fan-list-addTo").attr("data-toggle","dropdown");
     }
          var allChoose=true;
          var ifChoose=false;
          var size=$(".fan-choose-input");
          for(var i=0;i<size.length;i++){
              if(size.eq(i).attr("checked")=="checked"){
               ifChoose=true;
              }else{
                 allChoose=false;
                 $("#selectAll"). removeAttr("checked");
              }
          }
          if(allChoose){ 
              $("#selectAll").attr("checked","checked");
          }
          if(!ifChoose){
          $(".fan-list-addTo").removeAttr("data-toggle");
          }
});

//添加group按钮
$("#addFanGroup").click(function() {
    event.preventDefault();
    $("#addFanGroup_div").slideToggle();
});

//添加新分组,检测返回值,根据返回值选择是否添加进去
$("#addFanGroup_btn").click(function() {
    var tp = $("#addFanGroup_text").val();
    $.post("fans/addgroup", {groupName: tp}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            window.location.reload(true);
        } else {
            alert("添加失败");
        }
    });
});

//fan-group-ul的li的hover显示group-operation
$(".fan-group-ul li.normal-group-list-li").hover(function(){
    var groupId=$(this).attr("data-groupid");
    if(groupId>100){
    $(this).find("div.group-operation").toggle();}
});

//点击group-operation传一个groupId
$(".deleteFanGroup").click(function(e){
    e.stopPropagation();
    var groupId=$(this).parents("li").attr("data-groupid");
     $.post("fans/deletegroup", {groupId: groupId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //window.location.reload(true);
        } else {
            alert("删除失败");
        }
    });
});

//添加备注
$("#setFansNote-btn").click(function(){
    var note = $(this).parents("#setNoteModal").find("textarea").val();
    var fanId=$(this).parents("#setNoteModal").find("input").val()
    $.post("fans/setNote", {fanId:fanId,note: note}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //window.location.reload(true);
        } else {
            alert("删除失败");
        }
    });
});

$(".changefansNoteBtn").click(function(){
    $("#setNoteModal").find("form").append("<input type='text' name='fansId' value='" + $(this).parents("li").find(".worker-name").attr("data-fanId") + "' style='visibility:hidden'/>");
});