class CustomerRepository < BaseRepository
  def model_from_row(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def model_header
    %w( id, name, address )
  end

  def csv_row(customer)
    [ customer.id, customer.name, customer.address ]
  end
end
