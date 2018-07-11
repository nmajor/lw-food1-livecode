class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def sign_in
    # Ask for the username
    username = @sessions_view.ask_user_for('username')
    # Ask for the password
    password = @sessions_view.ask_user_for('password')
    # Get employee from the repo using the username
    employee = @employee_repository.find_by_username(username)
    # Check that the password matches
    if employee && employee.password == password
      @sessions_view.sign_in_successful
      # If password matches -> sign in user
      return employee
    else
      @sessions_view.sign_in_unsuccessful
      sign_in
      # Else rejection message and ask again
    end
  end
end