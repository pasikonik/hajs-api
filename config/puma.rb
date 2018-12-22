threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
threads 1, threads_count

port        ENV.fetch('PORT') { 3000 }
workers     ENV.fetch('WEB_CONCURRENCY') { 1 }
environment ENV.fetch('RAILS_ENV') { 'development' }

app_dir = File.expand_path('../..', __FILE__)
shared_dir = "#{app_dir}/shared"

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
#activate_control_app

preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
