module Jekyll
  class RawContent < Generator
    def generate(site)
      site.posts.each do |post|
        tmp = post.content
        tmp.gsub!(/\{% include JB\/setup %}/,'')
        post.data['raw_content'] = tmp
      end
    end
  end
end