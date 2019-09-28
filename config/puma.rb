threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
threads 1, threads_count

port        ENV.fetch('PORT') { 3000 }
workers     ENV.fetch('WEB_CONCURRENCY') { 1 }
environment ENV.fetch('RAILS_ENV') { 'development' }

preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
