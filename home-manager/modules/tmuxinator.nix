{
  home.file.".config/tmuxinator/my_blog_web.yml".text = ''
    name: django
    root: ~/code/python/my_blog_web

    windows:
      - editor:
          panes:
            - source .venv/bin/activate && nvim .
      - server:
          panes:
            - source .venv/bin/activate && python manage.py runserver 0.0.0.0:8000
      - shell:
          panes:
            - source .venv/bin/activate && python manage.py shell
      - git:
          panes:
            - lazygit
  '';

  home.file.".config/tmuxinator/slicer.yml".text = ''
    name: slicer
    root: ~/code/python/Slicer

    windows:
      - editor:
          panes:
            - source .venv/bin/activate && nvim .
      - server:
          panes:
            - source .venv/bin/activate && python manage.py runserver 0.0.0.0:8000
      - shell:
          panes:
            - source .venv/bin/activate && python manage.py shell
      - git:
          panes:
            - lazygit
  '';

}
