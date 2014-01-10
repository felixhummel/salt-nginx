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

