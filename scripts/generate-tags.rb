require 'yaml'

POSTS_DIR = '_posts/'
TAGS_DIR = 'tags/'

Dir.foreach(POSTS_DIR) do |post|

  next if post == '.' or post == '..' or post == '.DS_Store'
  postYaml = YAML.load_file(POSTS_DIR + post)
  postYaml['tags'].each{|tag|

    unless File.exist?(TAGS_DIR + tag + '.html')

      puts('[+] Generating #' + tag + ' page')

      File.open(TAGS_DIR + tag + '.html', 'w') {|f| f.write(
      "---\nlayout: tag\nsection-type: tag\ntitle: " + tag + "\n---\n## Tag")}

    end
  }

end
