require 'mechanize'

namespace :scrape do 
  task :db => :environment do 
    file = File.open(Rails.root.join('lib', 'tasks', 'wishes.txt'), "r")
    line = file.gets
    puts line.split.to_yaml
    while (line = file.gets)
      line = line.split
    end
  end
end