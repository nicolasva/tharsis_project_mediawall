class DropViewStatistiques < ActiveRecord::Migration
  def self.up
  	drop_view :stat_widgetids
	drop_view :stat_widgetserials
	drop_view :stat_widgetdates
	drop_view :stat_serials
	drop_view :stat_widgetserialsessions
	drop_view :stat_widgetnames
	drop_view :stat_mediasessions
	drop_view :stat_mediasessiondates
	drop_view :stat_widgetidusers
	drop_view :stat_widgetusersessionids
	drop_view :stat_widgetusersessionserials
	drop_view :stat_widgetusertimes
	drop_view :stat_widgettotalusers
	drop_view :stat_widgettotalusersapps
  end
end
