server '118.27.26.115', user: 'root', roles: %w{app db web}, port: 10022 
set :ssh_options, keys: '~/.ssh/conoha_ipkato/id_rsa'
