# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no organization
User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "password", role: "CanaryAdmin")

# organization with a sub
broomsticks = Organization.create!(kind: "hospital", name: "The Three Broomsticks", address1: "Somewhere in Hogsmeade") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'

# Admin in organization with sub
User.create!(first_name: "Dani", last_name: "Litani", email: "Admin_c_w_s@null.com", password: "password", role: "Admin", organizations: [broomsticks])

# Doctor in organization with sub
User.create!(first_name: "Bryan", last_name: "Adams", email: "Doctor_c_w_s@null.com", password: "password", role: "Doctor", organizations: [broomsticks])

# Nurse in organization with sub
User.create!(first_name: "Edie", last_name: "Brickell", email: "Nurse_c_w_s@null.com", password: "password", role: "Nurse", organizations: [broomsticks])

# Nurse in sub
if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
  brewery = Organization.create!(kind: "clinic", name: "The Brewery", address1: "Somewhere else in Hogsmeade")
  User.create!(first_name: "Susanna", last_name: "Hoffs", email: "Nurse_s@null.com", password: "password", role: "Nurse", organizations: [brewery])
  brewery.move_to_child_of broomsticks
end

# Doctor in organization without sub
cons = Organization.create!(kind: "clinic", name: "The Conservatory", address1: "Somewhere in Paris") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
User.create!(first_name: "Fred", last_name: "Chopin", email: "Doctor_c_wo_s@null.com", password: "password", role: "Doctor", organizations: [cons])

# demo/anonymous users organization
democ = Organization.find_or_create_by(kind: "clinic", name: "Demos", address1: "Somewhere in Hogsmeade") if ENV['USERS_BELONG_TO_ORGANIZATIONS'] == 'true'
demou = User.where(email: "demo@null.com").first
if(demou)
  demou.organizations << democ
else
  User.create!(first_name: "Brandi", last_name: "Carlile", email: "demo@null.com", password: "password", role: "Nurse", organizations: [democ])
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true
