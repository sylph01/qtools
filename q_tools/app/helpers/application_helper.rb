# encoding : utf-8
module ApplicationHelper
  def court_select
    return ["A", "B", "C", "D", "E", "F"]
  end
  
  def genre_select
    return ["ノン","アニ","スポ","芸能","ライ","社会","文系","理系"]
  end
  
  def type_select
    return ["○×","四択","連想","並替","文字","スロ","タイ","エフ","キュ","線結","多答","順当","グル","S1","S2","S3","ラン","自由"]
  end
end
