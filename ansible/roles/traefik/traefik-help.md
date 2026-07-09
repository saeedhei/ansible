1 edit loop in ansible\roles\traefik\tasks\main.yml  too
2 create template too


- name: Deploy dynamic configs
  ansible.builtin.template:
    src: "dynamic/{{ item }}.yml.j2"
    dest: "{{ traefik_dir }}/dynamic/{{ item }}.yml"
    mode: "0644"
  loop:
    - dashboard
    - kanban
    add hierrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr