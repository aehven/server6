# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no organization
User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "password", role: "admin")

# organization with a sub
broomsticks = Organization.create!(name: "The Three Broomsticks", address1: "Somewhere in Hogsmeade") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'

# supervisor in organization with sub
User.create!(first_name: "Dani", last_name: "Litani", email: "supervisor_c_w_s@null.com", password: "password", role: "supervisor", organization: broomsticks)

# manager in organization with sub
User.create!(first_name: "Bryan", last_name: "Adams", email: "manager_c_w_s@null.com", password: "password", role: "manager", organization: broomsticks)

# regular in organization with sub
User.create!(first_name: "Edie", last_name: "Brickell", email: "regular_c_w_s@null.com", password: "password", role: "regular", organization: broomsticks)

# regular in sub
if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
  brewery = Organization.create!(name: "The Brewery", address1: "Somewhere else in Hogsmeade")
  User.create!(first_name: "Susanna", last_name: "Hoffs", email: "regular_s@null.com", password: "password", role: "regular", organization: brewery)
  brewery.move_to_child_of broomsticks
end

# manager in organization without sub
cons = Organization.create!(name: "The Conservatory", address1: "Somewhere in Paris") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
User.create!(first_name: "Fred", last_name: "Chopin", email: "manager_c_wo_s@null.com", password: "password", role: "manager", organization: cons)

# demo/anonymous users organization
democ = Organization.find_or_create_by(name: "Demos", address1: "Somewhere in Hogsmeade") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
demou = User.where(email: "demo@null.com").first
if(demou)
  demou.update_column(:organization_id, democ&.id)
else
  User.create!(first_name: "Brandi", last_name: "Carlile", email: "demo@null.com", password: "password", role: "regular", organization: democ)
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true
