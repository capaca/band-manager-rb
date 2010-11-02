namespace :db do
	
	namespace :scripts do

		desc "Execute all the scripts in the folder db/scripts"
	  task :load => :environment do
			require 'db/scripts/scripts'
			Scripts.load
	  end
          
	end

end

