# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :section, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :date_before_start
  validate :date_before_end

  def date_before_start
    errors.add(:start_date, 'は今日以降のものを選択してください') if start_date < Date.today
  end

  def date_before_end
    if end_date.nil? || end_date < start_date
      errors.add(:end_date, 'は受付開始日以降のものを選択してください')
    end
  end
end
