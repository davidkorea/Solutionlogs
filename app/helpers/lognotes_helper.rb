module LognotesHelper

  def render_highlight_content(lognote,query_string)
    excerpt_cont = excerpt(lognote.caseid, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end


end
