class SessionsView
  def ask_user_for(attribute)
    puts "Please enter customer #{attribute}"
    gets.chomp
  end

  def sign_in_successful
    puts "Yay! Signed in!"
  end

  def sign_in_unsuccessful
    puts "Wrong username and password"
  end
end