require 'pry'
require 'json'
bachelor_file = File.read('spec/fixtures/contestants.json')
bachelor_hash = JSON.parse(bachelor_file)

def all_contestants(data)
  data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  data[season].detect { |el|
    el["status"] == "Winner"
  }["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  contestants = all_contestants(data)
  contestants.find { |contestant|
    contestant["occupation"] == occupation
  }["name"]
end

def count_contestants_by_hometown(data, hometown)
  contestants = all_contestants(data)
    contestants.filter { |contestant|
      contestant["hometown"] == hometown
    }.length
end

def get_occupation(data, hometown)
  contestants = all_contestants(data)
    contestants.find { |contestant|
      contestant["hometown"] == hometown
    }["occupation"]
end

def get_average_age_for_season(data, season)
  (data[season].map { |el| 
    el["age"].to_f
  }.sum / data[season].length).round
end