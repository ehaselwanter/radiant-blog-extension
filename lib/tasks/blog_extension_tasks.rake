namespace :radiant do
  namespace :extensions do
    namespace :blog do
      
      desc "Runs the migration and update tasks of the Blog extension"
      task :install => [:environment, :migrate, :update]
        
      desc "Runs the migration of the Blog extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          BlogExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          BlogExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Author to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[BlogExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(BlogExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
