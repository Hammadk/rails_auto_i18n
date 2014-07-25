module YMLPathFinder
  def find_yml_path(file_path)
      yml_path = ["en"]

      # Add file path, after the /views folder to unique identifier
      sub_directories = File.dirname(file_path).split("/")
      index_after_views = sub_directories.find_index("views") + 1
      unless index_after_views == sub_directories.length
        yml_path << sub_directories[index_after_views...sub_directories.length]
      end
      yml_path.flatten!

      #Find unique ID for file
      base_name = File.basename(file_path, ".html.erb")
      base_name = base_name[1..-1] if base_name.start_with?("_")
      yml_path << base_name

      yml_path.map! {|item| item << ":"}
  end
end
