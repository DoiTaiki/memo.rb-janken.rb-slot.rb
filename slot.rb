def begin_game()
  puts "コインを持っていません"
  puts "ゲームを開始しますか？"
  puts "1(開始する) 2(やらない)"
  responce = gets.chomp.to_i
  
  if responce != 1 && responce != 2
    puts "1 or 2を入力して下さい"
    puts "______________________________"
  end
  
  if responce == 1
    puts "100コイン配布されました"
    puts "ゲームを開始します"
  end
  
  if responce == 1 || responce == 2
    return responce
  end
  
  begin_game()
  
end
    

def bet_coin(coin)
  puts "投入するコインの枚数を入力して下さい"
  puts "1(10コイン) 2(3０コイン) 3(5０コイン) 4(投入しない)"
  selected_bet_coin = gets.chomp.to_i
  
  if selected_bet_coin != 1 && selected_bet_coin != 2 && selected_bet_coin != 3 && selected_bet_coin != 4
    puts "1~4を入力して下さい"
    puts "______________________________"
  end
  
  consume_coin = [10, 30, 50]
  
  if selected_bet_coin == 1 || selected_bet_coin == 2 || selected_bet_coin == 3
    if coin - consume_coin[selected_bet_coin-1] < 0
      puts "コインが足りません..."
      bet_coin()
    else
      puts "#{consume_coin[selected_bet_coin-1]}枚投入します"
    end
  end

  if selected_bet_coin == 1 || selected_bet_coin == 2 || selected_bet_coin == 3 || selected_bet_coin == 4
    return selected_bet_coin
  end
  
  bet_coin(coin)

end



def slot()
  numbers = []
  
  for i in 1..9 do
    numbers[i] = rand(1..9)
  end

  puts "エンターキーを3回押して下さい"
  
  gets
  
  puts "______________________________"
  puts ""
  puts "|#{numbers[1]}|||"
  puts "|#{numbers[2]}|||"
  puts "|#{numbers[3]}|||"
  
  gets

  puts "______________________________"
  puts ""
  puts "|#{numbers[1]}|#{numbers[4]}||"
  puts "|#{numbers[2]}|#{numbers[5]}||"
  puts "|#{numbers[3]}|#{numbers[6]}||"
  
  gets
  
  puts "______________________________"
  puts ""
  puts "|#{numbers[1]}|#{numbers[4]}|#{numbers[7]}|"
  puts "|#{numbers[2]}|#{numbers[5]}|#{numbers[8]}|"
  puts "|#{numbers[3]}|#{numbers[6]}|#{numbers[9]}|"
  puts "______________________________"

  same_patterns = 0
  
  for i in 1..3 do
    if numbers[i] == numbers[i+3] && numbers[i] == numbers[i+6]
      same_patterns += 1
    end
  end
  
  2.step(4, 2) {|j|
    if numbers[5] == numbers[5-j] && numbers[5] == numbers[5+j]
      same_patterns += 1
    end
  }
  
  return same_patterns
end

def posessed_coin(result_bet_coin, slot_result, coin)  
  betting_coins = [10, 30, 50]
  
  coin -= betting_coins[result_bet_coin-1]
  
  magnifications = [0, 10, 30, 50, 100, 200]
  
  get_coin = betting_coins[result_bet_coin-1] * magnifications[slot_result]
  
  coin += get_coin
  
  if get_coin != 0
    puts "#{get_coin}枚獲得しました！！"
  end
  
  return coin
end

def posessed_point(result_bet_coin, slot_result, point)  
  betting_coins = [10, 30, 50]
  
  magnifications = [0, 10, 30, 50, 100, 200]
  
  get_point = betting_coins[result_bet_coin-1] * magnifications[slot_result]
  
  point += get_point
  
  if get_point != 0
    puts "#{get_point}点獲得しました！！"
  end
  
  return point
end




def total_process()

  begin_or_finish = begin_game()
    
  if begin_or_finish == 1
    coin = 100
    point = 0
  elsif begin_or_finish == 2
    return "アプリを終了します。"
  end
    
  while coin != 0 do
    result_bet_coin = bet_coin(coin)
  
    if result_bet_coin == 4
      return "アプリを終了します。今回の得点は#{point}点でした！！"
    end
  
    slot_result = slot()

    coin = posessed_coin(result_bet_coin, slot_result, coin)
    point = posessed_point(result_bet_coin, slot_result, point)
    
    puts "コイン枚数：#{coin}枚"
    puts "得点：#{point}点"
    puts "______________________________"
    
    if coin == 0
      return "コインが無くなりました...アプリを終了します。今回の得点は#{point}点でした！！"
    end
    
  end
    
end

finish = total_process()

puts finish



