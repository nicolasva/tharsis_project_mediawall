set(:env, 'tact_pre_production_gandi') unless exists?(:env)

set :applicationdev, "mediawalldev"
set :application, "mediawall"
set :git_domaindev, "92.243.26.5" #gandi
set :git_domain, "95.142.171.246" #gandi prod
set :repositorydev,  "ssh://git@#{git_domaindev}:22/var/git/#{applicationdev}.git"
set :repository, "ssh://git@#{git_domain}:22/home/admin/www/git/#{application}.git"

case env
	when "gandi_production"
	       set :domain, git_domain
	       set :local_repository, repository
       	       set :deploy_to, "/home/admin/www/#{application}"	
	       set :user "admin"
	
	else
		set :domain, git_domaindev
		set :repository, "file:///var/git/#{applicationdev}.git"
		set :deploy_via, :export
		set :deploy_to, "/var/www/#{applicationdev}"
		set :user "www"
end
	           
set :scm, :git
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                     # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

after "deploy:symlink", "db:symlink"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
