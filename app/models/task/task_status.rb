module Task
  class TaskStatus
    include ActiveModel::Model

    attr_accessor :status_code, :status_name

    DATA = [
      { status_code: "TODO", status_name: "未着手" },
      { status_code: "DOING", status_name: "着手中" },
      { status_code: "DONE", status_name: "完了" },
    ].freeze

    def self.all
      DATA.map { |data| self.new(data) }
    end
  end
end
