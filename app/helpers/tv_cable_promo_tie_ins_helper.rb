module TvCablePromoTieInsHelper
  def select_options_tv_cable_promo_tie_in(obj)
    obj.all.map{|s| [s.description, s.description]}
  end
end
