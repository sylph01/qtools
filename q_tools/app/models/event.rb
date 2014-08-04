class Event < ActiveRecord::Base
  attr_accessible :description, :name, :password, :active
  
  has_many :rounds, :dependent => :destroy
  
  scope :active_only, -> { where("active = ?", true)}
  
  def history_by_name(name)
    history = []
    # keeps round name, genre, and type
    self.rounds.each do |round|
      round.matches.each do |match|
        if match.player1_name == name
          history << [round.name, match.player1_genre, match.player1_type]
        elsif match.player2_name == name
          history << [round.name, match.player2_genre, match.player2_type]
        elsif match.player3_name == name
          history << [round.name, match.player3_genre, match.player3_type]
        elsif match.player4_name == name
          history << [round.name, match.player4_genre, match.player4_type]
        end
      end
    end
    return history
  end
end
