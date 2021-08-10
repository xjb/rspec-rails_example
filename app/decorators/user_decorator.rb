# frozen_string_literal: true

module UserDecorator
  def name_addr
    "#{name}<#{email}>"
  end
end
