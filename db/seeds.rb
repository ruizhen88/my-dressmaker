# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath    = 'db/dressmakers_copie.csv'



# CSV.foreach(filepath, csv_options) do |row|
#   if $. <= 10
#     puts "#{row['Nom']}"
#   end
# end





puts 'Cleaning database...'

Photo.destroy_all
UserSpeciality.destroy_all
DressmakerProfile.destroy_all
Speciality.destroy_all
User.destroy_all

puts 'Creating database entries...'

specialities = ["Sewing", "Knitting", "Embroidery", "Petite", "Size plus", "Pregnant"]
IMAGES = ["https://res.cloudinary.com/dwww7z6po/image/upload/v1550816886/28764527_1664285163655634_7004804197614878720_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816591/28754706_200321677393619_6917173176715706368_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816308/29094602_741655309372175_2581932462007386112_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550817624/28430650_166633167466350_769802935675650048_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550815017/30590559_209799832945293_5529215187472613376_n.jpg.jpg", "https://res.cloudinary.com/dwww7z6po/image/upload/v1550814461/30912304_155312951970971_2589061570847834112_n.jpg.jpg"]

specialities.each do |speciality|
  Speciality.create!(name: speciality)
end
users = []

CSV.foreach(filepath, csv_options) do |row|
  if $. <= 5

    new_user = User.create(
      first_name: "#{row['Prénom']}",
      last_name: "#{row['Nom']}",
      email: "#{row['Email']}",
      dressmaker: true,
      street_address: "#{row['Ville ']} ",
      password: "password",
      avatar_url: "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816401/29089358_421990581574361_8492057583018835968_n.jpg.jpg"
    )
    users << new_user
 end
end


#   John: {
#     first_name: "John",
#     last_name: "Higgins",
#     email: "johnhiggins@outlook.ie",
#     dressmaker: true,
#     street_address: "1 avenue des champs élysées, Paris",
#     password: "password",
#     avatar_url: "https://res.cloudinary.com/dwww7z6po/image/upload/v1550817089/28763316_174324203358901_1703058075935571968_n.jpg.jpg"
#   },
#   Kane: {
#     first_name: "Kane",
#     last_name: "Ryans",
#     email: "kaneryans@live.com",
#     dressmaker: false,
#     password: "password",
#     avatar_url: "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816591/28754706_200321677393619_6917173176715706368_n.jpg.jpg"
#   },
#   Yejin: {
#     first_name: "Yejin",
#     last_name: "Jung",
#     email: "yejiin.jung@gmail.com",
#     dressmaker: false,
#     password: "password",
#     avatar_url: "https://res.cloudinary.com/dwww7z6po/image/upload/v1550816401/29089358_421990581574361_8492057583018835968_n.jpg.jpg"
#   },
# }

users.each do |new_user|
  # new_user = User.new(
  #   first_name: userValue[:first_name],
  #   last_name: userValue[:last_name],
  #   email: userValue[:email],
  #   street_address: userValue[:street_address],
  #   password: userValue[:password],
  #   dressmaker: userValue[:dressmaker],
  #   avatar_url: userValue[:avatar_url]
  #   )
  # new_user.save

  if new_user.dressmaker

    dressmaker_bio = ["Passionate dressmaker I have done that all my life", "The best dressmaker in all Ireland"]

    new_dm = DressmakerProfile.new(
      bio: dressmaker_bio.sample,
      user: new_user,
      account_status: "active"
    )
    new_dm.save

    3.times do
      # speciality_ids = (1..Speciality.all.count - 1).to_a
      UserSpeciality.create!(
        speciality: Speciality.order("RANDOM()").first,
        dressmaker_profile: new_dm
        )

    end

    3.times do
      Photo.create!(
      remote_url_url: IMAGES.sample,
      dressmaker_profile: new_dm
      )
    end
  else
    BuyerProfile.create(user: new_user)
  end
end

puts 'Finished!'
