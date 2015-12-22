module ContentTypesHelper

  # regenerate the sequence number on next page selection
  def pagination_seq(page)
    ContentType.per_page * page.to_i
  end

  # get page number
  def page_count(page)
    (page.nil? || page == '1') ? 0 : (page.to_i - 1)
  end

end

