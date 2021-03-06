class Attendance < ApplicationRecord
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum:5 }
  
  validate :finished_at_is_invalid_without_a_started_at, on: :hoge
  validate :started_at_at_is_invalid_without_a_fnished_at, on: :hoge
  validate :started_at_than_finished_at_fast_if_invalid, on: :hoge
  
  def finished_at_is_invalid_without_a_started_at
      errors.add(:started_at, "が必要です(編集時にはセットで入力してください)") if started_at.blank? && finished_at.present?
  end
  
  def started_at_at_is_invalid_without_a_fnished_at
      errors.add(:finished_at, "が必要です(編集時にはセットで入力してください)") if started_at.present? && finished_at.blank?
  end
  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い時間を退勤時間とすることはできません") if started_at > finished_at
    end
  end  
  
end