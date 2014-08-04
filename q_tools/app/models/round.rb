class Round < ActiveRecord::Base
  attr_accessible :description, :event_id, :name
  
  belongs_to :event
  has_many :matches, :dependent => :destroy
  
  # qacers export
  def qacers_export
    str = ""
    self.matches.each do |match|
      str << match.player1_name.to_s + "," + match.player1_genre.to_s + "," + match.player1_qacers_type.to_s + "," + match.player1_score.to_s + "\n"
      str << match.player2_name.to_s + "," + match.player2_genre.to_s + "," + match.player2_qacers_type.to_s + "," + match.player2_score.to_s + "\n"
      str << match.player3_name.to_s + "," + match.player3_genre.to_s + "," + match.player3_qacers_type.to_s + "," + match.player3_score.to_s + "\n"
      str << match.player4_name.to_s + "," + match.player4_genre.to_s + "," + match.player4_qacers_type.to_s + "," + match.player4_score.to_s + "\n"
    end
    str.chomp
  end
  
  # info: 0 = name, 1 = score, 2 = rank, 3 = rate
  def rate_order
    infos = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    infos = infos.sort_by{|x| x[3]}.reverse
    return infos.map{|x| "#{x[0]}(#{"%3.2f" % x[3].to_f} @ #{x[2]}位)"}
  end
  def select_top1
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    infos.delete_if{|x| x[2].to_i > 1}
    names = infos.map{|x| x[0]}
    names
  end
  
  def select_top2
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    infos.delete_if{|x| x[2].to_i > 2}
    names = infos.map{|x| x[0]}
    names
  end
  
  def select_bottom2
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    infos.delete_if{|x| x[2].to_i <= 2}
    names = infos.map{|x| x[0]}
    names
  end
  
  def select_2nd
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    infos.delete_if{|x| x[2].to_i != 2}
    names = infos.map{|x| x[0]}
    names
  end
  
  def select_top1_and_rate(num)
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    # 1st player passes
    infos.each do |info|
      if info[2].to_i <= 1
        names << info[0]
      end
    end
    # then pass by loss rate
    infos.delete_if{|x| x[2].to_i <= 1}
    infos = infos.sort_by{|x| x[3]}.reverse
    for i in 1 .. num do
      if infos[i-1]
        names << infos[i-1][0]
      end
    end
    return names
  end
  
  def select_top2_and_rate(num)
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    # 1st player passes
    infos.each do |info|
      if info[2].to_i <= 2
        names << info[0]
      end
    end
    # then pass by loss rate
    infos.delete_if{|x| x[2].to_i <= 2}
    infos = infos.sort_by{|x| x[3]}.reverse
    for i in 1 .. num do
      if infos[i-1]
        names << infos[i-1][0]
      end
    end
    return names
  end
  
  def select_topX_and_rateY(top, rate)
    if top <= 0
      top = 1
    elsif top >= 4
      top = 4
    end
    
    infos = []
    names = []
    self.matches.each do |match|
      infos += match.score_infos
    end
    # 1st player passes
    infos.each do |info|
      if info[2].to_i <= top
        names << info[0]
      end
    end
    # then pass by loss rate
    infos.delete_if{|x| x[2].to_i <= top}
    infos = infos.sort_by{|x| x[3]}.reverse
    for i in 1 .. rate do
      if infos[i-1]
        names << infos[i-1][0]
      end
    end
    return names
  end
  
end
