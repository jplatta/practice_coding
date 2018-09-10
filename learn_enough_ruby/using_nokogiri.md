# Some Notes on Nokogiri Gem

```ruby
>> require 'nokogiri'
>> html = '<p>lorem<sup class="reference">1</sup></p><p>ipsum</p>'
>> doc = Nokogiri::HTML(html)
=> #<Nokogiri::HTML::Document:0x3fd87e023b18...

>> doc.css('p')
=> [#<Nokogiri::XML::Element:0x3fd87e022664 name="p"...
>> doc.css('p').length
=> 2
>> doc.css('p')[0].content
=> "lorem1"

>> doc.css('.reference')
=> [#<Nokogiri::XML::Element:0x3fd87e04d60c name="sup"...
>> doc.css('.reference').length
=> 1

#Removing DOM elements
>> doc.css('.reference').each { |reference| reference.remove }

#Mapping paragraph content
>> doc.css('p').map { |paragraph| paragraph.content }
=> ["lorem", "ipsum"]

```