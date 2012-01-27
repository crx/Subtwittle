module TweetFilter
  STOPWORDS = YAML.load_file('lib/stopwords.yml').to_set
  
  def filter_tweet(text)
    # should account for words with adjacent punctuation
    words = text.split(/\s/)
    words.reject! {|w| w[0] == '#' || !w.scan(/^http(s?):\/\//).empty? || STOPWORDS.member?(w.downcase) }
    words.join ' '
  end
end