module Algorithms
  def get_binary
  end

  def get_all_combos
    #000
    #001
    #010
    #011
    #2 * 2 * 3 = 12
    colors = ["grey", "black"]
    animal = ["fox", "dog"]
    action = ["jumped", "ran", "growled"]
    all_combos = []

    (1..12).each { all_combos << []}

    #0-5 grey
    (0..5).each do |i|
      all_combos[i] << colors[0]
    end
    #6-11 black
    (6..11).each do |i|
      all_combos[i] << colors[1]
    end

    #every other two fox or dog
    fox = true

    all_combos.each do |combo|
      if cnt == 2
        cnt = 1
      else
      combo << animal[0] if fox
    end

    #loop through actions, changing for each record
  end
end
