# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored (player_name)
  game_hash[:home][:players].each do |player|
    if player[:player_name] == player_name
      return player[:points]
    else
      game_hash[:away][:players].each do |player|
        if player[:player_name] == player_name
          return player[:points]
        end
      end
    end
  end
end

def shoe_size (player_name)
   game_hash[:home][:players].each do |player|
    if player[:player_name] == player_name
      return player[:shoe]
    else
      game_hash[:away][:players].each do |player|
        if player[:player_name] == player_name
          return player[:shoe]
        end
      end
    end
  end
end

def team_colors (teamname)
  if game_hash[:home][:team_name] == teamname
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  array=[]
  array << game_hash[:home][:team_name]
  array << game_hash[:away][:team_name]
  array
end

def player_numbers (teamname)
  array=[]
  game_hash.each do |key, team|
    if team[:team_name] == teamname
      team.each do |key, player|
        if key == :players
          player.each do |player|
            array << player[:number]
          end
        end
      end
    end
  end
  array
end

def player_stats (player_name)
  game_hash[:home][:players].each do |player|
    if player[:player_name] == player_name
      return player
    else
      game_hash[:away][:players].each do |player|
        if player[:player_name] == player_name
          return player
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe=0
  player_with_biggest_shoe={}
  game_hash[:home][:players].each do |player|
    if player[:shoe] > biggest_shoe
      biggest_shoe = player[:shoe]
      player_with_biggest_shoe=player
    end 
  end
  game_hash[:away][:players].each do |player|
    if player[:shoe] > biggest_shoe
      biggest_shoe = player[:shoe]
    end
    if player[:shoe] == biggest_shoe
      return player[:rebounds]
    else
      return player_with_biggest_shoe[:rebounds]
    end
  end
end