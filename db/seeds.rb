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

user = [User.Doctor.sample(1)].flatten.first
organization = user.organization

Patient.create!(
  first_name: "Antonio",
  last_name: "Vivaldi",
  email: "avivaldi@null.com",
  phone: "1234567890",
  address1: "Somplace nice",
  address2: "Uptown",
  city: "Florence",
  state: "Tuscany",
  zip: "12345",
  country: "Itali",
  dob: Date.parse("1678-03-04"),
  surgery_date: Date.parse("2020-10-20"),
  users: [user],
  organizations: [organization]
)

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
    users: [user],
    organizations: [organization]
  )
end

tsq = Test.create!(name: "Squats")
tw = Test.create!(name: "Walking")
tjj = Test.create!(name: "Jumping Jacks")
tl = Test.create!(name: "Lunges")
tsu = Test.create!(name: "Stairs Up")
tsd = Test.create!(name: "Stairs Down")
ts = Test.create!(name: "Stairs")
tsg = Test.create!(name: "Stand Up and Go")

pa = TestPlan.create!(name: "Plan A")
pb = TestPlan.create!(name: "Plan B")
pc = TestPlan.create!(name: "Plan C")
pd = TestPlan.create!(name: "Plan D")
pe = TestPlan.create!(name: "Plan E")
pf = TestPlan.create!(name: "Plan F")

TestPlansTest.create(test: tsq, test_plan: pa, duration: 10)
TestPlansTest.create(test: tjj, test_plan: pa, duration: 15, high_res: true)
TestPlansTest.create(test: tsu, test_plan: pa, duration: 20)
TestPlansTest.create(test: tl, test_plan: pa, duration: 15, high_res: true)

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true

