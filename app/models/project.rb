class Project < ActiveRecord::Base
  attr_accessible :client_id, :deadline, :description, :name, :reward, :skill_id1, :skill_id2, :skill_id3, :url
  
  belongs_to :client
  
end
