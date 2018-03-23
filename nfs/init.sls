{%- from "nfs/map.jinja" import nfs with context %}

include:
  - nfs.client
  {%- if nfs.server is defined %}
  - nfs.server
  {%- endif %}
  {%- if nfs.unmount is defined %}
  - nfs.unmount
  {%- endif %}
  {%- if nfs.mount is defined %}
  - nfs.mount
  {%- endif %}
