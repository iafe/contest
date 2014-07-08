# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new({ email: 'tech@fairsandexpos.com', email_confirmation: 'tech@fairsandexpos.com', password: 'password', password_confirmation: 'password', first_name: 'Rachel', last_name: 'Mundhenke', phone: '417-862-5771', admin: true, judge: false, enabled: true }).save

Organization.new({ name: 'International Association of Fairs and Expositions', primary_contact: 'Jim Tucker', address_line_1: '3043 E Cairo St', city: 'Springfield', state: 'MO', zip_code: '65802', phone: '417-862-5771', fair: false, enabled: true }).save

UserOrganization.new({ user_id: 1, organization_id: 1 }).save
