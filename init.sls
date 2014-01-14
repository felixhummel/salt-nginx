nginx_repo_key:
  cmd.script:
    - source: salt://nginx/add_nginx_repo_key.sh
    - unless: apt-key list | grep 7BD9BF62 >/dev/null
    - require_in:
      - pkgrepo: nginx_bin_repo
      - pkgrepo: nginx_src_repo

nginx_bin_repo:
  pkgrepo.managed:
    - humanname: Official Nginx Repo
    - name: deb http://nginx.org/packages/{{ grains['lsb_distrib_id'] | lower }}/ {{ grains['lsb_distrib_codename'] }} nginx
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/nginx.list
    - require_in:
      - pkg: nginx

nginx_src_repo:
  pkgrepo.managed:
    - humanname: Official Nginx Repo
    - name: deb-src http://nginx.org/packages/{{ grains['lsb_distrib_id'] | lower }}/ {{ grains['lsb_distrib_codename'] }} nginx
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/nginx.list
    - require_in:
      - pkg: nginx

nginx:
  pkg.installed:
    - refresh: True

