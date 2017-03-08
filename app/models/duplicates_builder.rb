class DuplicatesBuilder
  def initialize(data)
    @data = data
  end

  def build
    duplicates
  end

  private



  def words_with_indexes(array_of_duplicates)
    @data.each_with_index { |val, idx| (array_of_duplicates[val] ||= []) << idx }
  end

  def delete_unrepeated(array_of_duplicates)
    array_of_duplicates.delete_if {|k,v| v.size == 1}
  end

  def format_to_word_and_positions(array_of_duplicates)
    array_of_duplicates.map { |k, v| { word: k, positions: v } }
  end

  def word_and_positions(array_of_duplicates)
    words_with_indexes(array_of_duplicates)
    delete_unrepeated(array_of_duplicates)
    format_to_word_and_positions(array_of_duplicates)
  end

  def duplicates
    return  [] if !@data
    array_of_duplicates = {}
    word_and_positions(array_of_duplicates)
  end
end
