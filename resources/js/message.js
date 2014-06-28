// ======================================
// New Edition
// ======================================
$(function(){
    // ==================================================
    // 日期组件
    $('.datetime-group .form-datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 0,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.datetime-group .remove').click(function(){
        $(this).parent().find('input').val('');
    });

    // TODO: fromDate & toDate 检验
    // ......


    // ==================================================
    // fancybox初始化
    // FUCK
    /*$('.fancybox-buttons').fancybox({
        openEffect  : 'none',
        closeEffect : 'none',
        prevEffect : 'none',
        nextEffect : 'none',
        closeBtn  : false,
        helpers : {
            title : {
                type : 'inside'
            },
            buttons : {}
        }
    });*/


    // ==================================================
    // 分页初始化
    $('.wb-pagination').wbPagination();


    // ==================================================
    //得到用户数据
    var msgNum = $(".message-item").size();
    for(var i=0; i<msgNum; i++){ 
        var fromUserId = $(".message-list .user-head").eq(i).attr("data-userid");
        (function (arg){
            $.post(
                'fans/infos',
                {
                    'wechatId': fromUserId
                },
                function(data){
                    var fansObj = JSON.parse(data['rs']);
                    $('.message-list .user-head').eq(arg).attr('src', fansObj.headImgUrl);
                    $('.message-list .user-info').eq(arg).find('a').text(fansObj.nickName);
                }
            );
        }(i));
    }


    // ==================================================
    // 快速回复
    var clearReplyDiv = function(){
        $('#replyInput').val('');
        $('#wordsCount').html('还可以输入<em>140</em>&nbsp;字');
        $('#replyUserId').val('');
        $('#replyMessageId').val('');
    };
    var returnReplyDiv = function(){
        clearReplyDiv();
        $('#quickReplyWrap').append($('#quickReplyDiv'));
    };

    var MAX_WORDS = 140;
    // 返回剩余字数，负值表示已超过
    var wordsCountCheck = function(){
        var textLength = $('#replyInput').val().length;
        return (MAX_WORDS - textLength);
    }
    

    $('.reply-link').click(function(){
        var parentItem = $(this).closest('.message-item');
        // toggle判断
        if(parentItem.find('#quickReplyDiv').length == 0){
            clearReplyDiv();

            // 移动quickReplyDiv
            var destination = parentItem.find('.reply-wrap');
            destination.append($('#quickReplyDiv'));

            // 初始化
            $('#replyInput').focus();
            $('#replyUserId').val(parentItem.find('.user-head').attr('data-userid'));
            $('#replyMessageId').val(parentItem.attr('data-msgid'));
        }
        else{
            // 归还quickReplyDiv
            returnReplyDiv();
        }
    });

    $('#replyInput').keyup(function(){
        var left = wordsCountCheck();
        if(left >= 0){
            $('#wordsCount').html('还可以输入<em>' + left + '</em>&nbsp;字');
        }
        else{
            $('#wordsCount').html('已超过<em class="text-warn">' + (-left) + '</em>&nbsp;字');
        }
    });

    $('#replyOk').click(function(){
        if(wordsCountCheck() >= 0){
            $.post(
                'message/reply',
                {
                    'wechatId': $('#replyUserId').val(),
                    'content': $('#replyInput').val(),
                    'id': $('#replyMessageId').val()
                },
                function(data){
                    var result = data['rs'];
                    if(result == 'ok'){
                        returnReplyDiv();
                    }
                    else{
                        // TODO: 消息对话框插件
                        alert('发送失败');
                    }
                }
            );
        }
        else{
            // 超出字数
            // TODO: 消息对话框插件
            alert('超出字数');
        }
    });

    $('#replyCancel').click(function(){
        returnReplyDiv();
    });

});
