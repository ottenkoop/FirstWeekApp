# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w( sprints userstories ).each do |file|
  YAML.load_file("#{Rails.root}/db/seeds/#{file}.yml").each do |k, v|
    Object.const_get(k.classify).create(v)
  end
end