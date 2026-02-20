var matrix = (function() {
  var canvas = document.getElementById('matrix-bg');
  var ctx = canvas.getContext('2d');

  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  var chars = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789ABCDEF';
  chars = chars.split('');

  var fontSize = 14;
  var columns = Math.floor(canvas.width / fontSize);
  var drops = [];

  for (var i = 0; i < columns; i++) {
    drops[i] = Math.floor(Math.random() * -canvas.height / fontSize);
  }

  function draw() {
    ctx.fillStyle = 'rgba(10, 10, 10, 0.05)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    ctx.fillStyle = '#00ff41';
    ctx.font = fontSize + 'px monospace';

    for (var i = 0; i < drops.length; i++) {
      var text = chars[Math.floor(Math.random() * chars.length)];

      var brightness = Math.random();
      if (brightness > 0.9) {
        ctx.fillStyle = '#ffffff';
      } else if (brightness > 0.5) {
        ctx.fillStyle = '#00ff41';
      } else {
        ctx.fillStyle = '#008f11';
      }

      ctx.fillText(text, i * fontSize, drops[i] * fontSize);

      if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
        drops[i] = 0;
      }
      drops[i]++;
    }
  }

  var interval = setInterval(draw, 40);

  window.addEventListener('resize', function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    var newColumns = Math.floor(canvas.width / fontSize);
    if (newColumns > columns) {
      for (var i = columns; i < newColumns; i++) {
        drops[i] = Math.floor(Math.random() * -canvas.height / fontSize);
      }
    }
    columns = newColumns;
    drops.length = columns;
  });

  return { interval: interval };
})();
