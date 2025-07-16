class Task < ApplicationRecord
  VALID_STATUSES = %w[in_progress overdue completed canceled]

  validates :status, inclusion: { in: VALID_STATUSES }

  before_save :check_due_date

  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_title, ->(title) { where("title ILIKE ?", "%#{title}%") if title.present? }
  scope :by_description, ->(desc) { where("description ILIKE ?", "%#{desc}%") if desc.present? }
  scope :by_created_at, ->(date) { where("DATE(created_at) = ?", date) if date.present? }
  scope :by_due_date, ->(date) { where(due_date: date) if date.present? }

  def in_progress?
    status == "in_progress"
  end

  def completed?
    status == "completed"
  end

  private

  def check_due_date
    return unless due_date.present?
    return unless in_progress? && due_date < Date.today

    self.status = "overdue"
  end
end
