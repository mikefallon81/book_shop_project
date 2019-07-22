require_relative('../models/product.rb')
require_relative('../models/author.rb')
require_relative('../models/publisher.rb')
require_relative('../models/genre.rb')
require('pry-byebug')

Genre.delete_all()
Publisher.delete_all()
Product.delete_all()
Author.delete_all()

publisher1 = Publisher.new({
  'name' => 'Chapman Publishing Ltd',
  'street' => '4 Broughton Place',
  'city' => 'Edinburgh',
  'phone' => '0131 557 2207',
  'email' => 'chapman-pub@blueyonder.co.uk'
  })


publisher2 = Publisher.new({
  'name' => 'Penguin',
  'street' => '80 Strand',
  'city' => 'London',
  'phone' => '0207 139 3000',
  'email' => 'customersupport@penguinrandomhouse.co.uk'
  })

publisher1.save()
publisher2.save()


author1 = Author.new({
  'first_name' => 'David',
  'last_name' => 'McFarland'
  })

author2 = Author.new({
  'first_name' => 'Irvine',
  'last_name' => 'Welsh'
  })

author1.save()
author2.save()

genre1 = Genre.new({
  'genre_type' => 'Technical'
  })

genre2 = Genre.new({
  'genre_type' => 'Humourous Fiction'
  })

genre1.save()
genre2.save()

product1 = Product.new({
  'name' => 'CSS: The Missing Manual',
  'description' => 'the book that should have been in the box',
  'isbn' => '978-1-491-91805-0',
  'date_published' => '01/06/2014',
  'current_stock' => 10,
  'minimum_stock' => 5,
  'trade_price' => 22.95,
  'retail_price' => 25.00,
  'publisher_id' => publisher1.id,
  'author_id' => author1.id,
  'genre_id' => genre1.id
  })

product2 = Product.new({
  'name' => 'Dead Mens Trousers',
  'description' => 'Mark Renton is finally a success. An international jet-setter, he now makes significant money managing DJs, but the constant travel, airport lounges, soulless hotel rooms and broken relationships have left him dissatisfied with his life. He’s then rocked by a chance encounter with Frank Begbie, from whom he’d been hiding for years after a terrible betrayal and the resulting debt. But the psychotic Begbie appears to have reinvented himself as a celebrated artist and – much to Mark’s astonishment – doesn’t seem interested in revenge.</br>

Sick Boy and Spud, who have agendas of their own, are intrigued to learn that their old friends are back in town, but when they enter the bleak world of organ-harvesting, things start to go so badly wrong. Lurching from crisis to crisis, the four men circle each other, driven by their personal histories and addictions, confused, angry – so desperate that even Hibs winning the Scottish Cup doesn’t really help. One of these four will not survive to the end of this book. Which one of them is wearing Dead Men’s Trousers?</br>

Fast and furious, scabrously funny and weirdly moving, this is a spectacular return of the crew from Trainspotting.',
  'isbn' => '978-1787330771',
  'date_published' => '29/03/2018',
  'current_stock' => 10,
  'minimum_stock' => 5,
  'trade_price' => 8.00,
  'retail_price' => 13.00,
  'publisher_id' => publisher2.id,
  'author_id' => author2.id,
  'genre_id' => genre2.id
  })

product1.save()
product2.save()


binding.pry
nil
