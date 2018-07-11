class EmployeeRepository < BaseRepository
  def model_from_row(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def model_header
    %w( id, username, password, role )
  end

  def csv_row(employee)
    [
      employee.id,
      employee.username,
      employee.password,
      employee.role
    ]
  end

  def find_by_username(username)
    all.find{|employee| employee.username == username }
  end
end