# encoding: utf-8
class Match < ActiveRecord::Base
  attr_accessible :match_number, :notes, :player1_free_1, :player1_free_2, :player1_free_3, :player1_genre, :player1_name, :player1_type, :player2_free_1, :player2_free_2, :player2_free_3, :player2_genre, :player2_name, :player2_type, :player3_free_1, :player3_free_2, :player3_free_3, :player3_genre, :player3_name, :player3_type, :player4_free_1, :player4_free_2, :player4_free_3, :player4_genre, :player4_name, :player4_type, :round_id, :player1_score, :player2_score, :player3_score, :player4_score, :court, :image, :image_cache
  
  attr_accessible :remote_image_url
  
  mount_uploader :image, ImageUploader

  belongs_to :round
  
  has_many :match_images
  
  before_save :calculate_match_number, :calculate_rank_and_rate, :set_decimals
  
  QACERS_REPLACE_TABLE = {
    "○×" => "○×",
    "四択" => "４択",
    "連想" => "連想",
    "並替" => "並替",
    "文字" => "文字",
    "スロ" => "スロ",
    "タイ" => "タイ",
    "エフ" => "エフ",
    "キュ" => "キュ",
    "線結" => "線結",
    "多答" => "多答",
    "順当" => "順当",
    "グル" => "グル",
    "S1" => "Ｒ１",
    "S2" => "Ｒ２",
    "S3" => "Ｒ３",
    "ラン" => "ＲＡ",
    "自由" => "ＦＳ"
  }
 
  def name
    return self.court.to_s + "コート 第" + self.match_number.to_s + "試合"
  end
  
  def names_set?
    return !self.player1_name.blank? && !self.player2_name.blank? && !self.player3_name.blank? && !self.player4_name.blank?
  end
  def scores_set?
    return !self.player1_score.blank? && !self.player2_score.blank? && !self.player3_score.blank? && !self.player4_score.blank?
  end
  
  def scores
    return [self.player1_score.to_f, self.player2_score.to_f, self.player3_score.to_f, self.player4_score.to_f]
  end
  
  def ranks
    return [self.player1_rank, self.player2_rank, self.player3_rank, self.player4_rank]
  end
  
  def rates
    return [self.player1_rate, self.player2_rate, self.player3_rate, self.player4_rate]
  end
  
  def score_infos
    return [
      [self.player1_name, self.player1_score.to_f, self.player1_rank, self.player1_rate], 
      [self.player2_name, self.player2_score.to_f, self.player2_rank, self.player2_rate], 
      [self.player3_name, self.player3_score.to_f, self.player3_rank, self.player3_rate], 
      [self.player4_name, self.player4_score.to_f, self.player4_rank, self.player4_rate]]
  end
  
  # change type to qacers format
  def player1_qacers_type
    if self.player1_type
      str = self.player1_type
      QACERS_REPLACE_TABLE.each{|key,value|
        str.gsub!(key,value)
      }
      str
    else
      return ""
    end
  end
  
  def player2_qacers_type
    if self.player2_type
      str = self.player2_type
      QACERS_REPLACE_TABLE.each{|key,value|
        str.gsub!(key,value)
      }
      str
    else
      return ""
    end
  end
  
  def player3_qacers_type
    if self.player3_type
      str = self.player3_type
      QACERS_REPLACE_TABLE.each{|key,value|
        str.gsub!(key,value)
      }
      str
    else
      return ""
    end
  end
  
  def player4_qacers_type
    if self.player4_type
      str = self.player4_type
      QACERS_REPLACE_TABLE.each{|key,value|
        str.gsub!(key,value)
      }
      str
    else
      return ""
    end
  end
  
  private
  def set_decimals
    if self.player1_score.to_f > 400
      self.player1_score = self.player1_score.to_f / 100.0
    end
    if self.player2_score.to_f > 400
      self.player2_score = self.player2_score.to_f / 100.0
    end
    if self.player3_score.to_f > 400
      self.player3_score = self.player3_score.to_f / 100.0
    end
    if self.player4_score.to_f > 400
      self.player4_score = self.player4_score.to_f / 100.0
    end
  end
  
  def calculate_match_number
    if !self.match_number
      # find newest 
      newest_item = Match.where('round_id = ? AND court = ?',self.round_id,self.court).order("match_number DESC").limit(1)
      if newest_item.length != 0
        self.match_number = newest_item[0].match_number + 1
      else
        self.match_number = 1
      end
    end
  end
  
  def calculate_rank_and_rate
    #unless self.new_record?
      ranks = []
      rates = []
      for i in 0 .. 3 do
        ranks[i] = self.scores.sort.reverse.index(self.scores[i]) + 1
        if self.scores.max.to_f != 0
          rates[i] = self.scores[i] / self.scores.max.to_f * 100
        else 
          rates[i] = 0
        end
      end

      self.player1_rank = ranks[0]
      self.player2_rank = ranks[1]
      self.player3_rank = ranks[2]
      self.player4_rank = ranks[3]

      self.player1_rate = rates[0]
      self.player2_rate = rates[1]
      self.player3_rate = rates[2]
      self.player4_rate = rates[3]
      #end
  end
end
