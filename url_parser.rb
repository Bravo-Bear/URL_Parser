class UrlParser
    attr_reader :url, :scheme, :domain, :fragment_id
    def initialize(url)
        @url = url
        @scheme = @url.split(":").first
        @domain =  @url.split("/")[2].split(":").first 
        @fragment_id =  @url.split("#").last
    end
    def port
        if @url.split("/")[2].include? ":"
          @url.split("/")[2].split(":").last 
        elsif  @scheme == "https"
          "443"
        elsif @scheme == "http"
          "80"
        end
    end
    def path
        if url.include? "/?"
            nil
        else
            @url.split("?").first.split("/").last
        end
    end
    def query_string
        hash = @url.split("?").last.split("#").first.split("&").map! do |q|
          q.split("=")
        end
        hash.to_h
    end
end