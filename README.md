# vocabulary_to_csv

`vocabulary_to_csv` is a Ruby gem designed for extracting vocabulary lists from Vocabulary.com and saving the data into a CSV file. It employs the Nokogiri gem for web scraping.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add vocabulary_to_csv

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install vocabulary_to_csv

## Usage

````ruby
require 'vocabulary_to_csv'

# Create an instance of VocabularyToCSV
# Pass the vocabulary list ID
parser = VocabularyToCsv.new('271244')

# Parse and save data to CSV (Examples column included by default)
parser.parse_and_save_to_csv(examples: true)
````

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kupolak/vocabulary_to_csv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kupolak/vocabulary_to_csv/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Make sure to comply with Vocabulary.com's terms of service when using this gem for web scraping.
The gem assumes you are providing a valid vocabulary list ID as an argument. The use of a complete URL is not officially supported and may lead to unexpected behavior. 
The gem may not work correctly if Vocabulary.com's website structure changes.
## Code of Conduct

Everyone interacting in the VocabularyToCsv project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kupolak/vocabulary_to_csv/blob/main/CODE_OF_CONDUCT.md).
