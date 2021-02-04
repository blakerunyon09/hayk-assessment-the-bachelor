# require 'pry'
# require 'json'
# bachelor_file = File.read('spec/fixtures/contestants.json')
# bachelor_hash = JSON.parse(bachelor_file)

# def all_contestants(data)
#   data.values.flatten
# end

# def get_first_name_of_season_winner(data, season)
#   data[season].detect { |el|
#     el["status"] == "Winner"
#   }["name"].split(" ")[0]
# end

# def get_contestant_name(data, occupation)
#   contestants = all_contestants(data)
#   contestants.find { |contestant|
#     contestant["occupation"] == occupation
#   }["name"]
# end

# def count_contestants_by_hometown(data, hometown)
#   contestants = all_contestants(data)
#     contestants.filter { |contestant|
#       contestant["hometown"] == hometown
#     }.length
# end

# def get_occupation(data, hometown)
#   contestants = all_contestants(data)
#     contestants.find { |contestant|
#       contestant["hometown"] == hometown
#     }["occupation"]
# end

# def get_average_age_for_season(data, season)
#   (data[season].map { |el| 
#     el["age"].to_f
#   }.sum / data[season].length).round
# end

require 'pry'
require 'json'
file = File.read('spec/fixtures/contestants.json')
j_data = JSON.parse(file)


def get_first_name_of_season_winner(data, season)
  #binding.pry
  data.find do |list_of_sesasons, contestants|
    list_of_sesasons == season
      contestants.find do |profile|
        profile["status"] == "Winner"
          contestants["name"].split(" ")
      end
  end
end

def get_first_name_of_season_winner(data, season)
  data[season].find do |element|
    element["status"] == "Winner"
  end["name"].split(" ")[0]
end

get_first_name_of_season_winner(j_data, "season 10")

def all_contestants data
  data.map do |season, contestant_array|
    contestant_array
  end 
end 


def get_contestant_name(data, occupation)
  # code here
end



def count_contestants_by_hometown(all_contestants, hometown)
  all_contestants.reduce(0) do |sum, each_contestant|
    if each_contestant"hometown" == hometown
      sum + 1
    end
  end 
end

def get_occupation(all_contestants, hometown)
  all_contestants.find do |each_contestant|
    each_contestant"hometown" == hometown
      each_contestant"occupation"
  end 
end 

def get_average_age_for_season(data, season)
  data.find do |list_of_sesasons, contestants|
    list_of_sesasons == season
      contestants.sum
  end
end
