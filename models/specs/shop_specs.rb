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

  def test_isbn()
    result = @product.isbn()
    assert_equal('978-1-491-91805-0', result)
  end

  def test_date_published()
    result = @product.date_published()
    assert_equal('01/06/2014', result)
  end

  def test_current_stock()
    result = @product.current_stock()
    assert_equal(10, result)
  end

  def test_minimum_stock()
    result = @product.minimum_stock()
    assert_equal(5, result)
  end

  def test_trade_price()
    result = @product.trade_price()
    assert_equal(22.95, result)
  end

  def test_retail_price()
    result = @product.retail_price()
    assert_equal(25.00, result)
  end

end
