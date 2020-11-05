require 'csv'

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
  users: [anderson],
  organization: anderson.organization
)

tsq = Test.create!(name: "Squats")
tw = Test.create!(name: "Walking")
tjj = Test.create!(name: "Jumping Jacks")
tl = Test.create!(name: "Lunges")
tsu = Test.create!(name: "Stairs Up")
tsd = Test.create!(name: "Stairs Down")
ts = Test.create!(name: "Stairs")
tsg = Test.create!(name: "Stand Up and Go")

pa = TestPlan.create!(name: "Default", users: [], organizations: [])
TestPlansUser.create!(test_plan_id: pa.id, user_id: nil)

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
  major: 1,
  minor: 2,
  bugfix: 3,
  build: 4, 
  critical: false
)

rows = CSV.read(Rails.root.join("db", "seed_files", "cte_results", "cte_dataheader.csv"), headers: true)
rows.each_with_index do |row, i|
  cte = Cte.find_by(id: row[1])

  if(cte.nil?)
    cte = Cte.create!(id: row[1], name: i%2 == 0 ? "Right Knee" : "Left Knee", radio_id: 17, serial_number: 17, encryption_key: [0x04030201, 0x08070605, 0x11121009, 0x16151413], manufacturer_id: 1)

    if(i == 0)
      Patient.find(1).update(ctes: [cte])
    else
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
        surgeries: [Surgery.create(date: Faker::Date.between(from: 6.months.ago, to: 1.month.ago), name: i%2 == 0 ? "Right Knee" : "Left Knee")],
        users: [user = [User.Doctor.sample(1)].flatten.first],
        organization: user.organization,
        ctes: [cte])
    end
  end

  CteData.create!(id: row[0], cte_id: row[1], dataset_number: row[2], sample_bcd_datetime: row[6])

  ptp = PatientsTestPlan.create!(patient_id: cte.patients.last.id, test_plan_id: 1)
  TestResult.create!(patients_test_plan: ptp, start_time: row[6], dataset_number: row[2])
end

rows = CSV.read(Rails.root.join("db", "seed_files", "cte_results", "cte_resultsheader.csv"), headers: true)
rows.each do |row|
  CteResultHeader.create!(id: row[0], cte_data_id: row[1], app_version: row[2], matlab_version: row[3], when_calculated: row[4], sequence_no: row[5], company_id: row[6], tibia_length_used: row[7], tibia_length_source: row[8])
end

rows = CSV.read(Rails.root.join("db", "seed_files", "cte_results", "cte_results.csv"), headers: true)
rows.each do |row|
  CteResult.create!(id: row[0], cte_result_header_id: row[1], qualified_gait_cycle: row[2], gc_start: row[3], gc_end: row[4], cadence: row[5], stride_length: row[6], walk_speed: row[7], tib_rom: row[8], knee_rom: row[9], company_id: row[10])
end

# THIS MUST BE THE LAST LINE
PaperTrail.enabled = true
