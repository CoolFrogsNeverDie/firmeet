 var $eles = $('.slider>ul>li'); // li 제이쿼리 객체
  var eles = $eles.toArray(); // li의 dom요소를 담는 배열
  var pt = []; // 각 li 태그의 css {top,height,left,z-index}을 담는 배열
  var center = Math.floor(eles.length / 2);
  var total = eles.length;
  var repeat = 1, count = 0;

  var playSlider = function () {
    setCss();
  }

  // 각 li태그의 css값을 pt 배열에 저장
  function setCss() {
    eles.forEach(function (e, i) {
      pt[i] = $(e).css(['top', 'height', 'left', 'z-index']);
    });

    // 초기 위치 설정
    for (var i = 0; i < center; i++) {
      eles.unshift(eles.pop());
      eles.forEach(function (e, i) {
        count++;
        $(e).css(pt[i]).removeClass('click').find('.txt').hide();
        if (count == (Math.abs(repeat) * total)) {
          count = 0, repeat = 1;
          $(eles[center]).addClass('click').find('.txt').show().css('bottom', 0);
        }
      });
    }
  }

// 패널이동
function movePanel() {
  eles.forEach(function (e, i) {
    $(e).removeClass('click').find('.txt').hide().css('bottom', -40);
    $(e).stop(true, true).animate(pt[i], 200, function () {
      count++;
      if (count == (Math.abs(repeat) * total)) {
        count = 0, repeat = 1;
        $(eles[center]).addClass('click').find('.txt').show().stop(true, true).animate({ 'bottom': 0 }, 100);

        // 다음 버튼을 클릭하는 경우 두 번째 이동을 막기 위해 repeat 값을 초기화
        if (repeat === 2) {
          repeat = 1;
        }
      }
    });
  });
}


  // li 태그 버튼
  $eles.on('click', function (e) {
    if (!$(this).hasClass('click')) {
      repeat = center - parseInt(eles.indexOf(this));
      repeat < 0 ? repeatFn(nextFn) : repeatFn(prevFn);
    }
  });

  function repeatFn(m) {
    for (var i = 0; i < Math.abs(repeat); i++) {
      m();
    }
  }

  // prev
  $('.prev').on('click', function (e) {
    prevFn();
  });

  // next
  $('.next').on('click', function (e) {
    nextFn();
  });

  function prevFn() {
    eles.unshift(eles.pop());
    movePanel();
  }

  function nextFn() {
    eles.push(eles.shift());
    movePanel();
  }

  playSlider();