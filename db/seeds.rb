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

publisher3 = Publisher.new({
  'name' => 'Vintage',
  'street' => '80 Strand',
  'city' => 'London',
  'phone' => '0207 139 3000',
  'email' => 'customersupport@penguinrandomhouse.co.uk'
  })

  publisher4 = Publisher.new({
    'name' => 'Ebury Press',
    'street' => '80 Strand',
    'city' => 'London',
    'phone' => '0207 139 3000',
    'email' => 'customersupport@penguinrandomhouse.co.uk'
    })


publisher1.save()
publisher2.save()
publisher3.save()
publisher4.save()

genre1 = Genre.new({
  'genre_type' => 'Technical'
  })

genre2 = Genre.new({
  'genre_type' => 'Humourous Fiction'
  })

genre3 = Genre.new({
  'genre_type' => 'Horror'
  })

genre4 = Genre.new({
  'genre_type' => 'Memoirs'
  })

genre5 = Genre.new({
  'genre_type' => 'Sports'
  })

genre1.save()
genre2.save()
genre3.save()
genre4.save()
genre5.save()



author1 = Author.new({
  'first_name' => 'David',
  'last_name' => 'McFarland'
  })

author2 = Author.new({
  'first_name' => 'Irvine',
  'last_name' => 'Welsh'
  })

author3 = Author.new({
  'first_name' => 'Michael',
  'last_name' => 'Connolly'
  })

author4 = Author.new({
  'first_name' => 'Stephen',
  'last_name' => 'King'
  })

author5 = Author.new({
  'first_name' => 'Peter',
  'last_name' => 'Crouch'
  })

author6 = Author.new({
  'first_name' => 'Michelle',
  'last_name' => 'Obama'
  })

author1.save()
author2.save()
author3.save()
author4.save()
author5.save()
author6.save()





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

  product3 = Product.new({
    'name' => 'Trainspotting',
    'description' => 'Choose us. Choose life. Choose mortgage payments; choose washing machines; choose cars; choose sitting oan a couch watching mind-numbing and spirit-crushing game shows, stuffing fuckin junk food intae yir mooth. Choose rotting away, pishing and shiteing yersel in a home, a total fuckin embarrassment tae the selfish, fucked-up brats ye\'ve produced. Choose life.</br>',
    'isbn' => '978-0099465898',
    'date_published' => '11/07/1994',
    'current_stock' => 10,
    'minimum_stock' => 5,
    'trade_price' => 6.00,
    'retail_price' => 8.00,
    'publisher_id' => publisher3.id,
    'author_id' => author2.id,
    'genre_id' => genre2.id
    })

    product4 = Product.new({
      'name' => 'The Blade Artist',
      'description' => 'Jim Francis has finally found the perfect life – and is now unrecognisable, even to himself. A successful painter and sculptor, he lives quietly with his wife, Melanie, and their two young daughters, in an affluent beach town in California. Some say he’s a fake and a con man, while others see him as a genuine visionary.

      But Francis has a very dark past, with another identity and a very different set of values. When he crosses the Atlantic to his native Scotland, for the funeral of a murdered son he barely knew, his old Edinburgh community expects him to take bloody revenge. But as he confronts his previous life, all those friends and enemies – and, most alarmingly, his former self – Francis seems to have other ideas.

      When Melanie discovers something gruesome in California, which indicates that her husband’s violent past might also be his psychotic present, things start to go very bad, very quickly.

      The Blade Artist is an elegant, electrifying novel – ultra violent but curiously redemptive – and it marks the return of one of modern fiction’s most infamous, terrifying characters, the incendiary Francis Begbie from Trainspotting.</br>',


      'isbn' => '978-1784700553',
      'date_published' => '06/04/2017',
      'current_stock' => 10,
      'minimum_stock' => 5,
      'trade_price' => 6.00,
      'retail_price' => 8.00,
      'publisher_id' => publisher3.id,
      'author_id' => author2.id,
      'genre_id' => genre2.id
      })

      product5 = Product.new({
        'name' => 'I, Robot: How to Be a Footballer, Book 2t',
        'description' => 'What happens on the pitch is only half the story.<br>
        Being a footballer is not just kicking a ball about with 21 other people on a big grass rectangle. Sometimes being a footballer is about accidentally becoming best mates with Mickey Rourke, or understanding why spitting is considered football\'s most heinous crime.<br>
        In How to be a Footballer, Peter Crouch took us into a world of bad tattoos and even worse haircuts, a world where you\'re on the pitch one minute, spending too much money on a personalised number plate the next. In I, Robot, he lifts the lid even further on the beautiful game. We will learn about Gareth Bale\'s magic beans, the Golden Rhombus of Saturday night entertainment, and why Crouchy\'s dad walks his dog wearing an England tracksuit from 2005.<br>
        Whether you\'re an armchair expert, or out in the stands every Saturday, crazy for five-a-side or haven\'t put on a pair of boots since school, this is the real inside story of how to be a footballer.</br>',


        'isbn' => '978-1529104615',
        'date_published' => '17/10/2019',
        'current_stock' => 10,
        'minimum_stock' => 5,
        'trade_price' => 12.00,
        'retail_price' => 15.00,
        'publisher_id' => publisher3.id,
        'author_id' => author5.id,
        'genre_id' => genre5.id
        })

product1.save()
product2.save()
product3.save()
product4.save()
product5.save()


binding.pry
nil
