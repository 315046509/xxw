module ApplicationHelper
  def my_datetime_format(datetime)
    datetime.strftime(" %Y/%m/%d %H:%M:%S")
  end
end
