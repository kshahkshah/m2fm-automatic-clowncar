require 'mail2frontmatter'

module Mail2FrontMatter
  class AutomaticClowncar < PreProcessor
    require 'nokogiri'
    require 'fileutils'

    def self.run(metadata, body)

      parsed_body = Nokogiri::HTML.parse(body)

      metadata[:attachments].each_pair do |id, data|
        # get element
        element = parsed_body.elements.xpath("//*[@src='cid:#{id}']")

        namespaced_directory = @options[:namespace_directory] || 'photos'

        # ensure directory exists...
        FileUtils.mkdir_p(File.join(Dir.pwd, 'source', namespaced_directory))

        # set destination for the file
        destination = File.join(Dir.pwd, 'source', namespaced_directory, data[:filename])

        # move it
        FileUtils.mv(data[:filepath], destination)

        # update the metadata with the new location
        data[:filepath] = File.join(destination, data[:filename])

        # replace the element
        body.gsub!(element.to_s, "<%= automatic_clowncar_tag '#{namespaced_directory}/#{data[:filename]}' %>")
      end

      return metadata, body
    end
  end
end
