## I18n helper for Rails

A `Ruby` script that helps you internationalize your Rails app! This script 
reads `html.erb` files and outputs the hard-coded text in an en.yml-friendly format.

Its reads through all of the given `html.erb` files, parses them and
finds all of the nodes with hard-coded text. 

### Usage:
```sh
git clone git@github.com:Hammadk/rails_auto_i18n.git
gem install nokogiri

ruby rails_auto_i18n/lib/auto_i18n.rb <directory_with_html_erb_files>
```

### TODO
1. Implement the --tag option, that outputs the rails translate method after
   the yml text output. 
2. Implement the --replace option, that replaces the hard-coded text in your view
files with the i18n tag in a translate method. I.e. `<% t(".unique_tag") %>`
3. Write tests (Currently only tested on dummy app)

### Known Limitations:
* The extraction of text isn't perfect, and requires someone to examine the
  output for oddities.
* The unique identifiers are unique, but they are not the very readable.
  Ideally, someone should go over them and replace them with human-readable
  identifiers.


### External Dependencies:
* [NokoGiri](http://nokogiri.org/)

