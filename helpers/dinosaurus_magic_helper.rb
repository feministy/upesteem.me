helpers do
  class DinosaurusMagic
    attr_reader :key, :are, :value

    def initialize(key, params)
      @key = key
      @value = params[key]
      lookup_words
      pick_words_for_are
    end

    def lookup_words
      @words = Dinosaurus.synonyms_of(@value)
    end

    def pick_words_for_are
      @are = @words.sample(4).join(", ")
    end

    def happy
      random = ["awesome", "superb", "great", "pretty", "funny"]
      @happy = Dinosaurus.synonyms_of(random.sample).sample(3).join(", ")
    end
  end
end