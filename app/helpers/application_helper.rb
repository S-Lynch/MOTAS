module ApplicationHelper
# Return a title on a per-page basis.
  def title
    base_title = "MOTAS"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

def logo
  image_tag("mot.png", :alt => "MOTAS App", :class => "round") #Rails default points to the public/images directory and uses teh blueprint CSS methods
end

def herokurails
  image_tag("Heroku-Ruby-Rails.jpg", :alt => "Heroku-Rails", :class => "round")
end