puts "GALAXY CONTEST"
puts %{There is competition to broadcast galaxy wide sporting events between TV stations.
You are an engineer responsible for launching satellites to orbit, can you
beat the competiting stations?}
puts
puts

altitude = rand(100) + 1

puts "Launch satellite to the altitude of #{altitude}"

max_try_count = 8
try_count = 0
success = false

while try_count < max_try_count and success == false
  puts "Give launch angle (0-90)"
  answer = gets.chomp
  angle = answer.to_i

  puts "Give velocity (0-40000)"
  answer = gets.chomp
  velocity = answer.to_i

  angle = angle - Math.atan(altitude / 3) * 180 / Math::PI
  velocity = velocity - 3000 * Math.sqrt(altitude + 1 / altitude)

  success = true if angle.abs < 2 and velocity.abs < 100
  puts "Angle is too gentle" if angle < -2
  puts "Angle is too steep" if angle > 2
  puts "Not enough velocity" if velocity < -100
  puts "Too high velocity" if velocity > 100

  try_count = try_count + 1
end

if success
  puts "Launch was successfull, congratulations!\nYou got pay rise!"
else
  puts "FAIL! You have been fired!"
end
