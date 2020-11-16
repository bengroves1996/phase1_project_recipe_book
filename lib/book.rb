

class Book
    attr_accessor :title, :readyInMinutes, :sourceUrl
    def initialize(title,readyInMinutes,sourceUrl)
        @title = title
        @readyInMinutes = readyInMinutes
        @sourceUrl = sourceUrl
    end


end