module Sorter

  def sorts(searches, params)

    if params['crit_asc'] == 'true'
      searches.order('criteria')
    elsif params['updated_desc'] == 'true'
      searches.reverse
    else
      searches
    end
  end
end