module ActiveRecord::Scoping::Named
  module ClassMethods
    def all_or_some(*ids)
      if ids.compact.present?
        where(id: ids)
      else
        all
      end
    end
  end
end
