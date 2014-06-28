
//通过id找到history的框子，实现收缩
 $("#report_history").click(function(){
     $('#report_history_detail').collapse("toggle");  
 });

 $("#report_message").click(function(){
     $('#report_message_detail').collapse("toggle");  
 });

  $("#editTags_btn").click(function(){
         $("#editTags_div").slideToggle();
  });
  $("#report_message").click();



//判断客户端情况
function browserRedirect() {
				var sUserAgent = navigator.userAgent.toLowerCase();
				var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
				var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
				var bIsMidp = sUserAgent.match(/midp/i) == "midp";
				var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
				var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
				var bIsAndroid = sUserAgent.match(/android/i) == "android";
				var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
				var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";

				if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
					//window.location.href = 'http://url/mobile.html';
                                        return false;
				} else {
					//window.location = 'http://url/pc.html';
                                        return true;
				}

			}

			


//点击已修复
$("#fixed-btn").click(function(){
    var style= browserRedirect();
    if(style){
        style=1;
    }else{
        style=0;
    }
    
    $.post(
                'report/resovle',
                {
                    'reportId': $(".report-detail-workerInfo").attr("data-reportid"),
                    'visitType': style,
                },
                function(data){
                    var result = data['rs'];
                    if(result == 'ok'){
                        alert("发送成功");
                    }
                    else{
                        alert('发送失败');
                    }
                }
            );
    
});

//点击冲分配
$("#reAllocate-btn").click(function(){
    //var style= browserRedirect();
    //if(style){ style=1;}else{style=0; }
    var note=$("#reAllocateModal").find("textarea").val();
    $.post(
                'report/return',
                {
                    'reportId': $(".report-detail-workerInfo").attr("data-reportid"),
                    'note':note
                },
                function(data){
                    var result = data['rs'];
                    if(result == 'ok'){
                        alert("发送成功");
                    }
                    else{
                        alert('发送失败');
                    }
                    $('#reAllocateModal').modal('toggle');
                }
            );
    
});
