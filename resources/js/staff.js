//多个staff改变分组的按钮
$(".changeStaffGroup-li").click(function() {
    var groupId = $(this).attr("data-groupId");
    var choosedStaff = $(".fan-choose-input:checked");
    var userId = "";
    for (var i = 0; i < choosedStaff.length; i++) {
        userId += choosedStaff.eq(i).parents("li").find("div.worker-name").attr("data-staffId") + ";";
    }

    $.post("staff/changegroup", {groupId: groupId, userIdList: userId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //alert("添加成功");
        } else {
            //alert("添加失败");
        }
        window.location.reload(true);
    });

});

//staff改变分组的按钮
$(".changeGroup-select").change(function() {
    var groupId = $(this).children('option:selected').attr("data-groupId");
    var userId = $(this).parents("li").find("div.worker-name").attr("data-staffId") + ";";

    $.post("staff/changegroup", {groupId: groupId, userIdList: userId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //alert("添加成功");
        } else {
           // alert("添加失败");
        }
        window.location.reload(true);
    });
});

//添加group按钮
$("#addGroup").click(function() {
    event.preventDefault();
    $("#addGroup_div").slideToggle();
});

//显示所有的fans,添加进model里面
$("#showAllFans").click(function() {
    $.ajax({
        contentType: "application/json",
        type: "get",
        url: "fans/listall",
        success: function(data) {
            var fansObj = JSON.parse(data['rs']);
            $("#showAllFansTbody").empty();
            for (var i = 0; i < fansObj.length; i++) {
                $("#showAllFansTbody").append("<tr><td><div class='media' s=''><a class='pull-left'><img style='width:80px;height:80px;' src='" + fansObj[i].headImgUrl + "' class='media-object' data-userid='" + fansObj[i].openId + "' data-toggle='popover' title='' data-content='' data-original-title=''> </a><div class='media-body' contenteditable='true'><h4 class='media-heading'>" + fansObj[i].nickName + "</h4>" + fansObj[i].province + "</div></div></td><td>" + fansObj[i].subscribeTime + "</td><td><div class='item-opr btn-toolbar'><div class='btn-group'><button class='btn btn-default markFans' type='button'><span class='glyphicon glyphicon-star'></span></button></div></div></td></tr>");
            }

        }
    });
    $('#myModal').modal('toggle');
});

//modal里面的select监听
$("#modalGroupSelect").change(function() {
    $("#setFansDetail").find("form").find("input[name='groupId']").remove();
    $("#setFansDetail").find("form").append("<input type='text' name='groupId' value='" + $("#modalGroupSelect option:selected").attr("data-groupid") + "' style='visibility:hidden'/>");
});

//点击下一步,进入详细信息设置的modal
$("#next").click(function() {
    $("#fansDetail").empty();
    $("img[data-mark='mark']").parents("div.media").clone().appendTo($("#fansDetail"));
    $("#setFansDetail").find("form").find("input[name='wechatId']").remove();
    $("#setFansDetail").find("form").find("input[name='groupId']").remove();
    $("#setFansDetail").find("form").append("<input type='text' name='wechatId' value='" + $("img[data-mark='mark']").attr("data-userid") + "' style='visibility:hidden'/>");
    $("#setFansDetail").find("form").append("<input type='text' name='groupId' value='" + $("#modalGroupSelect option:selected").attr("data-groupid") + "' style='visibility:hidden'/>");
    $('#myModal').modal('toggle');
    $("#setFansDetail").modal("toggle");
});

//点击前一步,进入选择用户页面
$("#forward").click(function() {
    $("#fansDetail").empty();
    $("#setFansDetail").modal("toggle");
    $('#myModal').modal('toggle');
});

//绑定markFans的按钮，为选中任务的图片添加属性mark
$(".markFans").live('click', function() {
    $("img[data-mark=mark]").attr("data-mark", "");
    $(this).parents("tr").find("img").attr("data-mark", "mark");
    $(this).addClass("btn-success");
    $(this).parents("tr").siblings().find("button").removeClass("btn-success");
});

//点击确认添加用户,发送一堆数据过去
$("#confirmAddFans").click(function() {
    var role=$("#roleGroupSelect option:selected").val();
    var groupId = $("input[name=groupId]").val();
    var email = $("input[name=email]").val();
    var password1 = $("input[name=password1]").val();
    var password2 = $("input[name=password2]").val();
    var tel = $("input[name=tel]").val();
    var note = $("input[name=note]").val();
    var wechatId = $("input[name=wechatId]").val();
    var name = $("input[name=name]").val();
    var workNumber = $("input[name=workNumber]").val();
    $.post("staff/add", {groupId: groupId, email: email, password1: password1, password2: password2, tel: tel, note: note, wechatId: wechatId, name: name, workNumber: workNumber, role:role}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            alert("添加成功");
            $("#setFansDetail").modal("toggle");
        } else {
            alert("添加失败");
        }
    });

});


//添加新分组,检测返回值,根据返回值选择是否添加进去
$("#addGroup_btn").click(function() {
    var tp = $("#addGroup_text").val();
    $.post("staff/addgroup", {groupName: tp}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
//                                       var txt="<li><a href=''>"+tp+"</a></li>";
//                                       $("#addGroup_div").before(txt);
//                                       $("#addGroup_div").hide();
            window.location.reload(true);

        } else {
            alert("添加失败");
        }
    });
});

$("#addGroup_text").keydown(function(e) {
    var tp = $("#addGroup_text").val();
    if (tp != "") {
        if (e.keyCode == 13) {
            $("#addGroup_btn").click();
        }
    }
});



//刷新下staff自己的组
var length = $("div.worker-name").size();
for (var i = 0; i < length; i++) {

    var num = i;
    (function(arg) {
        var groupId = $("div.worker-name").eq(arg).attr("data-groupId");
        $("div.worker-name").eq(arg).parents(".row").eq(0).find("select>option[data-groupId=" + groupId + "]").attr("selected", "true");
    }(num));
}

//staff-group-ul的li的hover显示group-operation
$(".staff-group-ul li.normal-group-list-li").hover(function(){
    var groupId=$(this).attr("data-groupid");
    if(groupId>100){
    $(this).find("div.group-operation").toggle();}
});

//点击group-operation传一个groupId
$(".deleteGroup").click(function(e){
    e.stopPropagation();
    var groupId=$(this).parents("li").attr("data-groupid");
     $.post("staff/deletegroup", {groupId: groupId}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //window.location.reload(true);
        } else {
            alert("删除失败");
        }
    });
});

//每个用户拂过显示编辑和删除按钮
$("li.staff-edit").hover(function(){
    $(this).find("div.staff-operation").toggle();
});

//删除staff
$(".deleteStaff").click(function(){
    var staffId=$(".worker-name").attr("data-staffId");
     $.post("staff/deleteStaff", {staffId: staffId}, function(data) {
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
$("#setStaffNote-btn").click(function(){
    var note = $(this).parents("#setNoteModal").find("textarea").val();
    var staffId=$(this).parents("#setNoteModal").find("input").val();
    $.post("staff/setNote", {staffId:staffId,note: note}, function(data) {
        var res = data.rs.toString();
        var ifOk = "ok";
        if (res == ifOk) {
            //window.location.reload(true);
        } else {
            alert("删除失败");
        }
    });
});

$(".changeStaffNote").click(function(){
    $("#setNoteModal").find("form").append("<input type='text' name='staffId' value='" + $(this).parents("li").find(".worker-name").attr("data-staffId") + "' style='visibility:hidden'/>");
});