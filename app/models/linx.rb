class Linx < ApplicationRecord
	before_create :add_linx

  def self.valid?(linx)
    linx.instance_of?(String) && linx.starts_with?('0x') ## && linx.length == 34
  end

  def self.get(reference)
    if Linx.valid?(reference)
      begin
        find_by_linx(reference)
      rescue StandardError
        nil
      end
    else
      begin
        find(reference)
      rescue StandardError
        nil
      end
    end
  end

  def self.short_hash(long_hash, is_mobile = false)
    if long_hash.present?
      long_hash = long_hash.chars
      if is_mobile
        "#{long_hash.first(3).join}..#{long_hash.last(4).join}"
      else
        "#{long_hash.first(5).join}...#{long_hash.last(5).join}"
      end
    end
  end

  def self.format_linx(long_hash, is_mobile = false)
    if long_hash.present?
      if is_mobile
        long_hash = long_hash.chars
        "#{long_hash.first(3).join}..#{long_hash.last(4).join}"
      else
        long_hash
      end
    end
  end

  def self.format_date(ref_date, is_mobile = false, show_age = true)
    if ref_date.present?
      retval = ref_date.strftime('%m-%d-%Y').to_s
      unless is_mobile
        retval += " <i class='fa fa-clock-o'></i> #{ref_date.strftime('%I:%M %p')}"
        retval += " <br /> <small>#{Linx.age(ref_date)}</small>" if show_age
      end
      retval.html_safe
    end
  end

  def self.age(creation_date = created_at)
    _age = Time.diff(creation_date, Time.current, '%d, %h:%m hours ago')
    if (_age[:year]).positive?
      "#{_age[:year]} year+ ago"
    elsif (_age[:month]).positive?
      "#{_age[:month]} month+ ago"
    elsif (_age[:week]).positive?
      "#{_age[:week]} week+ ago"
    elsif (_age[:day]).zero? && (_age[:hour]).zero? && (_age[:minute]).zero?
      'seconds ago'
    elsif (_age[:day]).zero? && (_age[:hour]).zero?
      "#{_age[:minute]} minutes ago"
    elsif (_age[:day]).zero?
      "#{_age[:hour]} hours, #{_age[:minute]} minutes ago"
    else
      _age[:diff]
    end
  end

  private

  def add_linx
    unless linx.present?
      # if the user does not have a hash, try a new hash until it is unique
      self.linx = loop do
        _linx = "0x#{rand(19_999_000_000_000_000_000_000_000_000_000_000_000_000..99_999_999_999_999_999_999_999_999_999_999_999_999_999).to_s(16)}"[0,
                                                                                                                                                     34]
        break _linx unless Linx.exists?(linx: _linx)
      end
    end
  end
end
