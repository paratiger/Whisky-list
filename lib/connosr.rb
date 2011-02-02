require 'hpricot'
require 'open-uri'

class Connosr
  @@cabinet_url = "http://www.connosr.com/members/paratiger/cabinet/"
  
  def initialize
    # Scrap page, check pagination and repeat
    doc = open(@@cabinet_url) { |f| Hpricot(f) } rescue nil
    unless doc.blank?
      list = (doc/"ul.list-detail li") rescue nil
      unless list.blank?
        list.each do |w|
          title = w.at("h2 span").innerHTML
          url = w.at("a").attributes["href"]
          unless whisky = Whisky.find(:first, :conditions => {:title => title}) rescue nil
            whisky = Whisky.new(:distillery_id => 1)
          end
          whisky.title = title
          whisky.url = url
          if whisky.save
            puts "Saved: #{title}"
          else
            puts "Failed: #{title}"
          end
        end
      end
    end
  end
  
end