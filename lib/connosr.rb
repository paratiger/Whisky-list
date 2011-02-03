require 'hpricot'
require 'open-uri'

class Connosr
  @@cabinet_url = "http://www.connosr.com/members/paratiger/cabinet/"
  
  def initialize
    # Scrap page, check pagination and repeat
    doc = open(@@cabinet_url) { |f| Hpricot(f) } rescue nil
    unless doc.blank?
      # pagination
      pages = 1
      pagination = (doc/"div.pg-top a") rescue nil
      pages = pagination[pagination.length-2].innerHTML.to_i rescue 0 unless pagination.blank?
      
      (1..pages).each do |page|
        # Load next page if required
        doc = open(@@cabinet_url + "?cabinet=#{page}") { |f| Hpricot(f) } rescue nil if page > 1
        unless doc.blank?
          list = (doc/"ul.list-detail li") rescue nil
          unless list.blank?
            list.each do |w|
              title = w.at("h2 span").innerHTML
              unless whisky = Whisky.find(:first, :conditions => {:title => title}) rescue nil
                whisky = Whisky.new
              end
              whisky.title = title
              whisky.url = w.at("a").attributes["href"]
              whisky.rating = w.at("p.score-box").innerHTML.to_i unless w.at("p.score-box").blank?
              # TODO: Store images locally
              whisky.image_url = w.at("img").attributes["src"] unless w.at("img").blank?
              
              # Distillery and Whisky details
              unless whisky.url.blank?
                detail_doc = open(whisky.url) { |f| Hpricot(f) } rescue nil
                unless detail_doc.blank?
                  detail_list = (detail_doc/"ul.inline-list li") rescue nil
                  unless detail_list.blank?
                    whisky_details = []
                    detail_list.each do |detail|
                      next unless (detail/"a").blank?
                      whisky_details << detail.innerHTML
                    end
                    whisky.body = "<p>#{whisky_details.join('<br />')}</p>" unless whisky_details.blank?
                    
                    # Distillery
                    dist_list = (detail_doc/"ul.inline-list li").at("a") rescue nil
                    unless dist_list.blank?
                      dist_title = dist_list.innerHTML
                      dist_url = dist_list.attributes["href"]
                      latlong = (detail_doc/"span#map-latlon").innerHTML.split(",") rescue [0,0]
                      unless distillery = Distillery.find(:first, :conditions => {:title => dist_title}) rescue nil
                        distillery = Distillery.create(:title => dist_title, :lat => latlong[0], :lng => latlong[1], :url => dist_url)
                      end
                      whisky.distillery = distillery
                    end
                  end
                end
              end
              
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
  end
  
end