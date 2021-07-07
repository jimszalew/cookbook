module Sorter

  def sorts(searches, params)
    case params['order']
    when 'crit_asc'
      searches.order('criteria')
    when 'updated_desc'
      searches.reverse
    else
      searches
    end
  end
end