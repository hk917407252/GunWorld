// JavaScript Document
$(function(){
	$(".focus2").sudyslide({
		json:w77imgJsons,
		zWidth:1375,
        zHeight:457,
		thumb: true,
		title: {
                active: true, // 是否显示标题
                isAutoWidth: true, // 标题背景自动宽度
                href: true // 标题是否加文章链接
            }
	});
	roll("#focus",10,w55imgJsons);
	roll("#focus2",11,w56imgJsons);
	roll("#focus3",12,w57imgJsons);
	roll("#focus4",21,w58imgJsons);
	
})
function roll(cls,win,json){
	$(cls).sudyfocus({
                p:win, // 窗口号或频道号
                json: json, // 文章的json数据
                title: {
                    active: false, // 是否显示标题
                    isAutoWidth: true, // 标题背景自动宽度
                    href: false // 标题是否加文章链接
                },
                text: {
                    active: false, // 是否显示文章简介
                    isAutoHeight: true, // 简介背景自动高度
                    href: false // 简介是否加文章链接
                },
                href: true, // 图片是否加链接
                zWidth: 370, // 窗口宽度
                zHeight: 200, // 窗口高度
                response: true, // 是否自适应缩放
                navigation: true, // 是否显示按钮，上一张、下一张
                isNavHover: true, // 导航按钮是否默认隐藏，鼠标经过时再显示
                pagination: true, // 是否显示按钮，1、2、3、4...
                effect: 'slide', // slide(滑动),fade(淡入),show(即显)
                speed: 400, // 切换速度
                crossfade: true, // 是否交叉淡入淡出
                start: 1, // 默认从第一个开始切换
                autoPlay:true, // 是否自动播放
                interval: 5000 // 自动播放时间间隔
    });
}