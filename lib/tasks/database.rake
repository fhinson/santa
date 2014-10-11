namespace :database do 
  task :seed => :environment do 
    file = File.open(Rails.root.join('lib', 'tasks', 'wishes.txt'), "r")
    line = file.gets
    while (line = file.gets)
      line = line.split(/[\t\n]/)
      name = line[2] == ' ' ? line[1] : line[1] + line[2]
      age = line[5].split[0].to_i
      t = Tag.find_by_name_and_age(name, age) || Tag.new
      t.name = line[2] == ' ' ? line[1] : line[1] + ' ' + line[2] 
      t.group = line[3] if line[3] != ' '
      t.gender = line[4]
      t.age = age
      t.wish = line[6] if line[6] != ' '
      t.alternate_wish = line[7] if line[7] != ' '
      t.special_needs = line[8] if line[8] != ' '
      t.save!
    end
  end
end