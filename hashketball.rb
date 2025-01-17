# Write your code here!
require 'pry'
def game_hash
  {
    :home => 
      {:team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
          {:player_name => "Alan Anderson",
            :number => 0, 
            :shoe => 16,
            :points => 22, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 3, 
            :blocks => 1, 
            :slam_dunks => 1 
          }, 
          {
            :player_name => "Reggie Evans",
            :number => 30, 
            :shoe => 14,
            :points => 12, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 12, 
            :blocks => 12, 
            :slam_dunks => 7
          },
          {
            :player_name => "Brook Lopez",
            :number => 11, 
            :shoe => 17,
            :points => 17, 
            :rebounds => 19, 
            :assists => 10, 
            :steals => 3, 
            :blocks => 1, 
            :slam_dunks => 15 
          }, 
          {
            :player_name => "Mason Plumlee",
            :number => 1, 
            :shoe => 19,
            :points => 26, 
            :rebounds => 11, 
            :assists => 6, 
            :steals => 3, 
            :blocks => 8, 
            :slam_dunks => 5 
          },
          {
            :player_name => "Jason Terry",
            :number => 31, 
            :shoe => 15,
            :points => 19, 
            :rebounds => 2, 
            :assists => 2, 
            :steals => 4, 
            :blocks => 11, 
            :slam_dunks => 1
          }]
      },
      :away =>  {:team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          {:player_name => "Jeff Adrien",
            :number => 4, 
            :shoe => 18,
            :points => 10, 
            :rebounds => 1, 
            :assists => 1, 
            :steals => 2, 
            :blocks => 7, 
            :slam_dunks => 2 
          },
          {
            :player_name => "Bismack Biyombo",
            :number => 0, 
            :shoe => 16,
            :points => 12, 
            :rebounds => 4, 
            :assists => 7, 
            :steals => 22, 
            :blocks => 15, 
            :slam_dunks => 10 
          },
          {
            :player_name => "DeSagna Diop",
            :number => 2, 
            :shoe => 14,
            :points => 24, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 4, 
            :blocks => 5, 
            :slam_dunks => 5 
          },
          {
            :player_name => "Ben Gordon",
            :number => 8, 
            :shoe => 15,
            :points => 33, 
            :rebounds => 3, 
            :assists => 2, 
            :steals => 1, 
            :blocks => 1, 
            :slam_dunks => 0 
          },
          {
            :player_name => "Kemba Walker",
            :number => 33, 
            :shoe => 15,
            :points => 6, 
            :rebounds => 12, 
            :assists => 12, 
            :steals => 7, 
            :blocks => 5, 
            :slam_dunks => 12 
          }]
      }
  }
end 

def num_points_scored(players_name)
  player = get_player_stats(players_name)
  player[:points]
end 

def shoe_size(players_name)
  player = get_player_stats(players_name)
  player[:shoe]
end 

def get_player_stats(players_name)
  game_hash.each do |home_or_away, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player|
          if player[:player_name] == players_name
            return player
          end 
        end 
      end 
    end
  end 
end 


def team_colors(team_name)
  game_hash.each do |home_or_away, team|
    if team[:team_name] == team_name
      return team[:colors]
    end 
  end 
end 

def team_names
  teams = []
  game_hash.each do |home_or_away, team|
    teams << team[:team_name]  
  end 
  teams
end 

def player_numbers(team_name)
 jersey_numbers = []
  game_hash.each do |home_or_away, team|
    if team[:team_name] == team_name
      team[:players].each do |player|
        jersey_numbers << player[:number]
      end 
    end 
  end
  jersey_numbers
end 

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |home_or_away, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
         size = player[:shoe]
         if size > shoe_size
            shoe_size = size
            rebounds = player[:rebounds]
        end
      end 
    end 
  end 
end 
  rebounds
end 

def player_stats(player_name)
  player = get_player_stats(player_name)
  player.delete(:player_name) 
  player
end 

def most_points_scored
  name = nil 
  points = 0 
  game_hash.each do |home_or_away, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          most_points = player[:points]
          if most_points > points
             points = most_points
             name = player[:player_name]
          end 
        end 
      end 
    end 
   end 
   name
end 

def winning_team
  total_points = 0 
  win_team = ""
  game_hash.each do |home_or_away, team|
    team_total = 0 
    team_name = team[:team_name] 
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          team_total += player[:points]
        end
      end
    end 
    win_team, total_points = team_name, team_total if team_total > total_points
  end 
  return win_team
end 

def player_with_longest_name
  names = []
  game_hash.each do |home_or_away, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player|
          names << player[:player_name]
        end 
      end 
    end 
  end 
  names.sort_by{|word| word.length}[-1]
end 

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  steals = 0 
  game_hash.each do |home_or_away, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player|
          players_steals = player[:steals]
          players_name = player[:player_name]
          if player[:steals] > steals 
             steals = players_steals
          end 
          if player[:player_name] == longest_name
            return true 
          else 
            false 
          end 
        end 
      end 
    end 
  end 
end 