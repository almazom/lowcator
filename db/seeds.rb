# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  p link =  Link.create(:description => Forgery(:lorem_ipsum).words(11), :url => 'http://'+Forgery(:lorem_ipsum).words(1)+'.ru', :user_id => User.first.id )

  50.times do
    p link.comments.create(:body => Forgery(:lorem_ipsum).words(11))
  end
end

