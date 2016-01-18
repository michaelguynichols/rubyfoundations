class PigLatin
  def self.translate(phrase)
    split_phrase = phrase.split
    final_phrase = []

    split_phrase.each do |word|
      if /\A[aeiou]+/.match(word.downcase).to_s != '' || word.start_with?('xr') || word.start_with?('yt')
        final_phrase << word + 'ay'
      elsif /\A[^aeiou]+/.match(word.downcase).to_s.end_with?('q')
        final_phrase << word.slice(find_index(word) + 1..word.size - 1) + /\A[^aeiou]+/.match(word.downcase).to_s + 'uay'
      else
        final_phrase << word.slice(find_index(word)..word.size - 1) + /\A[^aeiou]+/.match(word.downcase).to_s + 'ay'
      end
    end

    if final_phrase.size > 1
      return final_phrase.join(' ')
    end

    final_phrase.join
  end

  def self.find_index(word)
    word =~ /[aeiou]/
  end
end
