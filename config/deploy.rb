require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

set :domain, 'fidedigi.com'
set :port, '22'

set :path, '$HOME/ruby/bin:$HOME/bin'
set :bundle_bin, 'ruby -S bundle'
set :deploy_to, '/home/fidedigi/app'
set :repository, 'git@github.com:fidelidade-digital/fidedigi.git'
set :branch, 'master'
set :shared_paths, ['log', '.env', 'tmp', 'pids']

set :user, 'fidedigi'
set :forward_agent, true

task :environment do
  queue! %[#{echo_cmd %{export PATH="#{path}:$PATH"}}]
end

task :setup => :environment do
  queue! %[#{echo_cmd %{ssh-keyscan -H github.com > ~/.ssh/known_hosts}}]

  queue! %[mkdir -p "#{deploy_to}/shared/pids"]
  queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rwx,u+rwx "#{deploy_to}/shared/tmp"]

  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/.env"]
  queue %[echo "-----> Be sure to edit 'shared/.env'."]
end

desc 'Restart Rails app'
task :restart => :environment do
  queue! 'kill -USR1 `cat /home/fidedigi/app/shared/pids/puma.pid`'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :restart
    end
  end
end