module Scripts
	# Nome do banco
	# DB_NAME = "viajantes"
	# USER_NAME = "viajantes"
	SCRIPTS_DIR = "db/scripts/"
	# DUMPS_DIR = "db/dumps/"

	def self.load
		init
	
		puts "Scripts:"
		Dir.entries(SCRIPTS_DIR).sort.each do |file|
			if sql?(file)
				self.execute_script!(file)
			end
		end
	end   
	
	def self.load_dump
	  create_database
		
    dumps = Dir.entries(DUMPS_DIR).sort
    # Ultimo
    file = "20091019.sql" #dumps[dumps.length - 1] 
    
    puts "Dump escolhido: #{file}, executando..." 
		if sql?(file)
			self.execute_script!(file, DUMPS_DIR)
		end  
	end
         
  # Metodos privados #########################################################
	private  

  def self.init
    puts "Recreating the databases and migrating the tables..."
    drop_all
    create_all
    migrate
  end

  def self.drop_all
    puts "Dropping all the databases..."
    system ("rake -q db:drop:all")
  end
  
  def self.create_all
    puts "Creating all the databases..."
    system ("rake -q db:create:all")
  end
  
  def self.migrate
    puts "Migrating the tables..."
    system ("rake -q db:migrate")
  end
	 
	def self.schama_load
	  puts "Recreating the tables and loading the schema..."
		system ("rake -q db:schema:load")
	end
	
	def self.sql?(file)
		return file =~ /.*\.sql$/
	end	

	def self.execute_script!(script, dir = SCRIPTS_DIR)
		puts "Executando: #{script}"
		
		sql = ""
		File.open("#{dir}#{script}", "r").each do |line|
			sql << line
		end
		
		Scripts.execute(sql)
	end
	
	# Executa o sql passado
	#
	def self.execute(sql)
#		begin
#			con = ActiveRecord::Base.connection()
#			con.begin_db_transaction
#			con.execute(sql)
#			con.commit_db_transaction
#			
#			puts "-> Sql executed successefully!"
#		rescue StandardError => e
#			puts "-> Failure while executing sql. (#{e})"
#		end
    system ("sqlite3 #{RAILS_ROOT}/db/development.sqlite3 \"#{sql}\"")
	end

end






























