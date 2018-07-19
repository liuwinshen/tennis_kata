class TennisGame2

  attr_reader :p1_points, :p2_points

  POINT_NAMES = {0 => "Love", 1 => "Fifteen", 2 => "Thirty", 3 => "Forty"}

  def initialize(player1_name, player2_name)
    @p1_name = player1_name
    @p2_name = player2_name
    @p1_points = 0
    @p2_points = 0
  end
      
  def won_point(player_name)
    if player_name == @p1_name
      increment_p1_score()
    else
      increment_p2_score()
    end
  end

  def score
    result = ""
    if @p1_points >= 3 and @p2_points >= 3
      if win?
        result = 'Win for ' + lead_player
      elsif equal_points?
        result = 'Deuce' 
      else
        result = 'Advantage for' + lead_player
      end
    else 
      result += POINT_NAMES[@p1_points] + "-All" if equal_points?
    end

    p1_result = ""
    p2_result = ""
    if (@p1_points > 0 and @p2_points==0)
      if (@p1_points==1)
        p1_result = "Fifteen"
      end
      if (@p1_points==2)
        p1_result = "Thirty"
      end
      if (@p1_points==3)
        p1_result = "Forty"
      end
      p2_result = "Love"
      result = p1_result + "-" + p2_result
    end
    if (@p2_points > 0 and @p1_points==0)
      if (@p2_points==1)
        p2_result = "Fifteen"
      end
      if (@p2_points==2)
        p2_result = "Thirty"
      end
      if (@p2_points==3)
        p2_result = "Forty"
      end
      
      p1_result = "Love"
      result = p1_result + "-" + p2_result
    end
    
    if (@p1_points>@p2_points and @p1_points < 4)
      if (@p1_points==2)
        p1_result="Thirty"
      end
      if (@p1_points==3)
        p1_result="Forty"
      end
      if (@p2_points==1)
        p2_result="Fifteen"
      end
      if (@p2_points==2)
        p2_result="Thirty"
      end
      result = p1_result + "-" + p2_result
    end
    if (@p2_points>@p1_points and @p2_points < 4)
      if (@p2_points==2)
        p2_result="Thirty"
      end
      if (@p2_points==3)
        p2_result="Forty"
      end
      if (@p1_points==1)
        p1_result="Fifteen"
      end
      if (@p1_points==2)
        p1_result="Thirty"
      end
      result = p1_result + "-" + p2_result
    end
    if @p2_points >= 3 and @p1_points >= 3
      if (@p1_points > @p2_points)
        result = "Advantage " + @p1_name
      end
      if (@p2_points > @p1_points)
        result = "Advantage " + @p2_name
      end
    end
    if (@p1_points>=4 and @p2_points>=0 and (@p1_points-@p2_points)>=2)
      result = "Win for " + @p1_name
    end
    if (@p2_points>=4 and @p1_points>=0 and (@p2_points-@p1_points)>=2)
      result = "Win for " + @p2_name
    end
    result
  end

  def equal_points?
    @p1_points == @p2_points
  end

  def win?
    (@p1_points - @p2_points).abs >= 2
  end

  def lead_player 
    return @p1_name if @p1_points > @p2_points
    @p2_name
  end

  def set_p1_score(number)
    number.times {increment_p1_score()}
  end

  def set_p2_score(number)
    number.times {increment_p2_score()}
  end

  def increment_p1_score
    @p1_points += 1
  end
  
  def increment_p2_score
    @p2_points += 1
  end
end