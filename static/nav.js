(function() {
  var currentPage = window.location.pathname.split('/').pop() || 'index.html';

  var links = [
    { href: 'index.html', label: 'home' },
    { href: 'about.html', label: 'about' },
    { href: 'projects.html', label: 'projects' },
    { href: 'resume.html', label: 'resume' }
  ];

  var nav = document.createElement('nav');
  nav.id = 'main-nav';

  var ul = document.createElement('ul');
  for (var i = 0; i < links.length; i++) {
    var li = document.createElement('li');
    var a = document.createElement('a');
    a.href = links[i].href;
    a.textContent = '> ' + links[i].label;
    if (currentPage === links[i].href) {
      a.classList.add('active');
    }
    li.appendChild(a);
    ul.appendChild(li);
  }
  nav.appendChild(ul);

  var socialDiv = document.createElement('div');
  socialDiv.className = 'nav-social';
  socialDiv.innerHTML = '<a href="https://www.linkedin.com/in/nathan-wren" target="_blank" title="linkedin"><img src="images/iconmonstr-linkedin-4.svg" alt="linkedin"></a> ' +
    '<a href="https://github.com/nwren1337" target="_blank" title="github"><img src="images/iconmonstr-github-1.svg" alt="github"></a>';
  nav.appendChild(socialDiv);

  document.body.insertBefore(nav, document.body.firstChild);
})();
