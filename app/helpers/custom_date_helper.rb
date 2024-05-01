module CustomDateHelper
  def custom_date_select(object_name, method, options = {start_year: Time.now.year, end_year: 1930}, html_options = {})
    default_options = {
      use_month_numbers: true,
      prompt: {
        day: '--',
        month: '--',
        year: '--'
      },
      start_year: options[:start_year],
      end_year: options[:end_year],
    }
    date_select(object_name, method, default_options.merge(options), html_options)
  end
end