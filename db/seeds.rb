# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath    = 'db/dressmakers_v2.csv'

#Skip email sending method when seeding :
# https://stackoverflow.com/questions/2846314/ruby-on-rails-skipping-validate-on-create-statement-for-seeds/3622206

puts 'Cleaning database...'

Photo.destroy_all
UserSpeciality.destroy_all
DressmakerProfile.destroy_all
Speciality.destroy_all
User.destroy_all

puts 'Creating database entries...'

specialities = ["Sewing", "Knitting", "Embroidery", "Petite", "Size plus", "Pregnant", "Wedding", "Children"]
clothing_types = ["Dress", "Jacket & Coat", "Top","Skirt","Trousers & Shorts"]

# IMAGES = ["https://res.cloudinary.com/dwww7z6po/image/upload/v1550816886/28764527_1664285163655634_7004804197614878720_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816591/28754706_200321677393619_6917173176715706368_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816308/29094602_741655309372175_2581932462007386112_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550817624/28430650_166633167466350_769802935675650048_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550815017/30590559_209799832945293_5529215187472613376_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550814461/30912304_155312951970971_2589061570847834112_n.jpg.jpg"]

specialities.each do |speciality|
  Speciality.create!(name: speciality)
end

clothing_types.each do |clothing_type|
  ClothingType.create!(name: clothing_type)
end

puts 'Creating Dressmakers...'

CSV.foreach(filepath, csv_options) do |row|
  new_user = User.create(

    first_name: "#{row['first_name']}",
    last_name: "#{row['last_name']}",
    email: "#{row['email']}",
    dressmaker: true,
    street_address: "#{row['city']} ",
    password: "password",
    avatar_url: "#{row['avatar']}"
    # new_user.remote_avatar_url_url = row['avatar']
  )

  new_dm = DressmakerProfile.create(
    bio: "#{row['bio']}",
    user: new_user,
    account_status: "active"
  )

  puts row['speciality_1']

  UserSpeciality.create!(
    speciality: Speciality.find_by(name:"#{row['speciality_1']}"),
    dressmaker_profile: new_dm
    )
  UserSpeciality.create!(
    speciality: Speciality.find_by(name:"#{row['speciality_2']}"),
    dressmaker_profile: new_dm
    )
  UserSpeciality.create!(
    speciality: Speciality.find_by(name:"#{row['speciality_3']}"),
    dressmaker_profile: new_dm
    )
  UserSpeciality.create!(
    speciality: Speciality.find_by(name:"#{row['speciality_4']}"),
    dressmaker_profile: new_dm
    )

  Photo.create!(
    remote_url_url: "#{row['portfolio_url_1']}",
    dressmaker_profile: new_dm
    )
  Photo.create!(
    remote_url_url: "#{row['portfolio_url_2']}",
    dressmaker_profile: new_dm
    )
  Photo.create!(
    remote_url_url: "#{row['portfolio_url_3']}",
    dressmaker_profile: new_dm
    )

  3.times do
    num = rand(1..5)
    UserClothingType.create!(
      clothing_type: ClothingType.find(num),
      dressmaker_profile: new_dm
    )
  end
end

puts 'Finished!'
