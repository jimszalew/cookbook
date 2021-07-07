module Sorter

  def sorts(searches, params)
    # byebug
    if params['crit_asc'] == 'true'
      searches.order('criteria')
    elsif params['updated_desc'] == 'true'
      searches.reverse
    else
      searches
    end
  end
  
  # def sort_params(params)
  #   if params['crit_asc'] == 'true'
  #     'criteria'
  #   elsif params['updated_desc'] == 'true'
  #     ''
  #   else
  #     'updated_at'
  #   end
  # end
end