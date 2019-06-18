lock "~> 3.11.0"
set :application, 'tm_registration'
set :repo_url, 'git@github.com:KaoruOnuki/n201906tm_registration.git'
set :branch, 'master'
set :deploy_to, '/var/www/ipkato_app'
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 5
set :rbenv_ruby, '2.6.0'
set :log_level, :debug
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          sql = "CREATE DATABASE IF NOT EXISTS n201906tm_registration_production;"
          execute "mysql --user=root --password=root -e '#{sql}'"
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
