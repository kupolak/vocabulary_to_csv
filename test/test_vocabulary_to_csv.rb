# frozen_string_literal: true

require "test_helper"

class TestVocabularyToCsv < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::VocabularyToCsv::VERSION
  end

  def test_download
    vocabulary = VocabularyToCsv.new("271244")
    result = vocabulary.parse_and_save_to_csv

    assert result
    assert_equal result.count, 40
    assert_equal result.first.count, 3
  end
end
