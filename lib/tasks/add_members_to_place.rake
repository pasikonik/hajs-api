namespace :add_members_to_place do
  task perform: :environment do
    place = Place.last
    users = FactoryBot.create_list('user', 4)
    place.users << users
    place.save
  end
end
