$LOAD_PATH.unshift(File.dirname(__FILE__))
require "rubygems"
require "nokogiri"
require "helper_modules/uniquify_id"
require "helper_modules/yml_path_finder"

# Usage: ruby i18n_helper <directory_with_views>
module I18NHelper
  extend UniquifyID
  extend YMLPathFinder

  BLACK_LIST = %w[ script ]

  def self.parse_views(views_dir)
    all_view_files = Dir.glob(File.join(views_dir, "**", "*.html.erb"))
    all_view_files.each do |file|

      yml_path = find_yml_path(file)
      indentation = output_and_indent(yml_path)

      repeated_ids_in_file = {}

      doc = Nokogiri::HTML(open(file))
      doc.search("//text()").each do |node|
        next if filtered_out?(node)

        unique_id = determine_id(node, repeated_ids_in_file)
        puts "#{indentation}#{unique_id}: #{node.text.strip}"
      end
    end
  end

  def self.output_and_indent(yml_path)
    indentation = ""
    yml_path.each do |id|
      puts "#{indentation}#{id}\n"
      indentation << "  "
    end
    indentation
  end

  def self.determine_id(node, repeated_ids_in_file)
    if node.parent.attributes["id"]
      id_name= node.parent.attributes["id"].value
      uniquify_id(id_name, repeated_ids_in_file)
    elsif node.parent.attributes["value"]
      value = node.parent.attributes["value"].value
      uniquify_id(value, repeated_ids_in_file)
    else
      first_word = node.text.split(' ')[0]
      uniquify_id(first_word, repeated_ids_in_file)
    end
  end

  def self.filtered_out?(node)
    (node.text !~ /\w/) or
    (BLACK_LIST.include? node.parent.name) or
    (node.text.match(/^{%.*/)) or
    (node.text.match(/^\d+$/))
  end

end

# input_param = "../test/dummy_app/app/views"
input_param = ARGV[0]
I18NHelper.parse_views(input_param)

