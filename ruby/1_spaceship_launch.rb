puts "SPACESHIP LAUNCH"
gravity = rand(20) + 1
weight = rand(40) + 1
resistance = gravity * weight

puts "Gravity = #{gravity}"
puts "Give thrust power:"

try_count = 0

while try_count < 10
  answer = gets.chomp
  thrust = answer.to_i

  if thrust == resistance
    puts "Launch was successfull!"
    break
  elsif thrust > resistance
    puts "Too much thrust power"
  else
    puts "Not enough thrust power"
  end


  if try_count < 10
    puts "Try again"
  else
    puts "You have failed"
  end
  
  try_count = try_count + 1
end
