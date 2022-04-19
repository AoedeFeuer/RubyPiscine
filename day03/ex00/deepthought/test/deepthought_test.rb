require "test_helper"

class DeepthoughtTest < Minitest::Test
  
  def test_return_object
    assert_equal Deepthought,
        Deepthought.new.class
  end

  def test_main_question
    assert_equal "42",
        Deepthought.new.respond("The Ultimate Question of Life, the Universe and Everything")
  end

  def test_other_question
    assert_equal "Mmmm i'm bored",
        Deepthought.new.respond("Who am I")
  end

  def test_language_question
    assert_equal "Mmmm i'm bored",
        Deepthought.new.respond("Как дела")
  end
end
