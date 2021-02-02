require 'pry'
require 'json'
bachelor_file = File.read('spec/fixtures/contestants.json')
bachelor_hash = JSON.parse(bachelor_file)

def get_first_name_of_season_winner(data, season)
  data.each { |season_num, contestant_list|
    if season_num == season
      contestant_list.each { |contestant|
        return contestant["name"].split(" ")[0] if contestant["status"] == "Winner"
      }
    end
  }
end

def get_contestant_name(data, occupation)
  data.each { |season_num, contestant_list|
    contestant_list.each { |contestant|
      return contestant["name"] if contestant["occupation"] == occupation
    }
  }
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each { |season_num, contestant_list|
    contestant_list.each { |contestant|
      count += 1 if contestant["hometown"] == hometown
    }
  }
  count
end

def get_occupation(data, hometown)
  data.each { |season_num, contestant_list|
    contestant_list.each { |contestant|
      return contestant["occupation"] if contestant["hometown"] == hometown
    }
  }
end

def get_average_age_for_season(data, season)
  age_arr = []
  data.each { |season_num, contestant_list|
    if season_num == season
      contestant_list.each { |contestant|
        age_arr << contestant["age"].to_f
      }
    end
  }
  (age_arr.sum.to_f / age_arr.length).round
end
