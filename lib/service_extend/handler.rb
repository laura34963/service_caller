module ServiceExtend
  module Handler

    def call
      if defined?(::Rails::Engine) && defined?(::ActiveRecord)
        begin
          super
        rescue ServiceError => e
          @error = e
        rescue ActiveRecord::RecordNotFound => e
          @error = ServiceError.new(:record_not_found, error_msg: e.message)
          @error.set_backtrace(e.backtrace)
        rescue Exception => e
          @error = ServiceError.generate_from_exception(e)
        end
      else
        begin
          super
        rescue ServiceError => e
          @error = e
        rescue Exception => e
          @error = ServiceError.generate_from_exception(e)
        end
      end
    end

  end
end
