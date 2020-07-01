# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no organization
User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "password", role: "CanaryAdmin")

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

30.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address1: Faker::Address.street_address,
    address2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: "USA",
    dob: Faker::Date.between(from: 90.years.ago, to: 20.years.ago),
    surgery_date: Faker::Date.between(from: 6.months.ago, to: 1.month.ago),
    users: [User.Doctor.sample(1)].flatten
  )
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true

