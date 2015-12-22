module OohClosingTimesHelper
  def fetch_table_header(tb)
    @ooh_closing_time.table_cells.map(&"table_#{tb}".to_sym).map(&tb.to_sym).uniq.join('`')
  end
end