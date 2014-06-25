## I18n helper for Rails

A `Ruby` script that helps you internationalize your Rails app! This script 
reads `html.erb` files and outputs the hard-coded text in en.yml-friendly format.

Its reads through all of the `html.erb` files, parses them with `Nokogiri`, and
find all of the nodes with hard-coded text in them. 

Usage: `ruby lib/auto_i18n.rb <directory_with_html_erb_files>`


### TODO
1. Implement the --tag option, that outputs the rails translate method after
   the yml text output. 
2. Implement the --replace option, that replaces the hard-coded text in your view
files with the i18n tag in a translate method. I.e. `<% t(".unique_tag") %>`
3. Write tests (Currently only tested on dummy app)

### Known Limitations:
* The extraction of text isn't perfect, and requires someone to look over the
  output for oddities.
* The unique identifiers are unique, but they are not the very readable.
  Ideally, someone should go over them and replace them with human-friendly
  identifiers.


### External Dependencies:
* NokoGiri

