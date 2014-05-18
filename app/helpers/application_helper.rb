module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = @website.name
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def cms_full_title(page_title)
    base_title = "Nikofe"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
