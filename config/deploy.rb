require 'bundler/capistrano'
require 'capistrano_colors'
require 'puma/capistrano'

set :user,        'deploy'
set :deploy_to,   '/home/deploy/apps/fiscal'
set :scm,         'git'
set :repository,  'git@github.com:42races/finace_visualization.git'
set :branch,      'master'
set :application, 'fiscal'
set :domain,      'thecrowdstudio.com'
set :subdomain,     true
set :keep_releases, 4
set :deploy_via,    :remote_cache
set :use_sudo,      false
set :normalize_asset_timestamps, false

#role  :app, '69.164.211.60'
role  :app, 'ec2-54-237-29-209.compute-1.amazonaws.com'

default_run_options[:pty]   = true
default_run_options[:shell] = 'bash --login' # use login shell
ssh_options[:forward_agent] = true