require("minitest/autorun")
require_relative("../product.rb")

class TestProduct < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'name' => 'CSS: The Missing Manual',
      'description' => 'the book that should have been in the box',
      'isbn' => '978-1-491-91805-0',
      'date_published' => '01/06/2014',
      'current_stock' => 10,
      'minimum_stock' => 5,
      'trade_price' => 22.95,
      'retail_price' => 25.00
    }
      # 'publisher_id' => 1,
      # 'author_id' => 1,
      # 'genre_id' => 1}

      @product = Product.new(options)
  end

  def test_name()
    result = @product.name()
    assert_equal('CSS: The Missing Manual', result)
  end

  def test_description()
    result = @product.description()
    assert_equal('the book that should have been in the box', result)
  end

end
