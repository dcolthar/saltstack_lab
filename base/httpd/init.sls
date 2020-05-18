install_packages:      # ID Declaration
  pkg.installed:       # state Declaration, installed is function
    - pkgs:            # function arg
      - httpd          # function arg

start_servcies:  
  service.running:
    - name: httpd
    - enable: True
    - require:         # requisite declaration
      # note that the require is referencing that another ID is True
      # in this case that install_packages ID returns true
      # which means httpd would be installed
      - pkg: install_packages

/var/www/html/index.html:
  file.managed:
    - source: salt://httpd/index.html
    - mode: 733

/var/www/:
  file.directory:
    - user: apache
    - group: apache
    - recurse:
      - user
      - group

firewall_rules:
  firewalld.present:
    - name: public
    - ports:
      - 22/tcp
      - 80/tcp 
