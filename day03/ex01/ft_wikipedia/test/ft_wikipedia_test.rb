require "test_helper"

class FtWikipediaTest < Minitest::Test
  def test_directory
    assert_equal nil,
        Ft_wikipedia.new.search("directory")
  end

  def test_problem
    assert_equal nil,
      Ft_wikipedia.new.search("problem")
  end

  def test_Einstein
    assert_equal nil,
        Ft_wikipedia.new.search("Einstein")
  end

  def test_kiss
    assert_equal nil,
        Ft_wikipedia.new.search("kiss")
  end

  def test_matter
    assert_equal nil,
        Ft_wikipedia.new.search("matter")
  end
end
