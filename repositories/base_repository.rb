class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find{|element| element.id == id }
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def model_from_row(row)
    raise NotImplementedError
  end

  def model_header
    raise NotImplementedError
  end

  def csv_row(element)
    raise NotImplementedError
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << model_header
      @elements.each do |element|
        csv << csv_row(element)
      end
    end
  end

  def load_csv # ---------------------
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << model_from_row(row)
    end

    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end