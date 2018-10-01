{% from "nfs/map.jinja" import nfs with context %}

nfs-server_pkgs:
  pkg.installed:
    - pkgs: {{ nfs.pkgs_server }}

/etc/exports:
  file.managed:
    - source: salt://nfs/files/exports
    - template: jinja
    - watch_in:
      - service: nfs_service

nfs_service:
  service.running:
    - name: {{ nfs.service_name }}
    - enable: True
