{% from "nfs/map.jinja" import nfs with context %}

nfs-client_pkgs:
  pkg.installed:
    - pkgs: {{ nfs.pkgs_client }}
