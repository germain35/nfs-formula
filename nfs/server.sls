{% from "nfs/map.jinja" import nfs with context %}

nfs-server_pkgs:
  pkg.installed:
    - pkgs: {{ nfs.pkgs_server }}

{%- if nfs.server.get('exports', False)  %}
  {%- for dir, params in nfs.server.exports.get('present', {}).items() -%}
nfs_{{dir}}_export:
  nfs_export.present:
    - name: {{dir}}
    {%- if params is mapping %}
      {%- for key, value in params.items() %}
    - {{key}}: {{value}}
      {%- endfor %}
    {%- endif %}
    - watch_in:
      - service: nfs_service
  {%- endfor %}

    {%- for dir in nfs.server.exports.get('absent', []) -%}
nfs_{{dir}}_export:
  nfs_export.absent:
    - name: {{dir}}
    - watch_in:
      - service: nfs_service
  {%- endfor %}
{%- endif %}

nfs_service:
  service.running:
    - name: {{ nfs.service_name }}
    - enable: True
