var pt = [];
var maxZindex = 3; // 가장높은 인덱스
var $item = $('.item');
var $tbox = $('.text-box');
var init = function() {
	valInp(function(i, e) {
		var o = {};
		o.top = $(e).position().top;
		o.left = $(e).position().left;
		o.height = $(e).outerHeight();
		o['z-index'] = $(e).css('z-index');
		pt[i] = o;
	});

	for (var i = 0; i < 2; i++) {
		pt.push(pt.shift());
	}

	valInp(function(i, e) {
		$(e).css(pt[i]);
		setZindex(e, function(e) {
			$(e).find('.txt').css({ 'display': 'block', 'bottom': 0 });
		});
	});
}

function valInp(fn) {
	$item.each(function(i, e) {
		fn(i, e);
	});
}

function setZindex(e, fn) {
	if ($(e).css('z-index') == maxZindex) {
		fn(e);
	}
}

function anime() {
	valInp(function(i, e) {
		$(e).css('z-index', pt[i]['z-index']).stop(true, true).animate(pt[i], {
			duration: 800, // 움직이는 시간을 조정하여 자연스러운 이동 구현
			complete: function() {
				$(e).find('.txt').css({ 'display': 'none', 'bottom': -40 });
				setZindex(e, function(e) {
					$(e).find('.txt').css('display', 'block').stop(true, true).animate({ 'bottom': 0 }, 200);
				});
			}
		});
	});
}

// prev
$('.p').on('click', function(e) {
	pt.push(pt.shift());
	anime();
});
// next
$('.n').on('click', function(e) {
	pt.unshift(pt.pop());
	anime();
});

init();

