$("div.bs-example li a").hover(function(){
    if($(this).find("a").size()!=0){
    $(this).find("a").remove();
    }else{
    var removeA="<a class='tn btn-success glyphicon glyphicon-remove' id='box_relative'></a>"; 
    $(this).append(removeA);
   }
});


//删除Tag的点击响应
$("div.bs-example li a a").live("click",function(){
//删除发送ajax请求,将tagId发送过去
  $.get("tag/remove?tagID="+$(this).parent().parent().attr("data-tagId")+"",function(data,status){
     alert("Data: " + data + "\nStatus: " + status);
   });
});

//添加TAG的点击响应
$("#addTagForm button").click(function(){
       var tagContent=$('#addTagForm').find("input").val();
//			$.get("tag/create?content="+tagContent+"",function(data,status){
//                            if(data.rs=="failed"){
//                                $('#myModal').modal('show');
//				//根据data-id传到服务器得到数据或者通过jquery得到id,然后显示数据
//					       //	 $('#myModal p#msg_type').text($(this).attr("data-id"));
//					       //	 $('#myModal p#msg_time').text($(this).parents("tr").find("td:eq(3)").text());
//					       //	 $('#myModal p#msg_info').text($(this).parents("tr").find("td:eq(1)").text());
//					       	// $('#myModal p#msg_sender').text($(this).parents("tr").find("td:eq(2)").text());
//                                //alert ("添加失败");
//                            }else{
//                             window.location.href="tag/list";
//                         }
//			   });

                  $.ajax({
                                contentType : "application/json",
			        type : "get",
			        url : "tag/create?content="+tagContent+"",
			        success : function(data) {
                                    if(data.rs=="failed"){
                                     $('#myModal').modal('show');
                                     }else{
                                     window.location.href="tag/list";
                         }
                                }
		});
  
});
