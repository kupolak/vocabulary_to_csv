# frozen_string_literal: true

require_relative "vocabulary_to_csv/version"

require "nokogiri"
require "open-uri"
require "csv"

# Interface to interact with vocabulary.com
class VocabularyToCsv
  def initialize(id)
    @id = id
    @url = "https://www.vocabulary.com/lists/#{id}"
  end

  def parse_and_save_to_csv(examples: true)
    words = scrape_words
    definitions = scrape_definitions
    examples_data = examples ? scrape_examples : Array.new(words.size, "")

    write_to_csv(words, definitions, examples_data)
  end

  private

  def scrape_words
    page.css("a.word").map { |word| word.text.strip }
  end

  def scrape_definitions
    page.css("div.definition").map { |definition| definition.text.strip }
  end

  def scrape_examples
    page.css("div.example").map { |example| example.text.strip.gsub(/[^[:print:]]/, "").gsub("â", "") }
  end

  def write_to_csv(words, definitions, examples, include_examples_header: true)
    words_definitions_examples = words.zip(definitions, examples)

    CSV.open("#{@id}.csv", "w") do |csv|
      csv << (%w[Word Definition] + (include_examples_header ? ["Example"] : []))

      words_definitions_examples.each do |word, definition, example|
        csv << ([word, definition] + (include_examples_header ? [example] : []))
      end
    end
  end

  def page
    @page ||= Nokogiri::HTML(URI.parse(@url).open)
  end
end
