class Badge < ActiveRecord::Base
  has_many :assignment_badges, dependent: :destroy
  has_many :assignments, through: :assignment_badges
  has_many :awarded_badges
  # adding validations for Badge table entries as part of project E1822
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :image_name, presence: true

  def self.get_id_from_name(badge_name)
    Badge.find_by(name: badge_name).try(:id)
  end

  # adding a method to get the image name from the Badge table to specify as part of src path of the
  # image to be displayed as part of the Teammate and Review Questionnaires
  def self.get_image_name_from_name(badge_name)
    Badge.find_by(name: badge_name).try(:image_name)
  end
end
