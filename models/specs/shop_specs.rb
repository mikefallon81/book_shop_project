require("minitest/autorun")
require_relative("../product.rb")
require_relative("../genre.rb")
require_relative("../author.rb")
require_relative("../publisher.rb")

class TestProduct < MiniTest::Test

  def setup

    publisher_options = {
      'name' => 'Chapman Publishing Ltd',
      'street' => '4 Broughton Place',
      'city' => 'Edinburgh',
      'phone' => '0131 557 2207',
      'email' => 'chapman-pub@blueyonder.co.uk'
      }

    @publisher = Publisher.new(publisher_options)

    author_options = {
      'first_name' => 'Irvine',
      'last_name' => 'Welsh'
    }

    @author = Author.new(author_options)

    genre_options = {
      'id' => 1,
      'genre_type' => 'fiction'
    }

    @genre = Genre.new(genre_options)

    product_options = {
      'id' => 1,
      'name' => 'CSS: The Missing Manual',
      'description' => 'the book that should have been in the box',
      'isbn' => '978-1-491-91805-0',
      'date_published' => '01/06/2014',
      'current_stock' => 10,
      'minimum_stock' => 5,
      'trade_price' => 22.95,
      'retail_price' => 25.00,
      'publisher_id' => '1',
      'author_id' => '1',
      'genre_id' => '1'
    }
      @product = Product.new(product_options)


  end

  def test_name()
    assert_equal('CSS: The Missing Manual', @product.name)
  end

  def test_description()
    assert_equal('the book that should have been in the box', @product.description)
  end

  def test_isbn()
    assert_equal('978-1-491-91805-0', @product.isbn)
  end

  def test_date_published()
    assert_equal('01/06/2014', @product.date_published)
  end

  def test_current_stock()
    assert_equal(10, @product.current_stock)
  end

  def test_minimum_stock()
    assert_equal(5, @product.minimum_stock)
  end

  def test_trade_price()
    assert_equal(22.95, @product.trade_price)
  end

  def test_retail_price()
    assert_equal(25.00, @product.retail_price)
  end

  def test_genre_type
    assert_equal('fiction', @genre.genre_type)
  end

  def test_author_first_name
    assert_equal('Irvine', @author.first_name)
  end

  def test_author_last_name
    assert_equal('Welsh', @author.last_name)
  end

  def test_publisher_name
    assert_equal('Chapman Publishing Ltd', @publisher.name)
  end

  def test_publisher_street
    assert_equal('4 Broughton Place', @publisher.street)
  end

  def test_publisher_city
    assert_equal('Edinburgh', @publisher.city)
  end

  def test_publisher_phone_no
    assert_equal('0131 557 2207', @publisher.phone)
  end

  def test_publisher_email
    assert_equal('chapman-pub@blueyonder.co.uk', @publisher.email)
  end

  def test_formatted_name
    assert_equal('Irvine Welsh', @product.format_name)
  end


end
