# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no organization
User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "password", role: "admin")

5.times do
  hospital = Organization.create!(
    name: Faker::Company.name,
    kind: "hospital"
  )

  2.times do
    clinic = Organization.create!(
      name: Faker::Company.name,
      kind: "clinic",
      parent_id: hospital.id
    )
  end
end

Organization.hospital.each do |hospital|
  10.times do
    User.create!(
      role: User.roles.keys.sample(1)[0],
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "password",
      organizations: [hospital, Organization.clinic.sample(1)[0]]
    )
  end
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true

