puts "SPACESHIP LAUNCH"
#rand(x) returns random number between 0 and x - 1
gravity = rand(20) + 1
weight = rand(40) + 1
resistance = gravity * weight

puts "Gravity = #{gravity}"
puts "Give thrust power:"

try_count = 0

while try_count < 10 #loop while try_count is less than 10
  answer = gets.chomp
  thrust = answer.to_i

  if thrust == resistance
    puts "Launch was successfull!"
    break #break from loop, program continues from the next line after the loop
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
#program jumps here, if the break is called in the loop above
#or if the while condition is not true
