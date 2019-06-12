class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :from_date, lambda {|date, date_field="created_at"|
    date = DateTime.parse(date) rescue nil if date.class == String
    self.where("#{self.table_name}.#{date_field} >= ?", date) if date.present? and column_names.include? 'created_at'
    # self.where("#{self.table_name}.#{date_field} >= ?", date.beginning_of_day) if date.present? and column_names.include? 'created_at'
  }

  scope :to_date, lambda {|date, date_field="created_at"|
    date = DateTime.parse(date) rescue nil if date.class == String
    self.where("#{self.table_name}.#{date_field} <= ?", date) if date.present? and column_names.include? 'created_at'
    # self.where("#{self.table_name}.#{date_field} <= ?", date.end_of_day) if date.present? and column_names.include? 'created_at'
  }

  scope :between_dates, lambda {|start_date, end_date, date_field="created_at"|
    self.from_date(start_date, date_field).to_date(end_date, date_field)
  }
end
