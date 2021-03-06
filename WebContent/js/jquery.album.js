/*
	name: jquery相册插件（防qq空间相册系统）
	添加自己播放功能
	添加viewMode 0没有缩略图 1有缩略图  2缩略图。全屏幕。可以对图片进行左右转
	args{
		preBtn: Dom  大图的左右按钮
		nextBtn :Dom  大图的左右按钮
		
		miniPreBtn: Dom  小图的左右按钮
		miniNextBtn :Dom  小图的左右按钮
		
		imgListWrap: DOM 包裹小图片列表的元素
		slideObj: DOM 动画的ul
		
		dataNode: DOM 一般是数据内容，内容放在textarea里实现延迟加载。
		添加键盘事件的支持
		
		//设置动画参数
		pageNum: Number 设置一屏放几个小的缩略图
		}
*/
(function ($) {
    function Album(args, m) {
        $.extend(this, defaultArgs, args);
        var _this = this;
        if (m) {
            this.loadNextPic(m);
        }
        else {
            this.loadNextPic(0);
        }
        this.realImg.show();
        this.imgLoading.hide();
        this.realImg.load(function () {
            _this.imgLoading.hide();
            _this.realImg.show();
        });
        if (this.albumDataList.val() == '') return;
        this.photoList.html(this.albumDataList.val());
        if (m) {
            this.photoList.find("li:eq(" + m.toString() + ")").addClass('on');
        }
        else {
            this.photoList.find("li").first().addClass('on');
        }
        this.imgListLen = this.photoList.find('li').length;
        this.liW = this.photoList.find('li').outerWidth(true);
        if (this.imgListLen < this.picNum) {
            this.picNum = this.imgListLen;
        }
        this.thumWrap.width(this.liW * this.picNum);
        if (m) {
            this.index = m;
        }
        else {
            this.index = 0;
        }
        //this.index=0;
        this.page = 1;
        this.nPageCount = Math.ceil(this.imgListLen * this.liW / (this.liW * this.picNum));

        //大图左右点击
        this.nextBtn.click(function () {
            _this.nextItem();
        });

        this.preBtn.click(function () {
            _this.preItem();
        });

        //show hide
        this.preBtn.hover(function () {
            $(this).find('i').css('visibility', 'visible');
        }, function () {
            $(this).find('i').css('visibility', 'visible');
        });
        this.nextBtn.hover(function () {
            $(this).find('i').css('visibility', 'visible');
        }, function () {
            $(this).find('i').css('visibility', 'visible');
        });

        //小图左右点击
        this.thumNextBtn.click(function () {
            _this.doNextMove();
        });
        this.thumPreBtn.click(function () {
            _this.doPreMove();
        });

        //点击每个小图
        this.photoList.find('li').each(function (i, o) {
            $(this).click(function () {
                _this.loadNextPic(i);//add
                _this.showPic(i);
                // _this.loadNextPic(i+1);//add
                _this.index = i;
                _this.photoList.find('li').eq(i).addClass('on').siblings().removeClass('on');
            });
        });
        this.init(m);
        //当窗口高度缩小时动态改变thumBox为bottom为auto.就可以解决当窗口高度缩小时thumBox也一直是在窗口最底部的。
        var fullHeight = $(window).height();
        //动态设置valin的高度即可= 屏幕的高-topbar-botommbar
        var crumH = $('.crumbs').outerHeight(true);
        var bottH = $('#thumBox').outerHeight(true);
        //var kk=$(window).height();
        //console.log(fullHeight,kk,crumH,bottH)
        $('.pic-alt').css({"top":(fullHeight - crumH - bottH-10-85)} );
        $('.album-con').height(fullHeight - crumH );
        $('.valin').height(fullHeight - crumH - bottH-10);
        this.nextBtn.height(fullHeight - crumH - bottH);
        this.preBtn.height(fullHeight - crumH - bottH);
        this.nextBtn.find('i').css('top', ((fullHeight - crumH - bottH) - 84) / 2);
        this.preBtn.find('i').css('top', ((fullHeight - crumH - bottH) - 84) / 2);
        //console.log('d'+fullHeight,fullHeight-crumH - bottH)//bug .当第一次打开是最小窗口this.preBtn.height，左右按钮不剧中。原因是当图片加载后。它的高度又改变了。所以重置高度
        //,'top':fullHeight- bottH
        //console.log(fullHeight)
        if (fullHeight < 620) {
            this.thumBox.css({ 'bottom': 'auto' });
        } else {
            this.thumBox.css({ 'bottom': '0' });
        }
        $(window).resize(function () {
            var fullHeight2 = $(window).height();
            //动态设置valin的高度即可= 屏幕的高-topbar-botommbar (padding 10px)
            var crumH = $('.crumbs').outerHeight(true);
            var bottH = $('#thumBox').outerHeight(true);
            //console.log('II')
            $('.pic-alt').css({"top":(fullHeight2 - crumH - bottH-10-85)} );
            $('.valin').height(fullHeight2 - crumH - bottH-10);
            _this.nextBtn.height(fullHeight2 - crumH - bottH);
            _this.preBtn.height(fullHeight2 - crumH - bottH);
            _this.nextBtn.find('i').css('top', ((fullHeight2 - crumH - bottH) - 84) / 2);
            _this.preBtn.find('i').css('top', ((fullHeight2 - crumH - bottH) - 84) / 2);
            if (fullHeight < 500 || fullHeight2 < fullHeight) {
                _this.thumBox.css({ 'bottom': 'auto' });
            } else if (fullHeight2 > fullHeight) {
                _this.thumBox.css({ 'bottom': '0' });
            } else if (fullHeight2 == fullHeight) {
                _this.thumBox.css({ 'bottom': '0' });
            }
        });
    }
    Album.prototype = {
        init: function (n) {
            var path = window.location.pathname.replace("/", "").split("-");
            //var _num = _current_num;
            // alert(path[2]);
            if (n) {
                this.loadNextPic(n);
            }
            else {
                this.loadNextPic(0);
            }
            //this.showPic(0);
        },
        loadNextPic: function (n) {
            if (0 <= n <= this.imgListLen - 1) {//解决左右按钮失效
                this.nextBtn.css('visibility', 'visible');
                this.preBtn.css('visibility', 'visible');
            }
            
            this.realImg.hide();
            this.imgLoading.show();
            var nextPicUrl = this.photoList.find('li').eq(n).find('i').html();
            var upload = this.photoList.find('li').eq(n).find('i').attr("upload");
            var imgAlt = this.photoList.find('li').eq(n).find('.imgAlt').html();
            if (!img) {
                var img = new Image();
                var _this = this;
                /**
                 * maple
                 */
                var fullHeight = $(window).height();
                var crumH = $('.crumbs').outerHeight(true);
                var bottH = $('#thumBox').outerHeight(true);
                /**
                 * maple
                 * h=600
                 * h = fullHeight2 - crumH - bottH-10
                 */
                var w = 980, h =fullHeight - crumH - bottH-10;
                var o = this.realImg.get(0);
                img.onload = function () {
                    img.onload = null;

                    if (img.width > 0 && img.height > 0) {
                        if (img.width / img.height < w / h) {
                        	 if (img.height > h) {
                                 o.height = h;
                                 o.width = (img.width * h) / img.height;
                             } else {
                                 o.width = img.width;
                                 o.height = img.height;
                             }
                             o.alt = imgAlt;
                        } else {
                        	 if (img.width > w) {
                                 o.width = w;
                                 o.height = (img.height * w) / img.width;
                             } else {
                                 o.width = img.width;
                                 o.height = img.height;
                             }
                             o.alt = imgAlt;
                           
                        }
                    }
                    //$("#txtDes").css({"width":(o.width+20)});
                    //alert($(o).css("margin-left"));
                }
                img.src = nextPicUrl;
            }
            this.realImg.attr('src', img.src);
            //this.tool.find("#view").attr("href", upload);
            $("#view").attr("href", upload);
            this.realImg.load(function () {
                _this.imgLoading.hide();
                _this.realImg.fadeIn();
            });
            this.showPic(n);
        },
        showPic: function (n) {
            var oLi = this.photoList.find('li');
            this.txtDes.html('');
            this.txtDes.html("<span style='display: block;text-align: center;'>" +oLi.eq(n).find('img').attr("data-title")+ "（<b>" + (parseInt(n)+1) + "</b>/" + oLi.length+ "）"+ "</span>"+oLi.eq(n).find('img').attr("data-remarks") );
            //this.realImg.attr({src:n});
            //this.realImg.attr({src:oLi.eq(n).find('i').html()});
            //alert(this.txtDes.height());
            $("#heightVal").val(this.txtDes.height());
        },
        nextItem: function () {
            if (this.index == this.imgListLen - 1) {//针对chrome 点到最后一页的bug
                this.index = this.imgListLen - 1;
                this.nextBtn.css('visibility', 'hidden');
                this.preBtn.css('visibility', 'visible');
                return;
            }
            var nextItemIndex = this.index + 1;
            this.preBtn.css('visibility', 'visible');
            if (nextItemIndex > this.imgListLen) {
                nextItemIndex = this.imgListLen - 1;
                this.index = this.imgListLen - 1;
                this.nextBtn.css('visibility', 'hidden');
            }
            //this.showPic(nextItemIndex);

            this.loadNextPic(nextItemIndex);
            this.index = nextItemIndex;
            this.photoList.find('li').eq(nextItemIndex).addClass('on').siblings().removeClass('on');
            if (nextItemIndex + 1 > this.page * this.picNum) {//如果到了第一版面底部，则小缩略图自动加载下一屏
                this.thumNextBtn.trigger("click");
            }
        },
        preItem: function () {
            if (this.index <= 0) {
                this.index = 0;
                this.nextBtn.css('visibility', 'visible');
                this.preBtn.css('visibility', 'hidden');
                return;
            }
            var preItemIndex = this.index - 1;
            this.nextBtn.css('visibility', 'visible');
            if (preItemIndex <= 0) {
                preItemIndex = 0;
                this.index = 0;
                this.preBtn.css('visibility', 'hidden');
            }
            this.index = preItemIndex;
            //this.showPic(preItemIndex);
            this.loadNextPic(preItemIndex);//add
            this.photoList.find('li').eq(preItemIndex).addClass('on').siblings().removeClass('on');

            if (preItemIndex < (this.page - 1) * this.picNum) {//如果到了第一版面底部，则小缩略图自动加载下一屏
                this.thumPreBtn.trigger("click");
            }
        },
        doNextMove: function () {
            var _this = this;
            if (!this.photoList.is(":animated")) {
                this.thumNextBtn.attr('title', '').css('opacity', "1");
                if (this.page >= this.nPageCount) {
                    this.thumNextBtn.attr('title', '已到最后一页了').css('opacity', "0.5");
                } else {
                    this.thumPreBtn.attr('title', '').css('opacity', "1");
                    this.photoList.animate({ left: '-=' + this.picNum * this.liW + 'px' }, 1000);
                    this.page++;
                }
            }
        },
        doPreMove: function () {
            if (!this.photoList.is(":animated")) {
                this.thumNextBtn.attr('title', '').css('opacity', "1");
                if (this.page <= 1) {
                    this.thumPreBtn.attr('title', '已到第一页了').css('opacity', "0.5");
                } else {
                    this.thumNextBtn.attr('title', '').css('opacity', "1");
                    this.photoList.animate({ left: '+=' + this.picNum * this.liW + 'px' }, 1000);
                    this.page--;
                }
            }
        }
    };

    var defaultArgs = {};
    $(function () {
        var path = window.location.pathname.replace("/", "").split("-");
        var num = 0;
        if($("#picNum").length > 0){
        	num = $("#picNum").val();
        }
        new Album({
            viewMode: 0,
            preBtn: $('#preBtn'),
            nextBtn: $('#nextBtn'),
            thumPreBtn: $('#thumPreBtn'),
            thumNextBtn: $('#thumNextBtn'),
            realImg: $('#realImg'),
            txtDes: $('#txtDes'),
            thumWrap: $('#thumWrap'),
            photoList: $('#photoList'),
            thumPreBtn: $('#thumPreBtn'),
            thumNextBtn: $('#thumNextBtn'),
            albumDataList: $('#albumDataList'),
            picNum: 8,//设置thum上一屏放几个小缩略图
            imgLoading: $('#imgLoading'),
            thumBox: $('#thumBox'),
            tool:$("#tool")
        }, num);
    });
})(jQuery);

$(document).ready(function () {
	
    var jqImg = $("#realImg");
    var tool = $("#tool");
    tool.children().click(function () {
        switch ($(this).attr("id")) {
            case "fd":
                if (jqImg.attr("zoom") == undefined) {
                    jqImg.attr("zoom", 0);
                }
                else {
                    jqImg.attr("zoom", parseInt(jqImg.attr("zoom")) + 10);
                }
                jqImg.width(jqImg.width() * 1.05);
                jqImg.height(jqImg.height() * 1.05);
                break;
            case "sx":
                if (jqImg.attr("zoom") == undefined) {
                    jqImg.attr("zoom", 0);
                }
                else {
                    jqImg.attr("zoom", parseInt(jqImg.attr("zoom")) - 10);
                }
                jqImg.width(jqImg.width() * 0.95);
                jqImg.height(jqImg.height() * 0.95);
                break;
        }
    });
    $(".valin img").css("max-height",$(window).height()-108);
});