def janken()
  puts "ジャンケン・・・ 1(グー) 2(チョキ) 3(パー) 4(戦わない)"
  you = gets.chomp.to_i
  cpu = rand(1..3)
  
  if you != 1 && you != 2 && you != 3 && you != 4
    puts "1~4を入力して下さい"
    puts "_____________________________________________"
    janken()
  elsif you == 4
    return "アプリを終了します"
  end
  
  hands = ["グー", "チョキ", "パー"]
  
  hand = hands[cpu - 1]
  
  puts "ポイ！！ 相手：#{hand}"

  if cpu == you + 1 || cpu == you - 2     #あなたの勝ち
    return 1
  elsif you == cpu + 1 || you == cpu - 2     #あなたの負け
    return 2
  else
    puts "あいこです"
    puts "_____________________________________________"
    janken()
  end
  
end

def choose_direction()
  puts "あっち向いて・・・"
  puts "1(上) 2(下) 3(右) 4(左)"
  choosen_direction = gets.chomp.to_i
  
  if choosen_direction != 1 && choosen_direction != 2 && choosen_direction != 3 && choosen_direction != 4
    puts "1~4を入力して下さい"
    puts "_____________________________________________"
    choose_direction()
  else
    return choosen_direction
  end
  
end

def number_to_direction(random_direction)
  
  if random_direction == 1
    return "上"
  elsif random_direction == 2
    return "下"
  elsif random_direction == 3
    return "右"
  elsif random_direction == 4
    return "左"
  end
  
end

def result(janken_result, direction_result, random_direction, converted_direction)
  puts "ホイ！！ 相手：#{converted_direction}"
  
  if direction_result == random_direction && janken_result == 1
    return "あなたの勝利です！！"
  elsif direction_result == random_direction && janken_result == 2
    return "あなたの負けです..."
  else
    puts "_____________________________________________"
    total_prosess()
  end
  
end

def total_prosess()
  janken_result = janken()
  
  if janken_result == "アプリを終了します"
    result_announce = janken_result
  else
    direction_result = choose_direction()
    random_direction = rand(1..4)
    converted_direction = number_to_direction(random_direction)
    result_announce = result(janken_result, direction_result, random_direction, converted_direction)
  end
  
  puts "#{result_announce}"
end

total_prosess()