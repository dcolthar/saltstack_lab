base:
  '*':
    - bashrc
  'os_family:RedHat':
    - match: grain
    - httpd
