if Rails.env.development?
  AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end
end

# Camera.create!(
#   name: "Test Camera 1",
#   location: "Demo School",
#   stream_url: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8"
# )

# Camera.create!(
#   name: "Test Camera 2",
#   location: "Another School",
#   stream_url: "https://test-streams.mux.dev/test_001/stream.m3u8"
# )


mp_districts = [
  "Agar Malwa", "Alirajpur", "Anuppur", "Ashoknagar", "Balaghat",
  "Barwani", "Betul", "Bhind", "Bhopal", "Burhanpur",
  "Chhatarpur", "Chhindwara", "Damoh", "Datia", "Dewas",
  "Dhar", "Dindori", "Guna", "Gwalior", "Harda",
  "Hoshangabad (Narmadapuram)", "Indore", "Jabalpur", "Jhabua", "Katni",
  "Khandwa", "Khargone", "Mandla", "Mandsaur", "Morena",
  "Narsinghpur", "Neemuch", "Niwari", "Panna", "Raisen",
  "Rajgarh", "Ratlam", "Rewa", "Sagar", "Satna",
  "Sehore", "Seoni", "Shahdol", "Shajapur", "Sheopur",
  "Shivpuri", "Sidhi", "Singrauli", "Tikamgarh", "Ujjain",
  "Umaria", "Vidisha"
]

mp_districts.each do |d_name|
  District.find_or_create_by!(name: d_name, state: "Madhya Pradesh")
end

# --- Dummy Schools ---
schools = [
  { name: "St. Xavier School", address: "Indore, MP", registration_no: "SXS123", contact_person: "Mr. Sharma", contact_number: "9876543210", district: District.find_by(name: "Indore") },
  { name: "Delhi Public School", address: "Bhopal, MP", registration_no: "DPS456", contact_person: "Ms. Verma", contact_number: "8765432109", district: District.find_by(name: "Bhopal") },
  { name: "Carmel Convent", address: "Ujjain, MP", registration_no: "CC789", contact_person: "Mr. Singh", contact_number: "7654321098", district: District.find_by(name: "Ujjain") }
]

schools.each do |s|
  School.find_or_create_by!(name: s[:name], district: s[:district]) do |school|
    school.address = s[:address]
    school.registration_no = s[:registration_no]
    school.contact_person = s[:contact_person]
    school.contact_number = s[:contact_number]
  end
end

# --- Dummy Buses ---
buses = [
  { registration_no: "MP09-BUS1001", capacity: 40, status: 1, school: School.find_by(name: "St. Xavier School") },
  { registration_no: "MP04-BUS2002", capacity: 50, status: 1, school: School.find_by(name: "Delhi Public School") },
  { registration_no: "MP13-BUS3003", capacity: 45, status: 1, school: School.find_by(name: "Carmel Convent") },
  { registration_no: "MP09-BUS1002", capacity: 42, status: 1, school: School.find_by(name: "St. Xavier School") }
]

buses.each do |b|
  Bus.find_or_create_by!(registration_no: b[:registration_no], school: b[:school]) do |bus|
    bus.capacity = b[:capacity]
    bus.status = b[:status]
  end
end

# --- Dummy Cameras (Stream URLs can be test HLS streams) ---
cameras = [
  { name: "Front Camera", location: "Driver Cabin", stream_url: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8", bus: Bus.find_by(registration_no: "MP09-BUS1001") },
  { name: "Back Camera", location: "Back Door", stream_url: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", bus: Bus.find_by(registration_no: "MP09-BUS1001") },
  { name: "Main Camera", location: "Middle Seats", stream_url: "https://moq.china-mobile.net/channels/30000001/01.m3u8", bus: Bus.find_by(registration_no: "MP04-BUS2002") },
  { name: "Entry Camera", location: "Front Gate", stream_url: "https://test-streams.mux.dev/pts_shift/master.m3u8", bus: Bus.find_by(registration_no: "MP13-BUS3003") },
  { name: "Rear Camera", location: "Back Side", stream_url: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8", bus: Bus.find_by(registration_no: "MP09-BUS1002") }
]

cameras.each do |c|
  Camera.find_or_create_by!(name: c[:name], bus: c[:bus]) do |camera|
    camera.location = c[:location]
    camera.stream_url = c[:stream_url]
  end
end
