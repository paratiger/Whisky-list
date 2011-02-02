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
          unless whisky = Whisky.find(:first, :conditions => {:title => title}) rescue nil
            whisky = Whisky.new(:distillery_id => 1)
          end
          whisky.title = title
          whisky.url = w.at("a").attributes["href"]
          whisky.rating = w.at("p.score-box").innerHTML.to_i unless w.at("p.score-box").blank?
          whisky.image_url = w.at("img").attributes["src"] unless w.at("img").blank?
          if whisky.save
            puts "Saved: #{title}"
          else
            puts "Failed: #{title} - #{whisky.errors}"
          end
        end
      end
    end
  end
  
end