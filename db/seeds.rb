# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no customer
User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "ribLeaDO", role: "admin")

# customer with a sub
broomsticks = Customer.create!(name: "The Three Broomsticks", address1: "Somewhere in Hogsmeade")

# supervisor in customer with sub
User.create!(first_name: "Dani", last_name: "Litani", email: "supervisor_c_w_s@null.com", password: "ribLeaDO", role: "supervisor", customer: broomsticks)

# manager in customer with sub
User.create!(first_name: "Bryan", last_name: "Adams", email: "manager_c_w_s@null.com", password: "ribLeaDO", role: "manager", customer: broomsticks)

# regular in customer with sub
User.create!(first_name: "Edie", last_name: "Brickell", email: "regular_c_w_s@null.com", password: "ribLeaDO", role: "regular", customer: broomsticks)

# regular in sub
brewery = Customer.create!(name: "The Brewery", address1: "Somewhere else in Hogsmeade")
User.create!(first_name: "Susanna", last_name: "Hoffs", email: "regular_s@null.com", password: "ribLeaDO", role: "regular", customer: brewery)

# brewery.move_to_child_of broomsticks

# manager in customer without sub
cons = Customer.create!(name: "The Conservatory", address1: "Somewhere in Paris")
User.create!(first_name: "Fred", last_name: "Chopin", email: "manager_c_wo_s@null.com", password: "ribLeaDO", role: "manager", customer: cons)

# demo/anonymous users customer
democ = Customer.find_or_create_by(name: "Demos")
democ.update_attributes(address1: "Somewhere in Hogsmeade")
demou = User.where(email: "demo@null.com").first
if(demou)
  demou.update_column(:customer_id, democ.id)
else
  User.create!(first_name: "Brandi", last_name: "Carlile", email: "demo@null.com", password: "password", role: "regular", customer: democ)
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true
