module TextContent
  def word_count
    body.split.count
  end

  module ClassMethods
    def self.total_word_count
      all.inject(0) { |total, a| total += a.word_count }
    end
  end

  def self.included(including_class)
    including_class.extend ClassMethods
  end
end
