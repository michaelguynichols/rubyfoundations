class Matrix
  attr_reader :matrix, :rows, :columns

  def initialize(matrix_string_representation)
    @matrix = convert_string_to_matrix(matrix_string_representation)
    @rows = matrix
    @columns = build_columns
  end

  def saddle_points
    saddles = []
    rows.each_with_index do |row, row_index|
      row.each_with_index do |number, column_index|
        break unless columns[column_index]
        if max_in_row?(number, row_index) && min_in_col?(number, column_index)
          saddles << [row_index, column_index]
        end
      end
    end
    saddles
  end

  private

  def convert_string_to_matrix(string_representation)
    string_representation.split("\n")
      .map { |number_row_string| number_row_string.split(/\s/) }
      .each { |number_row| number_row.map!(&:to_i) }
  end

  def build_columns
    matrix.each_with_index.map { |_, column| matrix.transpose[column] }
  end

  def max_in_row?(number, row_index)
    number == rows[row_index].max
  end

  def min_in_col?(number, column_index)
    number == columns[column_index].min
  end
end
