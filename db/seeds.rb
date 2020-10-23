# THIS MUST BE THE FIRST LINE
PaperTrail.enabled = false

# admin with no organization
admin = User.create!(first_name: "Roger", last_name: "Waters", email: "admin@null.com", password: "password", role: "CanaryAdmin")

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

anderson = User.create!(organizations: [Organization.first], first_name: "Ian", last_name: "Anderson", email: "ianderson@null.com", password: "password", role: "Doctor")
ellington = User.create!(organizations: [Organization.first], first_name: "Duke", last_name: "Ellington", email: "dellington@null.com", password: "password", role: "Doctor")
chopin = User.create!(organizations: [Organization.last], first_name: "Frederic", last_name: "Chopin", email: "fchopin@null.com", password: "password", role: "Doctor")

Organization.hospital.each do |hospital|
  10.times do |i|
    role = User.roles.keys.sample(1)[0]
    User.create!(
      role: role,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "#{role}#{i}@#{hospital.name.split(' ')[0].split(',')[0]}.com",
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
  surgeries: [Surgery.create(date: Date.parse("2020-10-20"), name: "Right Knee")],
  users: [user],
  organization: organization,
  ctes: [Cte.create!(
    name: "Right Knee",
    radio_id: 17,
    serial_number: 17,
    encryption_key: [0x01020304, 0x05060708, 0x09101211, 0x13141516],
    manufacturer_id: 1
  )]
)

30.times do |i|
  patient = Patient.create!(
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
    surgeries: [Surgery.create(date: Faker::Date.between(from: 6.months.ago, to: 1.month.ago), name: i%2 == 0 ? "Right Knee" : "Left Knee")],
    organization: Organization.all.sample,
    ctes: [Cte.create!(
      name: i%2 == 0 ? "Right Knee" : "Left Knee",
      radio_id: 17,
      serial_number: 17,
      encryption_key: [0x04030201, 0x08070605, 0x11121009, 0x16151413],
      manufacturer_id: 1
    )]
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

pa = TestPlan.create!(name: "Default")
ia = TestPlan.create!(name: "Ian's Test Plan", users: [anderson], organizations: [anderson.organization])
de = TestPlan.create!(name: "Duke's Test Plan", users: [ellington], organizations: [ellington.organization])

TestPlansTest.create!(test: tsq, test_plan: pa, duration: 10)
TestPlansTest.create!(test: tjj, test_plan: pa, duration: 10, high_res: true)
TestPlansTest.create!(test: tsu, test_plan: pa, duration: 20)
TestPlansTest.create!(test: tl, test_plan: pa, duration: 10, high_res: true)

TestPlansTest.create!(test: tsq, test_plan: ia, duration: 5)
TestPlansTest.create!(test: tjj, test_plan: ia, duration: 5, high_res: true)
TestPlansTest.create!(test: tsu, test_plan: ia, duration: 5)
TestPlansTest.create!(test: tl, test_plan: ia, duration: 5, high_res: true)

TestPlansTest.create!(test: tsq, test_plan: de, duration: 7)
TestPlansTest.create!(test: tjj, test_plan: de, duration: 7, high_res: true)
TestPlansTest.create!(test: tsu, test_plan: de, duration: 7)
TestPlansTest.create!(test: tl, test_plan: de, duration: 7, high_res: true)

BaseStation.create!(serial_number: 0, active: true, encryption_key: [1,2,3,4])

Firmware.create!(
  image: File.read(Rails.root.join("db", "seed_files", "firmware", "base_station", "clinic-base-station-dev-kit.bin")),
  kind: "BaseStation",
  major: 0,
  minor: 0,
  bugfix: 0,
  build: 0, 
  critical: false
)

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true

