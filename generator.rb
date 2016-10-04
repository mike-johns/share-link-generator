# Twitter Link Generator

def get_comment
  puts "Enter your comment:"
  comment_result = gets.chomp!
  @comment = comment_result.gsub(/[\s]/, "%20")
end

def get_url
  puts "Paste the URL to share:"
  @url = gets.chomp!
end

def get_source
  puts "Twitter account to credit. Hit RETURN to skip."
  source_acct = gets.chomp!
  if source_acct != ""
    if source_acct[0] == "@"
      @source = "%20(@#{source_acct.slice!(1..-1)})"
    else
      @source = "%20(@#{source_acct})"
    end
  else
    @source = ""
  end
end

def build_link
  @message = "https://twitter.com/intent/tweet?text=#{@comment}#{@source}&url=#{@url}"
end

# Start CLI

get_url
get_comment
get_source
build_link

puts "\nHere's your link:\n\n#{@message}"
