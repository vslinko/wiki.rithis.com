set :application, "wiki.rithis.com"
set :domain, application

set :repository, "git://github.com/rithis/#{domain}.git"
set :scm, :git

role :web, domain
set :user, "www-data"
set :deploy_to, "/var/www/#{domain}"

after "deploy:update_code" do
  run "cd #{latest_release} && nanoc"
end
