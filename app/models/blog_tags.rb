module BlogTags
  include Radiant::Taggable

  tag 'blogtags' do |tag|
    tag.expand
  end

  desc "inserts a technorati tag to the current page"
  tag 'blogtags:technorati' do |tag|
    %{<a href="http://technorati.com/cosmos/search.html?url=#{page_uri('url',tag)}"><img src="/images/blogtags/technorati.gif" title="add to technorati"/></a>}
  end
  
  desc "inserts a delicious tag to the current page"
  tag 'blogtags:delicious' do |tag|
    %{<a href="http://del.icio.us/post?url=#{page_uri('url',tag)}&title=#{tag.render('title')}"><img src="/images/blogtags/delicious.gif" title="add to delicious"/></a>}
  end
  
  desc "inserts a digg tag to the current page"
  tag 'blogtags:digg' do |tag|
    %{<a href="http://digg.com/submit?phase=2&url=#{page_uri('url',tag)}"><img src="/images/blogtags/digg.gif" title="add to digg"/></a>}
  end
  
  desc "inserts a blinklist tag to the current page"
  tag 'blogtags:blinklist' do |tag|
    %{<a href="http://blinklist.com/index.php?Action=Blink/addblink.php&url=#{page_uri('url',tag)}"><img src="/images/blogtags/blinklist.gif" title="add to blinklist"/></a>}
  end
  
  desc "inserts a furl tag to the current page"
  tag 'blogtags:furl' do |tag|
    %{<a href="http://furl.net/storeIt.jsp?u=#{page_uri('url',tag)}&t=#{tag.render('title')}"><img src="/images/blogtags/furl.gif" title="add to furl"/></a>}
  end

  desc "inserts a reddit tag to the current page"
  tag 'blogtags:reddit' do |tag|
    %{<a href="http://reddit.com/submit?url=#{page_uri('url',tag)}&title=#{tag.render('title')}"><img src="/images/blogtags/reddit.gif" title="add to reddit"/></a>}
  end  
  
  def page_uri(url,tag)
    URI.escape(File.join(request.protocol,request.host,"#{tag.render('url')}"))
  end
end