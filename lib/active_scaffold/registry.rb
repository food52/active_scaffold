module ActiveScaffold
  class Registry
    thread_mattr_accessor :current_user_proc, :current_ability_proc, :marked_records

    def self.user_settings
      @user_settings ||= {}
    end

    def self.constraint_columns
      @constraint_columns ||= Hash.new { |h, k| h[k] = [] }
    end

    def self.unauthorized_columns
      @unauthorized_columns ||= Hash.new { |h, k| h[k] = [] }
    end

    def self.cache(kind, key = nil, &block)
      unless key
        key = kind
        kind = :cache
      end
      @cache ||= {}
      cache = @cache[kind] ||= {}
      return cache[key] if cache.include? key
      cache[key] ||= yield
    end
  end
end
