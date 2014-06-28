/*
Usage:
    <div class="pagination wb-pagination" 
        data-page-now="<c:out value="${page.pageNo}"/>" 
        data-page-total="<c:out value="${page.totalPage}"/>">
    </div>

Output:
    <div class="page-prev">
        <a href="javascript:void(0);" class="btn btn-default">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
    </div>
    <div class="page-num">
        <span class="current-page"></span>
        <span class="interval">/</span>
        <span class="total-page"></span>
    </div>
    <div class="page-next">
        <a href="javascript:void(0);" class="btn btn-default">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
    <div class="page-jump">
        <input type="text" class="page-input">
        <a href="javascript:void(0);" class="btn btn-default">跳转</a>
    </div>
*/

(function($){
    $.fn.wbPagination = function(options){
        var opts = options;

        var insertElements = function(parent){
            var pagePrevEl = $('<div class="page-prev"></div>')
            pagePrevEl.append(
                '<a href="javascript:void(0);" class="btn btn-default">' + 
                    '<span class="glyphicon glyphicon-chevron-left"></span>' + 
                '</a>');
            parent.append(pagePrevEl);

            var pageNumEl = $('<div class="page-num"></div>');
            pageNumEl.append('<span class="current-page"></span>');
            pageNumEl.append('<span class="interval">/</span>');
            pageNumEl.append('<span class="total-page"></span>');
            parent.append(pageNumEl);

            var pageNextEl = $('<div class="page-next"></div>');
            pageNextEl.append(
                '<a href="javascript:void(0);" class="btn btn-default">' + 
                    '<span class="glyphicon glyphicon-chevron-right"></span>' + 
                '</a>');
            parent.append(pageNextEl);

            var pageJumpEl = $('<div class="page-jump"></div>');
            pageJumpEl.append('<input type="text" class="page-input">');
            pageJumpEl.append('<a href="javascript:void(0);" class="btn btn-default">跳转</a>');
            parent.append(pageJumpEl);
        };

        var initPageNumber = function(parent){
            var pageNow = parent.attr('data-page-now');
            var pageTotal = parent.attr('data-page-total');
            parent.find('.current-page').text(pageNow);
            parent.find('.total-page').text(pageTotal);

            // page number check
            if(pageNow == 1){
                parent.find('.page-prev').remove();
            }
            if(pageNow == pageTotal){
                parent.find('.page-next').remove();
            }
        };

        var getPrevPageNum = function(parent){
            var pageNow = Number(parent.attr('data-page-now'));
            return (pageNow > 1) ? (pageNow - 1) : 1;
        };

        var getNextPageNum = function(parent){
            var pageNow = Number(parent.attr('data-page-now'));
            var pageTotal = Number(parent.attr('data-page-total'));
            return (pageNow < pageTotal) ? (pageNow + 1) : pageTotal;
        }

        var getPageUrl = function(pageNum){
            var url = window.location.href;
            return url.replace(/pageNum=\d/, 'pageNum=' + pageNum);
        }

        var generateLink = function(parent){
            if(parent.find('.page-prev').length > 0){
                parent.find('.page-prev a').attr('href', getPageUrl(getPrevPageNum(parent)));
            }
            if(parent.find('.page-next').length > 0){
                parent.find('.page-next a').attr('href', getPageUrl(getNextPageNum(parent)));
            }
        };

        var bindJumpEvent = function(parent){
            // 返回validate后的input
            var validateInput = function(){
                var inputEl = parent.find('.page-input');
                var input = inputEl.val();

                // non-digit check
                input = Number(input.replace(/[^\d]/g, ''));
                
                // page check
                var pageTotal = Number(parent.attr('data-page-total'));
                input = Math.min(input, pageTotal);
                input = Math.max(input, 1);

                inputEl.val(input);
                return input;
            };

            parent.find('.page-input').on('keyup', function(){
                validateInput();
            }).on('paste', function(){
                return false;
            });

            parent.find('.page-jump a').click(function(){
                window.location.href = getPageUrl(validateInput());
            });
        };

        return this.each(function(){
            insertElements($(this));
            initPageNumber($(this));
            generateLink($(this));
            bindJumpEvent($(this));
        });
    }
})(jQuery);
