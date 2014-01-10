***********************************
Nginx Install Salt State for Ubuntu
***********************************
Installation
============
In your /srv/salt (which should be a git repo)::

    git submodule add https://github.com/felixhummel/salt-nginx.git nginx
    salt '*' state.sls nginx


